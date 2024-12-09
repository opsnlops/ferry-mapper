import Foundation
import SwiftData

@Model
final class Schedule: Sendable, Decodable {
    @Attribute(.unique) var scheduleID: Int
    var scheduleName: String
    var scheduleSeason: Int
    var schedulePDFUrl: String
    var scheduleStart: Date
    var scheduleEnd: Date
    var allRoutes: [Int]
    var terminalCombos: [TerminalCombo]

    @Model
    final class TerminalCombo: Sendable, Decodable {
        var departingTerminalID: Int
        var departingTerminalName: String
        var arrivingTerminalID: Int
        var arrivingTerminalName: String
        var sailingNotes: String
        var annotations: [String]
        var times: [SailingTime]
        var annotationsIVR: [String]

        @Model
        final class SailingTime: Sendable, Decodable {
            var departingTime: Date
            var arrivingTime: Date?
            var loadingRule: Int
            var vesselID: Int
            var vesselName: String
            var vesselHandicapAccessible: Bool
            var vesselPositionNum: Int
            var routes: [Int]
            var annotationIndexes: [Int]

            enum CodingKeys: String, CodingKey {
                case departingTime = "DepartingTime"
                case arrivingTime = "ArrivingTime"
                case loadingRule = "LoadingRule"
                case vesselID = "VesselID"
                case vesselName = "VesselName"
                case vesselHandicapAccessible = "VesselHandicapAccessible"
                case vesselPositionNum = "VesselPositionNum"
                case routes = "Routes"
                case annotationIndexes = "AnnotationIndexes"
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)

                let rawDepartingTime = try container.decode(String.self, forKey: .departingTime)
                guard let parsedDeparting = rawDepartingTime.parseDotNetDate() else {
                    throw DecodingError.dataCorrupted(.init(
                        codingPath: [CodingKeys.departingTime],
                        debugDescription: "Invalid date format for DepartingTime"
                    ))
                }
                self.departingTime = parsedDeparting

                if let rawArrivingTime = try container.decodeIfPresent(String.self, forKey: .arrivingTime) {
                    self.arrivingTime = rawArrivingTime.parseDotNetDate()
                } else {
                    self.arrivingTime = nil
                }

                self.loadingRule = try container.decode(Int.self, forKey: .loadingRule)
                self.vesselID = try container.decode(Int.self, forKey: .vesselID)
                self.vesselName = try container.decode(String.self, forKey: .vesselName)
                self.vesselHandicapAccessible = try container.decode(Bool.self, forKey: .vesselHandicapAccessible)
                self.vesselPositionNum = try container.decode(Int.self, forKey: .vesselPositionNum)
                self.routes = try container.decode([Int].self, forKey: .routes)
                self.annotationIndexes = try container.decode([Int].self, forKey: .annotationIndexes)
            }
        }

        enum CodingKeys: String, CodingKey {
            case departingTerminalID = "DepartingTerminalID"
            case departingTerminalName = "DepartingTerminalName"
            case arrivingTerminalID = "ArrivingTerminalID"
            case arrivingTerminalName = "ArrivingTerminalName"
            case sailingNotes = "SailingNotes"
            case annotations = "Annotations"
            case times = "Times"
            case annotationsIVR = "AnnotationsIVR"
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.departingTerminalID = try container.decode(Int.self, forKey: .departingTerminalID)
            self.departingTerminalName = try container.decode(String.self, forKey: .departingTerminalName)
            self.arrivingTerminalID = try container.decode(Int.self, forKey: .arrivingTerminalID)
            self.arrivingTerminalName = try container.decode(String.self, forKey: .arrivingTerminalName)
            self.sailingNotes = try container.decode(String.self, forKey: .sailingNotes)
            self.annotations = try container.decode([String].self, forKey: .annotations)
            self.times = try container.decode([SailingTime].self, forKey: .times)
            self.annotationsIVR = try container.decode([String].self, forKey: .annotationsIVR)
        }
    }

    enum CodingKeys: String, CodingKey {
        case scheduleID = "ScheduleID"
        case scheduleName = "ScheduleName"
        case scheduleSeason = "ScheduleSeason"
        case schedulePDFUrl = "SchedulePDFUrl"
        case scheduleStart = "ScheduleStart"
        case scheduleEnd = "ScheduleEnd"
        case allRoutes = "AllRoutes"
        case terminalCombos = "TerminalCombos"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.scheduleID = try container.decode(Int.self, forKey: .scheduleID)
        self.scheduleName = try container.decode(String.self, forKey: .scheduleName)
        self.scheduleSeason = try container.decode(Int.self, forKey: .scheduleSeason)
        self.schedulePDFUrl = try container.decode(String.self, forKey: .schedulePDFUrl)

        let rawScheduleStart = try container.decode(String.self, forKey: .scheduleStart)
        guard let parsedStart = rawScheduleStart.parseDotNetDate() else {
            throw DecodingError.dataCorrupted(.init(
                codingPath: [CodingKeys.scheduleStart],
                debugDescription: "Invalid date format for ScheduleStart"
            ))
        }
        self.scheduleStart = parsedStart

        let rawScheduleEnd = try container.decode(String.self, forKey: .scheduleEnd)
        guard let parsedEnd = rawScheduleEnd.parseDotNetDate() else {
            throw DecodingError.dataCorrupted(.init(
                codingPath: [CodingKeys.scheduleEnd],
                debugDescription: "Invalid date format for ScheduleEnd"
            ))
        }
        self.scheduleEnd = parsedEnd

        self.allRoutes = try container.decode([Int].self, forKey: .allRoutes)
        self.terminalCombos = try container.decode([TerminalCombo].self, forKey: .terminalCombos)
    }
}
