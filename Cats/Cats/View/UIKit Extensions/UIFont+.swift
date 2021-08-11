//
//  Created by Peter Combee on 29/07/2021.
//

import UIKit

extension UIFont {
    
    static var fontName: String = ""
                
    static let largeTitle: UIFont = UIFont.preferredFont(forTextStyle: .largeTitle)
    static let title: UIFont = .preferredFont(forTextStyle: .title1)
    static let body: UIFont = .preferredFont(forTextStyle: .body)
            
}

/*
 
 .largeTitle    SFUIDisplay    34.0
 .title1    SFUIDisplay
 (-Light on iOS <=10)    28.0
 .title2    SFUIDisplay    22.0
 .title3    SFUIDisplay    20.0
 .headline    SFUIText-Semibold    17.0
 .callout    SFUIText    16.0
 .subheadline    SFUIText    15.0
 .body    SFUIText    17.0
 .footnote    SFUIText    13.0
 .caption1    SFUIText    12.0
 .caption2    SFUIText    11.0
 
 */
