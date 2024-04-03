//
//  PokemonListView.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/22.
//

import SwiftUI

struct PokemonListView: View {
    
    @State private var pokedex: [Pokemon] = []
    private let presenter = PokedexPresenter()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        LazyVGrid(columns: columns) {
            ForEach(pokedex, id: \.name) { pokemon in
                PokemonItemView(pokemon: pokemon)
            }
        }
        .task {
            do {
                pokedex = try await presenter.fetchPokedex().results
            } catch {
                print(error)
            }
            
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
