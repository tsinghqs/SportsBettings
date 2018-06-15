//
//  LogInSignUpViewController.swift
//  SportsBetting
//
//  Created by Deval Parikh on 6/12/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//

import UIKit
import FacebookLogin

class LogInSignUpViewController: UIViewController {

    override func viewDidLoad() {
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        loginButton.frame = CGRect(x:50,
                                   y:460,
                                   width:280,
                                   height:50)
        
        loginButton.layer.cornerRadius = 30
        
        view.addSubview(loginButton)
        super.viewDidLoad()

        // Do any additional etup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
//MARK: - Dismiss Keyboard
//put self.hideKeyboardWhenTappedAround() in viewDidLoad function
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
