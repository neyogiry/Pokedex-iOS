//
//  PokemonListView.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/22.
//

import SwiftUI

struct PokemonListView: View {
    
    @State private var viewModel = PokemonListViewModel()
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.pokedex, id: \.name) { pokemon in
                    PokemonItemView(pokemon: pokemon)
                }
            }
            .padding(10)
            .task {
                do {
                    try await viewModel.fetchPokedex()
                } catch {
                    print(error)
                }
                
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
