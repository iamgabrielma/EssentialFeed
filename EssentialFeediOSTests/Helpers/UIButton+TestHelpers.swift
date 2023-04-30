//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Gabriel Maldonado Almendra on 30/4/23.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}

