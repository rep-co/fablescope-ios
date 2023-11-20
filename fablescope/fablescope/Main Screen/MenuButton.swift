//
//  menuButton.swift
//  fablescope
//
//  Created by Серега Пират on 16/11/2023.
//  Copyright © 2023 repCo. All rights reserved.
//

import UIKit

final class MenuButton: UIControl {
    private let label = UILabel()
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String, image: UIImage) {
        label.text = text
        imageView.image = image
    }
}

// MARK: - Pivate Methods -
private extension MenuButton {
    func setupUI() {
        addSubviews()
        setupConstraints()
        setupLabel()
        setupImageView()
        self.layer.cornerRadius = 16
    }

    func addSubviews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 42),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53),

            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
        ])
    }

    func setupLabel() {
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pacifico-Regular", size: 24)
    }

    func setupImageView() {
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
    }
}
extension MenuButton {
    private enum Const {
        static let leftImageViewConstraint: CGFloat = 53
        static let rightImageViewConstraint: CGFloat = -53
        static let topImageViewConstraint: CGFloat = 42
        static let bottomLabelConstraint: CGFloat = -20
        static let rightLabelConstraint: CGFloat = -10
        static let leftLabelConstraint: CGFloat = 10
    }
}