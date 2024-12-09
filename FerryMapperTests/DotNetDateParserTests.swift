import Testing
import Foundation

import FerryMapper

// MARK: - Tests for the parseDotNetDate() extension

struct DotNetDateParserTests {

    @Test func testParserWithValidNegativeOffset() async throws {
        let rawDate = "/Date(1726999200000-0700)/"
        let parsedDate = rawDate.parseDotNetDate()

        #expect(parsedDate != nil, "The parsed date should not be nil for a valid date string")

        // The timestamp 1726999200000 ms corresponds to 2024-09-22 03:20:00 UTC ignoring offset
        let expectedTimeInterval: TimeInterval = 1726999200000 / 1000.0
        #expect(parsedDate?.timeIntervalSince1970 == expectedTimeInterval, "The date should match the expected epoch time ignoring offset.")
    }

    @Test func testParserWithValidPositiveOffset() async throws {
        let rawDate = "/Date(1726999200000+0100)/"
        let parsedDate = rawDate.parseDotNetDate()

        #expect(parsedDate != nil, "The parsed date should not be nil for a valid date string")

        let expectedTimeInterval: TimeInterval = 1726999200000 / 1000.0
        #expect(parsedDate?.timeIntervalSince1970 == expectedTimeInterval, "The date should match the expected epoch time ignoring offset.")
    }

    @Test func testParserWithNoOffset() async throws {
        let rawDate = "/Date(1726999200000)/"
        let parsedDate = rawDate.parseDotNetDate()

        #expect(parsedDate != nil, "The parsed date should not be nil for a date string with no offset")

        let expectedTimeInterval: TimeInterval = 1726999200000 / 1000.0
        #expect(parsedDate?.timeIntervalSince1970 == expectedTimeInterval, "The date should match the expected epoch time ignoring offset.")
    }

    @Test func testParserWithMissingParentheses() async throws {
        let rawDate = "/Date1726999200000-0700/" // Missing parentheses
        let parsedDate = rawDate.parseDotNetDate()

        #expect(parsedDate == nil, "The parser should fail if parentheses are missing")
    }

    @Test func testParserWithInvalidTimestamp() async throws {
        let rawDate = "/Date(ABC123-0700)/" // Non-numeric
        let parsedDate = rawDate.parseDotNetDate()

        #expect(parsedDate == nil, "The parser should fail if the timestamp isn't numeric")
    }

    @Test func testParserWithEmptyString() async throws {
        let rawDate = ""
        let parsedDate = rawDate.parseDotNetDate()

        #expect(parsedDate == nil, "An empty string should fail to parse")
    }
}


