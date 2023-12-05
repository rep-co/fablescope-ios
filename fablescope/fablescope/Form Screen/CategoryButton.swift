//
//  CategoryButton.swift
//  fablescope
//
//  Created by Серега Пират on 22/11/2023.
//  Copyright © 2023 repCo. All rights reserved.
//

import UIKit
final class CategoryButton: UIControl {
    private let image = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension CategoryButton{
    func setupUI() {
        
    }
}
