//
//  SwiftDataMigrationApp.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataMigrationApp: App {
    private let dependencies: AppDependencies
    
    init() {
        self.dependencies = AppDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ProductListView(repository: dependencies.productRepository)
        }
        .modelContainer(dependencies.modelContainer)
    }
}
