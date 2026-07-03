//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 27/05/2026.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
