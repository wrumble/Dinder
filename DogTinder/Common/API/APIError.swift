import Foundation

enum ApiError: Error {
    case voteError(String)
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .voteError(let message):
            return NSLocalizedString(message, comment: "API error")
        }
    }
}
