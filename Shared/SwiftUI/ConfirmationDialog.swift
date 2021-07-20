//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct ConfirmationDialog: View {
  
    @State private var showingOptions = false
    @State private var selected = "None"
    
    var body: some View {
        VStack {
            Text(selected)
            Button("Confirm paint color") {
                showingOptions = true
            }
            .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
                Button("Red", role: .destructive) {
                    selected = "Red"
                }
                Button("Green") {
                    selected = "Green"
                }
                Button("Blue") {
                    selected = "Blue"
                }
                Button("Nevermind", role: .cancel) {
                    selected = "None"
                }
            }
        }
    }
}

struct ConfirmationDialog_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialog()
    }
}
