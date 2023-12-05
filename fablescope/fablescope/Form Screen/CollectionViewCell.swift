
// import UIKit
//struct CastomData {
//    var image: UIImage
//}
//
//final class FormScreenViewController: UIViewController {
//    var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//
//        setupCollectionView()
//
//        super.viewDidLoad()
//    }
//
//    func setupCollectionView() {
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
//        view.addSubview(collectionView)
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
//            ])
//        collectionView.dataSource = self
//    }
//
//    func setupFlowLayout() -> UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//
//        return layout
//    }
//}
//
//extension FormScreenViewController: UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
