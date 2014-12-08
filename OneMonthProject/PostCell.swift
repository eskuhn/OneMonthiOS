//
//  PostCell.swift
//  OneMonthProject
//
//  Created by Sarah B Fixler on 12/7/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var postImageView: UIImageView?
    @IBOutlet var usernameLabel: UILabel?
    @IBOutlet var datelabel: UILabel?
    
    var post: PFObject?
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
        if let constPost = post
        {
            // set the username label
            var user = constPost["User"] as PFUser
            user.fetchIfNeededInBackgroundWithBlock({
                (object, error) -> Void in
                
                if let constObject = object
                {
                    self.usernameLabel!.text = user.username
                }
                else if let constError = error
                {
                    //Alert the user
                }
            })
            
            // set the date label
            
            // download the image and display it
            
            
        }
    }
}
