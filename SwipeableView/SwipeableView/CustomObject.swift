//
//  CustomObject.swift
//  SwipeableView
//
//  Created by Alessio on 05/10/18.
//  Copyright © 2018 Mitric. All rights reserved.
//

import UIKit

class CustomObject: NSObject {
    
    var title:String!
    var release:Date!
    var avatar:UIImage!
    var GUID:String!
    
    init(co: Dictionary<String,Any>) {
        
        self.GUID = co["GUID"] as? String
        self.title = co["title"] as? String
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        self.release = df.date(from:(co["release"] as? String)!)!
        self.avatar = UIImage()
        
    }

}
