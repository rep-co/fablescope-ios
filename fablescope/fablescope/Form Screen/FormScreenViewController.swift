import UIKit

struct ViewModel {
    var image: UIImage
}

final class FromScreenViewController: UIViewController {
    private let createButton = ReadyButton()
    let data = [
        ViewModel( image: .witchHat ),
        ViewModel( image: .magicWandIcon ),
        ViewModel( image: .crown ),
        ViewModel( image: .witchHat ),
        ViewModel( image: .crown ),
        ViewModel( image: .magicWandIcon ),
        ViewModel( image: .witchHat ),
        ViewModel( image: .magicWandIcon ),
        ViewModel( image: .crown ),
        ViewModel( image: .witchHat ),
        ViewModel( image: .crown ),
        ViewModel( image: .magicWandIcon ),
        ViewModel( image: .witchHat ),
        ViewModel( image: .magicWandIcon ),
        ViewModel( image: .crown ),
        ViewModel( image: .witchHat ),
        ViewModel( image: .crown ),
        ViewModel( image: .magicWandIcon ),
        ViewModel( image: .witchHat ),
        ViewModel( image: .magicWandIcon ),
        ViewModel( image: .crown ),
        ViewModel( image: .witchHat ),
        ViewModel( image: .crown ),
        ViewModel( image: .magicWandIcon )
    ]
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Выбери все что хочешь"
    }
}

private extension FromScreenViewController{
    func setupUI() {
        addSubwiews()
    }
    
    func addSubwiews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.pacificoRegular
        ]
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            createButton.heightAnchor.constraint(equalToConstant: Const.createButtonHeight),
            createButton.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                constant: Const.createButtonRightInset),
            createButton.leftAnchor.constraint(equalTo: view.leftAnchor,
                                               constant: Const.createButtonLeftInset),
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                 constant: Const.createButtonBottomInset),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension FromScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        if cell?.isSelectedCell == false {
            cell?.isSelectedCell = true
        } else {
            cell?.isSelectedCell = false
        }
    }
}

extension FromScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/Const.collectionViewrRatio, height: collectionView.frame.width/Const.collectionViewrRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension FromScreenViewController {
    private enum Const {
        static let createButtonLeftInset: CGFloat = 20
        static let createButtonRightInset: CGFloat = -20
        static let createButtonHeight: CGFloat = 59
        static let createButtonBottomInset: CGFloat = -40
        static let collectionViewrRatio: CGFloat = 3.75
    }
}
