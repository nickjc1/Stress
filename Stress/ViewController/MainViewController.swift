//
//  MainViewController.swift
//  Stress
//
//  Created by Chao Jiang on 8/4/18.
//  Copyright © 2018 nickjc1. All rights reserved.
//

import UIKit
import ChameleonFramework

class MainViewController: UIViewController {
    
    @IBOutlet weak var pointLoadView: UIView!
    @IBOutlet weak var lineLoadView: UIView!
    @IBOutlet weak var verticalStripLoadView: UIView!
    @IBOutlet weak var embankmentLoadView: UIView!
    @IBOutlet weak var circularAreaLoadView: UIView!
    @IBOutlet weak var rectangularlyLoadView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLoadView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToPage1)))
        lineLoadView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToPage2)))
        verticalStripLoadView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToPage3)))
        embankmentLoadView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToPage4)))
        circularAreaLoadView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToPage5)))
        rectangularlyLoadView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToPage6)))
        
        let subViews: [UIView] = [pointLoadView, lineLoadView, verticalStripLoadView, embankmentLoadView, circularAreaLoadView, rectangularlyLoadView]
        var shadow: Shadow? = Shadow()
        for subView in subViews {
            shadow?.makingShadow(to: subView)
        }
        shadow = nil
    }
    
    @objc func goToPage1() {
        performSegue(withIdentifier: "goToPage1", sender: self)
    }
    @objc func goToPage2() {
        performSegue(withIdentifier: "goToPage2", sender: self)
    }
    @objc func goToPage3() {
        performSegue(withIdentifier: "goToPage3", sender: self)
    }
    @objc func goToPage4() {
        performSegue(withIdentifier: "goToPage4", sender: self)
    }
    @objc func goToPage5() {
        performSegue(withIdentifier: "goToPage5", sender: self)
    }
    @objc func goToPage6() {
        performSegue(withIdentifier: "goToPage6", sender: self)
    }

}
