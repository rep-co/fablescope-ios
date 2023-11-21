//
//  MenuButton.swift
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
            imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: Const.imageViewTopInset),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: Const.ImageViewLeftInset),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: Const.ImageViewRightInset),
            
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: Const.labelBottomInset),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor,constant: Const.labelRightInset),
            label.leftAnchor.constraint(equalTo: self.leftAnchor,constant: Const.labelLeftInset)
            ])
    }
    
    func setupLabel() {
        label.textColor = .white
        label.textAlignment = .center
        label.font = .pacificoRegular
    }
    
    func setupImageView() {
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
    }
}
extension MenuButton {
    private enum Const {
        static let ImageViewLeftInset: CGFloat = 53
        static let ImageViewRightInset: CGFloat = -53
        static let imageViewTopInset: CGFloat = 42
        static let labelBottomInset: CGFloat = -20
        static let labelRightInset: CGFloat = -10
        static let labelLeftInset: CGFloat = 10
    }
}
