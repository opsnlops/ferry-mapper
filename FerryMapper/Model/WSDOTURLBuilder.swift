import Foundation

struct WSDOTURLBuilder: Sendable {
    private let baseURL: String
    private let apiKey: String

    init(baseURL: String = "https://wsdot.wa.gov/Ferries/API/", apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    /// Builds a URL for a specific API path with path parameters and query parameters
    func buildURL(for path: String, pathParameters: [String: String] = [:], queryItems: [URLQueryItem] = []) -> URL {
        // Replace placeholders in the path with actual values
        var resolvedPath = path
        for (key, value) in pathParameters {
            resolvedPath = resolvedPath.replacingOccurrences(of: "{\(key)}", with: value)
        }

        // Create URLComponents
        var components = URLComponents(string: baseURL + resolvedPath)

        // Add query parameters, including the API key
        var allQueryItems = queryItems
        allQueryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        components?.queryItems = allQueryItems

        // Validate URL
        guard let url = components?.url else {
            fatalError("Invalid URL constructed with path: \(path), path parameters: \(pathParameters), and query items: \(queryItems)")
        }

        return url
    }
}
