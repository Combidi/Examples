//
//  Created by Peter Combee on 22/07/2021.
//

enum CatFilter: Equatable, Hashable {
    
    case breed(Breed)
    case category(Category)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .breed(let breed):
            hasher.combine(breed.id)
        case .category(let category):
            hasher.combine(category.name)
        }
    }
    
    var name: String {
        switch self {
        case .breed(let breed):
            return breed.name
        case .category(let category):
            return category.name
        }
    }
    
}

enum AppAction: Equatable {
    case loadBreeds
    case loadCategories
    case loadCatImages(CatFilter)
}
