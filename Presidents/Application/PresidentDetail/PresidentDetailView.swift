//
//  PresidentDetailView.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/4/21.
//

import SwiftUI

func loadPresidentFromName(name: String, presidentArray: [President]) -> President? {
  return presidentArray.first(where: { $0.name == name })
}

struct PresidentDetailView: View {
  let presidentName: String
  let president: President?
  init(presidentName: String) {
    self.presidentName = presidentName
    self.president = loadPresidentFromName(name: presidentName, presidentArray: presidentArray)
  }
    var body: some View {
      if let president = president {
        List {
          PresidentView(president: president.name)
          PresidentSignature(president: president.name)
          NavigationLink {
            PresidentialFirsts(firsts: president.firsts)
          } label: {
            Text("Presidential Firsts")
          }
          NavigationLink {
            PresidentCabinetView(cabinet: president.cabinet)
          } label: {
            Text("Cabinet")
          }
          PresidentInfo(presidentDetail: president)
        }
        .font(.title2)
        .navigationTitle(president.name)
      } else {
        Text("Error Loading President")
      }
    }
}
