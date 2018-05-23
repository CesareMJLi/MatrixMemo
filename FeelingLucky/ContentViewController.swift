//
//  ContentViewController.swift
//  FeelingLucky
///Users/cesare/Documents/iOS Development/MatrixMemo/FeelingLucky/ContentViewController.swift
//  Created by 李明举 on 2018/5/17.
//  Copyright © 2018年 李明举. All rights reserved.
//

import UIKit
import os.log

class ContentViewController: UIViewController, UITextViewDelegate {
    
    var m: memo?

    // MARK: Properties
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var segmentThemeCtrl: UISegmentedControl!
    
    var kbHeight: CGFloat!
    
    override func viewDidLoad() {
        textView.delegate = self
        loadMemo()
        textView.text = m?.content
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //----------Start from keyboard moving----------
    func animateTextView(up:Bool){
        if up{
            os_log("MOVED UP!!!!!!!!!!!!!!")
        }else{
            os_log("MOVED DOWN!!!!!!!!!!!!!!")
        }
        var movement = (up ? -kbHeight : (kbHeight/2))
        UIView.animate(withDuration: 0.3, animations: {self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)})
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                kbHeight = keyboardSize.height
                self.animateTextView(up: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.animateTextView(up: false)
    }
    
    func textViewShouldReturn(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    
    //----------End of keyboard moving----------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func setTextBoxColor(_ sender: UISegmentedControl) {
        m = memo(content: textView.text)!
        switch sender.selectedSegmentIndex{
        case 0:
            // Normal
            segmentThemeCtrl.tintColor = UIColor.blue
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.white
            backgroundView.backgroundColor = UIColor.white
            saveMemo()
        case 1:
            // Matrix
            segmentThemeCtrl.tintColor = UIColor.green
            textView.textColor = UIColor.green
            textView.backgroundColor = UIColor.black
            backgroundView.backgroundColor = UIColor.black
            saveMemo()
        case 2:
            // Man
            segmentThemeCtrl.tintColor = UIColor.black
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.init(red: 254.0/255, green: 244.0/255, blue: 156.0/255, alpha: 1)
            backgroundView.backgroundColor = UIColor.init(red: 254.0/255, green: 244.0/255, blue: 156.0/255, alpha: 1)
            saveMemo()
        case 3:
            // Ocean
            segmentThemeCtrl.tintColor = UIColor.black
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.cyan
            backgroundView.backgroundColor = UIColor.cyan
            saveMemo()
        case 4:
            // Anti
            segmentThemeCtrl.tintColor = UIColor.white
            textView.textColor = UIColor.white
            textView.backgroundColor = UIColor.black
            backgroundView.backgroundColor = UIColor.black
            saveMemo()
        case 5:
//            // Light
//            segmentThemeCtrl.tintColor = UIColor.black
//            textView.textColor = UIColor.black
//            textView.backgroundColor = UIColor.lightGray
//            backgroundView.backgroundColor = UIColor.lightGray
//            saveMemo()
            saveMemo()
            self.performSegue(withIdentifier:"backToMainView", sender:self)
        default:
            NSLog("sender: %ld",sender.selectedSegmentIndex)
        }
    }
    
    // MARK: private functions
    private func showMemoContents(m: memo){
        textView.text = m.content
    }
    
    private func saveMemo(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(m!, toFile: memo.ArchiveURL.path)
        if isSuccessfulSave{
            NSLog("Saved")
//            os_log("Memo saved.", log: OSLog.default, type: .debug)
        }else{
            NSLog("Failed to save")
//            os_log("Failed to save.", log: OSLog.default, type: .error)
        }
    }
    
    private func loadMemo(){
        self.m = NSKeyedUnarchiver.unarchiveObject(withFile: memo.ArchiveURL.path) as? memo
    }
}


