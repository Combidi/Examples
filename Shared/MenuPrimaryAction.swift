//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct MenuPrimaryAction: View {
    
    @State private var background: Color = .clear
    
    var body: some View {
        VStack {
            Text("Hold the button for options, tap it to perform the primary action")
            Menu("Options") {
                Button("Green") { background = .green }
                Button("Red") { background = .red }
                Button("Purple") { background = .purple }
            } primaryAction: {
                background = .yellow
            }
        }
        .background(background)
    }
}

struct MenuPrimaryAction_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrimaryAction()
    }
}
