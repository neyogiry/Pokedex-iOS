//
//  PokemonListView.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/22.
//

import SwiftUI

struct PokemonListView: View {
    
    let list: [Pokemon]
    
    init(list: [Pokemon]) {
        self.list = list
    }
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        LazyVGrid(columns: columns) {
            ForEach(list) { pokemon in
                PokemonItemView(pokemon: pokemon)
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        let list = [
            Pokemon(name: "Bulbasaur", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
            Pokemon(name: "Ivysaur", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png"),
            Pokemon(name: "Venusaur", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"),
            Pokemon(name: "Charmander", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")
        ]
        PokemonListView(list: list)
    }
}
