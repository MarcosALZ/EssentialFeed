//
//  UIButton+TestHelpers.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/11/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
