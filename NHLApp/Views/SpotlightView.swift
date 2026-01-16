//
//  SpotlightView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import SwiftUI

struct SpotlightView: View {
    @StateObject var viewModel = SpotlightViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Spotlight...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(viewModel.players) { player in
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: player.headshot)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(player.fullName)
                                    .font(.headline)
                                Text("\(player.position) • \(player.teamTriCode) • #\(player.sweaterNumber)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Spotlight")
        }
        .task {
            await viewModel.fetchSpotlight()
        }
    }
}


