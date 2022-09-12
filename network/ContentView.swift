//
//  ContentView.swift
//  network
//
//  Created by Beto Toro on 12/09/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var listOfUser = Users()
  @State private var showingPersonView = false
  @State private var defaultImage = Image(systemName: "person.circle")
  
    var body: some View {
      NavigationView {
        List {
          ForEach(listOfUser.example) { person in
            NavigationLink {
              Text("Link")
            } label: {
              HStack {
                if person.image != nil {
                  person.image!
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
                } else {
                  defaultImage
                }
                Text(person.name)
              }
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
