import UIKit

class SelectionButton: UIButton {
    private let image: UIImage
    
    required init(image: UIImage) {
        self.image = image
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectionButton: Subviewable {
    func setupSubviews() {
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        layer.borderColor = UIColor.buttonBorderColor
        layer.borderWidth = Layout.buttonBorderWidth
        layer.cornerRadius = Layout.buttonBorderCornerRadius
        layer.maskedCorners = UIScreen.hasSafeArea() ? [.layerMinXMinYCorner,
                                                        .layerMaxXMinYCorner,
                                                        .layerMinXMaxYCorner,
                                                        .layerMaxXMaxYCorner] : [.layerMinXMinYCorner,
                                                                                 .layerMaxXMinYCorner]
        contentEdgeInsets = UIEdgeInsets(top: Layout.buttonEdgeInset,
                                         left: Layout.buttonEdgeInset,
                                         bottom: Layout.buttonEdgeInset,
                                         right: Layout.buttonEdgeInset)
    }
    
    func setupHierarchy() {
        //no op
    }
    
    func setupAutoLayout() {
        //no op
    }
}
