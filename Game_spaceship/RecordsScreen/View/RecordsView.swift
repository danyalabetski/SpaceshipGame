import UIKit
import CoreData

protocol RecordsViewProtocol: AnyObject {
    func setScores(_ score: [Spaceship])
}

final class RecordsView: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    var scores = [Spaceship]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Properties

    var presenter: RecordsPresenterProtocol?

    // MARK: Private

    private let tableView = UITableView(frame: .zero, style: .plain)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
        setupConstraints()
        setupBehaviorUIElements()
        setupAppearanceUIElement()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter?.loadScores()
    }

    // MARK: - Setups

    private func setupView() {
        navigationItem.leftBarButtonItem?.isHidden = true
        view.backgroundColor = .systemBackground
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds

        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.shared)

        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupBehaviorUIElements() {}

    private func setupAppearanceUIElement() {}

    private func setupConstraints() {}

    // MARK: - Helpers
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension RecordsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.shared, for: indexPath)
                as? CustomCell
        else {
            return UITableViewCell()
        }
        
        let score = scores[indexPath.row]
        cell.setupSettingsCell(
            score: score.score ?? 0,
            userName: score.userName ?? "",
            speedGame: score.speedGame ?? 0.0,
            imageSpaceship: score.spaceshipImage ?? ""
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RecordsView: RecordsViewProtocol {
    func setScores(_ score: [Spaceship]) {
        scores = score
    }
}
