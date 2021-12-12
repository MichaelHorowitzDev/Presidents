//
//  PresidentFavorites.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/6/21.
//

import SwiftUI

struct PresidentFavorites: View {
  @EnvironmentObject var saved: SavedPresidents
  @Environment(\.presentationMode) var presentationMode
    var body: some View {
      NavigationView {
        GeometryReader { geo in
          List {
            ForEach(saved.presidents, id: \.self) { name in
              NavigationLink {
                PresidentDetailView(presidentName: name)
              } label: {
                HStack {
                  if let image = UIImage(named: "\((presidentNames.firstIndex(of: name) ?? -1)+1)_Preview") {
                    Image(uiImage: image)
                      .resizable()
                      .scaledToFit()
                      .clipShape(Circle())
                  } else {
                    Image(systemName: "xmark.octagon.fill")
                      .foregroundColor(.red)
                  }
                  Spacer()
                  Text(name)
                    .font(.system(size: min(geo.size.height, geo.size.width) * 0.05))
                }
                .frame(maxHeight: 100)
              }
            }
            .onDelete { indexSet in
              saved.presidents.remove(atOffsets: indexSet)
            }
          }
          .navigationBarTitle("Favorites")
//          .navigationTitle("Favorites")
          .navigationBarItems(
            trailing:
              Button {
                presentationMode.wrappedValue.dismiss()
              } label: {
                Text("Done")
                  .bold()
              }
          )
//          .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//              Button {
//                presentationMode.wrappedValue.dismiss()
//              } label: {
//                Text("Done")
//                  .bold()
//              }
//
//            }
//          }
        }
      }
    }
}
