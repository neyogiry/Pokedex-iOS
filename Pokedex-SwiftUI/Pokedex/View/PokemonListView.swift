//
//  PokemonListView.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/22.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject private var viewModel = PokemonListViewModel()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        LazyVGrid(columns: columns) {
            ForEach(viewModel.pokedex, id: \.name) { pokemon in
                PokemonItemView(pokemon: pokemon)
            }
        }
        .task {
            do {
                try await viewModel.fetchPokedex()
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
