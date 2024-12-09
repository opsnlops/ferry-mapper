import SwiftData

@Model
final class VesselInfo: Sendable, Decodable {
    @Attribute(.unique) var vesselID: Int
    var vesselName: String
    var mmsi: Int
    var departingTerminalID: Int
    var departingTerminalName: String
    var departingTerminalAbbrev: String
    var arrivingTerminalID: Int
    var arrivingTerminalName: String
    var arrivingTerminalAbbrev: String
    var latitude: Double
    var longitude: Double
    var speed: Double
    var heading: Int
    var inService: Bool
    var atDock: Bool
    var leftDock: String?
    var eta: String?
    var etaBasis: String
    var scheduledDeparture: String?
    var opRouteAbbrev: [String]
    var vesselPositionNum: Int
    var sortSeq: Int
    var managedBy: Int
    var timeStamp: String?
    var vesselWatchShutID: Int
    var vesselWatchShutMsg: String
    var vesselWatchShutFlag: String
    var vesselWatchStatus: String
    var vesselWatchMsg: String

    // Decodable initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.vesselID = try container.decode(Int.self, forKey: .vesselID)
        self.vesselName = try container.decode(String.self, forKey: .vesselName)
        self.mmsi = try container.decode(Int.self, forKey: .mmsi)
        self.departingTerminalID = try container.decode(Int.self, forKey: .departingTerminalID)
        self.departingTerminalName = try container.decode(String.self, forKey: .departingTerminalName)
        self.departingTerminalAbbrev = try container.decode(String.self, forKey: .departingTerminalAbbrev)
        self.arrivingTerminalID = try container.decode(Int.self, forKey: .arrivingTerminalID)
        self.arrivingTerminalName = try container.decode(String.self, forKey: .arrivingTerminalName)
        self.arrivingTerminalAbbrev = try container.decode(String.self, forKey: .arrivingTerminalAbbrev)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.speed = try container.decode(Double.self, forKey: .speed)
        self.heading = try container.decode(Int.self, forKey: .heading)
        self.inService = try container.decode(Bool.self, forKey: .inService)
        self.atDock = try container.decode(Bool.self, forKey: .atDock)
        self.leftDock = try container.decodeIfPresent(String.self, forKey: .leftDock)
        self.eta = try container.decodeIfPresent(String.self, forKey: .eta)
        self.etaBasis = try container.decode(String.self, forKey: .etaBasis)
        self.scheduledDeparture = try container.decodeIfPresent(String.self, forKey: .scheduledDeparture)
        self.opRouteAbbrev = try container.decode([String].self, forKey: .opRouteAbbrev)
        self.vesselPositionNum = try container.decode(Int.self, forKey: .vesselPositionNum)
        self.sortSeq = try container.decode(Int.self, forKey: .sortSeq)
        self.managedBy = try container.decode(Int.self, forKey: .managedBy)
        self.timeStamp = try container.decodeIfPresent(String.self, forKey: .timeStamp)
        self.vesselWatchShutID = try container.decode(Int.self, forKey: .vesselWatchShutID)
        self.vesselWatchShutMsg = try container.decode(String.self, forKey: .vesselWatchShutMsg)
        self.vesselWatchShutFlag = try container.decode(String.self, forKey: .vesselWatchShutFlag)
        self.vesselWatchStatus = try container.decode(String.self, forKey: .vesselWatchStatus)
        self.vesselWatchMsg = try container.decode(String.self, forKey: .vesselWatchMsg)
    }

    enum CodingKeys: String, CodingKey {
        case vesselID = "VesselID"
        case vesselName = "VesselName"
        case mmsi = "Mmsi"
        case departingTerminalID = "DepartingTerminalID"
        case departingTerminalName = "DepartingTerminalName"
        case departingTerminalAbbrev = "DepartingTerminalAbbrev"
        case arrivingTerminalID = "ArrivingTerminalID"
        case arrivingTerminalName = "ArrivingTerminalName"
        case arrivingTerminalAbbrev = "ArrivingTerminalAbbrev"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case speed = "Speed"
        case heading = "Heading"
        case inService = "InService"
        case atDock = "AtDock"
        case leftDock = "LeftDock"
        case eta = "Eta"
        case etaBasis = "EtaBasis"
        case scheduledDeparture = "ScheduledDeparture"
        case opRouteAbbrev = "OpRouteAbbrev"
        case vesselPositionNum = "VesselPositionNum"
        case sortSeq = "SortSeq"
        case managedBy = "ManagedBy"
        case timeStamp = "TimeStamp"
        case vesselWatchShutID = "VesselWatchShutID"
        case vesselWatchShutMsg = "VesselWatchShutMsg"
        case vesselWatchShutFlag = "VesselWatchShutFlag"
        case vesselWatchStatus = "VesselWatchStatus"
        case vesselWatchMsg = "VesselWatchMsg"
    }
}

