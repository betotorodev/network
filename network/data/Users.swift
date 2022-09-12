//
//  Users.swift
//  network
//
//  Created by Beto Toro on 12/09/22.
//

import Foundation
import SwiftUI

class Users: ObservableObject {
  @Published var users = [UserInfo]()
  var example = [UserInfo(id: UUID(), name: "Beto", image: Image("user")), UserInfo(id: UUID(), name: "Tiby", image: Image("user"))]
}
