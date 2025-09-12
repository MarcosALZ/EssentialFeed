//
//  URLSessionHTTPClientTests.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 12/9/25.
//

import XCTest
import EssentialFeed

protocol HTTPSession {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> HTTPSessionDataTask
}

protocol HTTPSessionDataTask {
    func resume()
}

extension URLSessionDataTask: HTTPSessionDataTask {}

class URLSessionHTTPClient {
    private let session: HTTPSession
    
    init(session: HTTPSession) {
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
        let session = HTTPSessionSpy()
        let task = HTTPSessionDataTaskSpy()
        session.stub(url: url, dataTask: task)
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url, completion: { _ in })
        
        XCTAssertEqual(task.resumeCallCount, 1)
    }
    
    func test_getFromURL_failsOnRequestError() {
        let url = URL(string: "http://any-url.com")!
        let error = NSError(domain: "Any error", code: 1)
        let session = HTTPSessionSpy()
        let task = HTTPSessionDataTaskSpy()
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
    
    private class HTTPSessionSpy: HTTPSession, @unchecked Sendable {
        private var stubs = [URL:Stub]()
        
        private struct Stub {
            let task: HTTPSessionDataTask
            let error: Error?
        }
        
        func stub(url: URL, dataTask: HTTPSessionDataTask = FakeHTTPSessionDataTask(), error: Error? = nil) {
            stubs[url] = Stub(task: dataTask, error: error)
        }
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> HTTPSessionDataTask {
            guard let stub = stubs[url] else {
                fatalError("Couldn't find stub for a given url")
            }
            completionHandler(nil, nil, stub.error)
            return stub.task
        }
    }
    
    private class FakeHTTPSessionDataTask: HTTPSessionDataTask, @unchecked Sendable {
        func resume() {}
    }
    
    private class HTTPSessionDataTaskSpy: HTTPSessionDataTask, @unchecked Sendable {
        var resumeCallCount = 0
        func resume() {
            resumeCallCount += 1
        }
    }
}
