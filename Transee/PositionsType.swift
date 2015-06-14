//
//  PositionsType.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct PositionsType {
    let type: String
    let items: [PositionsItem]
}

extension PositionsType: Decodable {
    static func create(type: String)(items: [PositionsItem]) -> PositionsType {
        return PositionsType(type: type, items: items)
    }
    
    static func decode(json: JSON) -> Decoded<PositionsType> {
        return PositionsType.create
            <^> json <| "type"
            <*> json <|| "items"
    }
}
