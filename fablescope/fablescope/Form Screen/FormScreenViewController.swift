import UIKit

final class FormScreenViewController: UIViewController {
    private let submitButton = SubmitButton()
    
    let data = [
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .magicWandIcon),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .magicWandIcon),
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .magicWandIcon),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .magicWandIcon),
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .magicWandIcon),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .magicWandIcon),
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .magicWandIcon),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .witchHat),
        CollectionViewCell.ViewModel(image: .crown),
        CollectionViewCell.ViewModel(image: .magicWandIcon)
    ]
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
        setupCollectionView()
    }
}

private extension FormScreenViewController{

    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setupUI() {
        title = "Выбери все что хочешь"
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    func addSubviews() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.pacificoRegular
        ]
    }

    func setupConstraints() {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.data = self.data[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        cell?.isSelectedCell.toggle()
    }
}

extension FormScreenViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
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
        static let createButtonLeftInset: CGFloat = 20
        static let createButtonRightInset: CGFloat = -20
        static let createButtonHeight: CGFloat = 59
        static let createButtonBottomInset: CGFloat = -40
        static let collectionViewRatio: CGFloat = 3.75
    }
}
