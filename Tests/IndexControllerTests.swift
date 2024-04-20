@testable import SlyDevServer
import Hummingbird
import HummingbirdTesting
import XCTest

final class IndexControllerTests: XCTestCase {
    struct TestArguments: AppArguments {
        var hostname: String = "127.0.0.1"
        var port: Int = 8080
    }

    func test_Get_Index_Returns200WithHTML() async throws {
        let app = try await buildApplication(TestArguments())

        try await app.test(.router) { client in
            try await client.execute(uri: "/", method: .get) { response in
                XCTAssertEqual(response.status, .ok)

                let buffer = response.body
                let data = Data(buffer: buffer)
                if let body = String(data: data, encoding: .utf8) {
                    XCTAssertTrue(body.contains("<title>Sly</title>"))
                } else {
                    XCTFail("Failed to decode body")
                }
            }
        }
    }
}