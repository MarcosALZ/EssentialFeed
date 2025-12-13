//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 25/11/25.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        return location != nil
    }
}
