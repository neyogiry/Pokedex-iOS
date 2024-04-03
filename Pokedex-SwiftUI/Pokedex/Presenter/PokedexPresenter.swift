//
//  PokedexPresenter.swift
//  Pokedex
//
//  Created by neyogiry on 27/12/23.
//

import Foundation

class PokedexPresenter {
    
    func fetchPokedex() async throws -> Pokedex {
        return try await PokemonRepository.shared.all()
    }
    
}
