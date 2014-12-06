//
//  StartViewController.swift
//  OneMonthProject
//
//  Created by Eric S Kuhn on 11/20/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func didTapSignIn(sender: AnyObject)
    {
        var viewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        viewController.authMode = .SignIn
        self.navigationController?.pushViewController(viewController, animated: true)
    }
   
    @IBAction func didTapSignUp(sender: AnyObject)
    {
        var viewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        viewController.authMode = .SignUp
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
