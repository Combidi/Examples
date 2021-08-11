//
//  Created by Peter Combee on 26/07/2021.
//

import Combine
import Foundation

class CategoriesViewModel: CategoriesViewModelProtocol {
    
    let store: MainStore

    init(store: MainStore) {
        self.store = store
    }
    
    private var subscriptions: Set<AnyCancellable> = []

    var stateDidChange: (ModelState<[Category]>) -> Void = { _ in } {
        didSet {
            subscriptions = []
            store.$state
                .subscribe(on: DispatchQueue.global(qos: .default))
                .map { $0.categoriesState }
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { [unowned self] in stateDidChange($0) })
                .store(in: &subscriptions)
        }
    }
        
    func loadCategories() {
        store.dispatch(action: .loadCategories)
    }

}
