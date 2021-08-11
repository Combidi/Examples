//
//  Created by Peter Combee on 27/07/2021.
//

import UIKit

class BreedDetailsCoordinator: Coordinator {
 
    let factory: ViewControllerFactoryProtocol
    let presenter: UIViewController
    
    init(factory: ViewControllerFactoryProtocol, presenter: UIViewController) {
        self.factory = factory
        self.presenter = presenter
    }
    
    var breed: Breed? = nil
    
    func start() {
        guard let breed = breed else { return }
        let viewController = factory.makeBreedDetailsViewController(
            breed: breed,
            didTapImageButton: showImagesViewController
        )
        presenter.presentAnimated(viewController)
    }
    
    private func showImagesViewController() {
        guard let breed = breed else { return }
        let viewContoller = factory.makeCatImagesViewController(filter: .breed(breed))
        presenter.presentedViewController?.presentAnimated(viewContoller)
    }
    
    func handle(deeplink: Deeplink) {
        
    }
    
}
