//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct FormExample: View {
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
        }
        .onSubmit {
            guard !username.isEmpty && !password.isEmpty else { return }
            print("Authenticating...")
        }
    }
}

struct FormExample_Previews: PreviewProvider {
    static var previews: some View {
        FormExample()
    }
}
