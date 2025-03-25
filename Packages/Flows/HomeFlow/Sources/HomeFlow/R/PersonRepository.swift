//
//  PersonRepository.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import Foundation
import RealmSwift

protocol  PersonRepository {
    func getPersonsList() -> [PersonDTO]
    func savePersonList(_ data: [PersonDTO])
    func clearPersonList()
}

final class PersonRepositoryImpl:  PersonRepository {
    private let storage: StorageService
    
    init(storage: StorageService = StorageService()) {
        self.storage = storage
    }
    
    func getPersonsList() -> [PersonDTO] {
        let data = storage.fetch(by: PersonObject.self)
        return data.map( PersonDTO.init)
    }
    
    func savePersonList(_ data: [PersonDTO]) {
        let objects = data.map(PersonObject.init)
        try? storage.saveOrUpdateAllObjects(objects: objects)
    }
    
    func clearPersonList() {
        try? storage.deleteAll()
    }
}
