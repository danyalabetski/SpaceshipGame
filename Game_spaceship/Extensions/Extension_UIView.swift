import UIKit

extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach { addSubview($0) }
    }
    
    func nonTranslatesAutoresizingMaskIntoConstraints(_ view: UIView...) {
        view.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
