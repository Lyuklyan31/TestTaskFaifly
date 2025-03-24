//
//  SupportDTO.swift
//  PeopleClient
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import SharedModels
import Foundation

extension PeopleDTO {
     
    struct SupportDTO: Codable {
        let url: String
        let text: String
    }
}

extension PeopleDTO.SupportDTO {
    
    enum CodingKeys: String, CodingKey {
        case url
        case text
    }
}

extension SupportData {
    
    init(dto: PeopleDTO.SupportDTO) {
        self.init(
            url: dto.url,
            text: dto.text
        )
    }
}
