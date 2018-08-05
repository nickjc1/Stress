//
//  LineLoadViewController.swift
//  Stress
//
//  Created by Chao Jiang on 8/4/18.
//  Copyright © 2018 nickjc1. All rights reserved.
//

import UIKit

class LineLoadViewController: UIViewController {
    
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
        for textfield in textFields {
            if textfield.isEditing {
                textfield.endEditing(true)
            }
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        for textField in textFields {
            textField.text = ""
        }
        resultTextField.text = ""
        submitButton.isEnabled = false
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        var stressFunctions: Stress? = Stress()
        
        guard let q = Double(textFields[0].text!), let x = Double(textFields[1].text!), let z = Double(textFields[2].text!) else {
            return
        }
        guard let result = stressFunctions?.lineLoad(q: q, x: x, z: z) else {
            return
        }
        resultTextField.text = String(result)
        
        stressFunctions = nil
    }
    
}

extension LineLoadViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        var canEnableSubmitButton = true
        for textField in textFields {
            canEnableSubmitButton = canEnableSubmitButton && (textField.text != "")
        }
        submitButton.isEnabled = canEnableSubmitButton
    }
}
