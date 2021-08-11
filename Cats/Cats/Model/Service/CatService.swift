//
//  Created by Peter Combee on 22/07/2021.
//

import Foundation

protocol CatService {
    func fetchBreeds() async throws -> [Breed]
    func fetchCategories() async throws -> [Category]
    func fetchCatImageURLs(filter: CatFilter, page: Int, pageSize: Int) async throws -> [Image]
}
