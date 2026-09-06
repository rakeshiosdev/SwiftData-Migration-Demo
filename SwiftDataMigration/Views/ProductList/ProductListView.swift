//
//  ProductListView.swift
//  SwiftDataMigration
//
//  Created by Rakesh's MacBook on 04/09/26.
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    private let repository: ProductRepository
    @State private var viewModel: ProductListViewModel
    @State private var showAddProduct = false
    
    init(repository: ProductRepository) {
        self.repository = repository
        _viewModel = State(initialValue: ProductListViewModel(repository: repository))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products, id: \.id) { product in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                            
                            Text(
                                product.price,
                                format: .currency(code: "INR")
                            )
                            .foregroundStyle(.secondary)
                            
                            Text("Qty: \(product.qty)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let product = viewModel.products[index]
                        viewModel.deleteProduct(product: product)
                    }
                }
            }
            .navigationTitle("Products")
            
            .toolbar {
                ToolbarItem(
                    placement: .topBarTrailing
                ) {
                    Button {
                        showAddProduct = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .task {
                viewModel.loadProducts()
            }
            
            .sheet(isPresented: $showAddProduct, onDismiss: {
                viewModel.loadProducts()
            }) {
                AddProductView(
                    repository: repository
                )
            }
        }
    }
}
