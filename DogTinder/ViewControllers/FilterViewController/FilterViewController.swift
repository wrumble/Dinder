import UIKit


class FilterViewController: UIViewController {
    
    private var tableViewHeightConstraint: NSLayoutConstraint!
    private let tableView = UITableView()
    private let breedButton = UIButton()
    private var tableViewOpen = false
        
    private var dogs: [Dog] = [Dog.all()] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private let viewModel: FilterViewModel
    
    required init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setup()
        viewModel.fetchBreeds()
    }
    
    @objc private func animateTableView() {
        let height: CGFloat = tableViewOpen ? Layout.tableViewClosedHeight : Layout.tableViewOpenHeight
        
        UIViewPropertyAnimator(duration: 0.5, curve: .linear, animations: {
            self.tableViewHeightConstraint.constant = height
            self.view.layoutIfNeeded()
        }).startAnimation()
        
        tableViewOpen = !tableViewOpen
    }
}

extension FilterViewController: Subviewable {
    func setupSubviews() {
        viewModel.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BreedCell.self, forCellReuseIdentifier: Identifier.breedCell)
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.backgroundColor = .backgroundYellow
        
        breedButton.setTitle(String.Localized.Filter.breed + " ▼", for: .normal)
        breedButton.titleLabel?.font = .details
        breedButton.titleLabel?.textAlignment = .left
        breedButton.setTitleColor(.black, for: .normal)
        breedButton.addTarget(self, action: #selector(animateTableView), for: .touchUpInside)
    }
    
    func setupHierarchy() {
        view.addSubview(breedButton)
        view.addSubview(tableView)
    }
    
    func setupAutoLayout() {
        breedButton.pin(toSuperview: .leading, insetBy: Layout.margin)
        breedButton.pin(toSuperview: .top, insetBy: Layout.margin/2)
        
        tableView.pin(.top, to: .bottom, of: breedButton)
        tableView.pin(toSuperview: [.leading, .trailing])
        tableViewHeightConstraint = tableView.set(height: Layout.tableViewClosedHeight)
        tableView.set(width: Layout.tableViewWidth)
    }
}

extension FilterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.breedCell, for: indexPath) as! BreedCell
        let breed = dogs[indexPath.row]
        
        cell.update(with: breed)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animateTableView()
        let breedID = dogs[indexPath.row].id
        viewModel.breedSelected(with: breedID)
    }
}

extension FilterViewController: FilterViewModelDelegate {
    internal func onFetchCompleted(_ dogs: [Dog]) {
        self.dogs.append(contentsOf: dogs)
    }
    
    internal func onRequestFailed(with error: Error?) {
        let message = error?.localizedDescription ?? String.Localized.Alert.genericErrorMessage
        let title = String.Localized.Alert.error
        
        showAlert(title: title, message: message)
    }
}
