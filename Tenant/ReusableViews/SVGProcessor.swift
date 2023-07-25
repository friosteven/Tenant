//
//  SVGProcessor.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation
import Kingfisher
import PocketSVG

struct SVGProcessor: ImageProcessor {

    // `identifier` should be the same for processors with the same properties/functionality
    // It will be used when storing and retrieving the image to/from cache.
    let identifier = "svgprocessor"
    var size: CGSize!
    init(size: CGSize) {
        self.size = size
    }
    // Convert input data/image to target image and return it.
    func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> Kingfisher.KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            return image
        case .data(let data):
            if let svgString = String(data: data, encoding: .utf8) {
                let path = SVGBezierPath.paths(fromSVGString: svgString)
                let layer = SVGLayer()
                layer.paths = path
                let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                layer.frame = frame
                let img = self.snapshotImage(for: layer)
                return img
            }
            return nil
        }
    }
    func snapshotImage(for view: CALayer) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        view.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
