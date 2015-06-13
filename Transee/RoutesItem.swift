//
//  RoutesItem.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct RoutesItem {
    let id: String
    let route: [LatLon]
}

extension RoutesItem: Decodable {
    static func create(id: String)(route: [LatLon]) -> RoutesItem {
        return RoutesItem(id: id, route: route)
    }
    
    static func decode(json: JSON) -> Decoded<RoutesItem> {
        return RoutesItem.create
            <^> json <| "id"
            <*> json <|| "route"
    }
}
