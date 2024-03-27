import Hummingbird

struct BookmarksController<Context: RequestContext> {
	
	func addRoute(to group: RouterGroup<Context>) {
		group
			.get("/") { request, context in
				"Up!\n"
			}
	}
}
