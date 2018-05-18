//
//  ContentViewController.swift
//  FeelingLucky
//
//  Created by 李明举 on 2018/5/17.
//  Copyright © 2018年 李明举. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var segmentThemeCtrl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func setTextBoxFiled(_ sender: UIButton) {
        textView.text = "What the fuck dudeeeeee"
    }
    
    @IBAction func setTextBoxColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            textView.textColor = UIColor.black
        case 1:
            textView.textColor = UIColor.blue
            backgroundView.backgroundColor = UIColor.brown
            textView.backgroundColor = UIColor.brown
        case 2:
            textView.textColor = UIColor.orange
        case 3:
            textView.textColor = UIColor.yellow
        case 4:
            textView.textColor = UIColor.white
        case 5:
            textView.textColor = UIColor.lightGray
        default:
            NSLog("sender: %ld",sender.selectedSegmentIndex)
        }
    }
    

}


