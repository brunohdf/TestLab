//
//  ViewController.swift
//  TestLab
//
//  Created by SalmoJunior on 1/6/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "TestLab"
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detail_segue") {
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.name = nameTextField.text
        }
        
    }
    
    @IBAction func next(sender: AnyObject) {
        let name = nameTextField.text
        
        if name == "" {
            shakeTextField(nameTextField)
        } else {
            performSegueWithIdentifier("detail_segue", sender: nil)
        }
    }
    
}

func shakeTextField(textField: UITextField) {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.07
    animation.repeatCount = 4
    animation.autoreverses = true
    animation.fromValue = NSValue(CGPoint: CGPointMake(textField.center.x - 10, textField.center.y))
    animation.toValue = NSValue(CGPoint: CGPointMake(textField.center.x + 10, textField.center.y))
    textField.layer.addAnimation(animation, forKey: "position")
}

