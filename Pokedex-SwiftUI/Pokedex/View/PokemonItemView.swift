//
//  PokemonItemView.swift
//  Pokedex
//
//  Created by neyogiry on 8/12/22.
//

import SwiftUI

struct PokemonItemView: View {
    
    private let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageURL(pokemon.url))) { image in
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
    
    private func imageURL(_ url: String) -> String {
        let baseImageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%@.png"
        let array = url.components(separatedBy: "/")
        print(array)
        let id = array[array.count-2]
        print(id)
        return String(format: baseImageUrl, arguments: [id])
    }
    
}

struct PokemonItemView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemon = Pokemon(
            name: "Bulbasaur",
            url: "https://pokeapi.co/api/v2/pokemon/1/"
        )
        PokemonItemView(pokemon: pokemon)
    }
}
