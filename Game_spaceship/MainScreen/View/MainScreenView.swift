import UIKit

protocol MainScreenViewProtocol: AnyObject {
    
}

final class MainScreenView: UIViewController {
    
    // MARK: - Properties
    
    var presenter: MainScreenPresenterProtocol?
    
    // MARK: - Private

    private let playGameButton = UIButton()
    private let settingsButton = UIButton()
    private let recordsGameButton = UIButton()
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//    
    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .systemBackground
//        navigationItem.leftBarButtonItem?.isHidden = true
//        navigationController?.navigationBar.isHidden = true
        
        
        view.addSubviews(
            playGameButton, settingsButton, recordsGameButton
        )
        
        view.nonTranslatesAutoresizingMaskIntoConstraints(
            playGameButton, settingsButton, recordsGameButton
        )
    }
    
    private func setupBehaviorUIElements() {
        playGameButton.setTitle("Play game", for: .normal)
        playGameButton.addTarget(self, action: #selector(didTapPlayGameButton), for: .touchUpInside)
        
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        
        recordsGameButton.setTitle("Records", for: .normal)
        recordsGameButton.addTarget(self, action: #selector(didTapPlayRecordsButton), for: .touchUpInside)
    }
    
    private func setupAppearanceUIElement() {
        playGameButton.setTitleColor(.black, for: .normal)
        playGameButton.layer.cornerRadius = 11
        playGameButton.layer.borderColor = UIColor.black.cgColor
        playGameButton.layer.borderWidth = 1
        
        settingsButton.setTitleColor(.black, for: .normal)
        settingsButton.layer.cornerRadius = 11
        settingsButton.layer.borderColor = UIColor.black.cgColor
        settingsButton.layer.borderWidth = 1
        
        recordsGameButton.setTitleColor(.black, for: .normal)
        recordsGameButton.layer.cornerRadius = 11
        recordsGameButton.layer.borderColor = UIColor.black.cgColor
        recordsGameButton.layer.borderWidth = 1
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: 40),
            settingsButton.widthAnchor.constraint(equalToConstant: 120),
            
            playGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            playGameButton.heightAnchor.constraint(equalToConstant: 40),
            playGameButton.widthAnchor.constraint(equalToConstant: 120),
            
            recordsGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordsGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            recordsGameButton.heightAnchor.constraint(equalToConstant: 40),
            recordsGameButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    // MARK: - Helpers
    
    @objc private func didTapPlayGameButton() {
        presenter?.pushGameScreen()
    }
    
    @objc private func didTapSettingsButton() {
        presenter?.pushSettingsScreen()
    }
    
    @objc private func didTapPlayRecordsButton() {
        presenter?.pushRecordsScreen()
    }
}

extension MainScreenView: MainScreenViewProtocol {
    
}
