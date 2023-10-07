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
    @State private var currentScale: CGFloat = 1
    @State private var floorPlanSize: CGSize = CGSize(width: 0, height: 0)
    @State private var isBottomSheetOpen: Bool = false
    @State private var tenant: Tenant?

    var body: some View {
        VStack {
            if let resources = viewModel.resourceArr.first {
                BaseImage(image: image)
                    .frame(width: CGFloat(resources.imageWidth),
                           height: CGFloat(resources.imageHeight))
                    .modifier(ImageModifier(imageSize: floorPlanSize,
                                            currentScale: $currentScale,
                                            tenantArr: $viewModel.tenantArr,
                                           didTap: { tenant in
                        self.tenant = tenant

                        isBottomSheetOpen = true
                    }))
            }
        }
        .onAppear(perform: {
            loadData()
        })
        .onChange(of: tenant, perform: { _ in
        })
        .onChange(of: viewModel.resourceArr.first) { resource in
            if let resource = resource {
                floorPlanSize = CGSize(width: CGFloat(resource.imageWidth),
                                       height: CGFloat(resource.imageHeight))
                loadSVG(resource: resource)
            }
        }
        .sheet(isPresented: $isBottomSheetOpen, content: {
            Text(tenant?.name ?? "").presentationDetents([.fraction(0.2)])
        })
        .toolbar {
            // TODO: - ADD CACHING WITH COREDATA
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button("Refresh", action: {
                    loadData()
                })
            })
        }
        
    }
}

extension FloorPlanView {
    func loadData() {

        viewModel.getImageURL()
        viewModel.getTenant()
    }
    func loadSVG(resource: Resource) {
        guard let url = URL(string: resource.imageURL) else { return }
        let size = CGSize(width: CGFloat(resource.imageWidth),
                          height: CGFloat(resource.imageHeight))

//        renderSVGImage(url: url,
//                       size: size,
//                       image: { image in
//            self.image = image
//        })
        self.image = Asset.ImageAssets.floorplan.image
    }
}

struct FloorPlanView_Previews: PreviewProvider {
    static var previews: some View {
        FloorPlanView()
    }
}
