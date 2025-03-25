//
//  PersonObject.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import RealmSwift

final class PersonObject: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var email: String
    @Persisted var isFavorite: Bool
    @Persisted var avatar: String
    
    convenience init(
        id: String,
        firstName: String,
        lastName: String,
        email: String,
        isFavorite: Bool,
        avatar: String
    ) {
        self.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.isFavorite = isFavorite
        self.avatar = avatar
    }
}

extension PersonObject {
    
    convenience init(_ dto: PersonDTO) {
        self.init()
        id = dto.id
        firstName = dto.firstName
        lastName = dto.lastName
        email = dto.email
        avatar = dto.avatar
    }
}
