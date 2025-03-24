//
//  PeopleClientProtocol.swift
//  PeopleClient
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import SharedModels
import Foundation
import Combine
import Shared

public protocol PeopleClientProtocol: ClientProtocol {
    
    var state: CreatePeopleData { get }
    var publisher: AnyPublisher<CreatePeopleData, Never> { get }
    @discardableResult
    func getListPeople(page: Int) async throws -> CreatePeopleData

}
