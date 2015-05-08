import XCTest
import Argo

class DecodedTests: XCTestCase {
  func testDecodedTypeMissmatch() {
    let user: Decoded<User> = decode(JSONFileReader.JSON(fromFile: "user_with_bad_type")!)

    switch user {
    case let .TypeMismatch(s): XCTAssert(s == user.description)
    default: XCTFail("Unexpected Case Occurred")
    }
  }

  func testDecodedMissingKey() {
    let user: Decoded<User> = decode(JSONFileReader.JSON(fromFile: "user_without_key")!)

    switch user {
    case let .MissingKey(s): XCTAssert(s == user.description)
    default: XCTFail("Unexpected Case Occurred")
    }
  }
}
