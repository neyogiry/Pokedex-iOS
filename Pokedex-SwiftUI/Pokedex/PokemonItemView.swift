//
//  PokemonItemView.swift
//  Pokedex
//
//  Created by neyogiry on 8/12/22.
//

import SwiftUI

struct PokemonItemView: View {
    
    let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            Text(pokemon.name)
        }
        .padding(.all, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(.gray, lineWidth: 1)
        )
    }
}

struct PokemonItemView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemon = Pokemon(
            name: "Bulbasaur",
            url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
        )
        PokemonItemView(pokemon: pokemon)
    }
}
