//
//  PeopleDTO.swift
//  PeopleClient
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import SharedModels

struct PeopleDTO: Codable {
    
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [PersonDataDTO]
    let support: SupportDTO
}

extension PeopleDTO {
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
        case support
    }
}

extension CreatePeopleData {
    
    init(dto: PeopleDTO) {
        self.init(
            page: .init(dto.page),
            perPage: .init(dto.perPage),
            total: .init(dto.total),
            totalPages: .init(dto.totalPages),
            data: dto.data.map { PersonData(dto: $0) },
            support: .init(dto: dto.support)
        )
    }
}
