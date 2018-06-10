//
//  LogInViewController.swift
//  Tinder
//
//  Created by Robert Jackson Jr on 6/7/18.
//  Copyright © 2018 Robert Jackson Jr. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInSignUpButton: UIButton!
    @IBOutlet var changeLogInSignUpButton: UIButton!
    
    var signUpMode = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
    }
    
    
    @IBAction func logInSignUpTapped(_ sender: Any) {
        
        if signUpMode {
            let user = PFUser()
            
            user.username = usernameTextField.text
            user.password = passwordTextField.text
            
            user.signUpInBackground (block: { (success, error) in
                if error != nil {
                    var errorMessage = "Sign Up Failed - Try Again"
                    if let newError = error as NSError? {
                        if let detailError = newError.userInfo["error"] as? String {
                            errorMessage = detailError
                        }
                    }
                    
                    self.errorLabel.isHidden = false
                    self.errorLabel.text = errorMessage
                    
                } else {
                    print("Sign Up Successful")
                    self.performSegue(withIdentifier: "updateSegue", sender: nil)
                }
            })
        } else {
            
            if let username = usernameTextField.text {
                if let password = passwordTextField.text {
                    PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
                        if error != nil {
                            var errorMessage = "Login Failed - Try Again"
                            if let newError = error as NSError? {
                                if let detailError = newError.userInfo["error"] as? String {
                                    errorMessage = detailError
                                }
                            }
                            
                            self.errorLabel.isHidden = false
                            self.errorLabel.text = errorMessage
                            
                        } else {
                            print("Login Successful")
                            if user?["isFemale"] != nil {
                                self.performSegue(withIdentifier: "loginToSwipingSegue", sender: nil)
                            } else {
                                self.performSegue(withIdentifier: "updateSegue", sender: nil)
                            }
                            
                          
                        }
                    }
                }
            }
          
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if PFUser.current() != nil {
            
            if PFUser.current()?["isFemale"] != nil {
             self.performSegue(withIdentifier: "loginToSwipingSegue", sender: nil)
            } else {
            self.performSegue(withIdentifier: "updateSegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func changeLogInSignUpTapped(_ sender: Any) {
        
        if signUpMode {
            
            logInSignUpButton.setTitle("Log In", for: .normal)
            changeLogInSignUpButton.setTitle("Sign Up", for: .normal)
            signUpMode = false
        } else {
            
            logInSignUpButton.setTitle("Sign Up", for: .normal)
            changeLogInSignUpButton.setTitle("Log In", for: .normal)
            signUpMode = true
        }
        
    }
    
   


}
