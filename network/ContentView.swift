//
//  ContentView.swift
//  network
//
//  Created by Beto Toro on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
        List {
          ForEach(0..<5) { person in
            NavigationLink {
              Text("Link")
            } label: {
              Text("name")
            }
          }
        }
        .navigationTitle("Network")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              // agregar persona
            } label: {
              Image(systemName: "plus")
            }
            .foregroundColor(Color.black)
          }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
