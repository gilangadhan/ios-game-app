//
//  DetailView.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @ObservedObject var presenter: DetailPresenter
    var body: some View {
        VStack (alignment: .leading){
            AsyncImage(url: URL(string: presenter.game.backgroundImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:200)
                    .cornerRadius(12)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(width: 350,height:200)
            }
            
            VStack (alignment: .leading, spacing: 12){
                HStack{
                    Text(presenter.game.name)
                        .font(.title2)
                        .bold()
                    
                    Button {
                        presenter.updateFavoriteGame()
                    } label: {
                        if presenter.game.favorite {
                            Image(systemName: "heart.fill")
                                .font(.title2)
                        } else {
                            Image(systemName: "heart")
                                .font(.title2)
                        }
                    }
                }
                
                Text("Release date: \(presenter.game.released)")
                    .foregroundColor(.secondary)
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Rating: \(removeZero(presenter.game.rating))")
                }
            }
            
            Spacer()

        }
    }
}

func removeZero(_ value: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.maximumFractionDigits = 16
    return numberFormatter.string(from: NSNumber(value: value)) ?? ""
}


