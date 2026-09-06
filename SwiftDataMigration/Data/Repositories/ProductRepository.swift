//
//  ProductRepository.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

protocol ProductRepository {
    func fetchProducts() throws -> [Product]
    func addProduct(_ product: Product) throws
    func deleteProduct(_ product: Product) throws
}
