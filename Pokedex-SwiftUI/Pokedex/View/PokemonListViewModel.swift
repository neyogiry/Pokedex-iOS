//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by neyogiry on 4/04/24.
//

import Foundation

final class PokemonListViewModel : ObservableObject {
    
    @Published var pokedex: [Pokemon] = []
    
    func fetchPokedex() async throws {
        do {
            pokedex = try await PokemonRepository.shared.all().results
        } catch {
            print(error)
        }
    }
    
}
