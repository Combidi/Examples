//
//  Created by Peter Combee on 22/07/2021.
//

import Combine
import Foundation

struct CombineCatServiceAdapter {
    
    let service: CatService
    
    func fetchBreeds() -> AnyPublisher<[Breed], Error> {
        Future { promise in
            async {
                do {
                    let breeds = try await service.fetchBreeds()
                    promise(.success(breeds))
                } catch let error {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchCategories() -> AnyPublisher<[Category], Error> {
        Future { promise in
            async {
                do {
                    let breeds = try await service.fetchCategories()
                    promise(.success(breeds))
                } catch let error {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchCatImageURLs(filter: CatFilter, page: Int, pageSize: Int) -> AnyPublisher<[Image], Error> {
        Future { promise in
            async {
                do {
                    let cats = try await service.fetchCatImageURLs(filter: filter, page: page, pageSize: pageSize)
                    promise(.success(cats))
                } catch let error {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

}
