//
//  Game.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-17.
//

import Foundation

struct Game: Identifiable {
    let id = UUID()
    let home: ScheduleTeam
    let away: ScheduleTeam
}

