//
//  SharedTestHelpers.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 5/10/25.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "Any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
