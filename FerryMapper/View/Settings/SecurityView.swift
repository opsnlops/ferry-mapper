import OSLog
import SimpleKeychain
import SwiftUI

struct SecuritySettingsView: View {

    let logger = Logger(subsystem: "io.opsnlops.FerryMapper", category: "SecuritySettingsView")

    @State private var apiKey: String = ""

    let simpleKeychain = SimpleKeychain(service: "io.opsnlops.FerryMapper", synchronizable: true)


    init() {

        // Go see if there's an API key in the keychain already
        if let key = try? simpleKeychain.string(forKey: "apiKey") {
            _apiKey = State(initialValue: key)
        }

    }



    var body: some View {
        VStack {
            Form {

                Section(header: Text("Authentication")) {
                    SecureField("API Key", text: $apiKey)
                        .onChange(of: apiKey) {
                            saveApiKey()
                        }
                }
            }
            Spacer()
        }
    }

    private func saveApiKey() {
        do {
            try simpleKeychain.set(apiKey, forKey: "apiKey")
            logger.info("API Key saved to keychain.")
        } catch {
            logger.error("Failed to save API Keyto keychain: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SecuritySettingsView()
}


