//
//  StandingsView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import SwiftUI

struct StandingsView: View {
    @StateObject private var viewModel = StandingsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.standings) { team in
                HStack {
                    AsyncImage(url: URL(string: team.teamLogo)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 36, height: 36)

                    VStack(alignment: .leading) {
                        Text(team.teamName.default)
                            .font(.headline)

                        Text("\(team.wins)-\(team.losses)-\(team.otLosses) • \(team.points) pts")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Text("\(team.streakCode)\(team.streakCount)")
                        .font(.caption2)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 6)
            }
            .navigationTitle("Standings")
        }
        .onAppear {
            print("StandingsView appeared")
            Task {
                await viewModel.fetchStandings()
            }
        }
    }
}





