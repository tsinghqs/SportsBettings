//
//  LogInViewController.swift
//  SportsBetting
//
//  Created by Deval Parikh on 6/12/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func LogInButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        UsernameTextField.delegate = self
        PasswordTextField.delegate = self
    }
    // MARK: - Search Method (Dismisses Keyboard on "Done" Press)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == UsernameTextField {
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
