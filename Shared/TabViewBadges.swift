//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct TabViewBadges: View {
    var body: some View {
        TabView {
            Text("Your home goes here")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .badge(5)
        }
    }
}

struct TabViewBadges_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBadges()
    }
}
