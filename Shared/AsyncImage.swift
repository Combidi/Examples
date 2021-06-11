//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct AsyncImageExample: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul.png")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 128, height: 128)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageExample()
    }
}
