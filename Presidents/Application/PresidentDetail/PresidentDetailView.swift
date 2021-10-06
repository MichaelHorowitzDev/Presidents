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

class SavedPresidents: ObservableObject {
  @Published var presidents: Set<String> {
    didSet {
      print(presidents)
      UserDefaults.standard.set(Array(presidents), forKey: "savedPresidents")
    }
  }
  
  init() {
    if let presidents = UserDefaults.standard.array(forKey: "savedPresidents") as? [String] {
      self.presidents = Set(presidents)
    } else {
      presidents = Set()
    }
  }
}

struct PresidentDetailView: View {
  let presidentName: String
  let president: President?
  @ObservedObject var savedPresidents: SavedPresidents = SavedPresidents()
  var isSaved: Bool {
    savedPresidents.presidents.contains(presidentName)
  }
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
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              if isSaved {
                savedPresidents.presidents.remove(presidentName)
              } else {
                savedPresidents.presidents.insert(presidentName)
              }
            } label: {
              Image(systemName: isSaved ? "star.fill" : "star")
            }
          }
        }
      } else {
        Text("Error Loading President")
      }
    }
}
