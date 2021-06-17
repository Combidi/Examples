//
//  Created by Peter Combee on 17/06/2021.
//

import SwiftUI

struct PreferenceKeys: View {
    
    @State private var width: CGFloat?
    
    var body: some View {
        List {
            row(number: "7.", text: "Peter Combee")
            row(number: "839.", text: "Peter Combee")
            row(number: "33.", text: "Peter Combee")
            row(number: "33349.", text: "Peter Combee")
            row(number: "3394.", text: "Peter Combee")
            row(number: "393.", text: "Peter Combee")
        }
        .listStyle(InsetGroupedListStyle())
        .onPreferenceChange(WidthPreferenceKey.self) { widths in
            if let width = widths.max() {
                self.width = width
            }
        }
    }
    
    private func row(number: String, text: String) -> some View {
        HStack {
            Text(number)
//                .lineLimit(1)
                .equalWidth()
                .frame(width: width, alignment: .trailing)
            Text(text)
        }
    }
}

extension View {
    func equalWidth() -> some View {
        self.modifier(EqualWidth())
    }
}

struct EqualWidth: ViewModifier {

    func body(content: Content) -> some View {
        content.overlay(
            GeometryReader { geo in
                Color.clear
                .preference(key: WidthPreferenceKey.self, value: [geo.size.width])
            }
        )
    }
}


struct WidthPreferenceKey: PreferenceKey {
    
    static var defaultValue: [CGFloat] = []
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
    
}

struct PreferenceKeys_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeys()
    }
}
