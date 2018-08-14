//
//  InfomationViewController.swift
//  Stress
//
//  Created by Chao Jiang on 8/11/18.
//  Copyright © 2018 nickjc1. All rights reserved.
//

import UIKit
import WebKit

class InfomationViewController: UIViewController {
    @IBOutlet weak var viewOfText: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var shadow: Shadow? = Shadow()
        
        shadow?.makingShadow(to: viewOfText)
        shadow = nil
        
    }
    
}
