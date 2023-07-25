//
//  BaseImage.swift
//  Tenant
//
//  Created by Steven Frio on 7/25/23.
//

import Foundation
import SwiftUI

struct BaseImage: View {
    var image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
    }
}
