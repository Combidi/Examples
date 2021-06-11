//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct ForegroundStyle: View {
    var body: some View {
        HStack {
            Image(systemName: "clock.fill")
            Text("set the time")
            Button("Text") {}
        }
        .font(.largeTitle.bold())
        .foregroundStyle(
            .linearGradient(colors: [.red, .white], startPoint: .top, endPoint: .bottom)
        )
        .background(Color.green)
    }
}

struct ForegroundStyle_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundStyle()
    }
}
