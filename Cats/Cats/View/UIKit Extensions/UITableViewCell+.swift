//
//  Created by Peter Combee on 26/07/2021.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
}
