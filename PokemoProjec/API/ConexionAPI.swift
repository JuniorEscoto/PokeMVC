//
//  ConexionAPI.swift
//  PokemoProjec
//
//  Created by user922809 on 6/3/20.
//  Copyright © 2020 user922809. All rights reserved.
//

import UIKit

class ConexionAPI: NSObject {
    static let shareInstance = ConexionAPI()
    
    func getPokemon() -> [pokemonClass] {
        return PokemonDetails
    }
    
}

extension UIImageView {
    func loadImge(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           self?.image = image
                    }
                }
            }
        }
    }
}
