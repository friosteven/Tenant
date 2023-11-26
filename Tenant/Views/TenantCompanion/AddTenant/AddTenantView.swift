//
//  AddTenantView.swift
//  Tenant
//
//  Created by Steven Frio on 10/29/23.
//

import SwiftUI

struct AddTenantView: View {
    @State private var xField: String = ""
    @State private var yField: String = ""
    @State private var widthField: String = ""
    @State private var heightField: String = ""
    @State private var nameField: String = ""
    @State private var typeField: String = ""

    @EnvironmentObject var viewModel: TenantCompanionViewModel

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                CustomTextField(customTextFieldType: .xField,
                                textFieldValue: $xField,
                                isDisabled: .constant(false))
                CustomTextField(customTextFieldType: .yField,
                                textFieldValue: $yField,
                                isDisabled: .constant(false))
            }
            HStack {
                CustomTextField(customTextFieldType: .widthField,
                                textFieldValue: $widthField,
                                isDisabled: .constant(false))
                CustomTextField(customTextFieldType: .heightField,
                                textFieldValue: $heightField,
                                isDisabled: .constant(false))
            }
            CustomTextField(customTextFieldType: .typeField,
                            textFieldValue: $typeField,
                            isDisabled: .constant(false))
            CustomTextField(customTextFieldType: .nameField,
                            textFieldValue: $nameField,
                            isDisabled: .constant(false))

            Button("Submit", action: {
                let request = AddTenantRequest(name: nameField,
                                               type: typeField,
                                               x: Float(xField) ?? 0.0,
                                               y: Float(yField) ?? 0.0,
                                               width: Float(widthField) ?? 0.0,
                                               height: Float(heightField) ?? 0.0)
                
                viewModel.addTenant(request: request)
            })
        }
        .padding(24)
        .environmentObject(viewModel)
    }
}

struct AddTenantView_Previews: PreviewProvider {
    static var previews: some View {
        AddTenantView()
    }
}
