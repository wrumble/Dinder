import UIKit

class DogView: UIView {
    private let imageViewContainer = UIImageView()
    private let imageView = UIImageView()
    private let detailsStackView = DogDetailsStackView()
    private let detailsScrollView = UIScrollView()
    
    private var imageURL: String? {
        didSet {
            DispatchQueue.main.async {
                self.imageView.image = self.imageFromURL()
            }
        }
    }
    private var dog: Dog? {
        didSet {
            DispatchQueue.main.async {
                self.setupStackView()
            }
        }
    }
    
    required init(dog: Dog? = nil, imageURL: String? = nil) {
        self.dog = dog
        self.imageURL = imageURL
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func imageFromURL() -> UIImage? {
        guard let imageURL = imageURL,
                let url = URL(string: imageURL),
                let data = try? Data(contentsOf: url) else {
                return nil
        }
        return UIImage(data: data)
    }
    
    func update(with dog: Dog? = nil, imageURL: String? = nil) {
        self.imageURL = imageURL
        self.dog = dog
    }
    
    private func setupStackView() {
        detailsStackView.update(with: dog)
    }
}

extension DogView: Subviewable {
    func setupSubviews() {
        imageViewContainer.image = .bones
        imageViewContainer.backgroundColor = .backgroundGreen
        imageViewContainer.contentMode = .scaleAspectFill
        
        imageView.contentMode = .scaleAspectFit
    }
    
    func setupHierarchy() {
        addSubview(imageViewContainer)
        imageViewContainer.addSubview(imageView)
        addSubview(detailsScrollView)
        detailsScrollView.addSubview(detailsStackView)
    }
    
    func setupAutoLayout() {
        imageViewContainer.pin(toSuperview: [.leading, .top, .trailing])
        imageViewContainer.pin(toSuperviewSafeArea: [.top])
        imageViewContainer.set(height: Layout.imageHeight)
        
        imageView.pin(toSuperview: [.top, .bottom], insetBy: Layout.margin)
        imageView.pin(toSuperview: [.leading, .trailing])

        detailsScrollView.pin(.top, to: .bottom, of: imageViewContainer)
        detailsScrollView.pin(toSuperview: [.trailing, .bottom, .leading])
        
        detailsStackView.pin(toSuperview: Edge.all)
        detailsStackView.set(width: Layout.screenWidth)
    }
}
