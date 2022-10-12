//
//  PresidentArray.swift
//  Presidents
//
//  Created by Michael Horowitz on 4/25/21.
//

import Foundation

let presidentArray = presidentsDataArray()

// swiftlint:disable force_try
func presidentsDataArray() -> [President] {
  let presidentDataURL = Bundle.main.url(forResource: "presidents_data", withExtension: "json")!
  let presidentData = try! Data(contentsOf: presidentDataURL)
  let presidentArray: [President] = try! JSONDecoder().decode([President].self, from: presidentData)
  return presidentArray
}
