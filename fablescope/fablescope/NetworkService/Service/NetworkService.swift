
import Foundation

final class NetworkService {
    static let shared = NetworkService()

    func getCategory() async throws -> [Category] {
        try await request(target: .getCategory)
    }

}

private extension NetworkService {
    func request<T: Decodable>(target: NetworkServiceTarget) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            let urlPath = target.getPath()
            guard let url = URL(string: urlPath) else {
                continuation.resume(throwing: Errors.fakeURL)
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, respone, error in
                if let error = error {
                    continuation.resume(throwing: error)
                }

                guard let data = data else {
                    continuation.resume(throwing: Errors.noData)
                    return
                }
                do {
                    let Category = try JSONDecoder().decode(T.self, from: data)
                    continuation.resume(returning: Category)
                } catch {
                    continuation.resume(throwing: error)
                }
            }.resume()
        }
    }
}

extension NetworkService {
    enum Errors: Error {
        case fakeURL
        case noData
    }
}

enum NetworkServiceTarget: Equatable {
    case getCategory
}

extension NetworkServiceTarget {
    var baseURL: String {
        return "https://d5dnkanre0pbmr5mkkvl.apigw.yandexcloud.net/"
    }

    func getPath() -> String {
        switch self {
        case .getCategory:
            return baseURL
        }
    }
}
