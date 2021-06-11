//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct ListBadges: View {
    var body: some View {
        List {
            Text("Wi-Fi")
                .badge("LAN Solo")
            Text("Bluetooth")
                .badge("On")
        }
    }
}

struct ListBadges_Previews: PreviewProvider {
    static var previews: some View {
        ListBadges()
    }
}
