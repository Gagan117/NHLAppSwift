//
//  SpotlightViewModel.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import Foundation
import SwiftUI

@MainActor
class SpotlightViewModel: ObservableObject {
    @Published var players: [SpotlightPlayer] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchSpotlight() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://api-web.nhle.com/v1/player-spotlight") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Debug: print raw JSON if needed
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }

            let decoded = try JSONDecoder().decode([SpotlightPlayer].self, from: data)
            players = decoded.sorted { $0.sortId < $1.sortId } // optional: sort by sortId
        } catch {
            print("Error fetching spotlight:", error)
            errorMessage = "Failed to load data"
        }

        isLoading = false
    }
}


