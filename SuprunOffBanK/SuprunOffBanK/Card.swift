//
//  Card.swift
//  SuprunOffBanK
//
//  Created by MacBookPro on 30.04.2024.
//

import Foundation

struct Card {
    /// Баланс карты
    private(set) var balance: Int
    let number: String
    
    mutating func add(sum: Int) {
        balance += sum
    }
    
    mutating func transfer(sum: Int, to: inout Card) {
        guard balance - sum > 0 else { return }
        balance -= sum
        to.add(sum: sum)
    }
}
