import UIKit

class DogDetailsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with dog: Dog?) {
        removeAllArrangedSubviews()
        
        guard let dog = dog else {
            showNoDetailsLabel()
            return
        }
        
        addNewSubviews(for: dog)
    }
    
    private func showNoDetailsLabel() {
        let noDetailsLabel = makeNoDetailsLabel()
        addArrangedSubview(noDetailsLabel)
    }
    
    private func makeNoDetailsLabel() -> UILabel {
        let noDetailsLabel = UILabel()

        noDetailsLabel.text = String.Localized.Details.noDetailsAvailable
        noDetailsLabel.textAlignment = .center
        noDetailsLabel.numberOfLines = 0
        noDetailsLabel.font = .details
        
        return noDetailsLabel
    }
    
    private func addNewSubviews(for dog: Dog) {
        if dog.breed != "" {
            let nameDetailLabel = createLabel(title: String.Localized.Details.name,
                                              text: dog.breed,
                                              isNameLabel: true)
            addArrangedSubview(nameDetailLabel)
        }
        
        if let weight = dog.weight?.localized(), weight != ""   {
            let weightDetailLabel = createLabel(title: String.Localized.Details.weight, text: weight)
            addArrangedSubview(weightDetailLabel)
        }
        
        if let height = dog.height?.localized(), height != "" {
            let heightDetailLabel = createLabel(title: String.Localized.Details.height, text: height)
            addArrangedSubview(heightDetailLabel)
        }
        
        if let breedGroup = dog.breedGroup, breedGroup != "" {
            let breedGroupDetailLabel = createLabel(title: String.Localized.Details.breedGroup, text: breedGroup)
            addArrangedSubview(breedGroupDetailLabel)
        }
        
        if let lifeSpan = dog.lifeSpan, lifeSpan != "" {
            let lifeSpanDetailLabel = createLabel(title: String.Localized.Details.lifeSpan, text: lifeSpan)
            addArrangedSubview(lifeSpanDetailLabel)
        }
        
        if let temperament = dog.temperament, temperament != "" {
            let temperamentDetailLabel = createLabel(title: String.Localized.Details.temperament, text: temperament)
            addArrangedSubview(temperamentDetailLabel)
        }
        
        if let origin = dog.origin, origin != "" {
            let originDetailLabel = createLabel(title: String.Localized.Details.origin, text: origin)
            addArrangedSubview(originDetailLabel)
        }
    }
    
    private func createLabel(title: String, text: String, isNameLabel: Bool = false) -> UILabel {
        let detailLabel = UILabel()
        let formattedString = NSMutableAttributedString()
        let spacerText = isNameLabel ? "" : ": "

        detailLabel.font = .details
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = isNameLabel ? .center : .left
        detailLabel.attributedText = isNameLabel ? formattedString.bold(text) : formattedString.bold(title)
                                                                                               .normal(spacerText)
                                                                                               .normal(text)
        
        return detailLabel
    }
}

extension DogDetailsStackView: Subviewable {
    func setupSubviews() {
        axis = .vertical
        distribution = .equalSpacing
        spacing = Layout.margin/2
        layoutMargins = Layout.detailStackViewEdgeInsets
        isLayoutMarginsRelativeArrangement = true
    }
    
    func setupHierarchy() {
        //no op
    }
    
    func setupAutoLayout() {
        //no op
    }
}
