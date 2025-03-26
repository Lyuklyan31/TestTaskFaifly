//
//  PeopleClient+Factory.swift
//  PeopleClient
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import Factory
import NetworkClient
import SharedModels

extension Container {
    
    public var peopleClient: Factory<any PeopleClientProtocol> {
        Factory(self) {
            let peopleClient = PeopleClient(
                networkClient: self.networkClient()
            )
            
            return peopleClient
        }.cached
    }
}
