//
//  ViewController.swift
//  fablescope
//
//  Created by Серега Пират on 14/11/2023.
//  Copyright © 2023 repCo. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
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
            buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            buttonStackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 166),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            autoButton.widthAnchor.constraint(equalToConstant: 166),
            createButton.widthAnchor.constraint(equalToConstant: 166),
            autoButton.heightAnchor.constraint(equalToConstant: 166),
            createButton.heightAnchor.constraint(equalToConstant: 166)
            ])
        
    }

    func setupBackground() {
        backgroundImageView.image = UIImage(named: "main_screen_background")
        backgroundImageView.contentMode = .scaleAspectFill
    }
    
    func  setupButtonStackView(){
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20.0
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        
    }
    
    func setupButton(){
        createButton.backgroundColor = UIColor(named: "fable_green")
        autoButton.backgroundColor = UIColor(named: "fable_green")

        if let imageA = UIImage(named: "magic_wand_icon"),let imageB = UIImage(named: "book_icon") {
            createButton.configure(text: "Cделай сам", image:imageA)
             autoButton.configure(text: "Авто", image: imageB)
        }
    }
    
}
