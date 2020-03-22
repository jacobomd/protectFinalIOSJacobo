//
//  TopicDB.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 21/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation
import RealmSwift

class TopicDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var created_at: String = ""
    @objc dynamic var posts_count: Int = 0
    @objc dynamic var views: Int = 0
    @objc dynamic var last_posted_at: String = ""
    var posters = List<PostersByTopicDB>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
   
    convenience init(id: Int, title: String, created_at: String, posts_count: Int, views: Int, last_posted_at: String, posters: List<PostersByTopicDB>) {
        self.init()
        
        self.id = id
        self.title = title
        self.created_at = created_at
        self.posts_count = posts_count
        self.views = views
        self.last_posted_at = last_posted_at
        self.posters = posters
    }
}

class PostersByTopicDB: Object {
    @objc dynamic var descripcion: String = ""
    @objc dynamic var user_id: Int = 0
    
    override static func primaryKey() -> String? {
          return "user_id"
      }

    convenience init(descripcion: String, user_id: Int) {
    self.init()
    
    self.descripcion = descripcion
    self.user_id = user_id
    }

}
