//
//  MainScreenViewController.swift
//  fablescope
//
//  Created by Серега Пират on 14/11/2023.
//  Copyright © 2023 repCo. All rights reserved.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private let autoButton = MenuButton()
    private let createButton = MenuButton()
    private let buttonStackView = UIStackView()
    private let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Methods -
private extension MainScreenViewController {
    func setupUI() {
        setupButtonStackView()
        addSubviews()
        setupConstraints()
        setupBackground()
        setupButton()
    }
    
    func addSubviews() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        autoButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImageView)
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(createButton)
        buttonStackView.addArrangedSubview(autoButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: Const.buttonStackViewLeftInset),
            buttonStackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: Const.buttonStackViewRightInset),
            buttonStackView.heightAnchor.constraint(equalToConstant: Const.buttonStackViewHeightInset),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            autoButton.widthAnchor.constraint(equalToConstant: Const.autoButtonInset),
            autoButton.heightAnchor.constraint(equalToConstant: Const.autoButtonInset),
            
            createButton.widthAnchor.constraint(equalToConstant: Const.createButtonInset),
            createButton.heightAnchor.constraint(equalToConstant: Const.createButtonInset)
        ])
    }
    
    func setupBackground() {
        backgroundImageView.image = .mainScreenBack
        backgroundImageView.contentMode = .scaleAspectFill
    }
    
    func setupButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = Const.buttonStackViewSpacing
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        
    }
    
    func setupButton() {
        createButton.backgroundColor = .fableGreen
        autoButton.backgroundColor = .fableGreen
        createButton.configure(text: "Cделай сам", image: .magicWandIcon)
        autoButton.configure(text: "Авто", image: .bookIcon)
       
    }
    
}

extension MainScreenViewController {
    private enum Const {
        static let buttonStackViewLeftInset: CGFloat = 20
        static let buttonStackViewRightInset: CGFloat = -20
        static let buttonStackViewHeightInset: CGFloat = 166
        static let createButtonInset: CGFloat = 166
        static let autoButtonInset: CGFloat = 166
        static let buttonStackViewSpacing: CGFloat = 20
    }
}

