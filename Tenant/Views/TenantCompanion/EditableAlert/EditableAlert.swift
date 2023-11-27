//
//  EditableAlert.swift
//  Tenant
//
//  Created by Steven Frio on 10/29/23.
//

import SwiftUI

struct EditableAlert: View {

    @Binding var imageWidth: String
    @Binding var imageHeight: String

    @State private var tfImageWidth = ""
    @State private var tfImageHeight = ""

    @EnvironmentObject var viewModel: TenantCompanionViewModel

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                CustomTextFieldV2(customTextFieldType: .imageWidth,
                                textFieldValue: $tfImageWidth,
                                isDisabled: .constant(false))
                CustomTextFieldV2(customTextFieldType: .imageHeight,
                                textFieldValue: $tfImageHeight,
                                isDisabled: .constant(false))
            }
            Button("Set as Default", action: {
                viewModel.setFloorPlanImageWidthAndHeight(width: Float(tfImageWidth) ?? 0,
                                                          height: Float(tfImageHeight) ?? 0)
                imageWidth = tfImageWidth
                imageHeight = tfImageHeight
                presentationMode.wrappedValue.dismiss()
            })
        }
        .padding(16)
        .onAppear(perform: {
            imageWidth = String(viewModel.getFloorPlanImageWidthAndHeight().width)
            imageHeight = String(viewModel.getFloorPlanImageWidthAndHeight().height)
        })
        .environmentObject(viewModel)
    }
}

//struct EditableAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        EditableAlert()
//    }
//}
