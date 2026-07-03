//
//  UIRefreshControl+Helpers.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 24/2/26.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
