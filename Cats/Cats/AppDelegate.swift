//
//  Created by Peter Combee on 22/07/2021.
//

import UIKit

/*
 UI based on:
 https://search.muz.li/ZTY0MWQxNmZl?utm_source=muz.li-insp&utm_medium=article&utm_campaign=%2Finspiration%2Fmobile-app-design-inspiration%2F
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
}
