//
//  PointLoadViewController.swift
//  Stress
//
//  Created by Chao Jiang on 8/2/18.
//  Copyright © 2018 nickjc1. All rights reserved.
//

import UIKit
import ChameleonFramework

class PointLoadViewController: UIViewController {
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var viewOfImage: UIView!
    @IBOutlet weak var viewOfInputSet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for textField in textFields {
            textField.delegate = self
        }
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        var shadow: Shadow? = Shadow()
        shadow?.makingShadow(to: viewOfImage)
        shadow?.makingShadow(to: viewOfInputSet)
        shadow = nil
    }
    
    @objc func dismissKeyboard() {
        for textField in textFields {
            if textField.isEditing {
                textField.endEditing(true)
            }
        }
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        for textField in textFields {
            textField.text = ""
        }
        resultTextField.text = ""
        submitButton.isEnabled = false
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        var stressFuncCollection: Stress? = Stress()
        
        let q = Double(textFields[0].text!)!
        let x = Double(textFields[1].text!)!
        let y = Double(textFields[2].text!)!
        let z = Double(textFields[3].text!)!
        guard let result = stressFuncCollection?.pointLoad(q: q, x: x, y: y, z: z) else {
            return
        }
        
        resultTextField.text = String(result)
        stressFuncCollection = nil
    }
}

extension PointLoadViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        var canEnableSubmitButton = true
        for textField in textFields {
            canEnableSubmitButton = canEnableSubmitButton && (textField.text != "")
        }
        submitButton.isEnabled = canEnableSubmitButton
    }
}









