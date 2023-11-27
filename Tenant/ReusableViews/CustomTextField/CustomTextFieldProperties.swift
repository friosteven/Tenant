//
//  CustomTextFieldProperties.swift
//  Tenant
//
//  Created by Steven Frio on 11/3/23.
//

import Foundation

class CustomTextFieldProperties: ObservableObject {
    @Published var textFieldValue = ""
    @Published var textFieldState = CustomTextFieldState.initial
    @Published var onEditingChanged = false
}
