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
    let presidentDict = presidentDataDict[president] as! [String:Any]
    return President(
      name: president,
      religion: presidentDict["religion"] as! String,
      nickname: presidentDict["nickname"] as? [String],
      career: presidentDict["career"] as! String,
      firsts: presidentFirstsDict[president] as! [String],
      born: presidentDict["born"] as! String,
      died: presidentDict["died"] as? String,
      causeOfDeath: presidentDict["cause_of_death"] as? String,
      restingPlace: presidentDict["resting_place"] as? String,
      politicalParty: presidentDict["political_party"] as! String,
      parents: presidentDict["parents"] as? [String],
      children: presidentDict["children"] as? [String],
      spouses: presidentDict["spouses"] as? [String],
      vicePresident: presidentDict["vice_president"] as? [String],
      startTerm: presidentDict["start_term"] as! String,
      endTerm: presidentDict["end_term"] as! String,
      birthPlace: presidentDict["birth_place"] as? String,
      locationDied: presidentDict["location_died"] as? String,
      wikipediaPage: URL(string: presidentDict["wikipedia"] as! String)!,
      secretaryState: presidentDict["secretary_of_state"] as! [String],
      secretaryTreasury: presidentDict["secretary_of_the_treasury"] as! [String],
      secretaryWar: presidentDict["secretary_of_war"] as? [String],
      attorneyGeneral: presidentDict["attorney_general"] as! [String],
      secretaryNavy: presidentDict["secretary_of_the_navy"] as? [String],
      secretaryInterior: presidentDict["secretary_of_the_interior"] as? [String],
      secretaryAgriculture: presidentDict["secretary_of_agriculture"] as? [String],
      secretaryCommerce: presidentDict["secretary_of_commerce"] as? [String],
      secretaryLabor: presidentDict["secretary_of_labor"] as? [String]
    )
  }
  return presidentArray
}
//    for president in presidentNames {
//        if president == "Franklin D. Roosevelt" {
//            continue
//        }
//        let newDict = presidentDataDict[president] as! [String:Any]
//        print(president)
//        presidentArray.append(
//            President(
//                name: president,
//                religion: newDict["religion"] as! String,
//                nickname: newDict["nickname"] as? [String],
//                career: newDict["career"] as! String,
//                firsts: presidentFirstsDict[president] as! [String],
//                born: newDict["born"] as! String,
//                died: newDict["died"] as? String,
//                causeOfDeath: newDict["cause_of_death"] as? String,
//                restingPlace: newDict["resting_place"] as? String,
//                politicalParty: newDict["political_party"] as! String,
//                parents: newDict["parents"] as? [String],
//                children: newDict["children"] as? [String],
//                spouses: newDict["spouses"] as? [String],
//                vicePresident: newDict["vice_president"] as? [String],
//                startTerm: newDict["start_term"] as! String,
//                endTerm: newDict["end_term"] as! String,
//                birthPlace: newDict["birth_place"] as? String,
//                locationDied: newDict["location_died"] as? String,
//                secretaryState: newDict["secretary_of_state"] as! [String],
//                secretaryTreasury: newDict["secretary_of_the_treasury"] as! [String],
//                secretaryWar: newDict["secretary_of_war"] as? [String],
//                attorneyGeneral: newDict["attorney_general"] as! [String],
//                secretaryNavy: newDict["secretary_of_the_navy"] as? [String],
//                secretaryInterior: newDict["secretary_of_the_interior"] as? [String],
//                secretaryAgriculture: newDict["secretary_of_agriculture"] as? [String],
//                secretaryCommerce: newDict["secretary_of_commerce"] as? [String],
//                secretaryLabor: newDict["secretary_of_labor"] as? [String]
//            )
//        )
//    }
//}
