import Foundation
import UIKit
import Combine

public protocol ViewModelProtocol: ObservableObject {
    associatedtype State
    associatedtype Actions
    
    var state: State { get }
    func send(_ actions: Actions)
}
