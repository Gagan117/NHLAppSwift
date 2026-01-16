//
//  StandingsModel.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import Foundation

// Top-level response
struct StandingsResponse: Codable {
    let wildCardIndicator: Bool
    let standingsDateTimeUtc: String
    let standings: [StandingsTeam]
}

// Team object
struct StandingsTeam: Codable, Identifiable {
    let teamName: TeamName
    let teamCommonName: TeamName
    let teamAbbrev: TeamName
    let teamLogo: String

    let wins: Int
    let losses: Int
    let otLosses: Int
    let points: Int
    let streakCode: String
    let streakCount: Int

    let conferenceName: String
    let divisionName: String
    let gamesPlayed: Int

    // NHL API does NOT give teamId — so create our own ID
    var id: String {
        teamAbbrev.default
    }
}

struct TeamName: Codable {
    let `default`: String
}





