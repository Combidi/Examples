//
//  Created by Peter Combee on 27/07/2021.
//

import UIKit

enum RootDestination: Int {
    case breeds
    case categories
}

enum RootViewSelection {
    case breed(Breed)
    case category(Category)
}

protocol RootViewControllerInterface {
    var activeDestination: RootDestination { get set }
}

typealias RootViewControllerType = UIViewController & RootViewControllerInterface

protocol ViewControllerFactoryProtocol {
    func makeRootViewController(didSelect: @escaping (RootViewSelection) -> Void) -> RootViewControllerType
    func makeBreedsViewController(didSelect: @escaping (Breed) -> Void) -> UIViewController
    func makeCategoriesViewController(didSelect: @escaping (Category) -> Void) -> UIViewController
    func makeBreedDetailsViewController(breed: Breed, didTapImageButton: @escaping () -> Void) -> UIViewController
    func makeCatImagesViewController(filter: CatFilter) -> UIViewController
}

struct ViewControllerFactory: ViewControllerFactoryProtocol {
        
    let store: MainStore
    
    func makeRootViewController(didSelect: @escaping (RootViewSelection) -> Void) -> RootViewControllerType {
        RootViewController(factory: self, didSelect: didSelect)
    }
    
    func makeBreedsViewController(didSelect: @escaping (Breed) -> Void) -> UIViewController {
        let model = BreedsViewModel(store: store)
        let viewController = BreedsViewController(model: model, didSelect: didSelect)
        viewController.title = "A list of cat breeds..."
        return viewController
    }
    
    func makeCategoriesViewController(didSelect: @escaping (Category) -> Void) -> UIViewController {
        let model = CategoriesViewModel(store: store)
        let viewController = CategoriesViewController(model: model, didSelect: didSelect)
        viewController.title = "A list of CATegories..."
        return viewController
    }
    
    func makeBreedDetailsViewController(breed: Breed, didTapImageButton: @escaping () -> Void) -> UIViewController {
        let viewController = BreedDetailViewController(breed: breed, didTapImageButton: didTapImageButton)
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.title = breed.name
        return navigationController
    }
    
    func makeCatImagesViewController(filter: CatFilter) -> UIViewController {
        let model = CatImageGaleryViewModel(
            store: store,
            filter: filter
        )
        let viewController = CatImageGaleryViewController(model: model)
        viewController.title = filter.name
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}

