//
//  PresidentInfo.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/4/21.
//

import SwiftUI

struct PresidentInfoView: View {
  let title: String
  let text: String?

  init(title: String, text: String?) {
    self.title = title
    self.text = text
  }
  init(title: String, text: [String]?) {
    self.title = title
    self.text = text?.joined(separator: "\n")
  }
  var body: some View {
    if let text = text {
      Section {
        Text(text)
      } header: {
        Text(title)
          .font(.callout)
      }
    }
  }
}

struct PresidentInfo: View {
  let presidentDetail: President
  var body: some View {
    Group {
      PresidentInfoView(title: "Born", text: presidentDetail.born)
      PresidentInfoView(title: "Died", text: presidentDetail.died)
      PresidentInfoView(title: "Start Term", text: presidentDetail.startTerm)
      PresidentInfoView(title: "End Term", text: presidentDetail.endTerm)
      PresidentInfoView(title: "Parents", text: presidentDetail.parents)
      if presidentDetail.spouses?.count == 1 {
        PresidentInfoView(title: "Spouse", text: presidentDetail.spouses)
      } else {
        PresidentInfoView(title: "Spouses", text: presidentDetail.spouses)
      }
      PresidentInfoView(title: "Religion", text: presidentDetail.religion)
      PresidentInfoView(title: "Political Party", text: presidentDetail.politicalParty)
      PresidentInfoView(title: "Career", text: presidentDetail.career)
      PresidentInfoView(title: "Nickname", text: presidentDetail.nickname)
    }
    Group {
      PresidentInfoView(title: "Birth Place", text: presidentDetail.birthPlace)
      PresidentInfoView(title: "Location Died", text: presidentDetail.locationDied)
      PresidentInfoView(title: "Cause of Death", text: presidentDetail.causeOfDeath)
      PresidentInfoView(title: "Resting Place", text: presidentDetail.restingPlace)
    }
  }
}
