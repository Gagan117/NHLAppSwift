//
//  TeamRosterView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-17.
//

import SwiftUI

struct TeamRosterView: View {
    let teamCode: String
    @StateObject private var viewModel = TeamRosterViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.forwards + viewModel.defensemen + viewModel.goalies) { player in
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: player.headshot)) { image in
                            image.resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text("\(player.firstName.default) \(player.lastName.default)")
                                .font(.headline)
                            Text("\(player.positionCode) • #\(player.sweaterNumber)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
        }
        .navigationTitle(teamCode)
        .task {
            await viewModel.fetchRoster(teamCode: teamCode)
        }
    }
}

