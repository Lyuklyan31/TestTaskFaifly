//
//  SupportData.swift
//  SharedModels
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation

public struct SupportData: Equatable {
    public var url: String
    public var text: String
    
    public init(
        url: String = "",
        text: String = ""

    ) {
        self.url = url
        self.text = text
    }
}
