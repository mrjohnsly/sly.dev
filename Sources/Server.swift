// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Hummingbird

@main
struct Server: AsyncParsableCommand {
    
    func run() async throws {
        let app = try await buildApplication()
        try await app.runService()
    }
    
}

func buildApplication() async throws -> some ApplicationProtocol {
    
    let router = Router()
    router.get("/api") { request, context in
        "Up!\n"
    }
    
    let app = Application(
        router: router,
        configuration: .init(address: .hostname("127.0.0.1", port: 8080))
    )
    
    return app
    
}
