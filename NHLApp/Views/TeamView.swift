//
//  TeamView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-17.
//

import SwiftUI

struct TeamView: View {
    let team: ScheduleTeam
    
    var body: some View {
        VStack(spacing: 8) {
            if let url = URL(string: team.logo) {
                SVGImageView(url: url)
                    .frame(width: 60, height: 60)
                    .scaledToFit()
            }

            Text(team.commonName.default)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(2) // optional, handles long names
        }
    }
}


