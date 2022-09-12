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
  @State private var image: Image?
  @State private var inputImage: UIImage?
  @State private var showingImagePicker = false
  
  func loadImage() {
    guard let inputImage = inputImage else { return }
    image = Image(uiImage: inputImage)
  }
  
  var body: some View {
    NavigationView {
      Form {
        VStack {
          HStack {
            Spacer()
            ZStack {
              Rectangle()
                .fill(.secondary)
                .frame(width: 200, height: 200)
              
              Text("Tap to select a picture")
                .foregroundColor(.white)
                .font(.headline)
              
              image?
                .resizable()
                .scaledToFit()
            }
            .onTapGesture {
              showingImagePicker.toggle()
            }
            Spacer()
          }
          TextField("Name", text: $name)
            .padding(10)
        }
        .padding([.top])
      }
      .navigationTitle("Add a person")
      .toolbar {
        Button("Save") {
          let individualUser = UserInfo(id: UUID(), name: name, image: image)
          listOfUser.users.append(individualUser)
          dismiss()
        }
      }
      .onChange(of: inputImage) {_ in loadImage()}
      .sheet(isPresented: $showingImagePicker) {
        ImagePicker(image: $inputImage)
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
