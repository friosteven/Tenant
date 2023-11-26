//
//  TenantCompanion.swift
//  Tenant
//
//  Created by Steven Frio on 10/7/23.
//

import SwiftUI

struct TenantCompanion: View {

    @State private var imageWidth: String = ""
    @State private var imageHeight: String = ""

    @State private var isAlertShown = false
    @State private var isBottomSheetShown = false
    @State private var sheetType: TenantCompanionSheetType?

    @StateObject private var viewModel = TenantCompanionViewModel()


    var body: some View {
        VStack {
            VStack(spacing: 16) {
                HStack(spacing: 8) {
                    CustomTextField(customTextFieldType: .imageWidth,
                                    textFieldValue: $imageWidth,
                                    isDisabled: .constant(true))
                    CustomTextField(customTextFieldType: .imageHeight,
                                    textFieldValue: $imageHeight,
                                    isDisabled: .constant(true))
                }
                Button(action: {
                    sheetType = .editImageDimensions
                    isBottomSheetShown = true
                }, label: {
                    Text("Edit Dimensions")
                })
                Button(action: {
                    sheetType = .addTenant
                    isBottomSheetShown = true
                }, label: {
                    Text("Add Tenant")
                })
                Spacer()
            }
        }
        .padding(16)
        .alert(isPresented: $viewModel.showAlert, content: {
            return Alert(title: Text(""),
                         message: Text(viewModel.addTenantMessage.capitalized ?? ""),
                         dismissButton: Alert.Button.cancel(
                            Text("Ok"),
                            action: {

                            })
            )
        })
        .sheet(isPresented: $isBottomSheetShown) { [sheetType] in
            if let sheetType = sheetType {
                switch sheetType {
                case .editImageDimensions:
                    EditableAlert(imageWidth: $imageWidth,
                                  imageHeight: $imageHeight)
                    .presentationDetents([.fraction(0.25)])
                    .environmentObject(viewModel)
                case .addTenant:
                    AddTenantView()
                        .presentationDetents([.fraction(0.60)])
                        .environmentObject(viewModel)
                }
            }
        }
        .onAppear(perform: {
            imageWidth = String(viewModel.getFloorPlanImageWidthAndHeight().width)
            imageHeight = String(viewModel.getFloorPlanImageWidthAndHeight().height)
        })

        // TODO: - input data from figma (x,y, width, height), automatically calculate corresponding supabase values then insert to Tenants.table on supabase
        
    }
}

struct TenantCompanion_Previews: PreviewProvider {
    static var previews: some View {
        TenantCompanion()
    }
}

enum TenantCompanionSheetType {
    case editImageDimensions
    case addTenant
}
