//
//  URLSessionHTTPClientTests.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 12/9/25.
//

import XCTest
import EssentialFeed

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { _, _, error in
            if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}


class URLSessionHTTPClientTests: XCTestCase {
    
    func test_getFromURL_resumesDataTaskWithURL() {
        
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(url: url, dataTask: task)
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url, completion: { _ in })
        
        XCTAssertEqual(task.resumeCallCount, 1)
    }
    
    func test_getFromURL_failsOnRequestError() {
        let url = URL(string: "http://any-url.com")!
        let error = NSError(domain: "Any error", code: 1)
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(url: url, dataTask: task, error: error)
        let sut = URLSessionHTTPClient(session: session)
        
        let expectation = expectation(description: "Waint for completion")
        sut.get(from: url) { result in
            switch result {
            case let .failure(receivedError as NSError):
                XCTAssertEqual(receivedError, error)
            default:
                XCTFail("Expected failure with error \(error), got: \(result) instead")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // MARK: Helpers
    
    private class URLSessionSpy: URLSession, @unchecked Sendable {
        private var stubs = [URL:Stub]()
        
        private struct Stub {
            let task: URLSessionDataTask
            let error: Error?
        }
        
        func stub(url: URL, dataTask: URLSessionDataTask = FakeURLSessionDataTask(), error: Error? = nil) {
            stubs[url] = Stub(task: dataTask, error: error)
        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            guard let stub = stubs[url] else {
                fatalError("Couldn't find stub for a given url")
            }
            completionHandler(nil, nil, stub.error)
            return stub.task
        }
    }
    
    private class FakeURLSessionDataTask: URLSessionDataTask, @unchecked Sendable {
        override func resume() {}
    }
    
    private class URLSessionDataTaskSpy: URLSessionDataTask, @unchecked Sendable {
        var resumeCallCount = 0
        override func resume() {
            resumeCallCount += 1
        }
    }
}
