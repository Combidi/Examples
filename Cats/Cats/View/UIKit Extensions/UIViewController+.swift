//
//  Created by Peter Combee on 22/07/2021.
//

import UIKit

extension UIViewController {
    func instal(child: UIViewController) {
        addChild(child)
        view.addViewFillingSubview(child.view)
        child.didMove(toParent: self)
    }
}

extension UIViewController {
    func present(message: String) {
        let alert = UIAlertController(title: "Oeps!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension UIViewController {
    func presentAnimated(_ viewController: UIViewController) {
        present(viewController, animated: true)
    }
}
