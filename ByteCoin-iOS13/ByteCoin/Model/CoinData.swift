//
//  CoinData.swift
//  ByteCoin
//
//  Created by Dongik Song on 3/13/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData : Decodable {
    
    let asset_id_base : String
    let asset_id_quote : String
    let rate : Double
    
}
