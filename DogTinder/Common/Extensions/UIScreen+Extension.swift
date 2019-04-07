import UIKit

extension UIScreen {
    static func hasSafeArea() -> Bool {
        guard #available(iOS 11.0, *),
            let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top,
            topPadding > 24 else {
                return false
        }
        return true
    }
}
