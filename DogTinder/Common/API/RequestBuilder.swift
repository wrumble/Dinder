import Foundation

struct RequestBuilder {
    private let baseURLString: String
    
    static var defaultBuilder: RequestBuilder {
        return RequestBuilder(
            baseURLString: APIURL.dogsBase
        )
    }
    
    func dogsRequest(with breedID: Int) -> URLRequest {
        var parameters: [String: Any] = [:]
        if breedID != BreedType.all {
            parameters = ["breed_id": breedID]
        }
        return baseRequest(path: Path.search, with: parameters)
    }
    
    func breedsRequest() -> URLRequest {
        return baseRequest(path: Path.breeds)
    }
    
    func voteRequest(imageID: String, vote: Int) -> URLRequest {
        var request = baseRequest(path: Path.votes)
        let parameters: [String: Any] = ["image_id": imageID,
                                         "value": vote]
        
        add(parameters, to: &request)
        
        return request
    }
    
    private func add(_ parameters: [String: Any],
                     to request: inout URLRequest) {
        guard let json = try? JSONSerialization.data(withJSONObject: parameters,
                                                     options: .prettyPrinted) else {
            preconditionFailure(PreconditionFailure.postRequest)
        }

        request.httpBody = json
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    }
    
    
    private func baseRequest(path: String, with parameters: [String: Any] = [:]) -> URLRequest {
        guard var components = URLComponents(string: baseURLString) else {
            preconditionFailure(PreconditionFailure.baseURL)
        }
        
        components.path = path
        components.setQueryItems(with: parameters)
        
        guard let url = components.url else {
            preconditionFailure(PreconditionFailure.baseURL)
        }
        var request = URLRequest(url: url)
        request.setValue(Key.dogs, forHTTPHeaderField: "x-api-key")
        
        return request
    }
}
