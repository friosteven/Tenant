//
//  FloorPlanView.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import SwiftUI
import Kingfisher

/// resources:
/// https://www.youtube.com/watch?v=ERr0GXqILgc
/// https://stackoverflow.com/questions/58518474/passing-headers-to-url-with-swift-urlsession
/// https://stackoverflow.com/questions/27723912/swift-get-request-with-parameters

struct FloorPlanView: View {
    @ObservedObject var viewModel = FloorPlanViewModel()
    @State private var image = UIImage()

    var body: some View {
        VStack {
            if let resources = viewModel.resourceArr.first {
                BaseImage(image: image)
                    .frame(width: CGFloat(resources.imageWidth) * 0.75,
                           height: CGFloat(resources.imageHeight) * 0.75)
            }
        }
        .onAppear(perform: {
            viewModel.getImageURL()
        })
        .onChange(of: viewModel.resourceArr.first) { resource in
            loadSVG(resource: resource)
        }
    }
}

extension FloorPlanView {
    func loadSVG(resource: Resource?) {
        if let resource = resource {
            guard let url = URL(string: resource.imageURL) else { return }
            let size = CGSize(width: resource.imageWidth,
                              height: resource.imageHeight)

            renderSVGImage(url: url,
                           size: size,
                           image: { image in
                self.image = image
            })
        }
    }
}

struct FloorPlanView_Previews: PreviewProvider {
    static var previews: some View {
        FloorPlanView()
    }
}
