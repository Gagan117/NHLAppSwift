//
//  StandingsModel.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import Foundation

struct StandingsResponse: Codable {
    let standings: [StandingsTeam]
}

struct StandingsTeam: Codable, Identifiable {
    let teamId: Int
    let teamName: TeamName
    let teamLogo: String
    let wins: Int
    let losses: Int
    let otLosses: Int
    let points: Int
    let streakCode: String
    let streakCount: Int
    let conferenceName: String

    var id: Int { teamId }
}

struct TeamName: Codable {
    let `default`: String
}



