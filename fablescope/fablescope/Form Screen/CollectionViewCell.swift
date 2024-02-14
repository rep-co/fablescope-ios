import UIKit

final class CollectionViewCell: UICollectionViewCell {

    struct ViewModel {
        var image: UIImage
        var isSelected: Bool
    }

    var data: ViewModel? {
        didSet {
            guard let data else { return }
            cellImage.image = data.image
            isSelectedCell = data.isSelected
        }
    }

    var isSelectedCell: Bool = false {
        didSet {
            setupDidSet()
        }
    }

    private let  cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addSubwiews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setup view

private extension CollectionViewCell {

    func setupUI() {
        layer.cornerRadius = 16
        layer.masksToBounds = true
        layer.cornerCurve = .continuous
        backgroundColor = .fableGreen
    }

    func addSubwiews() {
        contentView.addSubview(cellImage)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            cellImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
        ])
    }

    func setupDidSet() {
        if !isSelectedCell {
            backgroundColor = .fableGreen
            cellImage.tintColor = .white
            layer.borderWidth = 0
        } else {
            cellImage.tintColor = .lightSeaGreen
            backgroundColor = .white
            layer.borderWidth = 3
            layer.borderColor = UIColor.fableGreen.cgColor
        }
    }
}
