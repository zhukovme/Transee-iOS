//
//  RoutesType.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct RoutesType {
    let type: String
    let items: [RoutesItem]
}

extension RoutesType: Decodable {
    static func create(type: String)(items: [RoutesItem]) -> RoutesType {
        return RoutesType(type: type, items: items)
    }
    
    static func decode(json: JSON) -> Decoded<RoutesType> {
        return RoutesType.create
            <^> json <| "type"
            <*> json <|| "items"
    }
}
