// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Hummingbird
import Mustache

@main
struct SlyDevServer: AsyncParsableCommand {
    func run() async throws {
        let library = try await MustacheLibrary(directory: "templates")
        let router = Router()
        router.get("/") { request, context -> HTML in
            let html = library.render((), withTemplate: "index")!
            return HTML(html: html)
        }

        let app = Application(router: router)

        try await app.runService()
    }
}
