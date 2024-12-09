import SwiftData

@Model
final class VesselStats: Sendable, Decodable {
    @Attribute(.unique) var vesselID: Int
    var vesselSubjectID: Int
    var vesselName: String
    var vesselAbbrev: String
    var vesselClass: VesselClass
    var vesselNameDesc: String?
    var vesselHistory: String?
    var beam: String
    var cityBuilt: String
    var speedInKnots: Int
    var draft: String
    var engineCount: Int
    var horsepower: Int
    var length: String
    var maxPassengerCount: Int
    var passengerOnly: Bool
    var fastFerry: Bool
    var propulsionInfo: String
    var tallDeckClearance: Int
    var regDeckSpace: Int
    var tallDeckSpace: Int
    var tonnage: Int
    var displacement: Int
    var yearBuilt: Int
    var yearRebuilt: Int?
    var vesselDrawingImg: String?
    var solasCertified: Bool
    var maxPassengerCountForInternational: Int?


    // Decodable initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.vesselID = try container.decode(Int.self, forKey: .vesselID)
        self.vesselSubjectID = try container.decode(Int.self, forKey: .vesselSubjectID)
        self.vesselName = try container.decode(String.self, forKey: .vesselName)
        self.vesselAbbrev = try container.decode(String.self, forKey: .vesselAbbrev)
        self.vesselClass = try container.decode(VesselClass.self, forKey: .vesselClass)
        self.vesselNameDesc = try container.decodeIfPresent(String.self, forKey: .vesselNameDesc)
        self.vesselHistory = try container.decodeIfPresent(String.self, forKey: .vesselHistory)
        self.beam = try container.decode(String.self, forKey: .beam)
        self.cityBuilt = try container.decode(String.self, forKey: .cityBuilt)
        self.speedInKnots = try container.decode(Int.self, forKey: .speedInKnots)
        self.draft = try container.decode(String.self, forKey: .draft)
        self.engineCount = try container.decode(Int.self, forKey: .engineCount)
        self.horsepower = try container.decode(Int.self, forKey: .horsepower)
        self.length = try container.decode(String.self, forKey: .length)
        self.maxPassengerCount = try container.decode(Int.self, forKey: .maxPassengerCount)
        self.passengerOnly = try container.decode(Bool.self, forKey: .passengerOnly)
        self.fastFerry = try container.decode(Bool.self, forKey: .fastFerry)
        self.propulsionInfo = try container.decode(String.self, forKey: .propulsionInfo)
        self.tallDeckClearance = try container.decode(Int.self, forKey: .tallDeckClearance)
        self.regDeckSpace = try container.decode(Int.self, forKey: .regDeckSpace)
        self.tallDeckSpace = try container.decode(Int.self, forKey: .tallDeckSpace)
        self.tonnage = try container.decode(Int.self, forKey: .tonnage)
        self.displacement = try container.decode(Int.self, forKey: .displacement)
        self.yearBuilt = try container.decode(Int.self, forKey: .yearBuilt)
        self.yearRebuilt = try container.decodeIfPresent(Int.self, forKey: .yearRebuilt)
        self.vesselDrawingImg = try container.decodeIfPresent(String.self, forKey: .vesselDrawingImg)
        self.solasCertified = try container.decode(Bool.self, forKey: .solasCertified)
        self.maxPassengerCountForInternational = try container.decodeIfPresent(Int.self, forKey: .maxPassengerCountForInternational)
    }

    // Coding keys for JSON mapping
    enum CodingKeys: String, CodingKey {
        case vesselID = "VesselID"
        case vesselSubjectID = "VesselSubjectID"
        case vesselName = "VesselName"
        case vesselAbbrev = "VesselAbbrev"
        case vesselClass = "Class"
        case vesselNameDesc = "VesselNameDesc"
        case vesselHistory = "VesselHistory"
        case beam = "Beam"
        case cityBuilt = "CityBuilt"
        case speedInKnots = "SpeedInKnots"
        case draft = "Draft"
        case engineCount = "EngineCount"
        case horsepower = "Horsepower"
        case length = "Length"
        case maxPassengerCount = "MaxPassengerCount"
        case passengerOnly = "PassengerOnly"
        case fastFerry = "FastFerry"
        case propulsionInfo = "PropulsionInfo"
        case tallDeckClearance = "TallDeckClearance"
        case regDeckSpace = "RegDeckSpace"
        case tallDeckSpace = "TallDeckSpace"
        case tonnage = "Tonnage"
        case displacement = "Displacement"
        case yearBuilt = "YearBuilt"
        case yearRebuilt = "YearRebuilt"
        case vesselDrawingImg = "VesselDrawingImg"
        case solasCertified = "SolasCertified"
        case maxPassengerCountForInternational = "MaxPassengerCountForInternational"
    }
}

