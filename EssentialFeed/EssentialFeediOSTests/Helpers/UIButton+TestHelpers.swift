//
//  UIButton+TestHelpers.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/11/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
