import Hummingbird
import Mustache

struct WWDC24Controller {

	let library: MustacheLibrary

	func addRoutes(to group: RouterGroup<some RequestContext>) {
		group
			.get(use: indexHandler)
	}

	@Sendable func indexHandler(request: Request, context: some RequestContext) async throws -> HTML {
		let html = library.render((), withTemplate: "wwdc24")!
		return HTML(html: html)
	}
}