//
//  Poke.swift
//  PokemoProjec
//
//  Created by user922809 on 6/3/20.
//  Copyright © 2020 user922809. All rights reserved.
//

import Foundation

enum Abilty {
    case fire, water, rock, air, poision, ice, electricity, dragon
}

class pokemonClass: NSObject {
    let name: String
    let id: Int
    let detailInfo: String
    let type: [Abilty]
    let weak: [Abilty]
    let pokeImgUrl: String
    
    //constructor
    init(name:String, id: Int, detailInfo:String, type:[Abilty],weak: [Abilty], pokeUrl: String) {
        self.name = name
        self.id = id
        self.detailInfo = detailInfo
        self.type = type
        self.weak = weak
        self.pokeImgUrl = pokeUrl
        
    }
    
}
