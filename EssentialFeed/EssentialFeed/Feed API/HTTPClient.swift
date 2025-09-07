//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 7/9/25.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
