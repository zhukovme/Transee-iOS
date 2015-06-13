//
//  StationsItem.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct StationsItem {
    let id: String
    let position: LatLon
}

extension StationsItem: Decodable {
    static func create(id: String)(position: LatLon) -> StationsItem {
        return StationsItem(id: id, position: position)
    }
    
    static func decode(json: JSON) -> Decoded<StationsItem> {
        return StationsItem.create
            <^> json <| "id"
            <*> json <| "position"
    }
}
