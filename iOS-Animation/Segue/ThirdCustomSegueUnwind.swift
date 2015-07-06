//
//  ThirdCustomSegueUnwind.swift
//  iOS-Animation
//
//  Created by Emiliano Barbosa on 7/5/15.
//  Copyright (c) 2015 Bocamuchas. All rights reserved.
//

import UIKit

class ThirdCustomSegueUnwind: UIStoryboardSegue {
    
    override func perform() {
        // Assign the source and destination views to local variables.
        var fourthVCView = self.sourceViewController.view as UIView!
        var firstVCView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: fourthVCView)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, screenWidth, 0.0)
            fourthVCView.frame = CGRectOffset(fourthVCView.frame, screenWidth, 0.0)
            
            }) { (Finished) -> Void in
                
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
   
}
