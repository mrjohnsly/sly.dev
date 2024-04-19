// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Hummingbird
import Logging
import Mustache

@main
struct SlyDevServer: AsyncParsableCommand {
    func run() async throws {
        var logger = Logger(label: "SlyDevServer")
        logger.logLevel = .debug

        let library = try await MustacheLibrary(directory: "templates")
        
        let router = Router()
        router.middlewares.add(LogRequestsMiddleware(.info))
        router.get("/") { request, context -> HTML in
            let html = library.render((), withTemplate: "index")!
            return HTML(html: html)
        }

        router.get("/health") { request, context in
            "Up!"
        }

        let app = Application(router: router, logger: logger)

        try await app.runService()
    }
}
