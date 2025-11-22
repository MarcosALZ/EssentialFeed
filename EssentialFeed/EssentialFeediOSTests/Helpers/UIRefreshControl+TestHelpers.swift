//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/11/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
