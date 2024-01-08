import Foundation

public protocol NetworkServiceProtocol {
    func request<T: Decodable>(with endpoint: Endpoint) async throws -> T
}

public class NetworkService {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    deinit {
        session.invalidateAndCancel()
    }

    internal func makeURLRequest(with endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents(string: endpoint.baseURL)
        components?.path = endpoint.path
        components?.queryItems = endpoint.queryItems.isEmpty ? nil : endpoint.queryItems

        guard let url = components?.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        return request
    }
}

extension NetworkService: NetworkServiceProtocol {
    public enum NetworkServiceError: Error, Equatable {
        case invalidResponse
        case unacceptableStatusCode(Int)
    }

    public func request<T: Decodable>(with endpoint: Endpoint) async throws -> T {
        let request = try makeURLRequest(with: endpoint)
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkServiceError.invalidResponse
        }

        // Validate status code
        guard 200 ... 300 ~= httpResponse.statusCode else {
            throw NetworkServiceError.unacceptableStatusCode(httpResponse.statusCode)
        }

        return try endpoint.decoder.decode(T.self, from: data)
    }
}
