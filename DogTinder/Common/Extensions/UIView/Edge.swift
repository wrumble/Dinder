//The files in this folder have been created by Novoda as an internal iOS project and are soon to be released as a pod for the public to use.
import UIKit

public struct Edge: Equatable {

    let layoutAttribute: NSLayoutConstraint.Attribute
    let insetMultiplier: CGFloat
    
    public static let top = Edge(layoutAttribute: .top, insetMultiplier: 1)

    public static let bottom = Edge(layoutAttribute: .bottom, insetMultiplier: -1)

    public static let leading = Edge(layoutAttribute: .leading, insetMultiplier: 1)

    public static let trailing = Edge(layoutAttribute: .trailing, insetMultiplier: -1)
    
    public static let all: [Edge] = [.top, .bottom, .leading, .trailing]
    
    func offset(equivalentToInset inset: CGFloat) -> CGFloat {
        return inset * insetMultiplier
    }
}

internal extension NSLayoutConstraint.Axis {
    
    var from: Edge {
        switch self {
        case .horizontal:
            return .leading
        case .vertical:
            return .top
        }
    }
    
    var to: Edge  {
        switch self {
        case .horizontal:
            return .trailing
        case .vertical:
            return .bottom
        }
    }
}
