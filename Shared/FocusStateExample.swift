//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct FocusStateExample: View {
    
    enum Field {
        case firstName
        case lastName
        case emailAddress
    }
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""

    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $firstName)
                .focused($focusedField, equals: .firstName)
                .textContentType(.givenName)
                .submitLabel(.next)
            TextField("Enter your name", text: $lastName)
                .focused($focusedField, equals: .lastName)
                .textContentType(.familyName)
                .submitLabel(.next)
            TextField("Enter your email address", text: $emailAddress)
                .focused($focusedField, equals: .emailAddress)
                .textContentType(.emailAddress)
                .submitLabel(.join)
        }
        .onSubmit {
            switch focusedField {
            case .firstName:
                focusedField = .lastName
            case .lastName:
                focusedField = .emailAddress
            default:
                print("Joining chat room...")
            }
        }
    }
}

struct FocusStateExample_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateExample()
    }
}
