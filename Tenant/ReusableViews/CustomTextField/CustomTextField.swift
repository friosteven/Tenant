//
//  CustomTextField.swift
//  Tenant
//
//  Created by John Steven Frio on 10/20/23.
//

import SwiftUI

struct CustomTextField: View {
    @ObservedObject var ctfProperties: CustomTextFieldProperties
    var textFieldType: CustomTextFieldType = .name
    /// image for
    var passwordToggleImage: String {
        isSecureField ? "eye.slash" : "eye"
    }

    @State private var isSecureField = true
    var didChangeText: (() -> Void)?
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 0) {
                if ctfProperties.textFieldState != .noError {
                    Text("*")
                        .foregroundColor(.red)
                }
                Text(textFieldType.labelName).multilineTextAlignment(.leading)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(ctfProperties.textFieldState.borderColor, lineWidth: 0.5)
                if textFieldType != .password {
                    defaultTextField()
                } else {
                    HStack(spacing: 0) {
                        if isSecureField {
                            SecureField(textFieldType.placeholder, text: $ctfProperties.textFieldValue)
                                .keyboardType(textFieldType.keyboardType)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .cornerRadius(8)
                                .onChange(of: ctfProperties.textFieldValue, perform: {
                                    validateField(text: $0)
                                    didChangeText?()
//                                    showErrorMessage()
                                })
                        } else {
                            defaultTextField()
                        }
                        Image(systemName: passwordToggleImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24).onTapGesture {
                                $isSecureField.wrappedValue.toggle()
                            }
                        Spacer()
                    }
                }
            }.frame(height: 40)
            if ctfProperties.textFieldState == .error {
                errorMessageView()
            }
        }
    }
}

/// VIEWS
extension CustomTextField {
    func errorMessageView() -> some View {
        Text(textFieldType.errorMessage)
            .foregroundColor(.red)
            .font(Font.custom("", size: 12))
    }

    private func defaultTextField() -> some View {
        TextField(textFieldType.placeholder,
                  text: $ctfProperties.textFieldValue,
                  onEditingChanged: { editingChanged in
                      setFieldState(editingChanged)
                  })
                  .keyboardType(textFieldType.keyboardType)
                  .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                  .cornerRadius(8)
                  .onChange(of: ctfProperties.textFieldValue, perform: {
                      validateField(text: $0)
                      didChangeText?()
                  })
    }
}

/// FUNCTIONS
extension CustomTextField {
    private func setFieldState(_ editingChanged: Bool) {
        if $ctfProperties.textFieldValue.wrappedValue == "" {
            let state = editingChanged ? CustomTextFieldState.selected : CustomTextFieldState.initial
            ctfProperties.textFieldState = state
        }
    }

    func validateField(text: String) {
        let state = getFieldValidation(text: text) ? CustomTextFieldState.noError : CustomTextFieldState.error
        ctfProperties.textFieldState = state
    }

    func getFieldValidation(text: String) -> Bool {
        ctfProperties.textFieldValue = text
        switch textFieldType {
        case .mobileNumber:
            return Validator.isValidMobileRegex(text)
        case .password:
            return Validator.isValidPasswordRegex(text)
        case .email:
            return Validator.isValidEmail(text)
        default:
            return false
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(ctfProperties: CustomTextFieldProperties())
    }
}

enum CustomTextFieldType {
    case name
    case email
    case mobileNumber
    case password
    case confirmPassword
    var labelName: String {
        switch self {
        case .name:
            return "Name:"
        case .email:
            return "Email"
        case .mobileNumber:
            return "Mobile Number"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        }
    }

    var placeholder: String {
        switch self {
        case .name:
            return "Enter Name"
        case .email:
            return "Enter email"
        case .mobileNumber:
            return "Enter mobile number"
        case .password:
            return "Enter password"
        case .confirmPassword:
            return "Re-enter password"
        }
    }

    var errorMessage: String {
        switch self {
        case .name:
            return "Invalid name"
        case .email:
            return "Invalid email"
        case .mobileNumber:
            return "Please input a valid mobile number."
        case .password:
            return "Password must have at least 1 capital alphabet, 1 numeric, 1 special character."
        case .confirmPassword:
            return "Password does not match."
        }
    }

    var keyboardType: UIKeyboardType {
        switch self {
        case .name:
            return .default
        case .email:
            return .emailAddress
        case .mobileNumber:
            return .numberPad
        case .password:
            return .default
        case .confirmPassword:
            return .default
        }
    }
}

enum CustomTextFieldState {
    case initial
    case error
    case noError
    case selected
    var borderColor: Color {
        switch self {
        case .initial:
            return Color("neutral_black-20")
        case .error:
            return .red
        case .noError:
            return Color.green
        case .selected:
            return Color.yellow
        }
    }
}
