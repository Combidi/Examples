//
//  Created by Peter Combee on 29/07/2021.
//

import UIKit

class CategorizedCatImagesCoordinator: Coordinator {

    let factory: ViewControllerFactoryProtocol
    let presenter: UIViewController

    init(factory: ViewControllerFactoryProtocol, presenter: UIViewController) {
        self.factory = factory
        self.presenter = presenter
    }

    var category: Category? = nil
    
    func start() {
        guard let category = category else { return }
        let viewController = factory.makeCatImagesViewController(filter: .category(category))
        presenter.presentedViewController?.presentAnimated(viewController)
    }
    
    func handle(deeplink: Deeplink) {
        
    }
    
}
