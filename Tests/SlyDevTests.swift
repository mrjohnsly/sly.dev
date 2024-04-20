@testable import SlyDevServer
import Hummingbird
import HummingbirdTesting
import XCTest

final class SlyDevServerTests: XCTestCase {
	struct TestArguments: AppArguments {
		var hostname: String = "127.0.0.1"
		var port: Int = 8080
	}

	func test_Example() async throws {
		let app = try await buildApplication(TestArguments())

		try await app.test(.router) { client in
			try await client.execute(uri: "/health", method: .get) { response in
				XCTAssertEqual(response.status, .ok)
			}
		}
	}
}