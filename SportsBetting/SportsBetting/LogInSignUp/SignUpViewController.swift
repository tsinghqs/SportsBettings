//
//  SignUpViewController.swift
//  SportsBetting
//
//  Created by Deval Parikh on 6/12/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var EmailTextFlield: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        EmailTextFlield.delegate = self
        UserNameTextField.delegate = self
        PasswordTextField.delegate = self
    }
    // MARK: - Search Method (Dismisses Keyboard on "Done" Press)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == EmailTextFlield {
            // Switch focus to other text field
            UserNameTextField.becomeFirstResponder()
        }
        if textField == UserNameTextField {
            // Switch focus to other text field
            PasswordTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
