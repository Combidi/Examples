//
//  Created by Peter Combee on 26/07/2021.
//

func catImagesReducer(
    state: inout CatImagesState,
    action: InternalCatsAction
) {
    switch action {
    case .load(let filter):
        state[filter] = .loading
    case .startedLoading(let filter):
        state[filter] = .loading
    case .finishedLoading(let cats, let filter):
        state[filter] = .loaded(cats)
    case .failedLoading(let message, let filter):
        state[filter] = .message(message)
    }
}
