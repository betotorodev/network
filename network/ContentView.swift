//
//  ContentView.swift
//  network
//
//  Created by Beto Toro on 12/09/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var listOfUser = Users()
  @State private var image: Image?
  @State private var showingPersonView = false
  
    var body: some View {
      NavigationView {
        List {
          ForEach(listOfUser.users) { person in
            NavigationLink {
              Text("Link")
            } label: {
              Text(person.name)
            }
          }
        }
        .navigationTitle("Network")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              showingPersonView = true
            } label: {
              Image(systemName: "plus")
            }
            .foregroundColor(Color.black)
          }
        }
        .sheet(isPresented: $showingPersonView) {
          AddUserInfo(listOfUser: listOfUser)
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
