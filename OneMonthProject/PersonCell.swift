//
//  PersonCell.swift
//  OneMonthProject
//
//  Created by Eric S Kuhn on 12/9/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {


    var user: PFUser?
        {
            didSet
            {
                self.configure()
            }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
                
                NetworkManager.sharedInstance.isFollowing(constUser, completionHandler: {
                    (isFollowing, error) -> () in
                })
                
                // are we following this person?
                
                //if so, configure the button to unfollow
                
                //if not, configure the button to follow
            }
    }
    
}
