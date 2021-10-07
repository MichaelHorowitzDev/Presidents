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
          List(0..<presidentNames.count, id: \.self) { name in
            NavigationLink {
              PresidentDetailView(presidentName: presidentNames[name])
            } label: {
              HStack {
                Image("\(name+1)_Preview")
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                Spacer()
                Text(presidentNames[name])
                  .font(.system(size: min(geo.size.height, geo.size.width) * 0.05))
              }
              .frame(maxHeight: 100)
            }
          }
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              Button(action: {
                showingFavorites = true
              }, label: {
                Image(systemName: "list.dash")
              })
                .sheet(isPresented: $showingFavorites) {
                  PresidentFavorites()
                }
            }
          }
        }
        .navigationTitle("Presidents")
      }
      .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
