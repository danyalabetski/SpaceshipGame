protocol MainScreenPresenterProtocol {
    func pushGameScreen()
    func pushSettingsScreen()
    func pushRecordsScreen()
}

final class MainScreenPresenter {
    
    unowned let view: MainScreenViewProtocol
    private let router: MainScreenRouterInput
        
    init(view: MainScreenViewProtocol, router: MainScreenRouterInput) {
        self.view = view
        self.router = router
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    func pushGameScreen() {
        router.pushGameScreen()
    }
    
    func pushSettingsScreen() {
        router.pushSettingsScreen()
    }
    
    func pushRecordsScreen() {
        
        router.pushRecordsScreen()
    }
}
