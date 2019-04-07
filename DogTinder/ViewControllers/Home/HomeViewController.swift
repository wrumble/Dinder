import UIKit

class HomeViewController: UIViewController {
    
    private var filterIsOpen = false
    private let titleLabel = UILabel()
    private let dogView = DogView()
    private let loadingLabel = UILabel()
    private let buttonStackView = UIStackView()
    private let dislikeButton = SelectionButton(image: .dislike)
    private let likeButton = SelectionButton(image: .like)
    
    private let filterViewModel = FilterViewModel()
    private let filterViewController: FilterViewController
    private let viewModel: HomeViewModel!

    required init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.filterViewController = FilterViewController(viewModel: filterViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        viewModel.fetchDogFromAPI()
    }
    
    @objc private func viewTapped() {
        viewModel.fetchDogFromAPI()
    }
    
    @objc private func dislikeButtonTapped() {
        viewModel.voteDog(.down)
    }
    
    @objc private func likeButtonTapped() {
        viewModel.voteDog(.up)
    }
}

extension HomeViewController: Subviewable {
    func setupSubviews() {
        view.backgroundColor = .backgroundYellow
        
        viewModel.delegate = self
        
        filterViewModel.listener = viewModel
        
        filterViewController.didMove(toParent: self)
        
        titleLabel.text = String.Localized.Home.title
        titleLabel.font = .title
        titleLabel.textAlignment = .center
        
        dislikeButton.addTarget(self, action: #selector(dislikeButtonTapped), for: .touchUpInside)
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        buttonStackView.distribution = .fillEqually
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = Layout.buttonStackViewSpacing
        
        loadingLabel.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        loadingLabel.text = String.Localized.Home.loading + "..."
        loadingLabel.textAlignment = .center
        loadingLabel.font = .title
    }
    
    func setupHierarchy() {
        addChild(filterViewController)
        
        view.addSubview(titleLabel)
        view.addSubview(dogView)
        view.addSubview(buttonStackView)
        view.addSubview(filterViewController.view)
        view.addSubview(loadingLabel)
        
        buttonStackView.addArrangedSubview(dislikeButton)
        buttonStackView.addArrangedSubview(likeButton)
    }
    
    func setupAutoLayout() {
        filterViewController.view.pin(.top, to: .top, of: titleLabel)
        filterViewController.view.pin(toSuperview: .leading)
        filterViewController.view.set(height: 300)
        filterViewController.view.set(width: 250)
        
        titleLabel.pin(toSuperviewSafeArea: [.leading, .top, .trailing])
        
        dogView.pin(.top, to: .bottom, of: titleLabel)
        dogView.pin(toSuperview: [.leading, .trailing])
        dogView.pin(.bottom, to: .top, of: buttonStackView)
        
        buttonStackView.pin(.top, to: .bottom, of: dogView)
        buttonStackView.set(height: Layout.buttonHeight)
        buttonStackView.pin(toSuperviewSafeArea: [.leading, .trailing, .bottom])
        
        loadingLabel.pin(toSuperview: Edge.all)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    internal func onFetchCompleted(_ dog: Dog?, _ dogImageURL: String) {
        dogView.update(with: dog, imageURL: dogImageURL)
    }
    
    internal func onRequestFailed(with error: Error?) {
        let message = error?.localizedDescription ?? String.Localized.Alert.genericErrorMessage
        let title = String.Localized.Alert.error
        
        showAlert(title: title, message: message)
    }
    
    internal func showLoadingView() {
        loadingLabel.isHidden = false
    }
    
    internal func hideLoadingView() {
        loadingLabel.isHidden = true
    }
}
