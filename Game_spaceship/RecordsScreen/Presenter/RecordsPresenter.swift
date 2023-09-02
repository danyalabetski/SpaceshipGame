import Foundation

protocol RecordsPresenterProtocol {
    var scores: [Spaceship] { get }
    func loadScores()
}

final class RecordsPresenter {
        
    var scores = [Spaceship]() {
        didSet {
            self.view.setScores(scores)
        }
    }
    
    unowned let view: RecordsViewProtocol
    private let router: RecordsRouterProtocol
    
    init(view: RecordsViewProtocol, router: RecordsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}

extension RecordsPresenter: RecordsPresenterProtocol {
    
    
    func loadScores() {
        scores = CoreDataManager.shared.getScores()
    }
    
    
}
