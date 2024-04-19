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
    @Option(name: .shortAndLong)
    var hostname: String = "127.0.0.1"

    @Option(name: .shortAndLong)
    var port: Int = 8080

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

        HealthController().addRoutes(to: router.group("health"))

        let app = Application(
            router: router,
            configuration: .init(address: .hostname(self.hostname, port: self.port)),
            logger: logger
        )

        try await app.runService()
    }
}
