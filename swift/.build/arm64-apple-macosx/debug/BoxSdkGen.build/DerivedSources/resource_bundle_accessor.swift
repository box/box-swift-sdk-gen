import Foundation

extension Foundation.Bundle {
    static let module: Bundle = {
        let mainPath = Bundle.main.bundleURL.appendingPathComponent("BoxSdkGen_BoxSdkGen.bundle").path
        let buildPath = "/Users/ajankowski/work/sdk/box-codegen/scripts/ready_swift_gen/swift/.build/arm64-apple-macosx/debug/BoxSdkGen_BoxSdkGen.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
            // Users can write a function called fatalError themselves, we should be resilient against that.
            Swift.fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}