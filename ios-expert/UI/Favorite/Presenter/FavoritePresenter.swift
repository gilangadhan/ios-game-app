//
//  FavoritePresenter.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import Foundation
import Combine
import SwiftUI
import Game

class FavoritePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let favoriteUseCase: FavoriteUseCase
    private var router = FavoriteRouter()
    
    @Published var favoriteGame: [GameModuleDomain] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavorite() {
        isLoading = true
        favoriteUseCase.getFavoriteGames()
          .receive(on: RunLoop.main)
          .sink(receiveCompletion: { completion in
              switch completion {
              case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.isError = true
              case .finished:
                self.isLoading = false
              }
            }, receiveValue: { games in
              self.favoriteGame = games
            })
            .store(in: &cancellables)
      }
    
    func linkBuilder<Content: View>(for game: GameModuleDomain, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(for: game)) {
            content()
        }
    }
}
