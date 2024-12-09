import Foundation
import OSLog
import SwiftUI

struct SettingsView: View {

    let logger = Logger(subsystem: "io.opsnlops.FerryMapper", category: "SettingView")

    private enum Tabs: Hashable {
        case security
    }
    var body: some View {
        TabView {
            SecuritySettingsView()
                .tabItem {
                    Label("Security", systemImage: "key.horizontal")
                }
                .tag(Tabs.security)
        }
        .padding(20)
#if os(macOS)
        .frame(width: 600, height: 400)
#endif
    }
}

#Preview {
    SettingsView()
}
