//
//  AuthViewController.swift
//  OneMonthProject
//
//  Created by Eric S Kuhn on 11/21/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField: UITextField?
    @IBOutlet var passwordTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        var emailImageView = UIImageView(frame: CGRectMake(0,0,50, self.emailTextField!.frame.size.height))
        emailImageView.image = UIImage(named: "EmailIcon")
        emailImageView.contentMode = .Center
        
        self.emailTextField!.leftView = emailImageView
        self.emailTextField!.leftViewMode = .Always
        
        var passwordImageView = UIImageView(frame: CGRectMake(0,0,50, self.emailTextField!.frame.size.height))
        passwordImageView.image = UIImage(named: "PasswordIcon")
        passwordImageView.contentMode = .Center
        
        self.passwordTextField!.leftView = passwordImageView
        self.passwordTextField!.leftViewMode = .Always
        
        
        

        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        self.emailTextField?.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true , animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if (textField == self.emailTextField)
        {
            self.emailTextField?.resignFirstResponder()
            self.passwordTextField?.becomeFirstResponder()
        }
        else if (textField == self.passwordTextField)
        {
            self.passwordTextField?.resignFirstResponder()
            self.authenticate()
        }
        return true
    }
    
    func authenticate()
    {
        var email = self.emailTextField?.text
        var password = self.passwordTextField?.text
        
        if (email?.isEmpty == true || password?.isEmpty == true || email?.isEmailAddress() == false)
        {
            //alert the user
            
            return
        }
        
        
        
        
        
        
        // otherwise, authenticate
    }
}