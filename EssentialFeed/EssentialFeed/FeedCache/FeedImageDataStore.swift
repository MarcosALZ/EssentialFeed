//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/4/26.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
