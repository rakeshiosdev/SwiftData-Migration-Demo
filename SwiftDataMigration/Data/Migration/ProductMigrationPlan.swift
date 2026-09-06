//
//  ProductMigrationPlan.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import SwiftData

// Light weight Migration
//enum ProductMigrationPlan: SchemaMigrationPlan {
//
//    static var schemas: [any VersionedSchema.Type] {
//        [
//            ProductSchemaV1.self,
//            ProductSchemaV2.self
//        ]
//    }
//
//    static var stages: [MigrationStage] {
//        [
//            migrateV1toV2
//        ]
//    }
//
//    static let migrateV1toV2 = MigrationStage.lightweight(
//        fromVersion: ProductSchemaV1.self,
//        toVersion: ProductSchemaV2.self
//    )
//}


//Heavy weight migration

//enum ProductMigrationPlan: SchemaMigrationPlan {
//
//    static var schemas: [any VersionedSchema.Type] {
//        [
//            ProductSchemaV1.self,
//            ProductSchemaV2.self
//        ]
//    }
//
//    static var stages: [MigrationStage] {
//        [
//            migrateV1toV2
//        ]
//    }
//
//    static let migrateV1toV2 =
//        MigrationStage.custom(
//            fromVersion: ProductSchemaV1.self,
//            toVersion: ProductSchemaV2.self,
//
//            willMigrate: { context in
//
//                let products = try context.fetch(
//                    FetchDescriptor<ProductSchemaV1.Product>()
//                )
//
//                print("V1 products: \(products.count)")
//            },
//
//            didMigrate: { context in
//
//                let products = try context.fetch(
//                    FetchDescriptor<ProductSchemaV2.Product>()
//                )
//
//                for product in products {
//                    product.qty = 1
//                }
//
//                try context.save()
//
//                print("All migrated products received qty = 1")
//            }
//        )
//}

enum ProductMigrationPlan: SchemaMigrationPlan {
    
    static var schemas: [any VersionedSchema.Type] {
        [
            ProductSchemaV2.self,
            ProductSchemaV3.self
        ]
    }
    
    static var stages: [MigrationStage] {
        [
            migrateV2toV3
        ]
    }
    
    static let migrateV2toV3 =
    MigrationStage.custom(
        
        fromVersion: ProductSchemaV2.self,
        toVersion: ProductSchemaV3.self,
        
        willMigrate: { context in
            
            print("🚀 V2 → V3 migration started")
            
            let products = try context.fetch(
                FetchDescriptor<ProductSchemaV2.Product>()
            )
            
            for product in products {
                
                // Make sure no product has nil qty
                if product.qty == nil {
                    product.qty = 1
                }
            }
            
            try context.save()
        },
        
        didMigrate: { context in
            
            print("✅ V2 → V3 migration completed")
            
            let products = try context.fetch(
                FetchDescriptor<ProductSchemaV3.Product>()
            )
            
            for product in products {
                
                print(
                    "\(product.name) → qty: \(product.qty)"
                )
            }
        }
    )
}
