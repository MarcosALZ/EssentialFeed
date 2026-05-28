//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 28/05/2026.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
