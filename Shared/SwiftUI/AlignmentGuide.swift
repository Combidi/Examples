//
//  Created by Peter Combee on 17/06/2021.
//

import SwiftUI

struct AlignmentGuide: View {
        
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { index in
                Text("Number \(String(index))")
                    .foregroundColor(.white)
                    .alignmentGuide(.leading) { _ in
                        CGFloat(index * -10)
                    }
            }
        }
        .background(Color.black)
    }
}

struct AlignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuide()
    }
}
