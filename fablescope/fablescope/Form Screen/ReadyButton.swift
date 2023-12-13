import UIKit

final class ReadyButton: UIControl {
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ReadyButton {
    func setupUI() {
        addSubwiews()
        setupReadyButton()
        setupConstraints()
        setupLabel()
        self.layer.cornerRadius = 16
    }
    
    func addSubwiews() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupReadyButton() {
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
