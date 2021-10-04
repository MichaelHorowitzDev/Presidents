//
//  PresidentArray.swift
//  Presidents
//
//  Created by Michael Horowitz on 4/25/21.
//

import Foundation

var presidentArray = [President]()

func setupArray() {
    var url = Bundle.main.url(forResource: "presidents_data", withExtension: "json")!
    var file = try! Data(contentsOf: url)
    let dictionary = try! JSONSerialization.jsonObject(with: file, options: []) as! [String:Any]
    url = Bundle.main.url(forResource: "firsts", withExtension: "json")!
    file = try! Data(contentsOf: url)
    let firsts = try! JSONSerialization.jsonObject(with: file, options: []) as! [String:Any]
    
    for president in presidentNames {
        if president == "Franklin D. Roosevelt" {
            continue
        }
        let newDict = dictionary[president] as! [String:Any]
        print(president)
        presidentArray.append(
            President(
                name: president,
                religion: newDict["religion"] as! String,
                nickname: newDict["nickname"] as? [String],
                career: newDict["career"] as! String,
                firsts: firsts[president] as! [String],
                born: newDict["born"] as! String,
                died: newDict["died"] as? String,
                causeOfDeath: newDict["cause_of_death"] as? String,
                restingPlace: newDict["resting_place"] as? String,
                politicalParty: newDict["political_party"] as! String,
                parents: newDict["parents"] as? [String],
                children: newDict["children"] as? [String],
                spouses: newDict["spouses"] as? [String],
                vicePresident: newDict["vice_president"] as? [String],
                startTerm: newDict["start_term"] as! String,
                endTerm: newDict["end_term"] as! String,
                birthPlace: newDict["birth_place"] as? String,
                locationDied: newDict["location_died"] as? String,
                secretaryState: newDict["secretary_of_state"] as! [String],
                secretaryTreasury: newDict["secretary_of_the_treasury"] as! [String],
                secretaryWar: newDict["secretary_of_war"] as? [String],
                attorneyGeneral: newDict["attorney_general"] as! [String],
                secretaryNavy: newDict["secretary_of_the_navy"] as? [String],
                secretaryInterior: newDict["secretary_of_the_interior"] as? [String],
                secretaryAgriculture: newDict["secretary_of_agriculture"] as? [String],
                secretaryCommerce: newDict["secretary_of_commerce"] as? [String],
                secretaryLabor: newDict["secretary_of_labor"] as? [String]
            )
        )
    }
}
