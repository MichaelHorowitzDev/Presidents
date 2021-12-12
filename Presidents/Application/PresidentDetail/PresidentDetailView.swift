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
  @Published var presidents: Array<String> {
    didSet {
      print(presidents)
      UserDefaults.standard.set(Array(presidents), forKey: "savedPresidents")
    }
  }
  
  init() {
    if let presidents = UserDefaults.standard.array(forKey: "savedPresidents") as? [String] {
      self.presidents = presidents
    } else {
      presidents = [String]()
    }
  }
}

struct PresidentDetailView: View {
  let presidentName: String
  let president: President?
  @EnvironmentObject var savedPresidents: SavedPresidents
  @State private var showWikipediaLink = false
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
          HStack {
            Spacer()
            PresidentView(president: president.name)
              .frame(maxWidth: 200)
              .cornerRadius(10)
              .padding()
            Spacer()
          }
          HStack {
            Spacer()
            PresidentSignature(president: president.name)
              .frame(maxWidth: 400)
            Spacer()
          }
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
          Button {
            showWikipediaLink = true
          } label: {
            HStack {
              Spacer()
              Text("Wikipedia Page")
                .foregroundColor(.blue)
              Spacer()
            }
          }
          .sheet(isPresented: $showWikipediaLink) {
            SafariView(url: president.wikipediaPage)
          }
 //          Link(destination: president.wikipediaPage) {
//            HStack {
//              Spacer()
//              Text("Wikipedia Page")
//              Spacer()
//            }
//          }
          PresidentInfo(presidentDetail: president)
        }
        .font(Font.title2)
        .navigationBarTitle(president.name)
//        .navigationTitle(president.name)
        .navigationBarItems(
          trailing:
            Button {
              if isSaved {
                savedPresidents.presidents = savedPresidents.presidents.filter({ $0 != presidentName })
              } else {
                savedPresidents.presidents.append(presidentName)
              }
            } label: {
              Image(systemName: isSaved ? "star.fill" : "star")
            }
        )
//        .toolbar {
//          ToolbarItem(placement: .navigationBarTrailing) {
//            Button {
//              if isSaved {
//                savedPresidents.presidents = savedPresidents.presidents.filter({ $0 != presidentName })
//              } else {
//                savedPresidents.presidents.append(presidentName)
//              }
//            } label: {
//              Image(systemName: isSaved ? "star.fill" : "star")
//            }
//          }
//        }
      } else {
        Text("Error Loading President")
      }
    }
}
