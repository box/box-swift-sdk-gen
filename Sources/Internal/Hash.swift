import Foundation

/// Enum defining available hashing algorithms.
public enum HashName {
    /// SHA-1 hashing algorithm.
    case sha1
}

/// Class for hashing data using a specified algorithm.
public class Hash {
    private static let Base64Encoding = "base64"

    private let algorithm: HashName
    private var data: Data

    /// Initializes a `Hash` instance with the specified algorithm.
    ///
    /// - Parameter algorithm: The hashing algorithm to use.
    public init(algorithm: HashName) {
        self.algorithm = algorithm
        self.data = Data()
    }

    /// Updates the hash with additional data.
    ///
    /// - Parameter data: The data to append to the hash.
    public func updateHash(data: Data) {
        self.data.append(data)
    }

    /// Calculates the digest of the accumulated data using the specified encoding.
    ///
    /// - Parameter encoding: The string encoding to use for the digest result.
    /// - Returns: The base64-encoded or hexadecimal string representation of the hash digest.
    public func digestHash(encoding: String) async -> String {
        var digest = Data()

        switch algorithm {
        case .sha1:
            digest = SHA1.sha1(data: data)
        }

        if encoding == Self.Base64Encoding {
            return digest.base64EncodedString()
        } else {
            return digest.hexString()
        }
    }
}
