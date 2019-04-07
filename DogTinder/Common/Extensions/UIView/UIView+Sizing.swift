//The files in this folder have been created by Novoda as an internal iOS project and are soon to be released as a pod for the public to use.
import UIKit

public extension UIView {
    
    @discardableResult func set(height constant: CGFloat) -> NSLayoutConstraint {
        return pin(.height, constant: constant)
    }
    
    @discardableResult func set(width constant: CGFloat) -> NSLayoutConstraint {
        return pin(.width, constant: constant)
    }
    
    @discardableResult func set(widthEqualTo view: UIView,
                                attribute: NSLayoutConstraint.Attribute = .width,
                                constant: CGFloat = 0,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        return pin(.width,
                   to: attribute,
                   of: view,
                   constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func set(heightEqualTo view: UIView,
                                attribute: NSLayoutConstraint.Attribute = .height,
                                constant: CGFloat = 0,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(.height,
                   to: attribute,
                   of: view,
                   constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    func set(size: CGSize) {
        pin(.height, constant: size.height)
        pin(.width, constant: size.width)
    }
    
    func set(sizeEqualTo view: UIView,
             multiplier: CGFloat = 1,
             priority: UILayoutPriority = .required,
             relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        set(widthEqualTo: view,
            multiplier: multiplier,
            priority: priority,
            relatedBy: relation)
        
        set(heightEqualTo: view,
            multiplier: multiplier,
            priority: priority,
            relatedBy: relation)
    }
}
