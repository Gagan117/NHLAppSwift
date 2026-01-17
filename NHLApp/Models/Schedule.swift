//
//  Schedule.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//
import Foundation

struct ScheduleCalendarResponse: Codable {
    let startDate: String
    let endDate: String
    let teams: [ScheduleTeam]
}

struct ScheduleTeam: Codable, Identifiable {
    let id: Int
    let seasonId: Int
    let commonName: LocalizedName
    let abbrev: String
    let name: LocalizedName
    let logo: String
}

struct LocalizedName: Codable {
    let `default`: String
    let fr: String?
}



