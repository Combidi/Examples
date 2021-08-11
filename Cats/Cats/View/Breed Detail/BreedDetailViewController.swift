//
//  Created by Peter Combee on 26/07/2021.
//

import UIKit

class BreedDetailViewController: UIViewController {
    
    private var breed: Breed!
    private var didTapImageButton: (() -> Void)!
    
    convenience init(breed: Breed, didTapImageButton: @escaping () -> Void) {
        self.init()
        self.breed = breed
        self.didTapImageButton = didTapImageButton
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addArrangedSubviews([
            catImageView,
            imagesButton,
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description),
            row(title: "Desctiption", detail: breed.description)
        ])
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    
        catImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        catImageView.heightAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

    }
    
    private lazy var scrollView: UIView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemTeal
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.presentImageFrom(urlString: breed.image?.url)
        return imageView
    }()
        
    private lazy var imagesButton: UIButton = {
        let button = UIButton(type: .infoLight)
        button.addTarget(self, action: #selector(imagesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private func row(title: String, detail: String) -> UIView {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = UIStackView.Distribution.fillProportionally
        horizontalStack.addArrangedSubviews([
            label(text: title),
            label(text: detail)
        ])
        return horizontalStack
   }
    
    private func label(text: String) -> UIView {
        let label = UILabel()
        label.text = text
        label.sizeToFit()
        return label
    }
    
    // Actions
    @objc private func imagesButtonTapped() {
        didTapImageButton()
    }
    
}
