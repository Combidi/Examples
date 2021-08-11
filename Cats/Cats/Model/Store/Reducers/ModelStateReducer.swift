//
//  Created by Peter Combee on 26/07/2021.
//

func modelStateReducer<Model: Equatable>(
    state: inout ModelState<[Model]>,
    action: ModelLoadingAction<[Model]>
) {
    switch action {
    case .load:
        break
    case .startedLoading:
        state = .loading
    case .finishedLoading(let models):
        state = .loaded(models)
    case .failedLoading(let message):
        state = .message(message)
    }
}
