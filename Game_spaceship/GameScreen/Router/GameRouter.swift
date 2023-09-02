import UIKit

protocol GameRouterProtocol {
    func backMenu()
}

final class GameRouter {
        
    let navigationController: UINavigationController
    private let window: UIWindow
        
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        let view = GameView()
        let presenter = GamePresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
    
}

extension GameRouter: GameRouterProtocol {
    func backMenu() {
        _ = MainScreenRouter(navigationController: navigationController, window: window)
    }
}
