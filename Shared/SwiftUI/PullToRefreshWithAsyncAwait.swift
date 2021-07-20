//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct NewsItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let strap: String
}

struct PullToRefreshWithAsyncAwait: View {
    
    @State private var news = [
        NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")
    ]
    
    var body: some View {
        NavigationView {
            List(news) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.strap)
                        .foregroundColor(.secondary)
                }
                .id(item.id)
            }
            .refreshable {
                do {
                    let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    news = try JSONDecoder().decode([NewsItem].self, from: data)
                } catch {
                    news = []
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct PullToRefreshWithAsyncAwait_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshWithAsyncAwait()
    }
}
