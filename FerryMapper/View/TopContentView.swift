import OSLog
import SwiftUI

struct TopContentView: View {


    @State var navigationPath = NavigationPath()

    var body: some View {

        NavigationSplitView {
            List {
                Section("Things to Click") {

                    NavigationLink {
                        VesselMapView(vessels: [])
                    } label: {
                        Label("View Vessels", systemImage: "ferry")
                    }

                    NavigationLink {
                        SettingsView()
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }

                }
            }
            .navigationTitle("Ferry Mapper")
        }
        detail: {
            NavigationStack(path: $navigationPath) {
#if os(tvOS)
                EntitiesView()
#endif


            }

        }
    }
}

