//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct SwipeActions: View {

    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]

    var body: some View {
        NavigationView {
            List {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: {
                                print("Deleting this conversation")
                            }) {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button(action: {
                                print("Muting this conversation")
                            }) {
                                Label("Mute", systemImage: "bell.slash.fill")
                            }
                            .tint(.indigo)
                        }
                }
            }
            .navigationTitle("Swipe actions")
        }
    }
}

struct SwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActions()
    }
}
