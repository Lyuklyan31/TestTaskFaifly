//
//  PersonDTO.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import Foundation

struct PersonDTO {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let avatar: String
}

extension PersonDTO {
    
    init(object: PersonObject) {
        id = object.id
        firstName = object.firstName
        lastName = object.lastName
        email = object.email
        avatar = object.avatar
    }
}
