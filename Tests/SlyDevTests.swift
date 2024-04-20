@testable import SlyDevServer
import XCTest

final class SlyDevServerTests: XCTestCase {
	struct TestArguments: AppArguments {
		var hostname: String = "127.0.0.1"
		var port: Int = 8080
	}

	func test_Example() {
		XCTAssertTrue(true)
	}
}