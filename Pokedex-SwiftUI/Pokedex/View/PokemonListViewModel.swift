//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by neyogiry on 4/04/24.
//

import Foundation

@Observable
final class PokemonListViewModel {
    
    private let repository: PokemonRepository = PokemonRepository.shared
    
    var pokedex: [Pokemon] = []
    
    func fetchPokedex() async throws {
        do {
            pokedex = try await repository.all().results
        } catch {
            print(error)
        }
    }
    
}
