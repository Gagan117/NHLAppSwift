//
//  NHLAppApp.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-16.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SpotlightView()
                .tabItem {
                    Label("Spotlight", systemImage: "star.fill")
                }

            StandingsView()
                .tabItem {
                    Label("Standings", systemImage: "list.number")
                }
        }
    }
}


@main
struct NHLApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}


