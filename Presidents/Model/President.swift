//
//  President.swift
//  Presidents
//
//  Created by Michael Horowitz on 4/25/21.
//

import Foundation

struct PresidentCabinet: Codable {
  let vicePresident: [String]?
  let secretaryState: [String]
  let secretaryTreasury: [String]
  let secretaryWar: [String]?
  let attorneyGeneral: [String]
  let secretaryNavy: [String]?
  let secretaryInterior: [String]?
  let secretaryAgriculture: [String]?
  let secretaryCommerce: [String]?
  let secretaryLabor: [String]?

  enum CodingKeys: String, CodingKey {
    case vicePresident = "vice_president"
    case secretaryState = "secretary_of_state"
    case secretaryTreasury = "secretary_of_the_treasury"
    case secretaryWar = "secretary_of_war"
    case attorneyGeneral = "attorney_general"
    case secretaryNavy = "secretary_of_the_navy"
    case secretaryInterior = "secretary_of_the_interior"
    case secretaryAgriculture = "secretary_of_agriculture"
    case secretaryCommerce = "secretary_of_commerce"
    case secretaryLabor = "secretary_of_labor"
  }
}

struct President: Identifiable, Codable {
  let id = UUID()  
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
  let startTerm: String
  let endTerm: String
  let birthPlace: String?
  let locationDied: String?
  let wikipediaPage: URL
  let cabinet: PresidentCabinet


  init(from decoder: Decoder) throws {
    func convertDate(_ date: String) -> String? {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY-MM-dd"
      guard let newDate = formatter.date(from: date) else { return nil }
      formatter.dateFormat = "MMMM d, YYYY"
      return formatter.string(from: newDate)
    }

    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try container.decode(String.self, forKey: .name)
    self.religion = try container.decode(String.self, forKey: .religion)
    self.nickname = try container.decodeIfPresent([String].self, forKey: .nickname)
    self.career = try container.decode(String.self, forKey: .career)
    self.firsts = try container.decode([String].self, forKey: .firsts)
    let born = try container.decode(String.self, forKey: .born)
    self.born = convertDate(born) ?? ""
    let died = try container.decodeIfPresent(String.self, forKey: .died)
    self.died = convertDate(died ?? "") ?? ""
    self.causeOfDeath = try container.decodeIfPresent(String.self, forKey: .causeOfDeath)
    self.restingPlace = try container.decodeIfPresent(String.self, forKey: .restingPlace)
    self.politicalParty = try container.decode(String.self, forKey: .politicalParty)
    self.parents = try container.decodeIfPresent([String].self, forKey: .parents)
    self.children = try container.decodeIfPresent([String].self, forKey: .children)
    self.spouses = try container.decodeIfPresent([String].self, forKey: .spouses)
    let startTerm = try container.decode(String.self, forKey: .startTerm)
    if startTerm.contains("\n") {
      let array = startTerm.split(separator: "\n").map({ String($0) }).map {
        convertDate($0) ?? ""
      }
      self.startTerm = array.joined(separator: "\n")
    } else {
      self.startTerm = convertDate(startTerm) ?? ""
    }
    let endTerm = try container.decode(String.self, forKey: .endTerm)
    if endTerm.contains("\n") {
      let array = endTerm.split(separator: "\n").map({ String($0) }).map {
        convertDate($0) ?? ""
      }
      self.endTerm = array.joined(separator: "\n")
    } else {
      self.endTerm = convertDate(endTerm) ?? ""
    }
    self.birthPlace = try container.decodeIfPresent(String.self, forKey: .birthPlace)
    self.locationDied = try container.decodeIfPresent(String.self, forKey: .locationDied)
    self.wikipediaPage = try container.decode(URL.self, forKey: .wikipediaPage)
    self.cabinet = try container.decode(PresidentCabinet.self, forKey: .cabinet)
  }

  enum CodingKeys: String, CodingKey {
    case name
    case religion
    case nickname
    case career
    case firsts
    case born
    case died
    case causeOfDeath = "cause_of_death"
    case restingPlace = "resting_place"
    case politicalParty = "political_party"
    case parents
    case children
    case spouses
    case startTerm = "start_term"
    case endTerm = "end_term"
    case birthPlace = "birth_place"
    case locationDied = "location_died"
    case wikipediaPage = "wikipedia"
    case cabinet
  }
}
