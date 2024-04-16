import Hummingbird
import Mustache

struct HTML: ResponseGenerator {
    let html: String

    public func response(from request: Request, context: some BaseRequestContext) throws -> Response {
        let buffer = context.allocator.buffer(string: self.html)
        return .init(status: .ok, headers: [.contentType: "text/html"], body: .init(byteBuffer: buffer))
    }
}
