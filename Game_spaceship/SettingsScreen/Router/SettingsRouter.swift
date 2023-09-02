import UIKit

protocol SettingsRouterProtocol {
}

final class SettingsRouter {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = SettingsView()
        let presenter = SettingsPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
    
}

extension SettingsRouter: SettingsRouterProtocol {
    
}

