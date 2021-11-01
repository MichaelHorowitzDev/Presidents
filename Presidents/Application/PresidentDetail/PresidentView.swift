//
//  PresidentView.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/4/21.
//

import SwiftUI

struct PresidentView: View {
  var president: String
  var body: some View {
    Image(president)
      .resizable()
      .scaledToFit()
  }
}
