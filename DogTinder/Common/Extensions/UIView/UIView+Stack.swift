//The files in this folder have been created by Novoda as an internal iOS project and are soon to be released as a pod for the public to use.
import UIKit

public extension Array where Element == UIView {
    /**
     Stacks an array of UIViews vertically or horizontally with variadic spacing parameters
     
     - Parameter spacing: An array of spacings to be used between each view
     
     Spacing - if there are more views than spacing elements, the last spacing will be used for all remaining views.
     I.e. using a spacing of (30, 8) will cause an initial space of 30 then 8 for the remaining views.
     If there are more spacing values than views, extra spacing values will be ignored
     */
    func stack(direction: NSLayoutConstraint.Axis,
               spacing: CGFloat...,
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        stack(direction: direction,
              spacing: spacing,
              priority: priority,
              relatedBy: relation)
    }
    /**
     Stacks an array of UIViews vertically or horizontally with an array of spacing parameters
     
     - Parameter spacing: An array of spacings to be used between each view
     
     Spacing - if there are more views than spacing elements, the last spacing will be used for all remaining views.
     I.e. using a spacing of (30, 8) will cause an initial space of 30 then 8 for the remaining views.
     If there are more spacing values than views, extra spacing values will be ignored
     */
    func stack(direction: NSLayoutConstraint.Axis,
               spacing: [CGFloat] = [],
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        iterate { view, lastView, index in
            
            let constant = (index < spacing.count)
                ? spacing[index]
                : spacing.last ?? 0
            
            view.pin(direction.from,
                     to: direction.to,
                     of: lastView,
                     constant: constant,
                     priority: priority,
                     relatedBy: relation)
        }
    }
}
