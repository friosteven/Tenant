//
//  CategoriesCell.swift
//  Tenant
//
//  Created by John Steven Frio on 10/25/23.
//

import SwiftUI

struct CategoriesCell: View {
    var title: String?
    var size: CGFloat = 24
    var body: some View {
        VStack {
            Text(title?.capitalized ?? "Test only")
                .font(Font.custom("Poppins-Bold", size: size)) // not working
                .foregroundColor(.white)
        }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
}

struct CategoriesCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCell()
    }
}
