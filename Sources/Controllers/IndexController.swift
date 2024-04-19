import Hummingbird
import Mustache

struct IndexController {

	let library: MustacheLibrary

	func addRoutes(to group: RouterGroup<some RequestContext>) {
		group
			.get(use: indexHandler)
	}

	@Sendable func indexHandler(request: Request, context: some RequestContext) async throws -> HTML {
		let html = library.render((), withTemplate: "index")!
		return HTML(html: html)
	}
}