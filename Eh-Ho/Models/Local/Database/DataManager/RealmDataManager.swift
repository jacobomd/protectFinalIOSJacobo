//
//  RealmDataManager.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 21/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDataManager {
    
    private let realm = try! Realm()
    
    func initDefaultData() {
        deleteAllData()
    }
    
    func deleteAllData() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
   //MARK: Guardar todos los topics 
    func saveTopics(topicDB: [Topic]) {
        
        for topic in topicDB {
            try! realm.write {
                realm.add(topicDataDB(from: topic), update: .all)
                for post in topic.posters {
                    realm.add(postDB(from: post), update: .all)
                }
            }
        }
    }
    
    //MARK: Guardar todos los posts
    func savePosts(postDB: [LatestPost]) {
        for post in postDB {
            try! realm.write {
                realm.add(postDataDB(from: post), update: .all)
            }
        }
    }
    
    private func postDataDB(from postData: LatestPost) -> PosterDB {
        return PosterDB(id: postData.id,
                        username: postData.username,
                        cooked: postData.cooked,
                        created_at: postData.createdAt,
                        topic_id: postData.topicID)
    }
    
    private func postDB(from postData: Poster) -> PostersByTopicDB {
        return PostersByTopicDB(
                                descripcion: postData.description,
                                user_id: postData.userID)
    }
    
    private func topicDataDB(from topicData: Topic) -> TopicDB {
        return TopicDB(id: topicData.id,
                       title: topicData.title,
                       created_at: topicData.createdAt,
                       posts_count: topicData.postsCount,
                       views: topicData.views,
                       last_posted_at: topicData.lastPostedAt,
                       posters: posterDataDB(from: topicData.posters))
    }
    
    private func posterDataDB(from posterData: [Poster]) -> List<PostersByTopicDB> {
        let resultado = List<PostersByTopicDB>()
        for post in posterData {
            let poster = PostersByTopicDB(descripcion: post.description, user_id: post.userID)
            resultado.append(poster)
        }
        return resultado
    }
    
    // Generate auto-increment id manually
    private func autoincrementID() -> Int {
        guard let maxId: Int = realm.objects(PostersByTopicDB.self).max(ofProperty: "id") else {
            return 0
        }
        return maxId + 1
    }
    
    //MARK: Cargar todos los topics en la lista cuando no hay conexion a internet.
    func loadTopics() -> Array<Topic> {
        let data = realm.objects(TopicDB.self).sorted(byKeyPath: "last_posted_at", ascending: false)
        return data.compactMap { topicDB in
            return topicDataData(from: topicDB)
        }
    }
    
    //MARK: Cargar todos los posts de un determinado topic cuando no hay conexion a internet.
    func loadPostsByTopic(id: Int) -> Array<Post2> {
        let data = realm.objects(PosterDB.self).filter("topic_id = \(id)").sorted(byKeyPath: "created_at",ascending: true)
        return data.compactMap{ postDB in
            return posterDataData(from: postDB)
        }
    }
    
    private func posterDataData(from posterDB: PosterDB) -> Post2 {
        return Post2(id: posterDB.id,
                     username: posterDB.username,
                     createdAt: posterDB.created_at,
                     cooked: posterDB.cooked,
                     topicID: posterDB.topic_id)
    }

    private func topicDataData(from topicDB: TopicDB) -> Topic {
        return Topic(id: topicDB.id,
                     title: topicDB.title,
                     postsCount: topicDB.posts_count,
                     createdAt: topicDB.created_at,
                     lastPostedAt: topicDB.last_posted_at,
                     views: topicDB.views,
                     posters: postetDataData(from: topicDB.posters),
                     avatar_template: "",
                     username: ""
        )
                    
    }
    
    private func postetDataData(from posterDB: List<PostersByTopicDB>) -> [Poster] {
        var resultado: [Poster] = []
        for post in posterDB {
            let poster = Poster(description: post.descripcion, userID: post.user_id)
            resultado.append(poster)
        }
        return resultado
    }
    
   
}
