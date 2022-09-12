//
//  DataModel.swift
//  network
//
//  Created by Beto Toro on 12/09/22.
//

import Foundation
import SwiftUI

struct UserInfo: Identifiable {
  var id: UUID
  var name: String
  var image: Image?
}
