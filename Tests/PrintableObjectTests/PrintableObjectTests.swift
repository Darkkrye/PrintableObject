import XCTest
@testable import PrintableObject

final class PrintableObjectTests: XCTestCase {
    
    let user = User(id: 66, name: "General", pseudo: "Execute", lastName: "Order", execute: true)
    let userS = UserStruct(pseudo: "Execute", lastName: "Order", execute: false)
    
    let fullString = """
        ==============================
        **** User ****
        - pseudo: Execute (String)
        - lastName: Order (String)
        - execute: true (Bool)

        ----- Superclass - BaseUser -----
        - id: 66 (Int)
        - name: General (String)
        ==============================
        """
    
    let partialString = """
        ==============================
        **** User ****
        - pseudo: Execute (String)
        - lastName: Order (String)
        - execute: true (Bool)
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
    
    func testOnStruct() {
        let result = userS.getPrintableString(isFull: true)
        let str = partialString.replacingOccurrences(of: "User", with: "UserStruct").replacingOccurrences(of: "true", with: "false")
        XCTAssertEqual(result, str)
    }

    static var allTests = [
        ("testUser", testUser),
        ("testGetPrintableString", testGetPrintableString),
        ("testOnStruct", testOnStruct)
    ]
}
