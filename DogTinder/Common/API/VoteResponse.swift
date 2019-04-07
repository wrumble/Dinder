import Foundation

struct VoteResponse: Decodable {
    let message: String
}

enum VoteMessage: String {
    //No need for failure case as the API returns a detailed message upon failure instead, which is odd
    case success = "SUCCESS"
}
