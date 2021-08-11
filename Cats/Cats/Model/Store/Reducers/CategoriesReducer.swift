//
//  Created by Peter Combee on 26/07/2021.
//

func categoriesReducer(
    state: inout CategoriesState,
    action: InternalCategoriesAction
) {
    modelStateReducer(state: &state, action: action)
}
