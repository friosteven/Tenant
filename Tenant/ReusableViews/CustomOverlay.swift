//
//  CustomOverlay.swift
//  Tenant
//
//  Created by Steven Frio on 7/25/23.
//

import Foundation
import SwiftUI
import UIKit

class CustomOverlay {
    func setCustomOverlay(with overlayDetails: CustomOverlayDetails,
                          overlayType: TenantType,
                          currentScale: CGFloat?) -> some View {

        let overlay = getOverlayDimensionAndPosition(with: overlayDetails, currentScale: currentScale)

        return Rectangle()
            .fill(overlayType.fill)
            .frame(width: overlay.width,
                   height: overlay.height)
            .position(x: overlay.xAxis,
                      y: overlay.yAxis)
            .opacity(overlayType.opacity)
    }
    func setCustomOverlayWithImageSize(with overlayDetails: CustomOverlayDetailsWithImageSize,
                                       overlayType: TenantType,
                                       currentScale: CGFloat?,
                                       officeId: Int) -> some View {

        let overlay = getOverlayDimensionAndPositionWithImageSize(with: overlayDetails, currentScale: currentScale)

        /// To find this value:
        /// 1. Find the smallest spacing between two seats on a floor plan on Figma
        /// 2. Think of the spacing as a seat
        /// 3. Assume how many seats can fit on that space
        /// Note: This should be dynamic per floorplan
//        let distanceBetweenXSeats = getSeatOffsetByOfficeId(officeId: officeId).horizontal
//        let distanceBetweenYSeats = getSeatOffsetByOfficeId(officeId: officeId).vertical


        print("overlay details: x: \(overlay.xAxis), y: \(overlay.yAxis), width: \(overlay.width), height: \(overlay.height), rawX:\(overlayDetails.xAxis), rawY:\(overlayDetails.yAxis), rawWidth:\(overlayDetails.width), rawHeight:\(overlayDetails.height)")

        return ZStack {
            Rectangle()
                .fill(overlayType.fill)
                .frame(width: overlay.width,
                       height: overlay.height)
                .position(x: overlay.xAxis,
                          y: overlay.yAxis)
                .opacity(overlayType.opacity)
//            Rectangle()
//                .fill(Asset.ColorAssets.fefefe.swiftUIColor)
//                    .frame(width: overlay.width * distanceBetweenXSeats,
//                           height: overlay.height * distanceBetweenYSeats)
//                    .position(x: overlay.xAxis,
//                              y: overlay.yAxis)
//                    .opacity(0.01)
        }
    }

    func getOverlayDimensionAndPosition(with overlayDetails: CustomOverlayDetails,
                                        currentScale: CGFloat?) -> OverlayPositionAndDimension {
        let image = overlayDetails.image.size

        let xAxis = getCustomOverlayPosition(imageWidthOrHeight: image.width,
                                                          rawWidthOrHeight: overlayDetails.width,
                                                          rawXorY: overlayDetails.xAxis,
                                                          currentScale: currentScale)

        let yAxis = getCustomOverlayPosition(imageWidthOrHeight: image.height,
                                                        rawWidthOrHeight: overlayDetails.height,
                                                        rawXorY: overlayDetails.yAxis,
                                                        currentScale: currentScale)

        let width = getCustomOverlayDimension(imageWidthOrHeight: image.width,
                                              rawWidthOrHeight: overlayDetails.width,
                                              rawXorY: overlayDetails.xAxis,
                                              currentScale: currentScale)

        let height = getCustomOverlayDimension(imageWidthOrHeight: image.height,
                                               rawWidthOrHeight: overlayDetails.height,
                                               rawXorY: overlayDetails.yAxis,
                                               currentScale: currentScale)

        return OverlayPositionAndDimension(xAxis: xAxis, yAxis: yAxis, width: width, height: height)
    }

    func getOverlayDimensionAndPositionWithImageSize(with overlayDetails: CustomOverlayDetailsWithImageSize,
                                                     currentScale: CGFloat?) -> OverlayPositionAndDimension {
        let xAxis = getCustomOverlayPosition(
            imageWidthOrHeight: overlayDetails.size.width,
            rawWidthOrHeight: overlayDetails.width,
            rawXorY: overlayDetails.xAxis,
            currentScale: currentScale
        )

        let yAxis = getCustomOverlayPosition(
            imageWidthOrHeight: overlayDetails.size.height,
            rawWidthOrHeight: overlayDetails.height,
            rawXorY: overlayDetails.yAxis,
            currentScale: currentScale
        )

        let width = getCustomOverlayDimension(
            imageWidthOrHeight: overlayDetails.size.width,
            rawWidthOrHeight: overlayDetails.width,
            rawXorY: overlayDetails.xAxis,
            currentScale: currentScale
        )

        let height = getCustomOverlayDimension(
            imageWidthOrHeight: overlayDetails.size.height,
            rawWidthOrHeight: overlayDetails.height,
            rawXorY: overlayDetails.yAxis,
            currentScale: currentScale
        )

        return OverlayPositionAndDimension(xAxis: xAxis, yAxis: yAxis, width: width, height: height)
    }

