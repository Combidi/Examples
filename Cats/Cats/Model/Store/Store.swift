//
//  Created by Peter Combee on 22/07/2021.
//

import Combine

class Store<State, Action>: ObservableObject {
            
    var derivedCancellables: Set<AnyCancellable> = []
    
    @Published var state: State

    let _dispatch: (Action) -> Void
    
    init(state: State, dispatch: @escaping (Action) -> Void) {
        self.state = state
        _dispatch = dispatch
    }
        
    func dispatch(action: Action) {
        _dispatch(action)
    }

}
