//
//  PeopleDTO+PersonDataDTO.swift
//  PeopleClient
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import SharedModels

extension PeopleDTO {
    
    struct PersonDataDTO: Codable {
        
        let id: Int
        let email: String
        let firstName: String
        let lastName: String
        let avatar: String
    }
}

extension PeopleDTO.PersonDataDTO {
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_Name"
        case lastName = "last_Name"
        case avatar
    }
}

extension PersonData {
    
    init(dto: PeopleDTO.PersonDataDTO) {
        self.init(
            id: .init(dto.id),
            email: .init(dto.email),
            firstName: .init(dto.firstName),
            lastName: .init(dto.lastName),
            avatar: .init(dto.avatar)
        )
    }
}
