//
//  Created by Peter Combee on 29/07/2021.
//

import UIKit

class HeaderView: UIView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        installSubviews()
        configureConstraints()
    }
        
    private func installSubviews() {
        addSubview(titleLabel)
    }

    private func configureConstraints() {
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
    }
 
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .largeTitle
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
