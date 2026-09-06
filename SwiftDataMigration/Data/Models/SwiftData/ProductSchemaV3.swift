//
//  ProductSchemaV3.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 06/09/26.
//

import Foundation
import SwiftData

enum ProductSchemaV3: VersionedSchema {

    static var versionIdentifier = Schema.Version(3, 0, 0)

    static var models: [any PersistentModel.Type] {
        [Product.self]
    }

    @Model
    final class Product {

        @Attribute(.unique)
        var id: UUID

        var name: String
        var price: Double

        // Required
        var qty: Int

        init(
            id: UUID = UUID(),
            name: String,
            price: Double,
            qty: Int = 1
        ) {
            self.id = id
            self.name = name
            self.price = price
            self.qty = qty
        }
    }
}
