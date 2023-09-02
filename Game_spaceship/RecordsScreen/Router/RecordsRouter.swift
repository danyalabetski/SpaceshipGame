import UIKit

protocol RecordsRouterProtocol {
    
}

final class RecordsRouter {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = RecordsView()
        let presenter = RecordsPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}

extension RecordsRouter: RecordsRouterProtocol {
    
}
