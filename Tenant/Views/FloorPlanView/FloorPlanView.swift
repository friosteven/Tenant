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
    @EnvironmentObject var appStateContainer: AppStateContainer
    @StateObject var viewModel = FloorPlanViewModel()
    @State private var image = UIImage()
    @State private var currentScale: CGFloat = 1
    @State private var floorPlanSize: CGSize = CGSize(width: 0, height: 0)
    @State private var isBottomSheetOpen: Bool = false
    @State private var tenant: TenantResponse?

    var body: some View {
        ZStack {
            if image == UIImage() && viewModel.resourceArr.isEmpty  {
                ProgressView("")
            }
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
        .alert(isPresented: $isBottomSheetOpen, content: {
            Alert(title: Text(""),
                  message: Text(tenant?.name.capitalized ?? ""),
                  dismissButton: Alert.Button.cancel(
                    Text("Ok"),
                    action: {

                    })
            )
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
