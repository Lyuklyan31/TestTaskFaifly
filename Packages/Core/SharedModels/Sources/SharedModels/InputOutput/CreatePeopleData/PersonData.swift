//
//  PersonData.swift
//  SharedModels
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import Tagged

public struct PersonData: Equatable {
    
    public var id: ID
    public var email: Email
    public var firstName: FirstName
    public var lastName: LastName
    public var avatar: Avatar
    
    public init(
        id: ID = .init(1),
        email: Email = .init("george.bluth@reqres.in"),
        firstName: FirstName = .init("George"),
        lastName: LastName = .init("Bluth"),
        avatar: Avatar = .init("https://reqres.in/img/faces/1-image.jpg")
    ) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
}

extension PersonData {
    
    public typealias ID = Tagged<IDTag, Int>
    public struct IDTag {}
    
    public typealias Email = Tagged<EmailTag, String>
    public struct EmailTag {}
    
    public typealias FirstName = Tagged<FirstNameTag, String>
    public struct FirstNameTag {}
    
    public typealias LastName = Tagged<LastNameTag, String>
    public struct LastNameTag {}
    
    public typealias Avatar = Tagged<AvatarTag, String>
    public struct AvatarTag {}
}
