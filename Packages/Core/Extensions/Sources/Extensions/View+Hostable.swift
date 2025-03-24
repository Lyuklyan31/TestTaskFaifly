import SwiftUI

extension View {
    
    public func hostable() -> UIHostingController<Self> {
        .init(rootView: self)
    }
}
