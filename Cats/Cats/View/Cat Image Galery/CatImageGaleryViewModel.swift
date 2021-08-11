//
//  Created by Peter Combee on 28/07/2021.
//

import Combine
import Foundation

struct CatImageGaleryViewModel: CatImagesViewModelProtocol {
    
    let store: MainStore
    let filter: CatFilter
    
    var publisher: AnyPublisher<ModelState<[Image]>, Never> {
        store.$state
            .receive(on: DispatchQueue.global(qos: .default))
            .map {  $0.catImagesState[filter] ?? .idle }
            .eraseToAnyPublisher()
    }
    
    func loadCatImages() {
        store.dispatch(action: .loadCatImages(filter))
    }
    
}
