//
//  Created by Peter Combee on 28/07/2021.
//

import UIKit
import Combine

protocol CatImagesViewModelProtocol {
    var publisher: AnyPublisher<ModelState<[Image]>, Never> { get }
    func loadCatImages()
}

class CatImageGaleryViewController: UIViewController {
    
    private var model: CatImagesViewModelProtocol!
    
    convenience init(model: CatImagesViewModelProtocol) {
        self.init()
        self.model = model
    }

    private lazy var imageGalery = ImageGaleryViewController()
    
    private var subscriptions: Set<AnyCancellable> = []

    private var state: ModelState<[Image]> = .idle {
        didSet {
            switch state {
            case .loading, .idle:
                print("loading")
            case .loaded(let images):
                imageGalery.display(images: images)
            case .message(let message):
                present(message: message)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model.publisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [unowned self] in self.state = $0 })
            .store(in: &subscriptions)
        instal(child: imageGalery)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        model.loadCatImages()
    }
    
}
