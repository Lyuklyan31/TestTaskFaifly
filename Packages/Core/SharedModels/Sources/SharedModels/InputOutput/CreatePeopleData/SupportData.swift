//
//  SupportData.swift
//  SharedModels
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation



public struct SupportData: Equatable {
    
    // MARK: - Properties
    
    public var url: String
    public var text: String
    
    // MARK: - Inits
    
    public init(
        url: String = "",
        text: String = ""
    ) {
        self.url = url
        self.text = text
    }
}
