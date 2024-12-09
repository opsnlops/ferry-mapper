import Foundation
import OSLog
import SimpleKeychain
import SwiftUI


@main
struct FerryMapperApp: App {

    let logger = Logger(subsystem: "io.opsnlops.FerryMapper", category: "ContentView")
    let simpleKeychain = SimpleKeychain(service: "io.opsnlops.FerryMapper", synchronizable: true)

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
