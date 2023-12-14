import UIKit

final class SubmitButton: UIControl {
    private let label = UILabel()

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
        self.layer.cornerRadius = 16
    }

    func addSubwiews() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupSubmitButton() {
        backgroundColor = .fableGreen
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
    }

    func setupLabel() {
        label.textColor = .white
        label.textAlignment = .center
        label.font = .pacificoRegular
        label.text = "Готово"
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
}
