import Hummingbird
import Logging
import Mustache

func buildApplication(_ arguments: some AppArguments) async throws -> some ApplicationProtocol {
	var logger = Logger(label: "SlyDevServer")
	logger.logLevel = .debug

	let library = try await MustacheLibrary(directory: "Views")

	let router = Router()
	router.middlewares.add(LogRequestsMiddleware(.info))

	IndexController(library: library).addRoutes(to: router.group("/"))
	HealthController().addRoutes(to: router.group("health"))

	let app = Application(
		router: router,
		configuration: .init(address: .hostname(arguments.hostname, port: arguments.port)),
		logger: logger
	)

	return app
}