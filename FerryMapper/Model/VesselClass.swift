
import Foundation
import SwiftData

@Model
final class VesselClass: Sendable, Decodable {
    @Attribute(.unique) var classID: Int
    var classSubjectID: Int
    var className: String
    var sortSeq: Int
    var drawingImg: String
    var silhouetteImg: String
    var publicDisplayName: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.classID = try container.decode(Int.self, forKey: .classID)
        self.classSubjectID = try container.decode(Int.self, forKey: .classSubjectID)
        self.className = try container.decode(String.self, forKey: .className)
        self.sortSeq = try container.decode(Int.self, forKey: .sortSeq)
        self.drawingImg = try container.decode(String.self, forKey: .drawingImg)
        self.silhouetteImg = try container.decode(String.self, forKey: .silhouetteImg)
        self.publicDisplayName = try container.decode(String.self, forKey: .publicDisplayName)
    }

    enum CodingKeys: String, CodingKey {
        case classID = "ClassID"
        case classSubjectID = "ClassSubjectID"
        case className = "ClassName"
        case sortSeq = "SortSeq"
        case drawingImg = "DrawingImg"
        case silhouetteImg = "SilhouetteImg"
        case publicDisplayName = "PublicDisplayName"
    }
}
