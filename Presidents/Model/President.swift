//
//  President.swift
//  Presidents
//
//  Created by Michael Horowitz on 4/25/21.
//

import Foundation

struct President: Identifiable {
    var id = UUID()
    
    internal init(name: String, religion: String, nickname: [String]?, career: String, firsts: [String], born: String, died: String?, causeOfDeath: String?, restingPlace: String?, politicalParty: String, parents: [String]?, children: [String]?, spouses: [String]?, vicePresident: [String]?, startTerm: String, endTerm: String, birthPlace: String?, locationDied: String?, secretaryState: [String], secretaryTreasury: [String], secretaryWar: [String]?, attorneyGeneral: [String], secretaryNavy: [String]?, secretaryInterior: [String]?, secretaryAgriculture: [String]?, secretaryCommerce: [String]?, secretaryLabor: [String]?) {
        self.name = name
        self.religion = religion
        self.nickname = nickname
        self.career = career
        self.firsts = firsts
        self.born = dateConverter(born)!
        self.died = dateConverter(died ?? "")
        self.causeOfDeath = causeOfDeath
        self.restingPlace = restingPlace
        self.politicalParty = politicalParty
        self.parents = parents
        self.children = children
        self.spouses = spouses
        self.vicePresident = vicePresident
        if startTerm.contains("\n") {
            let array = startTerm.split(separator: "\n").map({ String($0) }).map {
                dateConverter($0) ?? ""
            }
            self.startTerm = array.joined(separator: "\n")
        } else {
            self.startTerm = dateConverter(startTerm) ?? ""
        }
        if endTerm.contains("\n") {
            let array = endTerm.split(separator: "\n").map({ String($0) }).map {
                dateConverter($0) ?? ""
            }
            self.endTerm = array.joined(separator: "\n")
        } else {
            self.endTerm = dateConverter(endTerm) ?? ""
        }
        self.birthPlace = birthPlace
        self.locationDied = locationDied
        self.secretaryState = secretaryState
        self.secretaryTreasury = secretaryTreasury
        self.secretaryWar = secretaryWar
        self.attorneyGeneral = attorneyGeneral
        self.secretaryNavy = secretaryNavy
        self.secretaryInterior = secretaryInterior
        self.secretaryAgriculture = secretaryAgriculture
        self.secretaryCommerce = secretaryCommerce
        self.secretaryLabor = secretaryLabor
    }
    
    let name: String
    let religion: String
    let nickname: [String]?
    let career: String
    let firsts: [String]
    let born: String
    let died: String?
    let causeOfDeath: String?
    let restingPlace: String?
    let politicalParty: String
    let parents: [String]?
    let children: [String]?
    let spouses: [String]?
    let vicePresident: [String]?
    let startTerm: String
    let endTerm: String
    let birthPlace: String?
    let locationDied: String?
    let secretaryState: [String]
    let secretaryTreasury: [String]
    let secretaryWar: [String]?
    let attorneyGeneral: [String]
    let secretaryNavy: [String]?
    let secretaryInterior: [String]?
    let secretaryAgriculture: [String]?
    let secretaryCommerce: [String]?
    let secretaryLabor: [String]?
}
