//
//  HomeView.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import SwiftUI
import Game

struct HomeView: View {
    @ObservedObject var vm: HomePresenter = .init(homeUseCase: GameInjection.init().provideHome())
    var body: some View {
        VStack {
            Text("Game List")
                .font(.title)
                .bold()
            Spacer()
            if vm.games.isEmpty {
                VStack{
                    ProgressView()
                }
            } else {
                List{
                    ForEach(vm.games){ item in
                        vm.linkBuilder(for: item) {
                            GameRow(game: item)
                        }
                        
                    }
                }
                .listStyle(.plain)
            }
            Spacer()
        }
        .onAppear{
            vm.getGames()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

