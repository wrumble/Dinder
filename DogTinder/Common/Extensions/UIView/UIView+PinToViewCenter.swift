//The files in this folder have been created by Novoda as an internal iOS project and are soon to be released as a pod for the public to use.
import UIKit

public extension UIView {
    @discardableResult func pin(centerXTo view: UIView,
                                       constant: CGFloat = 0,
                                       priority: UILayoutPriority = .required,
                                       relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(.centerX,
                   to: .centerX,
                   of: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func pin(centerYTo view: UIView,
                                       constant: CGFloat = 0,
                                       priority: UILayoutPriority = .required,
                                       multiplier: CGFloat = 1,
                                       relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(.centerY,
                   to: .centerY,
                   of: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
    
    func pin(centerTo view: UIView,
                   constant: CGFloat = 0,
                   priority: UILayoutPriority = .required,
                   relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        pin(centerXTo: view,
            constant: constant,
            priority: priority,
            relatedBy: relation)
        
        pin(centerYTo: view,
            constant: constant,
            priority: priority,
            relatedBy: relation)
    }
}
