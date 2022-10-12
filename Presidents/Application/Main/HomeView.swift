//
//  HomeView.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/4/21.
//

import SwiftUI

struct HomeView: View {
  @State private var showingFavorites = false
    var body: some View {
      NavigationView {
        GeometryReader { geo in
          List(presidentArray, id: \.self) { president in
            NavigationLink {
              PresidentDetailView(presidentName: president.name)
            } label: {
              HStack {
                Image("\(president.name)_Preview")
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                Spacer()
                Text(president.name)
                  .font(.system(size: min(geo.size.height, geo.size.width) * 0.05))
              }
              .frame(maxHeight: 100)
            }
          }
          .navigationBarItems(trailing:
              Button(action: {
                showingFavorites = true
              }, label: {
                Image(systemName: "list.star")
              })
                .sheet(isPresented: $showingFavorites) {
                  PresidentFavorites()
                }
          )
        }
        .navigationBarTitle("Presidents")
      }
      .navigationViewStyle(.stack)
    }
}
