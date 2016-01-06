//
//  DetailViewController.swift
//  TestLab
//
//  Created by SalmoJunior on 1/6/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Detail"
        resultLabel.text = "Ok captain \(name), you got it!"
    }

}
