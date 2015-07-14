//
//  UmViewController.swift
//  iOS-Animation
//
//  Created by Emiliano Barbosa on 7/4/15.
//  Copyright (c) 2015 Bocamuchas. All rights reserved.
//

import UIKit

class UmViewController: UIViewController {
    
    
    @IBOutlet weak var verticalSpaceBlock: NSLayoutConstraint!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var subeditoria: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        var swipeGestureRecognizer2: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFourthViewController")
        swipeGestureRecognizer2.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeGestureRecognizer2)
        
        var subeditoriaRecgnizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "moveDown")
        subeditoriaRecgnizer.direction = UISwipeGestureRecognizerDirection.Down
        subeditoria.addGestureRecognizer(subeditoriaRecgnizer)
    }
    
    func moveDown(){
        self.view.layoutIfNeeded()
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            ///self.subeditoria.frame = CGRectOffset(self.subeditoria.frame, 0.0, 50.0)
            self.verticalSpaceBlock.constant += 50
            self.view.layoutIfNeeded()
            }) { (Finished) -> Void in
                
        }
    }
    
    func showSecondViewController() {
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }
    
    func showFourthViewController() {
        self.performSegueWithIdentifier("idThirdSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.redColor()
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        }else if sender.identifier == "idThirdSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.redColor()
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        } else {
            self.lblMessage.text = "Welcome back!"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegue" {
            let secondViewController = segue.destinationViewController as! DoisViewController
            secondViewController.message = "Hello from the 1st View Controller"
        }
    }
    
    @IBAction func showThirdViewController(sender: AnyObject) {
        self.performSegueWithIdentifier("idSecondSegue", sender: self)
    }

}
