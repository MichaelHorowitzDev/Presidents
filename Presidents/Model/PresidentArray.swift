//
//  PresidentArray.swift
//  Presidents
//
//  Created by Michael Horowitz on 4/25/21.
//

import Foundation

let presidentArray = presidentsDataArray()

func presidentsDataArray() -> [President] {
    let presidentDataURL = Bundle.main.url(forResource: "presidents_data", withExtension: "json")!
    let presidentData = try! Data(contentsOf: presidentDataURL)
    let presidentDataDict = try! JSONSerialization.jsonObject(with: presidentData, options: []) as! [String:Any]
    let presidentFirstsURL = Bundle.main.url(forResource: "firsts", withExtension: "json")!
    let presidentFirsts = try! Data(contentsOf: presidentFirstsURL)
    let presidentFirstsDict = try! JSONSerialization.jsonObject(with: presidentFirsts, options: []) as! [String:Any]
  
  let presidentArray: [President] = presidentNames.map { president in
    var presidentDict = presidentDataDict[president] as! [String:Any]
    presidentDict["name"] = president
    presidentDict["firsts"] = presidentFirstsDict[president]
    presidentDict["cabinet"] = [
      "secretary_of_state": presidentDict["secretary_of_state"],
      "secretary_of_the_treasury": presidentDict["secretary_of_the_treasury"],
      "secretary_of_war": presidentDict["secretary_of_war"],
      "attorney_general": presidentDict["attorney_general"],
      "secretary_of_the_navy": presidentDict["secretary_of_the_navy"],
      "secretary_of_the_interior": presidentDict["secretary_of_the_interior"],
      "secretary_of_agriculture": presidentDict["secretary_of_agriculture"],
      "secretary_of_commerce": presidentDict["secretary_of_commerce"],
      "secretary_of_labor": presidentDict["secretary_of_labor"],
    ]
    let data = try! JSONSerialization.data(withJSONObject: presidentDict)
    return try! JSONDecoder().decode(President.self, from: data)
  }
  return presidentArray
}
