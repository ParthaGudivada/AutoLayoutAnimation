//
//  ViewController.swift
//  AnimatingView
//
//  Created by Parthasarathy Gudivada on 12/2/14.
//  Copyright (c) 2014 LearnJava. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    lazy var safariImageView1 = UIImageView()
    lazy var safariImageView2 = UIImageView()
    lazy var safariImage = UIImage(named: "Safari")
    var startPositionImage1XConstraint : NSLayoutConstraint?
    var startPositionImage1YConstraint : NSLayoutConstraint?
    var startPositionImage2XConstraint : NSLayoutConstraint?
    var startPositionImage2YConstraint : NSLayoutConstraint?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        safariImageView1.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(safariImageView1)
        safariImageView1.addConstraint(NSLayoutConstraint(item: safariImageView1, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        safariImageView1.addConstraint(NSLayoutConstraint(item: safariImageView1, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        startPositionImage1XConstraint = NSLayoutConstraint(item: safariImageView1, attribute: .Leading , relatedBy: .Equal, toItem: self.view, attribute: .Leading , multiplier: 1.0, constant: 10.0)
        startPositionImage1YConstraint = NSLayoutConstraint(item: safariImageView1, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 40.0)
        view.addConstraint(startPositionImage1XConstraint!)
        view.addConstraint(startPositionImage1YConstraint!)
        
       
        safariImageView2.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(safariImageView2)
        safariImageView2.addConstraint(NSLayoutConstraint(item: safariImageView2, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        safariImageView2.addConstraint(NSLayoutConstraint(item: safariImageView2, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        startPositionImage2XConstraint = NSLayoutConstraint(item: safariImageView2, attribute: .Leading , relatedBy: .Equal, toItem: self.view, attribute: .Trailing , multiplier: 1.0, constant: -100.0)
        startPositionImage2YConstraint = NSLayoutConstraint(item: safariImageView2, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -100.0)
        view.addConstraint(startPositionImage2XConstraint!)
        view.addConstraint(startPositionImage2YConstraint!)
        
        safariImageView1.image = safariImage
        safariImageView2.image = safariImage
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTopLeftImageViewAnimation()
    {
         safariImageView1.alpha = 1.0
        
        UIView.animateWithDuration(5.0, animations: { [weak self]() -> Void in
            self!.view.removeConstraint(self!.startPositionImage1XConstraint!)
            self!.view.removeConstraint(self!.startPositionImage1YConstraint!)
            self!.startPositionImage1XConstraint = NSLayoutConstraint(item: self!.safariImageView1, attribute: .Leading , relatedBy: .Equal, toItem: self!.view, attribute: .Trailing , multiplier: 1.0, constant: -100.0)
            self!.startPositionImage1YConstraint = NSLayoutConstraint(item: self!.safariImageView1, attribute: .Top, relatedBy: .Equal, toItem: self!.view, attribute: .Bottom, multiplier: 1.0, constant: -100.0)
            self!.view.addConstraint(self!.startPositionImage1XConstraint!)
            self!.view.addConstraint(self!.startPositionImage1YConstraint!)
            self!.safariImageView1.alpha = 0.0
            self!.safariImageView1.layoutIfNeeded()
            
            }, completion :{ [weak self](completed : Bool) -> Void in
                self!.safariImageView1.removeFromSuperview()
        })
 
    }
    
    func startBottomRightImageViewAnimationAfterDelay(paramDelay : CGFloat)
    {
        safariImageView2.alpha = 1.0
        
        UIView.animateWithDuration(3, delay: NSTimeInterval(paramDelay),
            options: UIViewAnimationOptions(rawValue: 0),
            animations: {[weak self] () -> Void in
            self!.view.removeConstraint(self!.startPositionImage2XConstraint!)
            self!.view.removeConstraint(self!.startPositionImage2YConstraint!)
            self!.startPositionImage2XConstraint = NSLayoutConstraint(item: self!.safariImageView2, attribute: .Leading , relatedBy: .Equal, toItem: self!.view, attribute: .Leading , multiplier: 1.0, constant: 10.0)
            self!.startPositionImage2YConstraint = NSLayoutConstraint(item: self!.safariImageView2, attribute: .Top, relatedBy: .Equal, toItem: self!.view, attribute: .Top, multiplier: 1.0, constant: 40.0)
            self!.view.addConstraint(self!.startPositionImage2XConstraint!)
            self!.view.addConstraint(self!.startPositionImage2YConstraint!)
            self!.safariImageView2.alpha = 0.0
            self!.safariImageView2.layoutIfNeeded()
            
            }) { [weak self](finished : Bool) -> Void in
                self!.safariImageView2.removeFromSuperview()
        }
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        startTopLeftImageViewAnimation()
        startBottomRightImageViewAnimationAfterDelay(2)
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
