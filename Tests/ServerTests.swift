@testable import Server
import Hummingbird
import HummingbirdTesting
import XCTest

final class ServerTests: XCTest {
    
    struct TestArguments: AppArguments {
        var hostname: String = "127.0.0.1"
        var port: Int = 8080
        var inMemoryTesting: Bool = false
    }
    
    func test_Get_Api_RespondsWithStatus200() async throws {
        let app = try await buildApplication(TestArguments())
        try await app.test(.router) { client in
            try await client.execute(uri: "/api", method: .get) { response in
                XCTAssertEqual(response.status, .ok)
            }
        }
    }
    
}
