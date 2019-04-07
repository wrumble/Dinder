import Foundation

struct DogResponse: Decodable {
    let dogs: [Dog]
    let imageURL: String
    let imageID: String
}

extension DogResponse {
    private enum CodingKeys: String, CodingKey {
        case dogs = "breeds"
        case imageURL = "url"
        case imageID = "id"
    }
}

struct Dog: Decodable {
    let weight: Measurement?
    let height: Measurement?
    let breed: String
    let id: Int
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    let origin: String?
}

extension Dog {
    private enum CodingKeys: String, CodingKey {
        case weight
        case height
        case breed = "name"
        case id
        case breedGroup
        case lifeSpan
        case temperament
        case origin
    }
}

extension Dog {
    static func all() -> Dog {
        return Dog(weight: nil,
                   height: nil,
                   breed: String.Localized.Filter.all,
                   id: BreedType.all,
                   breedGroup: nil,
                   lifeSpan: nil,
                   temperament: nil,
                   origin: nil)
    }
}

struct Measurement: Decodable {
    let imperial: String
    let metric: String
}

extension Measurement {
    func localized() -> String {
        if Locale.current.usesMetricSystem {
            return metric.isEmpty ? "" : metric + String.Localized.Details.cm
        } else {
            return imperial.isEmpty ? "" : imperial + String.Localized.Details.inches
        }
    }
}

struct BreedType {
    static let all = -0
}
