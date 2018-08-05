//
//  RectangularlyCornerLoadViewController.swift
//  Stress
//
//  Created by Chao Jiang on 8/5/18.
//  Copyright © 2018 nickjc1. All rights reserved.
//

import UIKit

class RectangularlyCornerLoadViewController: UIViewController {
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
        
        var shadow: Shadow? = Shadow()
        shadow?.makingShadow(to: viewOfInputSet)
        shadow?.makingShadow(to: viewOfImage)
        shadow = nil
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
    }
    
    @objc func dismissKeyboard() {
        for textField in textFields {
            if textField.isEditing {
                textField.endEditing(true)
            }
        }
    }
    
    @IBAction func submitbuttonPressed(_ sender: UIButton) {
        var stressFunctions: Stress? = Stress()
        
        guard let q = Double(textFields[0].text!), let z = Double(textFields[1].text!), let b = Double(textFields[2].text!), let l = Double(textFields[3].text!) else {
            return
        }
        guard let result = stressFunctions?.rectangularlyCornerLoad(q: q, z: z, b: b, l: l) else {
            return
        }
        resultTextField.text = String(result)
        
        stressFunctions = nil
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        for textField in textFields {
            textField.text = ""
        }
        resultTextField.text = ""
        submitButton.isEnabled = false
    }
}

extension RectangularlyCornerLoadViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        var canEnableSubmitbutton = true
        for textField in textFields {
            canEnableSubmitbutton = canEnableSubmitbutton && (!(textField.text?.isEmpty)!)
        }
        submitButton.isEnabled = canEnableSubmitbutton
    }
}
