import UIKit

struct Key {
    static let dogs = "f17a482a-8b8c-4314-8718-a899d87fa679"
}

struct APIURL {
    static let dogsBase = "https://api.thedogapi.com"
}

struct Path {
    static let version = "/v1"
    static let search = version + "/images/search"
    static let votes = version + "/votes"
    static let breeds = version + "/breeds"
    static let breedSearch = search + "?breed_ids="
}

struct Layout {
    static let margin: CGFloat = 10
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let imageHeight: CGFloat = screenWidth - (margin * 2)
    static let buttonHeight: CGFloat = 85
    static let buttonEdgeInset: CGFloat = 5
    static let buttonStackViewSpacing: CGFloat = -buttonEdgeInset/2
    static let buttonBorderWidth: CGFloat = 2
    static let buttonBorderCornerRadius: CGFloat = 8
    static let detailStackViewEdgeInset: CGFloat = 10
    static let detailStackViewEdgeInsets = UIEdgeInsets(top: detailStackViewEdgeInset,
                                                        left: detailStackViewEdgeInset,
                                                        bottom: detailStackViewEdgeInset,
                                                        right: detailStackViewEdgeInset)
    static let tableViewClosedHeight: CGFloat = 0
    static let tableViewOpenHeight: CGFloat = 280
    static let tableViewWidth: CGFloat = 250
}

struct PreconditionFailure {
    static let baseURL = "Check your BaseURL"
    static let postRequest = "Check Post request serialization"
}

struct Identifier {
    static let breedCell = "breedCell"
}
