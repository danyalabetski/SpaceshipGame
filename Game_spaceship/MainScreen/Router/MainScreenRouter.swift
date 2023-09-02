import UIKit

protocol MainScreenRouterInput {
    func pushGameScreen()
    func pushSettingsScreen()
    func pushRecordsScreen()
}

final class MainScreenRouter {

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        let view = MainScreenView()
        let presenter = MainScreenPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}

extension MainScreenRouter: MainScreenRouterInput {
    func pushGameScreen() {
        _ = GameRouter(navigationController: navigationController, window: window)
    }
    
    func pushSettingsScreen() {
        _ = SettingsRouter(navigationController: navigationController, window: window)
    }
    
    func pushRecordsScreen() {
        _ = RecordsRouter(navigationController: navigationController, window: window)
    }
}


