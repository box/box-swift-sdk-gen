import Foundation
// URL extension for convenience initializers
extension URL {
    public init(path: String) {
        self.init(string: path)!
    }
}
