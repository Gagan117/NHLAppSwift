//
//  DailyScheduleView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import SwiftUI

struct DailyScheduleView: View {
    @StateObject private var viewModel = DailyScheduleViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.games) { game in
                        GameCardView(game: game)
                    }
                }
                .padding()
            }
            .navigationTitle("Today's Games")
            .task {
                await viewModel.fetchSchedule()
            }
        }
    }
}



