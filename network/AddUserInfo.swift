//
//  AddUserInfo.swift
//  network
//
//  Created by Beto Toro on 12/09/22.
//

import SwiftUI

struct AddUserInfo: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var listOfUser: Users
  @State private var name = ""
  
    var body: some View {
      NavigationView {
        Form {
          TextField("Name", text: $name)
        }
        .navigationTitle("Add a person")
        .toolbar {
          Button("Save") {
            let individualUser = UserInfo(id: UUID(), name: name)
            listOfUser.users.append(individualUser)
            dismiss()
          }
        }
      }
    }
}

struct AddUserInfo_Previews: PreviewProvider {
    static var previews: some View {
      let users = Users()
      AddUserInfo(listOfUser: users)
    }
}
