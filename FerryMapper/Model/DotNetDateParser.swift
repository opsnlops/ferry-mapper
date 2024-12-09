import Foundation

// A handy extension to parse the weird .NET style date string
extension String {
    public func parseDotNetDate() -> Date? {
        // The format is like: "/Date(1726999200000-0700)/"
        // First, strip the "/Date(" and ")/"
        guard let openParenIndex = self.firstIndex(of: "("),
              let closeParenIndex = self.firstIndex(of: ")") else {
            return nil
        }

        let innerString = self[self.index(after: openParenIndex)..<closeParenIndex]
        // innerString might look like "1726999200000-0700"

        // Let’s just find where the timestamp ends by searching for + or -
        let plusIndex = innerString.firstIndex(of: "+")
        let minusIndex = innerString.firstIndex(of: "-")

        let timestampString: Substring
        if let plus = plusIndex {
            timestampString = innerString[..<plus]
        } else if let minus = minusIndex {
            timestampString = innerString[..<minus]
        } else {
            timestampString = innerString
        }

        guard let milliseconds = Double(timestampString) else {
            return nil
        }

        // Convert milliseconds to seconds
        let seconds = milliseconds / 1000.0
        let date = Date(timeIntervalSince1970: seconds)

        // We’re ignoring offset for now (the Date represents an absolute moment in time anyway).
        return date
    }
}
