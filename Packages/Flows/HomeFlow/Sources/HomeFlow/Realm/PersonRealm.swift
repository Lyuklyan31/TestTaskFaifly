//
//  PersonRealm.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import RealmSwift
import SharedModels

public class PersonRealm: Object, ObjectKeyIdentifiable {
    
    // MARK: - Properties
    
    @Persisted(primaryKey: true) public var id: ObjectId
    @Persisted var fullName: String = ""
    @Persisted var email: String = ""
    @Persisted var avatar: String = ""
    @Persisted var isFavorite: Bool = false
    @Persisted var support: String = ""
    @Persisted var ownerId: Int = 0
    
    // MARK: - Initializers
    
    convenience init(
        fullName: String,
        email: String,
        avatar: String,
        isFavorite: Bool,
        support: String,
        ownerId: Int
    ) {
        self.init()
        self.fullName = fullName
        self.email = email
        self.avatar = avatar
        self.isFavorite = isFavorite
        self.support = support
        self.ownerId = ownerId
    }
}

// MARK: - Convenience Initializer

extension PersonRealm {
    convenience init(personData: PersonData, supportData: String) {
        self.init()
        self.id = ObjectId.generate()
        self.fullName = "\(personData.firstName.rawValue) \(personData.lastName.rawValue)"
        self.email = personData.email.rawValue
        self.avatar = personData.avatar.rawValue
        self.isFavorite = personData.isFavorite
        self.support = supportData
        self.ownerId = personData.id.rawValue
    }
}
