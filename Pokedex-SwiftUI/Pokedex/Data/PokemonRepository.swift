//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by neyogiry on 28/12/23.
//

import Foundation

class PokemonRepository: PokemonDataSource {
    
    static let shared = PokemonRepository()
    
    func all() async throws -> Pokedex {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(Pokedex.self, from: data)
        } catch {
            throw ServiceError.invalidData
        }
    }
    
}

enum ServiceError : Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
