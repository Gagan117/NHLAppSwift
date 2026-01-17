//
//  GameCardView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import SwiftUI

struct GameCardView: View {
    let game: Game
    
    var body: some View {
        HStack(spacing: 20) {
            TeamView(team: game.home)
            Text("VS")
                .font(.headline)
                .foregroundColor(.secondary)
            TeamView(team: game.away)
        }
        .padding()
        .frame(maxWidth: .infinity) // <-- make it stretch
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}



