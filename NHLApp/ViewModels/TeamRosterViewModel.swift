//
//  TeamRosterViewModel.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-17.
//

import Foundation

@MainActor
class TeamRosterViewModel: ObservableObject {
    @Published var forwards: [RosterPlayer] = []
    @Published var defensemen: [RosterPlayer] = []
    @Published var goalies: [RosterPlayer] = []
    @Published var errorMessage: String? = nil
    
    func fetchRoster(teamCode: String) async {
        guard let url = URL(string: "https://api-web.nhle.com/v1/roster/\(teamCode)/current") else {
            errorMessage = "Invalid team code"
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(RosterResponse.self, from: data)
            
            // Update published properties
            forwards = decoded.forwards
            defensemen = decoded.defensemen
            goalies = decoded.goalies
            
        } catch {
            errorMessage = "Failed to fetch roster: \(error.localizedDescription)"
        }
    }
}

