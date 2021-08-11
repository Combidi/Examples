//
//  Created by Peter Combee on 22/07/2021.
//

func breedsReducer(
    state: inout BreedsState,
    action: InternalBreedsAction
) {
    modelStateReducer(state: &state, action: action)
}
