import UIKit

final class SubmitButton: UIControl {
    private let transitionButtonLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SubmitButton {

    func setupUI() {
        addSubwiews()
        setupSubmitButton()
        setupConstraints()
        setupLabel()
        self.layer.cornerRadius = 6
    }

    func addSubwiews() {
        addSubview(transitionButtonLabel)
        transitionButtonLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupSubmitButton() {
        backgroundColor = .fableGreen
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
    }

    func setupLabel() {
        transitionButtonLabel.textColor = .white
        transitionButtonLabel.textAlignment = .center
        transitionButtonLabel.font = .pacificoRegular
        transitionButtonLabel.text = "Готово"
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            transitionButtonLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            transitionButtonLabel.topAnchor.constraint(equalTo: self.topAnchor),
            transitionButtonLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            transitionButtonLabel.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
}
