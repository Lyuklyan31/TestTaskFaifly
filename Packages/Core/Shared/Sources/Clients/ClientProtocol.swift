//
//  ClientProtocol.swift
//  Shared
//
//  Created by Oleh Liuklian  on 23.03.2025.
//

import Foundation
import Combine

public protocol ClientProtocol: AnyObject {
    associatedtype State
  
    var state: State { get async }
    var publisher: AnyPublisher<State, Never> { get }
}
