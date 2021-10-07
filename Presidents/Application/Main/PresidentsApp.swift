//
//  PresidentsApp.swift
//  Presidents
//
//  Created by Michael Horowitz on 10/3/21.
//

import SwiftUI

@main
struct PresidentsApp: App {
    var body: some Scene {
        WindowGroup {
          HomeView()
            .environmentObject(SavedPresidents())
        }
    }
}
