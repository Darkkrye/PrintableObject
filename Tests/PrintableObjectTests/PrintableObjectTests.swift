import XCTest
@testable import PrintableObject

final class PrintableObjectTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let user = User(id: "XXX", name: "Execute", pseudo: "Order", lastName: "66")
        XCTAssertEqual(user.id, "XXX")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
