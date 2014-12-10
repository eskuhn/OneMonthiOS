//
//  TabBarController.swift
//  OneMonthProject
//
//  Created by Eric S Kuhn on 12/5/14.
//  Copyright (c) 2014 Eric S Kuhn. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        var feedViewController = FeedViewController(nibName: "FeedViewController", bundle: nil)
    
        var profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileViewController.user = PFUser.currentUser()
        
        var searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)

        var cameraViewController = UIViewController()
        cameraViewController.view.backgroundColor = UIColor.purpleColor()
        
        var viewControllers = [feedViewController, profileViewController, searchViewController, cameraViewController]
        self.setViewControllers(viewControllers, animated: true)
        
        var imageNames = ["FeedIcon", "ProfileIcon", "SearchIcon", "CameraIcon"]
        
        let tabItems = tabBar.items as [UITabBarItem]
        for (index, value) in enumerate(tabItems)
        {
            var imageName = imageNames[index]
            value.image = UIImage(named: imageName)
            value.imageInsets = UIEdgeInsetsMake(5.0,0,-5,0)
        }
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.navigationItem.hidesBackButton = true
        self.tabBar.translucent = false
        
        self.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .Done, target: self, action: "didTapSignOut:")
        
        
    
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false , animated: false)
        self.navigationItem.title = "One Month"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapSignOut(sender: AnyObject)
    {
        PFUser.logOut()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool
    {
        var cameraViewController = self.viewControllers![3] as UIViewController
        if viewController == cameraViewController
        {
            showCamera()
            return false
        }
        
        return true
    }

    func showCamera()
    {
        if !UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            self.alert("Camera is not available")
            return
        }
        
        
    }
}

