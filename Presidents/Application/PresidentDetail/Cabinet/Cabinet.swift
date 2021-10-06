//
//  Cabinet.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/5/21.
//

import SwiftUI

struct SectionHeader: View {
  let text: String
  init(_ text: String) {
    self.text = text
  }
  var body: some View {
    Text(text)
      .font(.callout)
  }
}
struct PresidentCabinetView: View {
  let cabinet: PresidentCabinet
  var body: some View {
    List {
      if cabinet.vicePresident != nil {
        Section(header: SectionHeader("Vice President")) {
          Text(cabinet.vicePresident!.joined(separator: "\n"))
        }
      }
      Section(header: SectionHeader("Secretary of State")) {
        Text(cabinet.secretaryState.joined(separator: "\n"))
      }
      Section(header: SectionHeader("Secretary of the Treasury")) {
        Text(cabinet.secretaryTreasury.joined(separator: "\n"))
      }
      if cabinet.secretaryWar != nil {
        Section(header: SectionHeader("Secretary of War")) {
          Text(cabinet.secretaryWar!.joined(separator: "\n"))
        }
      }
      Section(header: SectionHeader("Attorney General")) {
        Text(cabinet.attorneyGeneral.joined(separator: "\n"))
      }
      if cabinet.secretaryNavy != nil {
        Section(header: SectionHeader("Secretary of the Navy")) {
          Text(cabinet.secretaryNavy!.joined(separator: "\n"))
        }
      }
      if cabinet.secretaryInterior != nil {
        Section(header: SectionHeader("Secretary of the Interior")) {
          Text(cabinet.secretaryInterior!.joined(separator: "\n"))
        }
      }
      if cabinet.secretaryAgriculture != nil {
        Section(header: SectionHeader("Secretary of Agriculture")) {
          Text(cabinet.secretaryAgriculture!.joined(separator: "\n"))
        }
      }
      if cabinet.secretaryCommerce != nil {
        Section(header: SectionHeader("Secretary of Commerce")) {
          Text(cabinet.secretaryCommerce!.joined(separator: "\n"))
        }
      }
      if cabinet.secretaryLabor != nil {
        Section(header: SectionHeader("Secretary of Labor")) {
          Text(cabinet.secretaryLabor!.joined(separator: "\n"))
        }
      }
    }
    .font(.title2)
    .navigationBarTitle("Cabinet")
  }
}
