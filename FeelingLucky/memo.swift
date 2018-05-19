//
//  memo.swift
//  FeelingLucky
//
//  Created by 李明举 on 2018/5/19.
//  Copyright © 2018年 李明举. All rights reserved.
//

import Foundation
import UIKit
import os.log

class memo: NSObject, NSCoding{
    // MARK: Properties
    var content: String
    
    struct PropertyKey{
        static let content = "content"
    }
    
    // Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("memo")
    
    // MARK: Initialization
    init?(content: String){
        self.content = content
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(content, forKey: PropertyKey.content)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let content = aDecoder.decodeObject(forKey: PropertyKey.content) as? String else{
            os_log("Unable to decode the content for the memo.", log:OSLog.default, type:.debug)
            return nil
        }
        self.init(content: content)
    }
}
