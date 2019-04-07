import Foundation

protocol FilterViewModelDelegate: class  {
    func onFetchCompleted(_ dogs: [Dog])
    func onRequestFailed(with error: Error?)
}

protocol FilterViewControllerListener: class {
    func breedSelected(with id: Int)
}

class FilterViewModel  {
    weak var delegate: FilterViewModelDelegate?
    weak var listener: FilterViewControllerListener?
    
    private let api: API
    
    private var currentImageID = ""
    
    init(api: API = API()) {
        self.api = api
    }
    
    func fetchBreeds() {
        let breedsRequest = RequestBuilder.defaultBuilder.breedsRequest()
        
        api.fetchBreeds(with: breedsRequest, completion: { [weak self] response, error in
            guard let strongSelf = self else { return }
            
            guard let response = response else {
                strongSelf.onFail(error)
                return
            }
            
            strongSelf.onSuccess(response)
        })
    }
    
    func breedSelected(with id: Int) {
        listener?.breedSelected(with: id)
    }
    
    private func onFail(_ error: Error?) {
        DispatchQueue.main.async {
            self.delegate?.onRequestFailed(with: error)
        }
    }
    
    private func onSuccess(_ breeds: [Dog]) {
        DispatchQueue.main.async {
            self.delegate?.onFetchCompleted(breeds)
        }
    }
}
