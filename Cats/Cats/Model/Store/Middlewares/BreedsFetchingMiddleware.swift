//
//  Created by Peter Combee on 22/07/2021.
//

import Combine

func breedsFetchingMiddleware(
    service: CombineCatServiceAdapter
) -> AppMiddleware {
    return { getState, pipe in
        pipe
            .flatMapAction { action in
                guard
                    case let .breeds(breedsAction) = action,
                    breedsAction == .load
                else { return Empty().eraseToAnyPublisher() }
                return modelFetchingPublisher(
                    currentState: getState().breedsState,
                    fetch: service.fetchBreeds
                )
                .map { .breeds($0) }
                .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
