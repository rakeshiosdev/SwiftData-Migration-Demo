//
//  SwiftDataProductRepository.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import SwiftData
import Foundation

@MainActor
final class SwiftDataProductRepository: ProductRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchProducts() throws -> [Product] {
        let descriptor = FetchDescriptor<CurrentProductEntity>()
        
        let entities = try context.fetch(descriptor)
        
        return entities.map {
            Product(
                id: $0.id,
                name: $0.name,
                price: $0.price,
                qty: $0.qty
            )
        }
    }
    
    func addProduct(_ product: Product) throws {
        
        let entity = CurrentProductEntity(
            id: product.id,
            name: product.name,
            price: product.price,
            qty: product.qty
        )
        
        context.insert(entity)
        
        try context.save()
    }
    
    func deleteProduct(_ product: Product) throws {
        let productID = product.id
        
        let descriptor = FetchDescriptor<CurrentProductEntity>(
            predicate: #Predicate {
                $0.id == productID
            }
        )
        
        guard let entity = try context.fetch(descriptor).first else {
            return
        }
        
        context.delete(entity)
        try context.save()
    }
}
