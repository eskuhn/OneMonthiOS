//
//  PersonCell.swift
//  OneMonthProject
//
//  Created by Eric S Kuhn on 12/9/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet var followButton: UIButton?
    
    var isFollowing: Bool?

    var user: PFUser?
        {
            didSet
            {
                self.configure()
            }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.isFollowing = false
        self.followButton?.hidden = true
        // Initialization code
    }

    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        self.isFollowing = false
        self.followButton?.hidden = true
        self.textLabel?.text = ""
        self.user = nil
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func configure()
    {
        if let constUser = user
            {
                self.textLabel?.text = self.user?.username
                
                // are we following this person?
                
                
                NetworkManager.sharedInstance.isFollowing(constUser, completionHandler: {
                    (isFollowing, error) -> () in
                    
                    if let constError = error
                    {
                        //Alert the user, or otherwise modify UI
                    }
                    else
                    {
                        
                        self.isFollowing = isFollowing
                        if isFollowing == true
                        {
                            var image = UIImage(named: "UnfollowButton")
                            self.followButton?.setImage(image, forState: .Normal)
                        }
                        //if not, configure the button to follow
                        else
                        {
                            var image = UIImage(named: "FollowButton")
                            self.followButton?.setImage(image, forState: .Normal)                        }
                        
                            self.followButton?.hidden = false
                    }
                    
                })
                
                             
            }
    }
    
    @IBAction func didTapFollow(sender: UIButton)
    {
        self.followButton?.enabled = false
        
        var newValue = !(self.isFollowing == true)
        NetworkManager.sharedInstance.updateFollowValue(newValue, user: self.user!) { (error) -> () in
            
            self.followButton?.enabled = true
            var image = (newValue == true) ? UIImage(named: "UnfollowButton") : UIImage(named: "FollowButton")
            self.followButton?.setImage(image, forState: .Normal)
            
            self.isFollowing = newValue
        }
    }
}
