//
//  ProductSchemaV1.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import SwiftData
import Foundation

enum ProductSchemaV1: VersionedSchema {

    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] {
        [Product.self]
    }

    @Model
    final class Product {
        @Attribute(.unique)
        var id: UUID

        var name: String
        var price: Double

        init(
            id: UUID = UUID(),
            name: String,
            price: Double
        ) {
            self.id = id
            self.name = name
            self.price = price
        }
    }
}
