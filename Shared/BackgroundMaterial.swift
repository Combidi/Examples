//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct BackgroundMaterial: View {
    var body: some View {
        ZStack {
            Image("Rabbit")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Rabit")
                .padding(30)
                .background(.ultraThinMaterial)
                .foregroundColor(.secondary)
        }
    }
}

struct BackgroundMaterial_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterial()
    }
}
