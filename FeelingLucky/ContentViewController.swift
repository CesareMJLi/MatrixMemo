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
    @IBAction func setTextBox(_ sender: UIButton) {
        textView.text = "What the fuck dudeeeeee"
    }
    
    
    @IBAction func setTextBoxColor(_ sender: UISegmentedControl) {
        var counter: Int = 1
        switch sender.selectedSegmentIndex{
        case 0:
            // Normal
            segmentThemeCtrl.tintColor = UIColor.blue
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.white
            backgroundView.backgroundColor = UIColor.white
        case 1:
            // Matrix
            segmentThemeCtrl.tintColor = UIColor.green
            textView.textColor = UIColor.green
            textView.backgroundColor = UIColor.black
            backgroundView.backgroundColor = UIColor.black
        case 2:
            // Man
            segmentThemeCtrl.tintColor = UIColor.black
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.init(red: 254.0/255, green: 244.0/255, blue: 156.0/255, alpha: 1)
            backgroundView.backgroundColor = UIColor.init(red: 254.0/255, green: 244.0/255, blue: 156.0/255, alpha: 1)
        case 3:
            // May
            segmentThemeCtrl.tintColor = UIColor.black
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.cyan
            backgroundView.backgroundColor = UIColor.cyan
        case 4:
            // Anti
            segmentThemeCtrl.tintColor = UIColor.white
            textView.textColor = UIColor.white
            textView.backgroundColor = UIColor.black
            backgroundView.backgroundColor = UIColor.black
        case 5:
            // Light
            counter+=1
            segmentThemeCtrl.tintColor = UIColor.black
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.lightGray
            backgroundView.backgroundColor = UIColor.lightGray
            NSLog("sender: %i",counter)
        default:
            NSLog("sender: %ld",sender.selectedSegmentIndex)
        }
    }
    

}


