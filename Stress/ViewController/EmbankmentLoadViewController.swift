//
//  EmbankmentLoadViewController.swift
//  Stress
//
//  Created by Chao Jiang on 8/5/18.
//  Copyright © 2018 nickjc1. All rights reserved.
//

import UIKit

class EmbankmentLoadViewController: UIViewController {
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
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        for textField in textFields {
            textField.text = ""
        }
        submitButton.isEnabled = false
        resultTextField.text = ""
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        var stressFunctions: Stress? = Stress()
        
        let q = Double(textFields[0].text!)!
        let z = Double(textFields[1].text!)!
        let b1 = Double(textFields[2].text!)!
        let b2 = Double(textFields[3].text!)!
        
        guard let result = stressFunctions?.embankmentLoad(q: q, z: z, b1: b1, b2: b2) else {
            return
        }
        resultTextField.text = String(result)
        stressFunctions = nil
    }
    
    
}
extension EmbankmentLoadViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        var canEnableSubmitbutton = true
        for textField in textFields {
            canEnableSubmitbutton = (canEnableSubmitbutton && !(textField.text?.isEmpty)!)
        }
        submitButton.isEnabled = canEnableSubmitbutton
    }
}
