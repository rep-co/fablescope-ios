import UIKit

final class FormScreenViewController: UIViewController {
    private let submitButton = SubmitButton()
    
    private var data = [
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false),
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false),
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false),
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .witchHat, isSelected: false),
        CollectionViewCell.ViewModel(image: .crown, isSelected: false),
        CollectionViewCell.ViewModel(image: .magicWandIcon, isSelected: false)
    ]
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
        setupCollectionView()
    }
}

private extension FormScreenViewController {
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setupUI() {
        title = Const.title
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.pacificoRegular
        ]
    }

    func addSubviews() {
        view.addSubview(collectionView)
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConstraints() {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        NSLayoutConstraint.activate([
            submitButton.heightAnchor.constraint(equalToConstant: Const.createButtonHeight),
            submitButton.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                constant: Const.createButtonRightInset),
            submitButton.leftAnchor.constraint(equalTo: view.leftAnchor,
                                               constant: Const.createButtonLeftInset),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                 constant: Const.createButtonBottomInset),

            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension FormScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.data = self.data[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        data[indexPath.row] = .init(image: data[indexPath.row].image, isSelected:  !data[indexPath.row].isSelected)
        collectionView.reloadData()
    }
}

extension FormScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/Const.collectionViewRatio, height: collectionView.frame.width/Const.collectionViewRatio)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension FormScreenViewController {
    private enum Const {
        static let title = "Выбери все что хочешь"
        static let createButtonLeftInset: CGFloat = 20
        static let createButtonRightInset: CGFloat = -20
        static let createButtonHeight: CGFloat = 59
        static let createButtonBottomInset: CGFloat = -40
        static let collectionViewRatio: CGFloat = 3.75
    }
}
