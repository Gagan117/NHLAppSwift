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

    func fetchStandings() async {
        print("Fetching standings...")

        guard let url = URL(string: "https://api-web.nhle.com/v1/standings/now") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Data received:", data.count)

            let decoded = try JSONDecoder().decode(StandingsResponse.self, from: data)
            print("Decoded teams:", decoded.standings.count)

            standings = decoded.standings
        } catch {
            print("Decode error:", error)
        }
    }
}




