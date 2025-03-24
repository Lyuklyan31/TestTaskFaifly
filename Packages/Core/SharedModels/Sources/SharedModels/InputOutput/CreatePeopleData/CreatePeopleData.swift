//
//  CreatePeopleData.swift
//  SharedModels
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import Tagged

public struct CreatePeopleData: Equatable {
    
    // MARK: - Properties
    
    public var page: Page
    public var perPage: ParPage
    public var total: Total
    public var totalPages: TotalPages
    public var data: [PersonData]
    public var support: SupportData
    
    public init(
        page: Page = .init(1),
        perPage: ParPage = .init(6),
        total: Total = .init(2),
        totalPages: TotalPages = .init(6),
        data: [PersonData] = .init(),
        support: SupportData = .init()
    ) {
        self.page = page
        self.perPage = perPage
        self.total = total
        self.totalPages = totalPages
        self.data = data
        self.support = support
    }
}

extension CreatePeopleData {

    public typealias ParPage = Tagged<ParPageTag, Int>
    public struct ParPageTag {}
    
    public typealias Total = Tagged<TotalTag, Int>
    public struct TotalTag {}
    
    public typealias TotalPages = Tagged<TotalPagesTag, Int>
    public struct TotalPagesTag {}
}
