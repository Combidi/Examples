//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct Alert: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message!", isPresented: $showingAlert) {
            Button("First", role: .destructive) {}
            Button("Second", role: .cancel) {}
            Button("Third") {}
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        Alert()
    }
}
