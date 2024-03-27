import ArgumentParser
import Hummingbird
import Logging

@main
struct Server: AsyncParsableCommand, AppArguments {
    
    @Option(name: .shortAndLong)
    var hostname: String = "127.0.0.1"
    
    @Option(name: .shortAndLong)
    var port: Int = 8080
    
    @Flag
    var inMemoryTesting: Bool = false
    
    func run() async throws {
        let app = try await buildApplication(self)
        try await app.runService()
    }
    
}

protocol AppArguments {
    var hostname: String { get }
    var port: Int { get }
    var inMemoryTesting: Bool { get }
}

func buildApplication(_ arguments: some AppArguments) async throws -> some ApplicationProtocol {
    
    var logger = Logger(label: "Server")
    logger.logLevel = .debug
    
    let router = Router()
    router.middlewares.add(LogRequestsMiddleware(.info))
    router.get("/api") { request, context in
        "Up!\n"
    }
    
    let app = Application(
        router: router,
        configuration: .init(address: .hostname(arguments.hostname, port: arguments.port)),
        logger: logger
    )
    
    return app
    
}
