import Hummingbird

struct HealthController {
	func addRoutes(to group: RouterGroup<some RequestContext>) {
		group
			.get(use: healthCheckHandler)
	}

	@Sendable func healthCheckHandler(request: Request, context: some RequestContext) async throws -> String {
		return "Up!"
	}
}
