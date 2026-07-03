//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 30/9/25.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
