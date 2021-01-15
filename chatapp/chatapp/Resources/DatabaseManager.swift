//
//  DatabaseManager.swift
//  chatapp
//
//  Created by Joshua Taylor on 1/5/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()

}

// MARK: - Account Management

extension DatabaseManager {
    
    ///Does email exsit in database
    public func doesEmailExist(with email: String, completion: @escaping ((Bool) -> Void)) {
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    ///Insert new user to database
    public func insertUser(with user: ChatAppUser) {
        
        database.child(user.safeEmail).setValue(["firstName" : user.firstName,
                                                 "lastName" : user.lastName])
    }
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailName: String
    
    var safeEmail: String {
        var safeEmail = emailName.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}
