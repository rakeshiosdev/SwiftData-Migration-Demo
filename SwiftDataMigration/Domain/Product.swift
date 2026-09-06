//
//  Product.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import Foundation

struct Product: Identifiable {
    let id: UUID
    let name: String
    let price: Double
    let qty: Int
}
