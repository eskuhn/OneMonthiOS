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
    @IBOutlet var dateLabel: UILabel?
    
    var post: PFObject?
    {
        didSet
        {
            self.configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor.OMLightGray()

        
        self.usernameLabel?.text = nil
        self.dateLabel?.text = nil
        
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.postImageView?.image = UIImage(named: "PostPlaceholderImage")
        self.usernameLabel?.text = nil
        self.dateLabel?.text = nil
        self.post = nil
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure()
    {
        
        self.postImageView!.clipsToBounds = true
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
            
            var date = constPost.createdAt
            self.dateLabel?.text = date.fuzzyTime()
            
            // download the image and display it
            
            // NetworkManager download image and return it.
            NetworkManager.sharedInstance.fetchImage(constPost, completionHandler: {
                (image, error) -> () in
                
                if image != nil
                {
                    self.postImageView!.image = image
                }
                else
                {
                    //alert user
                }
                
            })
        
            
        }
    }
}
