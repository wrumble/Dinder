import Foundation

extension String {
    enum Localized {
        enum Alert {
            static let ok = "ok".localized
            static let error = "error".localized
            static let genericErrorMessage = "generic_error_message".localized
        }
        enum Button {
            static let dislike = "dislike".localized
            static let like = "like".localized
        }
        enum Home {
            static let title = "title".localized
            static let loading = "loading".localized
        }
        enum Details {
            static let weight = "weight".localized
            static let height = "height".localized
            static let name = "name".localized
            static let countryCode = "country_code".localized
            static let breedGroup = "breed_group".localized
            static let lifeSpan = "life_span".localized
            static let temperament = "temperament".localized
            static let origin = "origin".localized
            static let noDetailsAvailable = "no_details_available".localized
            static let cm = "cm".localized
            static let inches = "inches".localized
        }
        enum Filter {
            static let breed = "breed".localized
            static let all = "all".localized
        }
    }
}
