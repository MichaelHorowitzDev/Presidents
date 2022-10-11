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
      if let vicePresident = cabinet.vicePresident {
        Section(header: SectionHeader("Vice President")) {
          Text(vicePresident.joined(separator: "\n"))
        }
      }
      Section(header: SectionHeader("Secretary of State")) {
        Text(cabinet.secretaryState.joined(separator: "\n"))
      }
      Section(header: SectionHeader("Secretary of the Treasury")) {
        Text(cabinet.secretaryTreasury.joined(separator: "\n"))
      }
      if let war = cabinet.secretaryWar {
        Section(header: SectionHeader("Secretary of War")) {
          Text(war.joined(separator: "\n"))
        }
      }
      Section(header: SectionHeader("Attorney General")) {
        Text(cabinet.attorneyGeneral.joined(separator: "\n"))
      }
      if let navy = cabinet.secretaryNavy {
        Section(header: SectionHeader("Secretary of the Navy")) {
          Text(navy.joined(separator: "\n"))
        }
      }
      if let interior = cabinet.secretaryInterior {
        Section(header: SectionHeader("Secretary of the Interior")) {
          Text(interior.joined(separator: "\n"))
        }
      }
      if let agriculture = cabinet.secretaryAgriculture {
        Section(header: SectionHeader("Secretary of Agriculture")) {
          Text(agriculture.joined(separator: "\n"))
        }
      }
      if let commerce = cabinet.secretaryCommerce {
        Section(header: SectionHeader("Secretary of Commerce")) {
          Text(commerce.joined(separator: "\n"))
        }
      }
      if let labor = cabinet.secretaryLabor {
        Section(header: SectionHeader("Secretary of Labor")) {
          Text(labor.joined(separator: "\n"))
        }
      }
    }
    .font(.title2)
    .navigationBarTitle("Cabinet")
  }
}
