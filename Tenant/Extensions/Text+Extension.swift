//
//  Text+Extension.swift
//  Tenant
//
//  Created by Steven Frio on 1/8/24.
//

import Foundation
import SwiftUI

extension Text {
    func style(size: CGFloat = 14,
               color: Color = .black) -> Text {
        return self.font(.system(size: size))
            .foregroundColor(color)
    }
}

