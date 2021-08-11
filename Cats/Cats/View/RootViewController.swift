//
//  Created by Peter Combee on 22/07/2021.
//

import UIKit

class RootViewController: UITabBarController, RootViewControllerInterface {
            
    private var factory: ViewControllerFactoryProtocol!
    
    convenience init(
        factory: ViewControllerFactoryProtocol,
        didSelect: @escaping (RootViewSelection) -> Void
    ) {
        self.init()
        self.factory = factory
        
        let breedsViewController = factory.makeBreedsViewController(didSelect: { didSelect(.breed($0)) })
        breedsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        let categoriesViewController = factory.makeCategoriesViewController(didSelect: { didSelect(.category($0)) })
        categoriesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        viewControllers = [breedsViewController, categoriesViewController]
    }
     
    var activeDestination: RootDestination = .breeds {
        didSet { selectedIndex = activeDestination.rawValue }
    }
    
}
