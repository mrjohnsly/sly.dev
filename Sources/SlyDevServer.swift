// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Hummingbird

@main
struct SlyDevServer: AsyncParsableCommand {
    func run() async throws {
        let router = Router()
        router.get("/") { request, context in
            "Hello, World!!!\n"
        }

        let app = Application(router: router)

        try await app.runService()
    }
}
