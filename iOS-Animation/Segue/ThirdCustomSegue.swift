//
//  ThirdCustomSegue.swift
//  iOS-Animation
//
//  Created by Emiliano Barbosa on 7/5/15.
//  Copyright (c) 2015 Bocamuchas. All rights reserved.
//

import UIKit

class ThirdCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        // Assign the source and destination views to local variables.
        var firstVCView = self.sourceViewController.view as UIView!
        var fourthVCView = self.destinationViewController.view as UIView!
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        fourthVCView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(fourthVCView, aboveSubview: firstVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, -screenWidth, 0.0)
            fourthVCView.frame = CGRectOffset(fourthVCView.frame, -screenHeight, 0.0)
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController,
                    animated: false,
                    completion: nil)
        }
        
    }
   
}
