//
//  StandingsView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import SwiftUI

struct StandingsView: View {
    @StateObject var viewModel = StandingsViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.standingsByConference.keys.sorted(), id: \.self) { conference in
                    Section(header: Text(conference)) {
                        ForEach(viewModel.standingsByConference[conference] ?? []) { team in
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
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Standings")
        }
        .task {
            await viewModel.fetchStandings()
        }
    }
}



