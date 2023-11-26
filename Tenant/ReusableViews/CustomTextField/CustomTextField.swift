//
//  CustomTextField.swift
//  Tenant
//
//  Created by Steven Frio on 10/22/23.
//

import SwiftUI

struct CustomTextField: View {

    var customTextFieldType: CustomTextFieldType
    @Binding var textFieldValue: String
    @Binding var isDisabled: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(customTextFieldType.title)
                .font(Font.system(size: 12))
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                VStack {
                    TextField(customTextFieldType.placeholder, text: $textFieldValue)
                        .font(Font.system(size: 14))
                        .disabled(isDisabled)
                }
                .padding(16)
            }
        }
        .frame(height: 60)
    }
}
//
//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField(customTextFieldType: .xField, textFieldValue: .constant(""))
//    }
//}
