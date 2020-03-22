//
//  PosterDB.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 22/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

import RealmSwift

class PosterDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var username: String = ""
    @objc dynamic var cooked: String = ""
    @objc dynamic var created_at: String = ""
    @objc dynamic var topic_id: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
   
    convenience init(id: Int, username: String, cooked: String, created_at: String, topic_id: Int) {
        self.init()
        
        self.id = id
        self.username = username
        self.cooked = cooked
        self.created_at = created_at
        self.topic_id = topic_id
    }
}
