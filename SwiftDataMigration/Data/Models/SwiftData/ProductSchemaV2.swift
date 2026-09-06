//
//  ProductSchemaV2.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import Foundation
import SwiftData

enum ProductSchemaV2: VersionedSchema {

    static var versionIdentifier = Schema.Version(2, 0, 0)

    static var models: [any PersistentModel.Type] {
        [Product.self]
    }

    @Model
    final class Product {
        @Attribute(.unique)
        var id: UUID

        var name: String
        var price: Double
        var qty: Int?

        init(
            id: UUID = UUID(),
            name: String,
            price: Double,
            qty: Int? = nil
        ) {
            self.id = id
            self.name = name
            self.price = price
            self.qty = qty
        }
    }
}
