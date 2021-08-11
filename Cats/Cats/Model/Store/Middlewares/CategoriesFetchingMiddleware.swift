//
//  Created by Peter Combee on 26/07/2021.
//

import Combine

func categoriesFetchingMiddleware(
    service: CombineCatServiceAdapter
) -> AppMiddleware {
    return { getState, pipe in
        pipe
            .flatMapAction { action in
                guard
                    case let .categories(categoriesAction) = action,
                    categoriesAction == .load
                else { return Empty().eraseToAnyPublisher() }
                return modelFetchingPublisher(
                    currentState: getState().categoriesState,
                    fetch: service.fetchCategories
                )
                .map { InternalAction.categories($0) }
                .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
