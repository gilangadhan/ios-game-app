//
//  ContentView.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import SwiftUI
import Game

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    var body: some View {
        NavigationStack {
            TabView {
                HomeView(vm: homePresenter)
                    .tabItem {
                        Image(systemName: "house")
                    }
                FavoriteView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HomePresenter(homeUseCase: GameInjection.init().provideHome()))
            .environmentObject(FavoritePresenter(favoriteUseCase: GameInjection.init().provideFavorite()))
    }
}
