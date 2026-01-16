//
//  PlayerSpotlight.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import Foundation

struct SpotlightPlayer: Codable, Identifiable {
    let playerId: Int
    let name: PlayerName
    let playerSlug: String
    let position: String
    let sweaterNumber: Int
    let teamId: Int
    let headshot: String
    let teamTriCode: String
    let teamLogo: String
    let sortId: Int
    
    // Computed properties
    var id: Int { playerId }           // for Identifiable
    var fullName: String { name.default }
    
    // Optional: map CodingKeys explicitly
    enum CodingKeys: String, CodingKey {
        case playerId, name, playerSlug, position, sweaterNumber, teamId, headshot, teamTriCode, teamLogo, sortId
    }
}

struct PlayerName: Codable {
    let `default`: String
    let cs: String?
    let fi: String?
    let sk: String?
}



