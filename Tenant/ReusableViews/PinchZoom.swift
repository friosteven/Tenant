//
//  PinchZoom.swift
//  Tenant
//
//  Created by Steven Frio on 7/25/23.
//

import SwiftUI
import UIKit

// Pinch to zoom
// Reference: https://medium.com/@priya_talreja/pinch-zoom-pan-image-and-double-tap-to-zoom-image-in-swiftui-878ca70c539d

struct ImageModifier: ViewModifier {
    var imageSize: CGSize
    var min: CGFloat = 0.3
    var max: CGFloat = 2.0
    @Binding var currentScale: CGFloat
    @Binding var tenantArr: [TenantResponse]?
    var didTap: ((_ data: TenantResponse) -> Void)?

    private func doubleTapGesture() {
        if currentScale <= min { currentScale = max } else
        if currentScale >= max { currentScale = min } else {
            currentScale = ((max - min) * 0.5 + min) < currentScale ? max : min
        }
    }
    func body(content: Content) -> some View {

        ScrollView([.horizontal, .vertical], showsIndicators: false) {
            ZStack {
                content
                    .frame(width: imageSize.width * currentScale,
                           height: imageSize.height * currentScale,
                           alignment: .center)
                    .modifier(PinchToZoom(minScale: min,
                                          maxScale: max,
                                          scale: $currentScale))
                ForEach(Array((tenantArr ?? []).enumerated()), id: \.element) { index, tenant in
                    let customOverlay = CustomOverlay()
                    let overlayDetails = customOverlay.getSeatOverlayDetailsWithImageSize(
                        data: tenant,
                        size: imageSize)
                    
                    let overlayType = customOverlay.getCustomOverlayType(with: tenant.type)
                    customOverlay.setCustomOverlayWithImageSize(with: overlayDetails,
                                                                overlayType: overlayType,
                                                                currentScale: currentScale,
                                                                officeId: 0)
                    .highPriorityGesture(TapGesture().onEnded {
                        didTap?(tenant)
                    })
                }
            }
        }
    }
}

class PinchZoomView: UIView {
    let minScale: CGFloat
    let maxScale: CGFloat
    var isPinching: Bool = false
    var scale: CGFloat = 1.0
    let scaleChange: (CGFloat) -> Void

    init(minScale: CGFloat,
         maxScale: CGFloat,
         currentScale: CGFloat,
         scaleChange: @escaping (CGFloat) -> Void) {
        self.minScale = minScale
        self.maxScale = maxScale
        self.scale = currentScale
        self.scaleChange = scaleChange
        super.init(frame: .zero)
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        pinchGesture.cancelsTouchesInView = false
        addGestureRecognizer(pinchGesture)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc private func pinch(gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .began:
            isPinching = true

        case .changed, .ended:
            if gesture.scale >= maxScale && scale < maxScale {
                scale = maxScale
            } else if gesture.scale >= scale && scale <= maxScale {
                scale = gesture.scale
            } else if gesture.scale <= minScale && scale >= minScale {
                scale = gesture.scale * 2
            }
            scaleChange(scale)
        case .cancelled, .failed:
            isPinching = false
            scale = 1.0
        default:
            break
        }
    }
}

struct PinchZoom: UIViewRepresentable {
    let minScale: CGFloat
    let maxScale: CGFloat
    @Binding var scale: CGFloat
    @Binding var isPinching: Bool

    func makeUIView(context: Context) -> PinchZoomView {
        let pinchZoomView = PinchZoomView(minScale: minScale,
                                          maxScale: maxScale,
                                          currentScale: scale,
                                          scaleChange: { scale = $0 })
        return pinchZoomView
    }

    func updateUIView(_ pageControl: PinchZoomView, context: Context) { }
}

struct PinchToZoom: ViewModifier {
    let minScale: CGFloat
    let maxScale: CGFloat
    @Binding var scale: CGFloat
    @State var anchor: UnitPoint = .center
    @State var isPinching: Bool = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale, anchor: anchor)
            .animation(.spring(), value: isPinching)
            .overlay(PinchZoom(minScale: minScale, maxScale: maxScale, scale: $scale, isPinching: $isPinching))
    }
}
