//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by neyogiry on 3/01/22.
//

import Foundation
import Alamofire

final class PokemonRepository: PokemonDataSource {
    
    static let shared = PokemonRepository()
    
    func all(
        success: @escaping (_ response: PokemonResponse) -> Void
    ) {
        
        let url = "\(Constants.baseUrl)\(Constants.all)"
        
        AF
            .request(url)
            .responseDecodable(of: PokemonResponse.self) { (response) in
                if let result = response.value {
                    success(result)
                }
            }
        
    }
    
}
