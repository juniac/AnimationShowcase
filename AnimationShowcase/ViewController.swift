//
//  ViewController.swift
//  AnimationShowcase
//
//  Created by juniac on 04/15/2015.
//  Copyright (c) 2015 Bucket Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dampingValueLabel: UILabel!
    @IBOutlet weak var velocityValueLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var dampingSlider: UISlider!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBOutlet weak var animationOptionSegment: UISegmentedControl!
    
    var sampleView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sampleView = UIView(frame: CGRectMake(0, 100, 50, 50))
        sampleView.backgroundColor = UIColor.redColor()
        self.view.addSubview(sampleView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dampingSliderAction(sender: UISlider) {
        self.dampingValueLabel.text = NSString(format: "%.2f", sender.value) as String
    }

    @IBAction func velocitySliderAction(sender: UISlider) {
        velocityValueLabel.text = NSString(format: "%.2f", sender.value) as String
    }
    @IBAction func durationSliderAction(sender: UISlider) {
        durationValueLabel.text = NSString(format: "%.2f", sender.value) as String
    }
    @IBAction func resetButtonAction(sender: UIButton) {
        sampleView.transform = CGAffineTransformIdentity
    }
    @IBAction func startButtonAction(sender: AnyObject) {
        var option:UIViewAnimationOptions!
        switch animationOptionSegment.selectedSegmentIndex {
        case 0:
            option = UIViewAnimationOptions.CurveEaseIn
            break
        case 1:
            option = UIViewAnimationOptions.CurveEaseOut
            break
        case 2:
            option = UIViewAnimationOptions.CurveEaseInOut
            break
        case 3:
            option = UIViewAnimationOptions.CurveLinear
            break
        default:
            option = UIViewAnimationOptions.CurveEaseInOut
            break
            
        }

        
        UIView.animateWithDuration(NSTimeInterval(durationSlider.value),
            delay: 0,
            usingSpringWithDamping:CGFloat(dampingSlider.value),
            initialSpringVelocity: CGFloat(velocitySlider.value),
            options: option, animations: {
                self.sampleView.transform = CGAffineTransformMakeTranslation(100, 0)
                
            }, completion: { finished in
        })
    }
}

