//
//  ModelContainerFactory.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import Foundation
import SwiftData

enum ModelContainerFactory {
    static func create() -> ModelContainer {
        do {
            let schema = Schema(versionedSchema: ProductSchemaV3.self)
            
            let configuration = ModelConfiguration("ProductDatabase", isStoredInMemoryOnly: false)
            
//            let container = try ModelContainer(
//                for: schema,
//                migrationPlan: ProductMigrationPlan.self,
//                configurations: configuration
//            )
            
            let container = try ModelContainer(
                for: schema,
                configurations: configuration
            )
            
            if let url = container.configurations.first?.url {
                print("📁 SwiftData Database:")
                print(url.path)
            }
            return container
        } catch {
            fatalError(
                "Failed to create ModelContainer: \(error)"
            )
        }
    }
}
