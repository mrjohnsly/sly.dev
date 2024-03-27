// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Hummingbird
import Logging

@main
struct Server: AsyncParsableCommand {
    
    func run() async throws {
        let app = try await buildApplication()
        try await app.runService()
    }
    
}

func buildApplication() async throws -> some ApplicationProtocol {
    
    var logger = Logger(label: "Server")
    logger.logLevel = .debug
    
    let router = Router()
    router.middlewares.add(LogRequestsMiddleware(.info))
    router.get("/api") { request, context in
        "Up!\n"
    }
    
    let app = Application(
        router: router,
        configuration: .init(address: .hostname("127.0.0.1", port: 8080)),
        logger: logger
    )
    
    return app
    
}
