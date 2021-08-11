//
//  Created by Peter Combee on 26/07/2021.
//

import Foundation

struct StubbedCatService: CatService {
    
    func fetchBreeds() async throws -> [Breed] {
        breedsStub
    }
    
    func fetchCategories() async throws -> [Category] {
        categoriesStub
    }
            
    func fetchCatImageURLs(filter: CatFilter, page: Int, pageSize: Int) async throws -> [Image] {
        imagesStub
    }
    
}

fileprivate var breedsStub: [Breed] = [
    .init(id: "1", name: "Gewone kat", description: "Zeer pluizig", image: .init(height: 1445, width: 1204, url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")),
    .init(id: "2", name: "Buurpoes", description: "Een soort met een vervelend karakter, de soort heeft de neiging om snachts de buurt te tetoriseren", image: .init(height: 1445, width: 1204, url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"))
]

fileprivate var categoriesStub: [Category] = [
    .init(id: 1, name: "Pleuzige katten"),
    .init(id: 2, name: "Minder pleuzige katten"),
    .init(id: 3, name: "Kale katten")
]

fileprivate var imagesStub: [Image] = [
    Image(height: 200, width: 200, url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
]
