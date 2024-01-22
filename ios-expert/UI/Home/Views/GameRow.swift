//
//  GameRow.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import Game
import SwiftUI

struct GameRow: View {
    var game: GameModuleDomain
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.backgroundImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .cornerRadius(12)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(width: 200, height: 100)
                    .cornerRadius(12)
            }
            
            VStack (alignment: .leading, spacing:  12){
                Text(game.name)
                    .font(.title2)
                    .bold()
                Text(game.released)
                    .foregroundColor(.secondary)
            }

        }
    }
}
