//
//  PresidentSignature.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/4/21.
//

import SwiftUI

struct PresidentSignature: View {
    let president: String
    var body: some View {
      Image(president + "_signature")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding()
    }
}
