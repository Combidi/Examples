//
//  Created by Peter Combee on 27/07/2021.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let store: MainStore
    let window: UIWindow
    
    let rootCoordinator: RootCoordinator
    
    init(store: MainStore, window: UIWindow) {
        self.store = store
        self.window = window
        rootCoordinator = .init(
            factory: ViewControllerFactory(store: store),
            window: window
        )
    }
        
    func start() {
        rootCoordinator.start()
        window.makeKeyAndVisible()
    }
    
    func handle(deeplink: Deeplink) {
        rootCoordinator.handle(deeplink: deeplink)
    }
    
}
