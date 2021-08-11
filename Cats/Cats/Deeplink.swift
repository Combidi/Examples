//
//  Created by Peter Combee on 27/07/2021.
//

import Foundation

class Deeplink {
        
    static func from(url: URL?) throws -> Deeplink {
        guard let url = url else { throw InvalidDeeplinkError.invalidURL }
        let destinations = try url.pathComponents
            .reversed()
            .map {
                try destionation(from: $0)
            }
        
        guard let firstDestination = destinations.first else { throw InvalidDeeplinkError.missingDestinations }
        return destinations.dropFirst().reduce(Deeplink(destination: firstDestination), { current, next in
            Deeplink(destination: next, next: current)
        })
    }
    
    static private func destionation(from string: String) throws -> Destination {
        guard let destination = Destination(rawValue: string) else {
            throw InvalidDeeplinkError.unknownDestination(string) }
        return destination
    }
    
    let destination: Destination
    private(set) var next: Deeplink?

    init(destination: Destination, next: Deeplink? = nil) {
        self.destination = destination
        self.next = next
    }
    
}

enum Destination: String {
    case breeds, categories
}

enum InvalidDeeplinkError: Error {
    case invalidURL
    case unknownDestination(String)
    case missingDestinations
}
