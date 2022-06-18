//
//  Extensions.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/18/22.
//

import Foundation
import SwiftUI
import UIKit

extension Double{
    func roundDouble() -> String {
        return String(format: "%.2f", self)
    }
}

extension UIDevice {
    struct DeviceModel: Decodable {
        let identifier: String
        let model: String
        static var all: [DeviceModel] {
            Bundle.main.decode([DeviceModel].self, from: "DeviceModels.json")
        }
    }
    var modelName: String {
        #if targetEnvironment(simulator)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif
        return DeviceModel.all.first {$0.identifier == identifier }?.model ?? identifier
    }
}
extension Bundle {
    var displayName: String {
        object(forInfoDictionaryKey: "CFBundleName") as? String ?? "Could not determine the application name"
    }
    var appBuild: String {
        object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Could not determine the application build number"
    }
    var appVersion: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Could not determine the application version"
    }
    func decode<T: Decodable>(_ type: T.Type,
                              from file: String,
                              dateDecodingStategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                              keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Error: Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error: Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Error: Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}


// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}



