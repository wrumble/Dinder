import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: Any]) {
        self.queryItems = parameters.compactMap {
            let value = String(describing: $0.value)
            return URLQueryItem(name: $0.key, value: value)
        }
    }
}
