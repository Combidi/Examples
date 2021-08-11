//
//  Created by Peter Combee on 29/07/2021.
//

import UIKit

fileprivate let shadowColor: CGColor = UIColor.lightGray.cgColor
fileprivate let selectedShadowColor: CGColor = UIColor.gray.cgColor

class BreedListCell: UITableViewCell {

    func set(breed: Breed) {
        catImageView.presentImageFrom(urlString: breed.image?.url)
        titleLabel.text = breed.name
        detailLabel.text = breed.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        installSubviews()
        configureConstraints()
        let bg = UIView()
        bg.backgroundColor = .clear
        selectedBackgroundView = bg
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        containerView.layer.shadowColor = selected ? selectedShadowColor : shadowColor
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        containerView.layer.shadowColor = highlighted ? selectedShadowColor : shadowColor
    }
    
    private func installSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageContainer)
        imageContainer.addSubview(catImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(detailLabel)
    }
        
    private func configureConstraints() {
        
        let marginGuides = contentView.layoutMarginsGuide
        
        containerView.leadingAnchor.constraint(equalTo: marginGuides.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: marginGuides.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: marginGuides.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: marginGuides.bottomAnchor).isActive = true
                
        imageContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageContainer.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageContainer.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        imageContainer.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: 10).isActive = true
        
        catImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        catImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        catImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        catImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true

        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 10).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true

        detailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true

    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        view.layer.shadowColor = shadowColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 4
        view.backgroundColor = .white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .title
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = .body
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    private let catImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.clipsToBounds = true
        return view
    }()
    
}
