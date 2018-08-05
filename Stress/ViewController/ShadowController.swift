//
//  shadowController.swift
//  Stress
//
//  Created by Chao Jiang on 8/5/18.
//  Copyright © 2018 nickjc1. All rights reserved.
//

import UIKit
import Foundation
import ChameleonFramework

struct Shadow {
    func makingShadow(to view: UIView) {
        view.layer.cornerRadius = 4
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
    }
}
