//
//  ios_expertApp.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import SwiftUI
import Game

@main
struct ios_expertApp: App {
    let homePresenter = HomePresenter(homeUseCase: GameInjection.init().provideHome())
    let favoritePresenter = FavoritePresenter(favoriteUseCase: GameInjection.init().provideFavorite())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
