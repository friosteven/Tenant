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
        VStack {
            VStack {
                ProgressView()
                    .tint(.pink)
            }
            .progressViewStyle(.linear)
            VStack(spacing: 24) {
                HStack {
                    CustomTextFieldV2(customTextFieldType: .xField,
                                    textFieldValue: $xField,
                                    isDisabled: .constant(false))
                    CustomTextFieldV2(customTextFieldType: .yField,
                                    textFieldValue: $yField,
                                    isDisabled: .constant(false))
                }
                HStack {
                    CustomTextFieldV2(customTextFieldType: .widthField,
                                    textFieldValue: $widthField,
                                    isDisabled: .constant(false))
                    CustomTextFieldV2(customTextFieldType: .heightField,
                                    textFieldValue: $heightField,
                                    isDisabled: .constant(false))
                }
                CustomTextFieldV2(customTextFieldType: .typeField,
                                textFieldValue: $typeField,
                                isDisabled: .constant(false))
                CustomTextFieldV2(customTextFieldType: .nameField,
                                textFieldValue: $nameField,
                                isDisabled: .constant(false))

                Button("Submit", action: {
                    let request = AddTenantRequest(name_input: nameField,
                                                   type_input: typeField,
                                                   x_input: Float(xField) ?? 0.0,
                                                   y_input: Float(yField) ?? 0.0,
                                                   width_input: Float(widthField) ?? 0.0,
                                                   height_input: Float(heightField) ?? 0.0)

                    viewModel.addTenant(request: request)
                })
            }
            .padding(24)
        }
        .environmentObject(viewModel)
    }
}

struct AddTenantView_Previews: PreviewProvider {
    static var previews: some View {
        AddTenantView()
    }
}
