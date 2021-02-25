import XCTest
@testable import PrintableObject

final class PrintableObjectTests: XCTestCase {
    
    let user = User(id: 66, name: "General", pseudo: "Execute", lastName: "Order")
    let subUser = SubUser(id: 66, name: "General", pseudo: "Execute", lastName: "Order", execute: true)
    let userS = UserStruct(pseudo: "Execute", lastName: "Order")
    
    let fullString = """
        ==============================
        **** SubUser ****
        - execute: true (Bool)

        ----- Superclass - User -----
        - pseudo: Execute (String)
        - lastName: Order (String)

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
        ==============================
        """
    
    func testUser() {
        XCTAssertEqual(subUser.pseudo, "Execute")
        XCTAssertEqual(subUser.lastName, "Order")
        XCTAssertEqual(subUser.id, 66)
        XCTAssertEqual(subUser.name, "General")
        XCTAssertTrue(subUser.execute)
    }
    
    func testGetPrintableString() {
        let string = subUser.getPrintableString()
        let partString = user.getPrintableString(isFull: false)
        
        XCTAssertEqual(string, fullString)
        XCTAssertEqual(partString, partialString)
    }
    
    func testOnStruct() {
        let result = userS.getPrintableString()
        let str = partialString.replacingOccurrences(of: "User", with: "UserStruct")
        XCTAssertEqual(result, str)
    }

    static var allTests = [
        ("testUser", testUser),
        ("testGetPrintableString", testGetPrintableString),
        ("testOnStruct", testOnStruct)
    ]
}
