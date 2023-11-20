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
            
            buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: Const.leftButtonStackViewConstraint),
            buttonStackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: Const.rightButtonStackViewConstraint),
            buttonStackView.heightAnchor.constraint(equalToConstant: Const.heightButtonStackViewConstraint),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            autoButton.widthAnchor.constraint(equalToConstant: Const.autoButtonConstraint),
            autoButton.heightAnchor.constraint(equalToConstant: Const.autoButtonConstraint),
            
            createButton.widthAnchor.constraint(equalToConstant: Const.createButtonConstraint),
            createButton.heightAnchor.constraint(equalToConstant: Const.createButtonConstraint)
            ])
    }
    
    func setupBackground() {
        backgroundImageView.image = UIImage(named: "main_screen_background")
        backgroundImageView.contentMode = .scaleAspectFill
    }
    
    func setupButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20.0
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        
    }
    
    func setupButton() {
        createButton.backgroundColor = .fableGreen
        autoButton.backgroundColor = .fableGreen
        
        if let createImage: UIImage = .magicWandIcon, let autoImage: UIImage = .bookIcon {
            createButton.configure(text: "Cделай сам", image: createImage)
            autoButton.configure(text: "Авто", image: autoImage)
        }
    }
    
}

extension MainScreenViewController {
    private enum Const {
        static let leftButtonStackViewConstraint: CGFloat = 20
        static let rightButtonStackViewConstraint: CGFloat = -20
        static let heightButtonStackViewConstraint: CGFloat = 166
        static let createButtonConstraint: CGFloat = 166
        static let autoButtonConstraint: CGFloat = 166
    }
}

