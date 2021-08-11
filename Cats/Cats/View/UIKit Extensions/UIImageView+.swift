//
//  Created by Peter Combee on 27/07/2021.
//

import UIKit

extension UIImageView {
    
    func presentImageFrom(urlString: String?) {
        guard let urlString = urlString else {
            installPlaceholder()
            return
        }
        async {
            showLoadingIndicator()
            if
                let url = URL(string: urlString),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data)
            {
                self.image = image
                hideLoadingIndicator()
            } else {
                hideLoadingIndicator()
                installPlaceholder()
            }
        }
    }
        
    private func showLoadingIndicator() {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.tintColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func hideLoadingIndicator() {
        subviews
            .compactMap { $0 as? UIActivityIndicatorView }
            .first?
            .removeFromSuperview()
    }
    
    private func installPlaceholder() {
        image = UIImage(systemName: "trash")
    }
    
}
