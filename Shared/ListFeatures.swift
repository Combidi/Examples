//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct ListFeatures: View {
    var body: some View {
        List {
            Section {
                ForEach(0..<20) { index in
                    Text("Row \(index)")
                        .listRowSeparatorTint(.green)
                }
                .listSectionSeparatorTint(.red)
            }
            Section {
                ForEach(0..<10) { index in
                    Text("Row \(index)")
                        .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct ListFeatures_Previews: PreviewProvider {
    static var previews: some View {
        ListFeatures()
    }
}
