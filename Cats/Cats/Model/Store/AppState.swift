//
//  Created by Peter Combee on 22/07/2021.
//

import Foundation

struct AppState: Equatable {
    var breedsState: BreedsState = .idle
    var categoriesState: CategoriesState = .idle
    var catImagesState: CatImagesState = [:]
}

typealias BreedsState = ModelState<[Breed]>
typealias CategoriesState = ModelState<[Category]>
typealias CatImagesState = [CatFilter: ModelState<[Image]>]

enum ModelState<T: Equatable>: Equatable {
    
    case idle
    case loading
    case loaded(T)
    case message(String)

    var requiresLoading: Bool {
        switch self {
        case .idle, .message:
            return true
        case .loading, .loaded:
            return false
        }
    }

}

enum ActivityState: Equatable {
    case idle
    case performing
    case message(String)
}
