//
//  AddProductViewModel.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import Foundation

@MainActor
@Observable
final class AddProductViewModel {
    private let repository: ProductRepository
    
    var name = ""
    var price = ""
    var qty = ""
    
    var errorMessage: String?
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func addProduct() -> Bool {
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter product name"
            return false
        }
        
        guard let priceValue = Double(price), priceValue >= 0 else {
            errorMessage = "Please enter a valid price"
            return false
        }
        
        guard let qtyValue = Int(qty), qtyValue > 0 else {
            errorMessage = "Please enter a valid quantity"
            return false
        }
        
        do {
            let product = Product(
                id: UUID(),
                name: name,
                price: priceValue,
                qty: qtyValue
            )
            try repository.addProduct(product)
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
