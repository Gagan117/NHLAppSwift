//
//  DailyScheduleViewModel.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import Foundation

@MainActor
class DailyScheduleViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    func fetchSchedule(for date: Date = Date()) async {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        let urlString = "https://api-web.nhle.com/v1/schedule-calendar/\(dateString)"
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(ScheduleCalendarResponse.self, from: data)
            
            // Pair teams into games
            var tempGames: [Game] = []
            let teams = response.teams
            
            for i in stride(from: 0, to: teams.count, by: 2) {
                if i + 1 < teams.count {
                    let game = Game(home: teams[i], away: teams[i + 1])
                    tempGames.append(game)
                }
            }
            
            self.games = tempGames
            
        } catch {
            print("Schedule fetch error:", error)
        }
    }
}




