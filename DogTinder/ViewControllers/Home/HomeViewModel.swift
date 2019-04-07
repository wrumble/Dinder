import Foundation

protocol HomeViewModelDelegate: class  {
    func onFetchCompleted(_ dog: Dog?, _ dogImageURL: String)
    func onRequestFailed(with error: Error?)
    func showLoadingView()
    func hideLoadingView()
}

enum Vote: Int {
    case up = 1
    case down = 0
}

class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    private let api: API
    
    private var currentImageID = ""
    private var currentBreedID: Int = BreedType.all {
        didSet {
                fetchDogFromAPI()
        }
    }
    
    init(api: API = API()) {
        self.api = api
    }
    
    func fetchDogFromAPI() {
        let dogsRequest = RequestBuilder.defaultBuilder.dogsRequest(with: currentBreedID)
        api.fetchDogs(with: dogsRequest, completion: { [weak self] response, error in
            guard let strongSelf = self else { return }
            strongSelf.showLoadingView()
            
            guard let response = response else {
                strongSelf.onFail(error)
                return
            }
            
            strongSelf.currentImageID = response.imageID
            strongSelf.onSuccess(response.dogs, response.imageURL)
        })
    }
    
    func voteDog(_ vote: Vote) {
        let voteRequest = RequestBuilder.defaultBuilder.voteRequest(imageID: currentImageID, vote: vote.rawValue)
        api.postVote(with: voteRequest, completion: { [weak self] voteResult, error in
            guard let strongSelf = self else { return }
            strongSelf.showLoadingView()
            
            guard let _ = voteResult else {
                    strongSelf.onFail(error)
                    return
            }
            
            strongSelf.fetchDogFromAPI()
        })
    }
    
    private func showLoadingView() {
        DispatchQueue.main.async {
            self.delegate?.showLoadingView()
        }
    }
    
    private func hideLoadingView() {
        DispatchQueue.main.async {
            self.delegate?.hideLoadingView()
        }
    }
    
    private func onFail(_ error: Error?) {
        hideLoadingView()
        delegate?.onRequestFailed(with: error)
    }
    
    private func onSuccess(_ dogs: [Dog], _ dogImageURL: String) {
        hideLoadingView()
        delegate?.onFetchCompleted(dogs.first, dogImageURL)
    }
}

extension HomeViewModel: FilterViewControllerListener {
    func breedSelected(with id: Int) {
        currentBreedID = id
    }
}
