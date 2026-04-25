//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/4/26.
//

import Foundation

public protocol FeedImageDataStore {
    typealias RetrievalResult = Swift.Result<Data?, Error>
    typealias InsertionResult = Swift.Result<Void, Error>

    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void)

    func retrieve(dataForURL url: URL, completion: @escaping (RetrievalResult) -> Void)
}
