 import UIKit

class CollectionViewCell: UICollectionViewCell {
    var data: CastomData? {
        didSet{
            guard let data = data else { return }
            cellImage.image = data.image
        }
    }

    var isSelectedCell: Bool = false {
        didSet {
            if isSelectedCell == false {
                backgroundColor = .fableGreen
                cellImage.tintColor = .white
            } else {
                cellImage.tintColor = .frostColor
                backgroundColor = .white
                layer.borderWidth = 3
                layer.borderColor = UIColor.fableGreen.cgColor
            }
        }
    }

    private let  cellImage: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CollectionViewCell {
    func setupUI() {
        addSubwiews()
        setupConstraints()
        layer.cornerRadius = 16
        layer.masksToBounds = true
        layer.cornerCurve = .continuous
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
}
