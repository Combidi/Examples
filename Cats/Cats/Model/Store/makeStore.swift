//
//  Created by Peter Combee on 22/07/2021.
//

typealias MainStore = Store<AppState, AppAction>

func makeStore() -> MainStore {
    let appStore = makeAppStore()
    let store = Store(
        state: appStore.state,
        dispatch: appStore.dispatch
    )
    appStore.stateDidChange = { newState in
        store.state = newState
    }
    return store
}

private func makeAppStore() -> AppStore {
    return .init(
        state: .init(),
        reducer: appReducer,
        middlewares: makeMiddlewares()
    )
}

private func appReducer(state: inout AppState, action: InternalAction) {
    switch action {
    case .breeds(let internalBreedsAction):
        breedsReducer(state: &state.breedsState, action: internalBreedsAction)
    case .categories(let internalCategoriesAction):
        categoriesReducer(state: &state.categoriesState, action: internalCategoriesAction)
    case .cats(let internalCatsAction):
        catImagesReducer(state: &state.catImagesState, action: internalCatsAction)
    }
}

private func makeMiddlewares() -> [Middleware<InternalAction, AppState>] {
    let service = CombineCatServiceAdapter(service: RemoteCatService())
    return [
        breedsFetchingMiddleware(service: service),
        categoriesFetchingMiddleware(service: service),
        catImagesFetchingMiddleware(service: service)
    ]
}
