import Foundation

@objc protocol Subviewable {
    func setupSubviews()
    func setupHierarchy()
    func setupAutoLayout()
}

extension Subviewable {
    func setup() {
        setupSubviews()
        setupHierarchy()
        setupAutoLayout()
    }
}
