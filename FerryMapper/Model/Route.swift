import SwiftData

@Model
final class Route: Sendable, Decodable {
    @Attribute(.unique) var routeID: Int
    var routeAbbrev: String
    var routeDescription: String
    var regionID: Int
    var serviceDisruptions: [String]

    // Decodable initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.routeID = try container.decode(Int.self, forKey: .routeID)
        self.routeAbbrev = try container.decode(String.self, forKey: .routeAbbrev)
        self.routeDescription = try container.decode(String.self, forKey: .routeDescription)
        self.regionID = try container.decode(Int.self, forKey: .regionID)
        self.serviceDisruptions = try container.decode([String].self, forKey: .serviceDisruptions)
    }

    // Coding keys for JSON mapping
    enum CodingKeys: String, CodingKey {
        case routeID = "RouteID"
        case routeAbbrev = "RouteAbbrev"
        case routeDescription = "Description" // Map to "Description" in JSON
        case regionID = "RegionID"
        case serviceDisruptions = "ServiceDisruptions"
    }
}

