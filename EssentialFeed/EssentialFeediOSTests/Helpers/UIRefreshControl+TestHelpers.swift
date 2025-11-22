//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/11/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
