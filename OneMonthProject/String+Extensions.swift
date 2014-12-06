//
//  String+Extensions.swift
//  OneMonthProject
//
//  Created by Eric S Kuhn on 11/21/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import Foundation

extension String
{
    func isEmailAddress() -> Bool
    {
        var predicate = self.predicateForEmail()
        return predicate.evaluateWithObject(self)
    }
    
    func predicateForEmail() -> NSPredicate
    {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return NSPredicate(format: "SELF MATCHES %@", regularExpression)!
    }
}