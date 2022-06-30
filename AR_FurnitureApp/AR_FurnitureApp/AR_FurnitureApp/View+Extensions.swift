import SwiftUI

// Dynamically hiding view in SwiftUI - https://stackoverflow.com/a/57420479

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
