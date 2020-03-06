//
//  CheckSession.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 04/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation
import Strongbox

public class Session {
    
    struct Constants {static let keySession = "keySession"}
    
    class func saveSession(userName: String) {

        let strongbox = Strongbox()
        _ = strongbox.archive(userName, key: Constants.keySession)
    
    }
    
    class func loggedSession() -> Bool {
        
        let strongbox = Strongbox()
        var success = false
        
        if strongbox.unarchive(objectForKey: Constants.keySession) != nil {
            success = true
        } else {
            success = false
        }
        
        return success
    }
    
}
