//
//  Created by Peter Combee on 26/07/2021.
//

import Combine

func modelFetchingPublisher<Model: Equatable>(
    currentState: ModelState<Model>,
    fetch: () -> AnyPublisher<Model, Error>
) -> AnyPublisher<ModelLoadingAction<Model>, Never> {
    guard currentState.requiresLoading else { return Empty().eraseToAnyPublisher() }
    return fetch()
        .map { .finishedLoading(model: $0) }
        .prepend(.startedLoading)
        .catch { Just(.failedLoading(message: String(describing: $0))) }
        .eraseToAnyPublisher()
}
