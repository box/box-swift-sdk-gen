import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#elseif os(OSX)
import AppKit
#endif

/// Defines the Box SDK static informations
public enum BoxConstants {
    /// The name of the SDK
    public static let sdkName = "box-swift-generated-sdk"
    /// The current SDK version
    public static let version = "0.1.0"
    /// Analytics headers using by the SDK
    public static var analyticsHeaders: [String: String] {
        [
            "User-Agent": "\(sdkName)/\(version) \(OSInformation.shared.name)/\(ProcessInfo.processInfo.operatingSystemVersionString)",
            "X-Box-UA": "agent=\(sdkName)/\(version); env=\(OSInformation.shared.name)/\(OSInformation.shared.version)"
        ]
    }
}

fileprivate class OSInformation {
    static let shared = OSInformation()

    lazy var name: String = {
#if os(iOS) || os(tvOS)
        return UIDevice.current.systemName
#elseif os(watchOS)
        return WKInterfaceDevice.current().systemName
#elseif os(OSX)
        return "macOS"
#elseif os(Linux)
        return "Linux"
#elseif os(Windows)
        return "Windows"
#else
        return "N/A"
#endif
    }()

    lazy var version: String = {
#if os(iOS) || os(tvOS)
        return UIDevice.current.systemVersion
#elseif os(watchOS)
        return WKInterfaceDevice.current().systemVersion
#else
        let version = ProcessInfo.processInfo.operatingSystemVersion
        return "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
#endif
    }()
}
