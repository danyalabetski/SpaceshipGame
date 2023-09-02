import CoreData
import UIKit

final class CoreDataManager {
    static let shared = CoreDataManager()

    func saveScores(_ spaceship: Spaceship) {
        guard let appDelegete = UIApplication.shared.delegate as? AppDelegate else { return }

        let managerContext = appDelegete.persistentContainer.viewContext

        if let entity = NSEntityDescription.entity(forEntityName: "SpaceshipEntity", in: managerContext) {

            let spaceships = NSManagedObject(entity: entity, insertInto: managerContext)
            
            spaceships.setValue(spaceship.score, forKey: "score")
            spaceships.setValue(spaceship.userName, forKey: "userName")
            spaceships.setValue(spaceship.spaceshipImage, forKey: "spaceshipImage")
            spaceships.setValue(spaceship.speedGame, forKey: "speedGame")

            do {
                try managerContext.save()
                print("Save request send.")
            } catch let error as NSError {
                print(error)
            }

        } else {
           
        }
    }

    func getScores() -> [Spaceship] {

        guard let appDelegete = UIApplication.shared.delegate as? AppDelegate else { return [] }

        let managerContext = appDelegete.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SpaceshipEntity")

        do {
            let objects = try managerContext.fetch(fetchRequest)

            var spaceships = [Spaceship]()

            for object in objects {
                let score = object.value(forKey: "score") as? Int ?? 0
                let userName = object.value(forKey: "userName") as? String ?? ""
                let spaceshipImage = object.value(forKey: "spaceshipImage") as? String ?? ""
                let speedGame = object.value(forKey: "speedGame") as? Double ?? 0.0

                let spaceship = Spaceship(
                    score: score,
                    userName: userName,
                    spaceshipImage: spaceshipImage,
                    speedGame: speedGame
                )

                spaceships.append(spaceship)
            }

            return spaceships

        } catch let error as NSError {
            print(error)
        }

        return []
    }

    private init() {}
}

