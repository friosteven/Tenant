//
//  StoreMainView.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import SwiftUI

struct StoreMainView: View {

    @StateObject private var viewModel = StoreHomeViewModel()

    @State private var keyword: String = ""
    @State private var isSearching = false
    var selectedCategoryValue = "All"
    @State private var selectedCategory = ""

    var body: some View {
        VStack {
            SearchBarView(text: $keyword, isSearching: $isSearching)

            ScrollViewReader { scrollViewReader in
                categoryView()
                    .onChange(of: viewModel.categories) { data in
                        if data != nil {
                            scrollViewReader.scrollTo(selectedCategoryValue, anchor: .center)
                        }
                    }
            }

            ProductGridView(products: filterByKeywordAndCategory())
                .padding(16)
                .onAppear(perform: {
                    viewModel.getAllCategories()
                    viewModel.getProducts()
                })
        }.onAppear {
            selectedCategory = selectedCategoryValue
        }
    }
}

// SUBVIEWS
extension StoreMainView {
    private func categoryView() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.categories ?? [], id: \.self) { data in
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(self.selectedCategory == data ? .blue : .gray)
                        CategoriesCell(title: data, size: 14)
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(self.selectedCategory == data ? .blue : .gray, lineWidth: 1)
                    }
                    .frame(width: 120, height: 120)
                    .onTapGesture {
                        self.selectedCategory = data
                    }
                    .id(data)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

extension StoreMainView {
    private func filterByKeyword() -> Products {
        if keyword.isEmpty {
            return viewModel.productsArr
        } else {
            return viewModel.productsArr.filter { ($0.productName.lowercased()).contains($keyword.wrappedValue.lowercased()) }
        }
    }

    private func filterByKeywordAndCategory() -> Products {
        if selectedCategory != "All" {
            return filterByKeyword().filter {
                ($0.category ?? "").lowercased().contains(selectedCategory.lowercased())
            }
        } else {
            return filterByKeyword()
        }
    }
}

struct StoreMainView_Previews: PreviewProvider {
    static var previews: some View {
        StoreMainView()
    }
}
