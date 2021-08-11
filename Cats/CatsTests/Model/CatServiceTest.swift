//
//  Created by Peter Combee on 22/07/2021.
//

import XCTest
@testable import Cats

class CatServiceTest: XCTestCase {
    
    func test_fetchBreeds() {
        let sut = CatService()
        let breeds = sut.fetchCats
        
        XCTFail()
    }
    
}
