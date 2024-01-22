//
//  FavoriteView.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import Foundation
import SwiftUI
import Game

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter = .init(favoriteUseCase: GameInjection.init().provideFavorite())
    var body: some View {
        VStack{
            Text("Favorite List")
                .font(.title)
                .bold()
            if presenter.favoriteGame.isEmpty {
                VStack {
                    Image("no-data")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    
                    Text("No data")
                        .foregroundColor(.secondary)
                }
                
            } else {
                List{
                    ForEach(presenter.favoriteGame) { item in
                        presenter.linkBuilder(for: item) {
                            GameRow(game: item)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            presenter.getFavorite()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
