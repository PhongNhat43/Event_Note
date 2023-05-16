//
//  Event.swift
//  Events
//
//  Created by devsenior on 02/04/2023.
//

import UIKit
import RealmSwift

class Event: Object {
    @objc dynamic var title: String?
    @objc dynamic var desc: String?
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    @objc dynamic var date: Date = Date()
//    @objc dynamic var image: NSData?
    

    convenience init(title: String, desc: String, _id: String, date: Date) {
        self.init()
        self.title = title
        self.desc = desc
        self.date = date
    }
    
    override static func primaryKey() -> String {
        return "_id"
    }

}
