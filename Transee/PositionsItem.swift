//
//  PositionsItem.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct PositionsItem {
    let id: String
    let name: String
    let vehicles: [PositionsVehicle]
}

extension PositionsItem: Decodable {
    static func create(id: String)(name: String)(vehicle: [PositionsVehicle]) -> PositionsItem {
        return PositionsItem(id: id, name: name, vehicles: vehicle)
    }
    
    static func decode(json: JSON) -> Decoded<PositionsItem> {
        return PositionsItem.create
            <^> json <| "id"
            <*> json <| "name"
            <*> json <|| "items"
    }
}
