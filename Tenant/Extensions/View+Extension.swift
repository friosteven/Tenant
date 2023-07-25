//
//  View+Extension.swift
//  Tenant
//
//  Created by Steven Frio on 7/25/23.
//

import Foundation
import SwiftUI
import Kingfisher
import PocketSVG

extension View {
    func renderSVGImage(url: URL,
                        size: CGSize,
                        image: @escaping ((_: UIImage) -> Void)) {

        let processor = SVGProcessor(size: size)

        KingfisherManager.shared.retrieveImage(
            with: url,
            options: [.processor(processor), .forceRefresh]) {  result in
                switch result {
                case .success(let value):
                    print("renderSVGImage:success", value)
                    image(value.image)
                case .failure(let error):
                    print("renderSVGImage:error", error.localizedDescription)
                    image(UIImage())
                }
            }
    }
}
