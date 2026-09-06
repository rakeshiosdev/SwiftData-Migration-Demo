//
//  AddProductView.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: AddProductViewModel
    
    init(repository: ProductRepository) {
        _viewModel = State(initialValue: AddProductViewModel(repository: repository))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Product") {
                    TextField("Product Name", text: $viewModel.name)
                    TextField("Price", text: $viewModel.price)
                    TextField(
                        "Quantity",
                        text: $viewModel.qty
                    )
                    .keyboardType(.numberPad)
                    
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundStyle(.red)
                    }
                }
                
                Section() {
                    Button("Add Product") {
                        let success = viewModel.addProduct()
                        
                        if success {
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Add Product")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
