//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 2/9/25.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://example.com/feed.json")!
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    var requestedURL: URL?
    
    private init() {}
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
