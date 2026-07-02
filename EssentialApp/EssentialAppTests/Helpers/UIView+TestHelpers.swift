//
//  UIView+TestHelpers.swift
//  EssentialApp
//
//  Created by Israel Marcos Alvarez Mesa on 02/07/2026.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
