import UIKit

protocol SettingsViewProtocol: AnyObject {
    
}

final class SettingsView: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SettingsPresenterProtocol?
    
    // MARK: Private
    
    private let userNameTextField = UITextField()
    private let saveNameButton = UIButton()
    
    
    private let descriptionSpeedGameLabel = UILabel()
    private let speedGamePositionFirstButton = UIButton()
    private let speedGamePositionSecondButton = UIButton()
    private let speedGamePositionThirdButton = UIButton()
    
    private let spaceshipFirstImageButton = UIButton()
    private let spaceshipSecondImageButton = UIButton()
    private let spaceshipThirdImageButton = UIButton()
    private let spaceshipFourthImageButton = UIButton()
    private let spaceshipFifthImageButton = UIButton()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupBehaviorUIElements()
        setupAppearanceUIElement()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubviews(
            userNameTextField, saveNameButton, spaceshipFirstImageButton, spaceshipSecondImageButton, spaceshipThirdImageButton, spaceshipFourthImageButton, spaceshipFifthImageButton, speedGamePositionFirstButton, speedGamePositionSecondButton, speedGamePositionThirdButton, descriptionSpeedGameLabel
        )
    }
    
    private func setupBehaviorUIElements() {
        view.nonTranslatesAutoresizingMaskIntoConstraints(
            userNameTextField, saveNameButton, spaceshipFirstImageButton, spaceshipSecondImageButton, spaceshipThirdImageButton, spaceshipFourthImageButton, spaceshipFifthImageButton, speedGamePositionFirstButton, speedGamePositionSecondButton, speedGamePositionThirdButton, descriptionSpeedGameLabel
        )
        
        saveNameButton.addTarget(self, action: #selector(saveNamePressButton), for: .touchUpInside)
        
        speedGamePositionFirstButton.addTarget(self, action: #selector(saveSpeedGameFirstPressButton), for: .touchUpInside)
        speedGamePositionSecondButton.addTarget(self, action: #selector(saveSpeedGameSecondPressButton), for: .touchUpInside)
        speedGamePositionThirdButton.addTarget(self, action: #selector(saveSpeedGameThirdPressButton), for: .touchUpInside)
        
        spaceshipFirstImageButton.addTarget(self, action: #selector(saveOneImageSpaceshipPressButton), for: .touchUpInside)
        spaceshipSecondImageButton.addTarget(self, action: #selector(saveTwoImageSpaceshipPressButton), for: .touchUpInside)
        spaceshipThirdImageButton.addTarget(self, action: #selector(saveThreeImageSpaceshipPressButton), for: .touchUpInside)
        spaceshipFourthImageButton.addTarget(self, action: #selector(saveFourImageSpaceshipPressButton), for: .touchUpInside)
        spaceshipFifthImageButton.addTarget(self, action: #selector(saveFiveImageSpaceshipPressButton), for: .touchUpInside)
    }
    
    private func setupAppearanceUIElement() {
        userNameTextField.placeholder = "Enter your name"
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        userNameTextField.layer.cornerRadius = 10
        userNameTextField.layer.borderWidth = 1
        userNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        userNameTextField.leftViewMode = .always
        
        saveNameButton.layer.cornerRadius = 8
        saveNameButton.backgroundColor = .darkGray
        saveNameButton.setTitle("Save name", for: .normal)
        
        descriptionSpeedGameLabel.text = "Speed game:"
        descriptionSpeedGameLabel.font.withSize(20)
        descriptionSpeedGameLabel.textAlignment = .center
        
        speedGamePositionFirstButton.setTitle("2", for: .normal)
        speedGamePositionFirstButton.setTitleColor(.black, for: .normal)
        speedGamePositionFirstButton.layer.borderColor = UIColor.black.cgColor
        speedGamePositionFirstButton.layer.borderWidth = 1
        speedGamePositionFirstButton.layer.cornerRadius = 10
        
        speedGamePositionSecondButton.setTitle("1.5", for: .normal)
        speedGamePositionSecondButton.setTitleColor(.black, for: .normal)
        speedGamePositionSecondButton.layer.borderColor = UIColor.black.cgColor
        speedGamePositionSecondButton.layer.borderWidth = 1
        speedGamePositionSecondButton.layer.cornerRadius = 10
        
        speedGamePositionThirdButton.setTitle("1", for: .normal)
        speedGamePositionThirdButton.setTitleColor(.black, for: .normal)
        speedGamePositionThirdButton.layer.borderColor = UIColor.black.cgColor
        speedGamePositionThirdButton.layer.borderWidth = 1
        speedGamePositionThirdButton.layer.cornerRadius = 10
        
        spaceshipFirstImageButton.setImage(UIImage(named: "spaceshipOne"), for: .normal)
        spaceshipSecondImageButton.setImage(UIImage(named: "spaceshipTwo"), for: .normal)
        spaceshipThirdImageButton.setImage(UIImage(named: "spaceshipThree"), for: .normal)
        spaceshipFourthImageButton.setImage(UIImage(named: "spaceshipFour"), for: .normal)
        spaceshipFifthImageButton.setImage(UIImage(named: "spaceshipFive"), for: .normal)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveNameButton.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            saveNameButton.centerXAnchor.constraint(equalTo: userNameTextField.centerXAnchor),
            saveNameButton.widthAnchor.constraint(equalToConstant: 150),
            saveNameButton.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionSpeedGameLabel.topAnchor.constraint(equalTo: saveNameButton.bottomAnchor, constant: 15),
            descriptionSpeedGameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionSpeedGameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            descriptionSpeedGameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            speedGamePositionFirstButton.topAnchor.constraint(equalTo: descriptionSpeedGameLabel.bottomAnchor, constant: 15),
            speedGamePositionFirstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            speedGamePositionFirstButton.heightAnchor.constraint(equalToConstant: 30),
            speedGamePositionFirstButton.widthAnchor.constraint(equalToConstant: 100),
            
            speedGamePositionSecondButton.topAnchor.constraint(equalTo: descriptionSpeedGameLabel.bottomAnchor, constant: 15),
            speedGamePositionSecondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            speedGamePositionSecondButton.heightAnchor.constraint(equalToConstant: 30),
            speedGamePositionSecondButton.widthAnchor.constraint(equalToConstant: 100),
            
            speedGamePositionThirdButton.topAnchor.constraint(equalTo: descriptionSpeedGameLabel.bottomAnchor, constant: 15),
            speedGamePositionThirdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            speedGamePositionThirdButton.heightAnchor.constraint(equalToConstant: 30),
            speedGamePositionThirdButton.widthAnchor.constraint(equalToConstant: 100),
            
            spaceshipFirstImageButton.topAnchor.constraint(equalTo: speedGamePositionFirstButton.bottomAnchor, constant: 30),
            spaceshipFirstImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            spaceshipFirstImageButton.widthAnchor.constraint(equalToConstant: 50),
            spaceshipFirstImageButton.heightAnchor.constraint(equalToConstant: 50),
            
            spaceshipSecondImageButton.topAnchor.constraint(equalTo: speedGamePositionFirstButton.bottomAnchor, constant: 30),
            spaceshipSecondImageButton.leadingAnchor.constraint(equalTo: spaceshipFirstImageButton.trailingAnchor, constant: 25),
            spaceshipSecondImageButton.widthAnchor.constraint(equalToConstant: 50),
            spaceshipSecondImageButton.heightAnchor.constraint(equalToConstant: 50),
            
            spaceshipThirdImageButton.topAnchor.constraint(equalTo: speedGamePositionFirstButton.bottomAnchor, constant: 30),
            spaceshipThirdImageButton.leadingAnchor.constraint(equalTo: spaceshipSecondImageButton.trailingAnchor, constant: 25),
            spaceshipThirdImageButton.widthAnchor.constraint(equalToConstant: 50),
            spaceshipThirdImageButton.heightAnchor.constraint(equalToConstant: 50),

            spaceshipFourthImageButton.topAnchor.constraint(equalTo: speedGamePositionFirstButton.bottomAnchor, constant: 30),
            spaceshipFourthImageButton.leadingAnchor.constraint(equalTo: spaceshipThirdImageButton.trailingAnchor, constant: 25),
            spaceshipFourthImageButton.widthAnchor.constraint(equalToConstant: 50),
            spaceshipFourthImageButton.heightAnchor.constraint(equalToConstant: 50),

            spaceshipFifthImageButton.topAnchor.constraint(equalTo: speedGamePositionFirstButton.bottomAnchor, constant: 30),
            spaceshipFifthImageButton.leadingAnchor.constraint(equalTo: spaceshipFourthImageButton.trailingAnchor, constant: 25),
            spaceshipFifthImageButton.widthAnchor.constraint(equalToConstant: 50),
            spaceshipFifthImageButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - Helpers
    
    @objc
    private func saveNamePressButton() {
        let name = userNameTextField.text
        
        UserDefaults.standard.set(name, forKey: "name")
//        presenter?.saveNameUser(name: userNameTextField.text ?? "User")
    }
    
    @objc
    private func saveSpeedGameFirstPressButton() {
        UserDefaults.standard.set(2, forKey: "speedGame")
//        presenter?.saveSpeedGame(speedGame: 2)
    }
    
    @objc
    private func saveSpeedGameSecondPressButton() {
        UserDefaults.standard.set(1.5, forKey: "speedGame")
//        presenter?.saveSpeedGame(speedGame: 1.5)
    }
    
    @objc
    private func saveSpeedGameThirdPressButton() {
        UserDefaults.standard.set(1, forKey: "speedGame")
//        presenter?.saveSpeedGame(speedGame: 1)
    }
    
    @objc
    private func saveOneImageSpaceshipPressButton() {
        UserDefaults.standard.set("spaceshipOne", forKey: "imageSpaceship")
//        presenter?.saveImageSpaceship(image: "spaceshipOne")
    }
    
    @objc
    private func saveTwoImageSpaceshipPressButton() {
        UserDefaults.standard.set("spaceshipTwo", forKey: "imageSpaceship")
//        presenter?.saveImageSpaceship(image: "spaceshipTwo")
    }
    
    @objc
    private func saveThreeImageSpaceshipPressButton() {
        UserDefaults.standard.set("spaceshipThree", forKey: "imageSpaceship")
//        presenter?.saveImageSpaceship(image: "spaceshipThree")
    }
    
    @objc
    private func saveFourImageSpaceshipPressButton() {
        UserDefaults.standard.set("spaceshipFour", forKey: "imageSpaceship")
//        presenter?.saveImageSpaceship(image: "spaceshipFour")
    }
    
    @objc
    private func saveFiveImageSpaceshipPressButton() {
        UserDefaults.standard.set("spaceshipFive", forKey: "imageSpaceship")
//        presenter?.saveImageSpaceship(image: "spaceshipFive")
    }
}

extension SettingsView: SettingsViewProtocol {

}
