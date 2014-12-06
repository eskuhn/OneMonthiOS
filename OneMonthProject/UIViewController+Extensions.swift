//
//  UIViewController+Extensions.swift
//  OneMonthProject
//
//  Created by Eric S Kuhn on 11/22/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import Foundation

extension UIViewController
{
    func showAlert(message: String)
    {
        self.showAlert("Uh Oh", message: message)
    }
    
    
    func showAlert(title: String, message: String)
    {
        var alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
