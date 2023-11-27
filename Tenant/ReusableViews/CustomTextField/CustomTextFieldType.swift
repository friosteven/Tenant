//
//  CustomTextFieldType.swift
//  Tenant
//
//  Created by Steven Frio on 10/22/23.
//

import Foundation

enum CustomTextFieldTypeV2 {
    case xField
    case yField
    case widthField
    case heightField
    case typeField
    case nameField
    case imageWidth
    case imageHeight

    var title: String {
        switch self {
        case .xField:
            return "X Axis"
        case .yField:
            return "Y Axis"
        case .widthField:
            return "Width"
        case .heightField:
            return "Height"
        case .typeField:
            return "Type"
        case .nameField:
            return "Name"
        case .imageWidth:
            return "Image Width"
        case .imageHeight:
            return "Image Height"

        }
    }

    var placeholder: String {
        switch self {
        case .xField:
            return "X Axis value from Figma"
        case .yField:
            return "Y Axis value from Figma"
        case .widthField:
            return "Width of overlay from Figma"
        case .heightField:
            return "Height of overlay from Figma"
        case .typeField:
            return "e.g. Office/ Mall/ Restaurant"
        case .nameField:
            return "e.g. Jollibee"
        case .imageWidth:
            return "Image Width"
        case .imageHeight:
            return "Image Height"
        }
    }

    var isEditable: Bool {
        switch self {
        case .imageHeight:
            return true
        case .imageWidth:
            return true
        default:
            return false
        }
    }
}
