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

        IndexController(library: library).addRoutes(to: router.group("/"))
        HealthController().addRoutes(to: router.group("health"))

        let app = Application(
            router: router,
            configuration: .init(address: .hostname(self.hostname, port: self.port)),
            logger: logger
        )

        try await app.runService()
    }
}
