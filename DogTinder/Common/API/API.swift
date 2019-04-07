import Foundation

protocol APIProvider {
    func fetchDogs(with request: URLRequest, completion: @escaping ((DogResponse?, Error?) -> Void))
    func postVote(with request: URLRequest, completion: @escaping ((VoteResponse?, Error?) -> Void))
    func fetchBreeds(with request: URLRequest, completion: @escaping (([Dog]?, Error?) -> Void))
}

class API: APIProvider {
    
    private let decoder = JSONDecoder()
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchDogs(with request: URLRequest, completion: @escaping ((DogResponse?, Error?) -> ())) {
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data,
                let json = try? self.decoder.decode([DogResponse].self, from: data),
                    let response = json.first else {
                    completion(nil, error)
                    return
            }
            
            completion(response, nil)
         }.resume()
    }
    
    func postVote(with request: URLRequest, completion: @escaping ((VoteResponse?, Error?) -> ())) {
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data,
                let response = try? self.decoder.decode(VoteResponse.self, from: data) else {
                    completion(nil, error)
                    return
            }
            
            if response.message != VoteMessage.success.rawValue {
                let voteError = ApiError.voteError(response.message)
                completion(nil, voteError)
            }
            
            completion(response, nil)
        }.resume()
    }
    
    func fetchBreeds(with request: URLRequest, completion: @escaping (([Dog]?, Error?) -> ())) {
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data,
                let response = try? self.decoder.decode([Dog].self, from: data) else {
                    completion(nil, error)
                    return
            }

            completion(response, nil)
        }.resume()
    }
}
