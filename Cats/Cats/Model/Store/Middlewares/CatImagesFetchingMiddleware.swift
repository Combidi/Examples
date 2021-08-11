//
//  Created by Peter Combee on 26/07/2021.
//

import Combine

func catImagesFetchingMiddleware(
    service: CombineCatServiceAdapter
) -> AppMiddleware {
    return { getState, pipe in
        pipe
            .flatMapAction { action in
                guard
                    case let .cats(catsAction) = action,
                    case let .load(filter) = catsAction,
                    (getState().catImagesState[filter] ?? .idle).requiresLoading
                else { return Empty().eraseToAnyPublisher() }
                return service
                    .fetchCatImageURLs(filter: filter, page: 0, pageSize: 15)
                    .map { .finishedLoading(model: $0, filter: filter) }
                    .prepend(.startedLoading(filter: filter))
                    .catch { Just(.failedLoading(message: $0.localizedDescription, filter: filter)) }
                    .map { InternalAction.cats($0) }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}

