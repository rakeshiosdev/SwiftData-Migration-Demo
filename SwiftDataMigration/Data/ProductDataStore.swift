//
//  ProductDataStore.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

//import SwiftData
//import Foundation
//
//@MainActor
//final class ProductDataStore {
//    private let modelContext: ModelContext
//    
//    init(modelContext: ModelContext) {
//        self.modelContext = modelContext
//    }
//    
//    func addProduct(name: String, price: Double) throws {
//        let product = Product(name: name, price: price)
//        
//        modelContext.insert(product)
//        try modelContext.save()
//    }
//    
//    func fetchProduct() throws -> [Product] {
//        let descripter = FetchDescriptor<Product>(
//            sortBy: [SortDescriptor(\.name)]
//        )
//        return try modelContext.fetch(descripter)
//    }
//    
//    func deleteProduct(product: Product) throws {
//        modelContext.delete(product)
//        try modelContext.save()
//    }
//}
