//
//  AppDependencies.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 06/09/26.
//

import SwiftData

@MainActor
final class AppDependencies {
    let modelContainer: ModelContainer
    let productRepository: ProductRepository
    
    init() {
        let container = ModelContainerFactory.create()
        
        self.modelContainer = container
        
        self.productRepository = SwiftDataProductRepository(context: container.mainContext)
    }
}
