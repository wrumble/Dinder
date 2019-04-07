//The files in this folder have been created by Novoda as an internal iOS project and are soon to be released as a pod for the public to use.
import UIKit

public struct Anchor {
    public let constrain: (UIView, CGFloat) -> Void
    
    public static let all: [Anchor] = [.top, .bottom, .leading, .trailing]
    
    public static let top = Anchor(constrain: { view, offset in
        view.topSafeAnchor.constraint(equalTo: view.superview!.topSafeAnchor,
                                      constant: Edge.top.offset(equivalentToInset: offset)).isActive = true
    })
    
    public static let bottom = Anchor(constrain: { view, offset in
        view.bottomSafeAnchor.constraint(equalTo: view.superview!.bottomSafeAnchor,
                                         constant: Edge.bottom.offset(equivalentToInset: offset)).isActive = true
    })
    
    public static let leading = Anchor(constrain: { view, offset in
        view.leadingSafeAnchor.constraint(equalTo: view.superview!.leadingSafeAnchor,
                                          constant: Edge.leading.offset(equivalentToInset: offset)).isActive = true
    })
    
    public static let trailing = Anchor(constrain: { view, offset in
        view.trailingSafeAnchor.constraint(equalTo: view.superview!.trailingSafeAnchor,
                                           constant: Edge.trailing.offset(equivalentToInset: offset)).isActive = true
    })
}
