//
//  ProductListViewModel.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import Foundation

@MainActor
@Observable

final class ProductListViewModel {
    private let repository: ProductRepository
    
    var products = [Product]()
    var errorMessage: String?
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    
    func loadProducts() {
        do {
            products = try repository.fetchProducts()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteProduct(product: Product) {
        do {
            try repository.deleteProduct(product)
            loadProducts()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}
