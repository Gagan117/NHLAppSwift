//
//  StandingsViewModel.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import Foundation

@MainActor
class StandingsViewModel: ObservableObject {
    @Published var standings: [StandingsTeam] = []

    var standingsByConference: [String: [StandingsTeam]] {
        Dictionary(grouping: standings, by: { $0.conferenceName })
    }

    func fetchStandings() async {
        guard let url = URL(string: "https://api-web.nhle.com/v1/standings") else {
            print("❌ Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoded = try JSONDecoder().decode(StandingsResponse.self, from: data)

            standings = decoded.standings
            print("✅ Loaded \(standings.count) teams")

        } catch {
            print("❌ Error fetching standings:", error)
        }
    }
}



