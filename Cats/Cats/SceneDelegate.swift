//
//  Created by Peter Combee on 22/07/2021.
//

import UIKit

fileprivate let mainStore = makeStore()

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private var coordinator: ApplicationCoordinator!
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        coordinator = .init(store: mainStore, window: window)
        coordinator.start()
    }
            
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        do {
            let deeplink = try Deeplink.from(url: url)
            coordinator.handle(deeplink: deeplink)
        } catch let error {
            fatalError(String(describing: error))
        }
    }
    
}

