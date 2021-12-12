//
//  PresidentialFirsts.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/5/21.
//

import SwiftUI

struct PresidentialFirsts: View {
  let firsts: [String]
    var body: some View {
      List(0..<firsts.count, id: \.self) { num in
        HStack {
          Text("\(num+1).")
            .font(.title.bold())
            .padding(.trailing)
          Text(firsts[num])
        }
        .padding(.vertical)
        .fixedSize(horizontal: false, vertical: true)
      }
      .font(.title2)
      .navigationBarTitle("Presidential Firsts")
//      .navigationTitle("Presidential Firsts")
    }
}
