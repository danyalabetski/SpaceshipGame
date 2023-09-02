protocol SettingsPresenterProtocol {
    func saveNameUser(name: String)
    func saveSpeedGame(speedGame: Double)
    func saveImageSpaceship(image: String)
}

final class SettingsPresenter {
    
    unowned let view: SettingsViewProtocol
    private let router: SettingsRouterProtocol
    
    init(view: SettingsViewProtocol, router: SettingsRouterProtocol) {
        self.view = view
        self.router = router
    }
}

extension SettingsPresenter: SettingsPresenterProtocol {
    func saveNameUser(name: String) {
        let nameUser = Spaceship(score: nil, userName: name, spaceshipImage: nil, speedGame: nil)
        CoreDataManager.shared.saveScores(nameUser)
    }
    
    func saveSpeedGame(speedGame: Double) {
        let speedGame = Spaceship(score: nil, userName: nil, spaceshipImage: nil, speedGame: speedGame)
        CoreDataManager.shared.saveScores(speedGame)
    }
    
    func saveImageSpaceship(image: String) {
        let imageSpaceship = Spaceship(score: nil, userName: nil, spaceshipImage: image, speedGame: nil)
        CoreDataManager.shared.saveScores(imageSpaceship)
    }
}
