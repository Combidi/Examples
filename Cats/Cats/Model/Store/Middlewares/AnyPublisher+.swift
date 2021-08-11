//
//  Created by Peter Combee on 26/07/2021.
//

import Combine

typealias InternalActionPublisher = AnyPublisher<InternalAction, Never>

extension AnyPublisher where Output == InternalAction, Failure == Never {
    
    func flatMapAction(
        _ transform: @escaping (InternalAction) -> InternalActionPublisher
    ) -> Publishers.FlatMap<AnyPublisher<InternalAction, Never>, InternalActionPublisher> {
        self.flatMap { (action: InternalAction) -> InternalActionPublisher in
            transform(action)
        }
    }
}
