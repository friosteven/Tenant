//
//  FloorPlanView.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import SwiftUI

/// resources:
/// https://www.youtube.com/watch?v=ERr0GXqILgc
/// https://stackoverflow.com/questions/58518474/passing-headers-to-url-with-swift-urlsession
/// https://stackoverflow.com/questions/27723912/swift-get-request-with-parameters

struct FloorPlanView: View {
    @ObservedObject var viewModel = FloorPlanViewModel()
    @State private var resources: [Resource]?

    var body: some View {
        VStack {
            if let resources = resources {
                ForEach(resources, id: \.id) { resources in
                    Text(resources.imageURL)
                    Text(resources.description)
                }
            }
        }
        .onAppear(perform: {
            viewModel.getImageURL()
        })
    }
}

struct FloorPlanView_Previews: PreviewProvider {
    static var previews: some View {
        FloorPlanView()
    }
}
