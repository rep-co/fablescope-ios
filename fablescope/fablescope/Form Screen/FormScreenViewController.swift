//
//  FormScreenViewController.swift
//  fablescope
//
//  Created by Серега Пират on 22/11/2023.
//  Copyright © 2023 repCo. All rights reserved.
//

import UIKit

class FromScreenViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
private extension FromScreenViewController{
    func setupUI() {
        addSubwiews()
    }

    func addSubwiews() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FromScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func colectionView(_ colectionView:UICollectionView, layout colectionViewLayuot: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  collectionView.frame.width/ 2, height: collectionView.frame.height/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .fableGreen
        return cell
    }

}
