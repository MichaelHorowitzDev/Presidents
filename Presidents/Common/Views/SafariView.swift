//
//  SafariView.swift
//  Presidents
//
//  Created by Michael Horowitz on 11/1/21.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
  let url: URL
  func makeUIViewController(context: Context) -> SFSafariViewController {
    SFSafariViewController(url: url)
  }
  func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

  }
}
