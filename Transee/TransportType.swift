//
//  Transport.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct TransportType {
    let type: String
    let items: [TransportItem]
}

extension TransportType: Decodable {
    static func create(type: String)(items: [TransportItem]) -> TransportType {
        return TransportType(type: type, items: items)
    }
    
    static func decode(json: JSON) -> Decoded<TransportType> {
        return TransportType.create
            <^> json <| "type"
            <*> json <|| "items"
    }
}
