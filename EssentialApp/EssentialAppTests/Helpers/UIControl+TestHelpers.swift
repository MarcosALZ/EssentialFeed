//
//  UIControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/11/25.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
