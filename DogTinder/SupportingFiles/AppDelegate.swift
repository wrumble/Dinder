import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setRootViewController()
        
        return true
    }
    
    private func setRootViewController() {
        let homeViewModel = HomeViewModel()
        let filterViewModel = FilterViewModel()
        let filterViewController = FilterViewController(viewModel: filterViewModel)
        let homeViewController = HomeViewController(viewModel: homeViewModel,
                                                    filterViewModel: filterViewModel,
                                                    filterViewController: filterViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = homeViewController
    }
}

