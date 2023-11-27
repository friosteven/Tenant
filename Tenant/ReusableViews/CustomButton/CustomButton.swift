//
//  CustomButton.swift
//  Tenant
//
//  Created by Steven Frio on 11/14/23.
//

import SwiftUI

struct CustomButton: View {
    ///
    var customButtonType: CustomButtonType = .cancel
    /// setting non-empty string value will enable rightImage
    var rightImage: String = ""
    /// if isCapsule == true, corner will be rounded
    var isCapsule: Bool = false
    var didTap: (() -> Void)?
    /// No need to override outside the class
    ///
    var buttonHeight: CGFloat = 40
    var cornerRadius: CGFloat {
        isCapsule ? buttonHeight : 4
    }

    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: cornerRadius)
//                .fill(customButtonType.background)
            Button {
                self.didTap?()
            } label: {
                HStack {
                    Text(customButtonType.title)
                        .foregroundColor(customButtonType.titleColor)
                    if !rightImage.isEmpty {
                        Image(rightImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: buttonHeight)
            }.background(customButtonType.background)
                .cornerRadius(cornerRadius)
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(customButtonType.borderColor, lineWidth: 1)
                .cornerRadius(cornerRadius)
        }.frame(height: buttonHeight)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}

enum CustomButtonType {
    case login
    case signup
    case cancel
    case facebook
    case google
    case addToCart
    case sortFilter
    case proceed
    var background: Color {
        switch self {
        case .login:
            return Color("primary_purple")
        case .signup:
            return Color("primary_purple")
        case .proceed:
            return Color("primary_purple")
        case .facebook:
            return Color("fb_blue")
        default:
            return Color.white
        }
    }

    var borderColor: Color {
        switch self {
        case .cancel:
            return Color.red
        case .facebook:
            return Color("fb_blue")
        case .google:
            return Color.black
        default:
            return Color("primary_purple")
        }
    }

    var title: String {
        switch self {
        case .login:
            return "Log in"
        case .signup:
            return "Sign-up"
        case .cancel:
            return "Cancel"
        case .facebook:
            return "Log in with Facebook"
        case .google:
            return "Log in with Google"
        case .addToCart:
            return "Add To Cart"
        case .sortFilter:
            return "Sort and Filter"
        case .proceed:
            return "Proceed"
        }
    }

    var titleColor: Color {
        switch self {
        case .login:
            return Color.white
        case .signup:
            return Color.white
        case .cancel:
            return Color.red
        case .facebook:
            return Color.white
        case .google:
            return Color.black
        case .addToCart:
            return Color.black
        case .sortFilter:
            return Color("primary_purple")
        case .proceed:
            return Color.white
        }
    }
}
