//
//  SearchBarView.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.leading, 24)
                .padding(.trailing, 8)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)

                        if isSearching {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isSearching = true
                }

            if isSearching {
                Button(action: {
                    self.isSearching = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .padding(.trailing, 8)
                }
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(isSearching)
    }
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), isSearching: .constant(false))
    }
}
