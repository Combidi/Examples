//
//  Created by Peter Combee on 27/07/2021.
//

protocol Coordinator {
    func start()
    func handle(deeplink: Deeplink)
}
