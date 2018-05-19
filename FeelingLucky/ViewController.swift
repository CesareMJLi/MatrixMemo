//
//  ViewController.swift
//  FeelingLucky
//
//  Created by 李明举 on 2018/5/13.
//  Copyright © 2018年 李明举. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var sendNudes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround()
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    // MARK: Actions
    @IBAction func setNudes(_ sender: UIButton) {
        if password.text == "1207"{
            self.performSegue(withIdentifier:"toContentPage", sender:self)
        } else {
            sendNudes.text = "INCORRECT USER"
        }
    }
}

