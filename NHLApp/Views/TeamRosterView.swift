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
                
                // MARK: Forwards
                if !viewModel.forwards.isEmpty {
                    Section(header: Text("Forwards")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    ) {
                        playerList(players: viewModel.forwards)
                    }
                }
                
                // MARK: Defensemen
                if !viewModel.defensemen.isEmpty {
                    Section(header: Text("Defensemen")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    ) {
                        playerList(players: viewModel.defensemen)
                    }
                }
                
                // MARK: Goalies
                if !viewModel.goalies.isEmpty {
                    Section(header: Text("Goalies")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    ) {
                        playerList(players: viewModel.goalies)
                    }
                }
            }
        }
        .navigationTitle(teamCode)
        .task {
            await viewModel.fetchRoster(teamCode: teamCode)
        }
    }
    
    // Helper function to render a list of players
    @ViewBuilder
    private func playerList(players: [RosterPlayer]) -> some View {
        ForEach(players) { player in
            HStack(spacing: 12) {
                
                // Player headshot
                AsyncImage(url: URL(string: player.headshot)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
                
                // Player info
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(player.firstName.default) \(player.lastName.default)")
                        .font(.headline)
                    
                    Text("\(player.positionCode) • #\(player.sweaterNumber) • \(player.shootsCatches)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Optional physical info
                    if let height = player.heightInInches, let weight = player.weightInPounds {
                        Text("\(height) in • \(weight) lbs")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    
                    if let city = player.birthCity?.default, let country = player.birthCountry {
                        Text("\(city), \(country)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .shadow(radius: 1)
        }
    }
}



