import UIKit

class BreedCell: UITableViewCell {
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with breed: Dog) {
        nameLabel.text = breed.breed
    }
}

extension BreedCell: Subviewable {
    func setupSubviews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.font = .details
    }
    
    func setupHierarchy() {
        contentView.addSubview(nameLabel)
    }
    
    func setupAutoLayout() {
        nameLabel.pin(toSuperview: Edge.all, insetBy: Layout.margin)
    }
}