    /// To get overlay width, ONLY pass horizontal values e.g. (X-Axis and Width).
    /// Same goes with overlay height, ONLY pass vertical values e.g. (Y-Axis and Height).
    /// DO NOT MIX AND MATCH  X-Axis with Height OR Y-Axis with Width.
    /// - Parameters:
    ///   - imageWidthOrHeight: width or height of reference image/ base image e.g. floorplan
    ///   - rawWidthOrHeight: width or height value from supabase
    ///   - rawXorY: x or y value from supabase
    ///   - currentScale: scale level of zoomed image
    /// - Returns: dimension of overlay e.g. height or width
//    func getCustomOverlayDimension(imageWidthOrHeight: CGFloat,
//                                   rawWidthOrHeight: Float,
//                                   rawXorY: Float,
//                                   currentScale: CGFloat?) -> CGFloat {
//
//        let imageDimension = imageWidthOrHeight * (currentScale ?? 1.0)
//        let overlayDimension = (CGFloat(rawWidthOrHeight) * imageDimension)
//
//        return overlayDimension
//    }

    /// Using values from figma directly to supabase
    func getCustomOverlayDimension(imageWidthOrHeight: CGFloat,
                                   rawWidthOrHeight: Float,
                                   rawXorY: Float,
                                   currentScale: CGFloat?) -> CGFloat {

        return CGFloat(rawWidthOrHeight) * (currentScale ?? 1.0)
    }

    /// To get overlay X-axis, ONLY pass horizontal values e.g. (X-Axis and Width).
    /// Same goes with overlay Y-Axis, ONLY pass vertical values e.g. (Y-Axis and Height).
    /// DO NOT MIX AND MATCH  X-Axis with Height OR Y-Axis with Width.
    /// - Parameters:
    ///   - imageWidthOrHeight: width or height of reference image/ base image e.g. floorplan
    ///   - rawWidthOrHeight: width or height value from supabase
    ///   - rawXorY: x or y value from supabase
    ///   - currentScale: scale level of zoomed image
    /// - Returns: X-Axis or Y-Axis coordinate of overlay
//    func getCustomOverlayPosition(imageWidthOrHeight: CGFloat,
//                                  rawWidthOrHeight: Float,
//                                  rawXorY: Float,
//                                  currentScale: CGFloat?) -> CGFloat {
//
//        let imageDimension = imageWidthOrHeight * (currentScale ?? 1.0)
//        let overlayDimension = (CGFloat(rawWidthOrHeight) * imageDimension)
//
//        let position = (CGFloat(rawXorY) * imageDimension)
//
//        return position + (overlayDimension / 2)
//    }

    /// Using values from figma directly to supabase
    func getCustomOverlayPosition(imageWidthOrHeight: CGFloat,
                                  rawWidthOrHeight: Float,
                                  rawXorY: Float,
                                  currentScale: CGFloat?) -> CGFloat {

        let position = CGFloat(rawXorY) + (CGFloat(rawWidthOrHeight) / 2)

        return position * (currentScale ?? 1.0)
    }

    func getSeatOverlayDetails(data: TenantResponse, image: UIImage) -> CustomOverlayDetails {
        return CustomOverlayDetails(image: image,
                                    xAxis: data.x,
                                    yAxis: data.y,
                                    width: data.width,
                                    height: data.height)
    }
    func getSeatOverlayDetailsWithImageSize(data: TenantResponse, size: CGSize) -> CustomOverlayDetailsWithImageSize {
        return CustomOverlayDetailsWithImageSize(size: size,
                                                 xAxis: data.x,
                                                 yAxis: data.y,
                                                 width: data.width,
                                                 height: data.height)
    }
//    func getRoomOverlayDetails(data: Room, image: UIImage) -> CustomOverlayDetails {
//        return CustomOverlayDetails(image: image,
//                                    xAxis: data.x,
//                                    yAxis: data.y,
//                                    width: data.width,
//                                    height: data.height)
//    }
//    func getRoomOverlayDetailsWithImageSize(data: Room, size: CGSize) -> CustomOverlayDetailsWithImageSize {
//        return CustomOverlayDetailsWithImageSize(size: size,
//                                                 xAxis: data.x,
//                                                 yAxis: data.y,
//                                                 width: data.width,
//                                                 height: data.height)
//    }
//    func getLockerOverlayDetails(data: LockerSection, image: UIImage) -> CustomOverlayDetails {
//        return CustomOverlayDetails(image: image,
//                                    xAxis: data.x,
//                                    yAxis: data.y,
//                                    width: data.width,
//                                    height: data.height)
//    }
    func getCustomOverlayType(with tenantType: String) -> TenantType {
        switch tenantType {
        case "Store":
            return .store
        case "Restaurant":
            return .restaurant
        case "Office":
            return .office
        default:
            return .office
        }
    }

    func getSeatOffsetByOfficeId(officeId: Int) -> SeatOverlayOffset {
        switch officeId {
        case 1: // 711
            return (1.4, 2.2)
        case 2: // 702
            return (2.5, 2.5)
        case 3: // office 2201
            return (1.5, 1.5)
        case 4: // 606
            return (1.6, 2.2)
        case 5: // 701
            return (1.4, 2.5)
        default:
            return (0, 0)
        }
    }

}

struct CustomOverlayDetails {
    let image: UIImage
    let xAxis, yAxis, width, height: Float
}
struct CustomOverlayDetailsWithImageSize {
    let size: CGSize
    let xAxis, yAxis, width, height: Float
}

struct OverlayPositionAndDimension {
    let xAxis, yAxis, width, height: CGFloat
}

enum TenantType {
    case office
    case restaurant
    case store

    var fill: Color {
        switch self {
        case .office:
            return Asset.ColorAssets.office.swiftUIColor
        case .restaurant:
            return Asset.ColorAssets.restaurant.swiftUIColor
        case .store:
            return Asset.ColorAssets.store.swiftUIColor
        }
    }
    var opacity: CGFloat {
        switch self {
        default:
            return 0.5
        }
    }
}


typealias SeatOverlayOffset = (horizontal: CGFloat, vertical: CGFloat)
