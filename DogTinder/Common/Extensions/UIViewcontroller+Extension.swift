import UIKit

extension UIViewController {
    internal func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: String.Localized.Alert.ok, style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}
