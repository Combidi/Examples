//
//  Created by Peter Combee on 20/07/2021.
//

// Based on the examples shown by Apple in the WWDC 2021 session Meet async/await in Swift https://developer.apple.com/videos/play/wwdc2021/10132/

import UIKit

// Model

enum FetchError: Error {
    case badID
    case badImage
}

struct Post {
    var id: String
}

class Peermanager {
    
    weak var delegate: PeerSyncDelegate?
    
    func syncSharedPosts() {
        fatalError()
    }
    
}

protocol PeerSyncDelegate: AnyObject {
    func peerManager(_ manager: Peermanager, receivedPosts: [Post])
    func peerManager(_ manager: Peermanager, hadError: Error)
}


class ViewModel: ObservableObject {
    
    func fetchThumbnail(for id: String) async throws -> UIImage {
        let request = thumbnailRequest(for: id)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badID }
        let maybeImage = UIImage(data: data)
        guard let thumbnail = await maybeImage?.thumbnail else { throw FetchError.badImage }
        return thumbnail
    }
    
    func persistPosts() async throws -> [Post] {
        typealias PostContinuation = CheckedContinuation<[Post], Error>
        return try await withCheckedThrowingContinuation { continuation in
            self.getPersistentPosts { posts, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: posts)
                }
            }
        }
    }

    private func getPersistentPosts(onComplete: ([Post], Error?) -> Void) {
        fatalError()
    }

    private func thumbnailRequest(for id: String) -> URLRequest {
        fatalError()
    }
    
}


// View

import SwiftUI

extension UIImage {
    
    static var thumbnailPlaceholder: UIImage {
        UIImage(systemName: "square.fill")!
    }
    
    var thumbnail: UIImage? {
        get async {
            let size = CGSize(width: 40, height: 40)
            return await self.byPreparingThumbnail(ofSize: size)
        }
    }
    
}

struct ThumbnailView: View {
    
    @ObservedObject private var viewModel: ViewModel
    var post: Post
    @State private var image: UIImage?
    
    var body: some View {
        Image(uiImage: self.image ?? .thumbnailPlaceholder)
            .onAppear {
                async {
                    self.image = try? await self.viewModel.fetchThumbnail(for: post.id)
                }
            }
    }
    
}

class ViewController: UIViewController {
    
    private let peerManager = Peermanager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peerManager.delegate = self
    }
    
    private var activeContinuation: CheckedContinuation<[Post], Error>?
    
    func sharedPostsFromPeer() async throws -> [Post] {
        try await withCheckedThrowingContinuation { continuation in
            self.activeContinuation = continuation
            self.peerManager.syncSharedPosts()
        }
    }
    
}

extension ViewController: PeerSyncDelegate {
    
    func peerManager(_ manager: Peermanager, receivedPosts: [Post]) {
        self.activeContinuation?.resume(returning: receivedPosts)
        self.activeContinuation = nil
    }
    
    func peerManager(_ manager: Peermanager, hadError error: Error) {
        self.activeContinuation?.resume(throwing: error)
        self.activeContinuation = nil
    }
    
}
