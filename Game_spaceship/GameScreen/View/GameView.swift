import UIKit

protocol GameViewProtocol: AnyObject {
    func setSpaceshipCoreData(_ spaceship: [Spaceship])
}

final class GameView: UIViewController {

    // MARK: - Properties

    var presenter: GamePresenterProtocol?
    
    var spaceship = [Spaceship]()

    // MARK: Private

    private let imageViewRoad: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        image.contentMode = .scaleToFill
        return image
    }()

    let imageViewCar: UIImageView = {
        let images = UserDefaults.standard.string(forKey: "imageSpaceship")
        let image = UIImageView(image: UIImage(named: images ?? "spaceshipOne"))
        image.frame = CGRect(x: 200, y: 500, width: 50, height: 100)
        image.contentMode = .scaleAspectFit
        return image
    }()

    let imageViewBarrier: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 200, y: -100, width: 40, height: 60)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()

    let scoreLabel: UILabel = {
        let score = UILabel()
        score.font = UIFont.boldSystemFont(ofSize: 30)
        score.textColor = .white
        return score
    }()
    
    let nameUserLabel = UILabel()

    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
        setupBehaviorUIElements()
        setupAppearanceUIElement()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.loadSpaceshipCoreData()
    }

    // MARK: - Setups

    private func setupView() {
        self.view.inputViewController?.navigationItem.leftBarButtonItem?.isHidden = true
        
        imageViewRoad.frame = view.bounds

        view.addSubviews(
            imageViewRoad, imageViewCar
        )

        imageViewRoad.addSubviews(
            imageViewBarrier, nameLabel, scoreLabel, nameUserLabel
        )

        view.nonTranslatesAutoresizingMaskIntoConstraints(
            nameLabel, scoreLabel, nameUserLabel
        )

        presenter?.moveBarrier()
        
        scoreLabel.text = "Score: \(String(describing: presenter!.currentScoresNumber))"

        let gestureRocognizer = UIPanGestureRecognizer(target: self, action: #selector(moveSpaceship))

        imageViewCar.addGestureRecognizer(gestureRocognizer)
        imageViewCar.isUserInteractionEnabled = true
                
        let name = UserDefaults.standard.string(forKey: "name")
        nameUserLabel.text = name
        
//        let nameUser = spaceship.map({ $0.userName })
//        nameUserLabel.text = spaceship.last?.userName ?? ""
    }

    private func setupBehaviorUIElements() {

    }

    private func setupAppearanceUIElement() {
        nameUserLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameUserLabel.textColor = .white
        nameUserLabel.textAlignment = .center
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: imageViewRoad.bottomAnchor, constant: -25),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            scoreLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -50),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameUserLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameUserLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameUserLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    // MARK: - Helpers

    @objc func moveSpaceship(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)

        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y)
        }

        recognizer.setTranslation(CGPoint.zero, in: view)

        if recognizer.state == UIGestureRecognizer.State.ended {
            let velocity = recognizer.velocity(in: view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            let slideFactor = 0.1 * slideMultiplier
            var finalPoint = CGPoint(x: recognizer.view!.center.x + (velocity.x * slideFactor),
                                     y: recognizer.view!.center.y + (velocity.y * slideFactor))
            finalPoint.x = min(max(finalPoint.x, 0), view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), view.bounds.size.height)
        }
    }
}

extension GameView: GameViewProtocol {
    func setSpaceshipCoreData(_ spaceship: [Spaceship]) {
        self.spaceship = spaceship
    }
}
