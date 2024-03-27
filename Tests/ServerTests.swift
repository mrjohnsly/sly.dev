@testable import Server
import Hummingbird
import HummingbirdTesting
import XCTest

final class ServerTests: XCTest {
    
    func test_Get_Api_RespondsWithStatus200() async throws {
        let app = try await buildApplication()
        try await app.test(.router) { client in
            try await client.execute(uri: "/api", method: .get) { response in
                XCTAssertEqual(response.status, .ok)
            }
        }
    }
    
}
