//
//  TransportItem.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct TransportItem {
    let id: String
    let name: String
}

extension TransportItem: Decodable {
    static func create(id: String)(name: String) -> TransportItem {
        return TransportItem(id: id, name: name)
    }
    
    static func decode(json: JSON) -> Decoded<TransportItem> {
        return TransportItem.create
            <^> json <| "id"
            <*> json <| "name"
    }
}
