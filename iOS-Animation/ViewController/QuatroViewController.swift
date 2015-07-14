//
//  QuatroViewController.swift
//  iOS-Animation
//
//  Created by Emiliano Barbosa on 7/5/15.
//  Copyright (c) 2015 Bocamuchas. All rights reserved.
//

import UIKit
import AVFoundation

class QuatroViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        self.loadWebview()
    
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("idThirdSegueUnwind", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "idThirdSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
    
    func loadWebview(){
        var error:NSErrorPointer = NSErrorPointer();
        var success:Bool = AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: error)
        
        
        var fullURL:String = "http://www.globo.com"
        var url:NSURL = NSURL(string: fullURL)!
        var request:NSURLRequest = NSURLRequest(URL: url)
        self.webview.loadRequest(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
