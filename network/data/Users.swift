//
//  Users.swift
//  network
//
//  Created by Beto Toro on 12/09/22.
//

import Foundation

class Users: ObservableObject {
  @Published var users = [UserInfo]()
}
