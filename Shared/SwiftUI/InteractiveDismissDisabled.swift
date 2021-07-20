//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct ExampleSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var termsAccepted = false
    
    var body: some View {
        VStack {
            Text("Terms and conditions")
                .font(.title)
            Text("Lots of legalese here..")
            Toggle("Accept", isOn: $termsAccepted)
            Button("Dismiss", action: close)
        }
        .interactiveDismissDisabled(!termsAccepted)
    }
    
    private func close() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct InteractiveDismissDisabledExample: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: ExampleSheet.init)
    }
    
}

struct InteractiveDismissDisabledExample_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveDismissDisabledExample()
    }
}
