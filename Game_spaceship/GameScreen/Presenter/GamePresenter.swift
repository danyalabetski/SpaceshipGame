import Foundation
import UIKit

protocol GamePresenterProtocol {
//    func moveCar()
    func moveBarrier()
    func isGameOver()
    var currentScoresNumber: Int { get }
    var spaceshipCoreData: [Spaceship] { get }
    func loadSpaceshipCoreData()
}

final class GamePresenter {

    var currentScoresNumber = 0
    var arrayScores = [Int]()

    var spaceshipCoreData = [Spaceship]() {
        didSet {
            self.view.setSpaceshipCoreData(spaceshipCoreData)
        }
    }

    unowned let view: GameView
    private let router: GameRouterProtocol

    init(view: GameView, router: GameRouterProtocol) {
        self.view = view
        self.router = router
    }
}

extension GamePresenter: GamePresenterProtocol {
//    func moveCar() {
//
//        let recognizer = UIPanGestureRecognizer()
//
//        let translation = recognizer.translation(in: view.view)
//
//        if let view = recognizer.view {
//            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y)
//        }
//
//        recognizer.setTranslation(CGPoint.zero, in: view.view)
//
//        if recognizer.state == UIGestureRecognizer.State.ended {
//            let velocity = recognizer.velocity(in: view.view)
//            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
//            let slideMultiplier = magnitude / 200
//            let slideFactor = 0.1 * slideMultiplier
//            var finalPoint = CGPoint(x: recognizer.view!.center.x + (velocity.x * slideFactor),
//                                     y: recognizer.view!.center.y + (velocity.y * slideFactor))
//            finalPoint.x = min(max(finalPoint.x, 0), view.view.bounds.size.width)
//            finalPoint.y = min(max(finalPoint.y, 0), view.view.bounds.size.height)
//        }
//    }

    func moveBarrier() {

        let avatars = ["targetOne", "targetTwo", "targetThree"]

        view.imageViewBarrier.image = UIImage(named: avatars[Int(arc4random_uniform(UInt32(avatars.count)))])
        view.imageViewBarrier.center.x = CGFloat(Int.random(in: 50 ..< Int(view.view.frame.width - 100)))
        view.imageViewBarrier.center.y = 0

        let speed = UserDefaults.standard.integer(forKey: "speedGame")

        UIView.animate(
            withDuration: TimeInterval(speed),
            delay: 0,
            options: .curveLinear
        ) {
            self.view.imageViewBarrier.frame.origin.y = self.view.imageViewCar.frame.origin.y

        } completion: { _ in

            if self.view.imageViewCar.frame.intersects(self.view.imageViewBarrier.frame) {

                self.isGameOver()

            } else {

                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {

                    self.view.imageViewBarrier.frame.origin.y = self.view.view.frame.maxY

                } completion: { _ in

                    self.currentScoresNumber += 1

                    self.view.scoreLabel.text = "Score: \(self.currentScoresNumber)"

                    self.arrayScores.append(self.currentScoresNumber)

                    self.moveBarrier()
                }
            }
        }
    }

    func isGameOver() {
        let alertController = UIAlertController(
            title: "GAME OVER",
            message: "Score \(String(describing: arrayScores.endIndex))",
            preferredStyle: .alert
        )

        let alertAction = UIAlertAction(
            title: "Menu",
            style: .default,
            handler: { _ in

                self.router.backMenu()
            }
        )

        let repeatAlertAction = UIAlertAction(
            title: "Repeat game",
            style: .default,
            handler: { _ in
                self.currentScoresNumber = 0
                self.arrayScores.removeAll()
                self.view.scoreLabel.text = "Score: \(self.currentScoresNumber)"
                self.moveBarrier()
            }
        )
        
        let images = UserDefaults.standard.string(forKey: "imageSpaceship")
        let speed = UserDefaults.standard.integer(forKey: "speedGame")

        let score = Spaceship(
            score: currentScoresNumber,
            userName: view.nameUserLabel.text,
            spaceshipImage: images,
            speedGame: Double(speed)
        )
        CoreDataManager.shared.saveScores(score)

        alertController.addAction(alertAction)
        alertController.addAction(repeatAlertAction)

        view.present(
            alertController,
            animated: true,
            completion: nil
        )
    }

    func loadSpaceshipCoreData() {
        spaceshipCoreData = CoreDataManager.shared.getScores()
    }
}
