//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct MarkdownText: View {
    var body: some View {
        VStack {
            Text("This is regular text")
            Text("This is **bold** text")
            Text("This is *italic* text")
            Text("This is ***bold*** text")
            Text("~~A striketrough example~~")
            Text("`Monospaced` works to")
            Text("`Visit Apple: [click here](https://www.apple.com)`")
        }
    }
}

struct MarkdownText_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownText()
    }
}
