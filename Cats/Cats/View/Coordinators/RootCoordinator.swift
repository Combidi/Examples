//
//  RootCoordinator.swift
//  Cats
//
//  Created by Peter Combee on 27/07/2021.
//

import UIKit

class RootCoordinator: Coordinator {
    
    let factory: ViewControllerFactoryProtocol
    
    private let presenter: UINavigationController
    private let breedDetailCoordinator: BreedDetailsCoordinator
    private let categorizedCatImagesCoordinator: CategorizedCatImagesCoordinator
    
    init(factory: ViewControllerFactoryProtocol, window: UIWindow) {
        self.factory = factory
        presenter = UINavigationController()
        window.rootViewController = presenter
        presenter.setNavigationBarHidden(true, animated: false)
        breedDetailCoordinator = .init(factory: factory, presenter: presenter)
        categorizedCatImagesCoordinator = .init(factory: factory, presenter: presenter)
    }
        
    private weak var presentedViewController: RootViewControllerType?
    
    func start() {
        let viewController = factory.makeRootViewController(didSelect: { [unowned self] destination in
            switch destination {
            case .breed(let breed):
                self.breedDetailCoordinator.breed = breed
                self.breedDetailCoordinator.start()
            case .category(let category):
                self.categorizedCatImagesCoordinator.category = category
                self.categorizedCatImagesCoordinator.start()
            }
        })
        presenter.viewControllers = [viewController]
        presentedViewController = viewController
    }
    
    func handle(deeplink: Deeplink) {
        switch deeplink.destination {
        case .breeds:
            presentedViewController?.activeDestination = .breeds
        case .categories:
            presentedViewController?.activeDestination = .categories
        }
    }
    
}
