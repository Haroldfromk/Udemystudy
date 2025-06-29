//
//  Currency.swift
//  LOTRConverter17
//
//  Created by Dongik Song on 3/7/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    //case fakeSilverPenny = 64
    
    // var id: Double { rawValue }
    var id: Currency { self }

    
    var image: ImageResource {
        switch self {
        case .copperPenny: .copperpenny
        case .silverPenny: .silverpenny
        case .silverPiece: .silverpiece
        case .goldPenny: .goldpenny
        case .goldPiece: .goldpiece
//        case .fakeSilverPenny:
//                .parchment
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny: "Copper Penny"
        case .silverPenny: "Silver Penny"
        case .silverPiece: "Silver Piece"
        case .goldPenny: "Gold Penny"
        case .goldPiece: "Gold Piece"
//        case .fakeSilverPenny:
//            "parchment"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format:"%.2f", convertedAmount)
    }
}
