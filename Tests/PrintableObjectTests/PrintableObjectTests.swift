import XCTest
@testable import PrintableObject

final class PrintableObjectTests: XCTestCase {
    
    let user = User(id: 66, name: "General", pseudo: "Execute", lastName: "Order")
    
    let fullString = """
        ==============================
        **** User ****
        - pseudo: Execute
        - lastName: Order

        ----- Superclass - BaseUser -----
        - id: 66
        - name: General
        ==============================
        """
    
    let partialString = """
        ==============================
        **** User ****
        - pseudo: Execute
        - lastName: Order
        ==============================
        """
    
    func testUser() {
        XCTAssertEqual(user.pseudo, "Execute")
        XCTAssertEqual(user.lastName, "Order")
        XCTAssertEqual(user.id, 66)
        XCTAssertEqual(user.name, "General")
    }
    
    func testGetPrintableString() {
        let string = user.getPrintableString()
        let partString = user.getPrintableString(isFull: false)
        
        XCTAssertEqual(string, fullString)
        XCTAssertEqual(partString, partialString)
    }

    static var allTests = [
        ("testUser", testUser),
        ("testGetPrintableString", testGetPrintableString),
    ]
}
