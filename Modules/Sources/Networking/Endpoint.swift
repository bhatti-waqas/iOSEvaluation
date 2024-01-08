import Foundation

public struct Endpoint {
    public enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }

    public let baseURL: String
    public let path: String
    public let method: HttpMethod
    public let queryItems: [URLQueryItem]
    public let decoder: JSONDecoder

    public init(
        baseURL: String,
        path: String,
        method: HttpMethod = .get,
        queryItems: [URLQueryItem] = [],
        decoder: JSONDecoder = .init()
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryItems = queryItems
        self.decoder = decoder
    }
}
