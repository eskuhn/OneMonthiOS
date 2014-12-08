//
//  NetworkManager.swift
//  OneMonthProject
//
//  Created by Sarah B Fixler on 12/7/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import Foundation

public class NetworkManager
{
    public class var sharedInstance: NetworkManager
    {
        struct Singleton
        {
            static let instance = NetworkManager()
        }
        
        return Singleton.instance
    }
    
    func follow(user: PFUser!, completionHandler:(error: NSError?) -> ())
    {
        var relation = PFUser.currentUser().relationForKey("following")
        relation.addObject(user)
        PFUser.currentUser().saveInBackgroundWithBlock({
            (success, error) -> Void in
            
            completionHandler(error: error)
        })
    }
    
    func fetchFeed(completionHandler: (objects: [AnyObject]?, error: NSError?) -> ())
    {
        
    }
    
}