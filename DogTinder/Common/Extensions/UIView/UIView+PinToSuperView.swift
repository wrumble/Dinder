//The files in this folder have been created by Novoda as an internal iOS project and are soon to be released as a pod for the public to use.
import UIKit

public extension UIView {
    
    func pin(toSuperview edges: [Edge],
             insetBy inset: CGFloat = 0,
             priority: UILayoutPriority = .required,
             relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        for edge in edges {
            pin(toSuperview: edge,
                insetBy: inset,
                priority: priority,
                relatedBy: relation)
        }
    }
    
    func pin(toSuperview edges: Edge...,
             insetBy inset: CGFloat = 0,
             priority: UILayoutPriority = .required,
             relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        var edges = edges
        
        if edges.isEmpty {
            edges = Edge.all
        }
        
        for edge in edges {
            pin(toSuperview: edge,
                insetBy: inset,
                priority: priority,
                relatedBy: relation)
        }
    }
    
    @discardableResult private func pin(toSuperview edge: Edge,
                                        insetBy inset: CGFloat = 0,
                                        priority: UILayoutPriority = .required,
                                        relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        return pin(edge,
                   to: edge,
                   of: superview,
                   constant: inset,
                   priority: priority,
                   relatedBy: relation)
    }
}
