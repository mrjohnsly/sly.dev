@testable import Server
import Hummingbird
import HummingbirdTesting
import XCTest

final class BookmarksControllerTests: XCTestCase {
    
    struct TestArguments: AppArguments {
        var hostname: String = "127.0.0.1"
        var port: Int = 8080
        var inMemoryTesting: Bool = false
    }
    
    func test_Get_Bookmarks_RespondsWithStatus200() async throws {
        let app = try await buildApplication(TestArguments())
        try await app.test(.router) { client in
            try await client.execute(uri: "/api/bookmarks", method: .get) { response in
                XCTAssertEqual(response.status, .ok)
            }
        }
    }
    
}
