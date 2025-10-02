//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 29/9/25.
//

import Foundation

public enum RetrieveCacheFeedResult {
    case empty
    case found([LocalFeedImage], timestamp: Date)
    case failure(Error)
}

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetrievalCompletion = (RetrieveCacheFeedResult) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion) 
}
