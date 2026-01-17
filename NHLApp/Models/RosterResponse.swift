//
//  RosterResponse.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-17.
//

import Foundation

struct RosterResponse: Codable {
    let forwards: [RosterPlayer]
    let defensemen: [RosterPlayer]
    let goalies: [RosterPlayer]
}

struct RosterPlayer: Codable, Identifiable {
    let id: Int
    let headshot: String
    let firstName: NameField
    let lastName: NameField
    let positionCode: String
    let shootsCatches: String
    let sweaterNumber: Int
    
    // Optional: physical info
    let heightInInches: Int?
    let weightInPounds: Int?
    let birthDate: String?
    let birthCity: NameField?
    let birthCountry: String?
    let birthStateProvince: NameField?
    
    struct NameField: Codable {
        let `default`: String
        let cs: String?
        let fi: String?
        let sk: String?
        let sv: String?
    }
}

