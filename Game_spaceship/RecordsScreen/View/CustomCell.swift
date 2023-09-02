import UIKit

final class CustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let shared = "CustomCell"

    // MARK: Public
    
    // MARK: Private
    
    private let scoreGameLabel = UILabel()
    private let nameUserLabel = UILabel()
    private let speedGameLabel = UILabel()
    private let imageSpaceshipImage = UIImageView()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCustomCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        scoreGameLabel.text = nil
        nameUserLabel.text = nil
        speedGameLabel.text = nil
        imageSpaceshipImage.image = nil
    }
    
    // MARK: - Setups
    
    private func setupCustomCell() {
        addSubviews(
            scoreGameLabel, nameUserLabel, speedGameLabel, imageSpaceshipImage
        )
        
        nonTranslatesAutoresizingMaskIntoConstraints(
            scoreGameLabel, nameUserLabel, speedGameLabel, imageSpaceshipImage
        )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scoreGameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            scoreGameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            scoreGameLabel.heightAnchor.constraint(equalToConstant: 20),
            scoreGameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            nameUserLabel.topAnchor.constraint(equalTo: scoreGameLabel.bottomAnchor, constant: 5),
            nameUserLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameUserLabel.heightAnchor.constraint(equalToConstant: 20),
            nameUserLabel.widthAnchor.constraint(equalToConstant: 100),
            
            speedGameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            speedGameLabel.leadingAnchor.constraint(equalTo: scoreGameLabel.trailingAnchor, constant: 10),
            speedGameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            speedGameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            imageSpaceshipImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageSpaceshipImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imageSpaceshipImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            imageSpaceshipImage.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSettingsCell(score: Int, userName: String, speedGame: Double, imageSpaceship: String) {
        scoreGameLabel.text = String("Score - \(score)")
        nameUserLabel.text = userName
        speedGameLabel.text = String("Speed game - \(speedGame)")
        imageSpaceshipImage.image = UIImage(named: imageSpaceship)
    }
    
    // MARK: - Helpers
}
