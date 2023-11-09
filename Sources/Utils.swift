import Foundation

/// Utility methods
public enum Utils {
    /// Helper methods for Url
    public enum Url {
        /// Creates a new `String` object by replacing all characters that are
        /// not allowed in `urlQueryAllowed` set  with percent encoded characters.
        ///
        /// - Parameter value: The String value to encode
        /// - Returns: Returns a new string created by replacing all characters in the `value`,
        ///   not allowed in `urlQueryAllowed` set  with percent encoded characters.
        public static func urlEncode(value: String) -> String {
            // swiftlint:disable:next force_unwrapping
            return value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }

        /// Creates a new `String` that represents a URL query based on the  dictionary passed to the parameter, where each `key/value`
        /// is encoded into a from that can be used in URL query.
        ///
        /// - Parameter dictionary: The dictionary of [String:String], which you want to encode into a single valid  URL String
        ///
        ///   E.g.:
        ///   let encodedString = Utils.Url.urlEncodeFrom(dictionary: ["paramOne": "valueOne", "paramTwo": "valueTwo" ])
        ///   print(encodedString) // -> paramOne=valueOne&paramTwo=valueTwo
        ///
        /// - Returns: Returns a new `String` that represents a URL query.
        public static func urlEncodeFrom(dictionary: [String: String]) -> String {
            return dictionary
                .map { key, value in
                    String(format: "%@=%@", urlEncode(value: key), urlEncode(value: value))
                }
                .joined(separator: "&")
        }

        public static func urlEncodedFrom(data: Data) throws -> String {
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            guard let dictionary else {
                throw GeneralError(message: .serializationError("Could not create object from JSON data"))
            }

            var items: [URLQueryItem] = []
            for (key, value) in dictionary {
                items.append(URLQueryItem(name: key, value: "\(value)"))
            }

            var components = URLComponents()
            components.queryItems = items

            if let query = components.query {
                return query
            }

            throw GeneralError(message: .serializationError("Could not create url encoded data."))
        }
    }

    /// Helper methods for Dictionary
    public enum Dictionary {
        /// Creates a dictionary by merging two dictionaries into one.
        /// If the same key exists in both dictionaries, dict2 takes precedence.
        ///
        /// - Parameters:
        ///   - dict1: First dictionary to merge
        ///   - dict2: Second dictionary to merge
        /// - Returns: A new dictionary with the combined keys and values of `dict1` dictionary and `dict2.
        public static func merge<T1,T2>(_ dict1:[T1:T2]?, _ dict2:[T1:T2]?) -> [T1:T2] {
            return (dict1 ?? [:]).merging(dict2 ?? [:]) {(_, second) in second }
        }

        /// Remove empty entries from dictionary.
        /// Used for headers and query params.
        ///
        /// - Parameters:
        ///   - dict: Input dictionary
        /// - Returns: A new dictionary with removed empty entries.
        public static func prepareParams(map: [String: String?]) -> [String: String] {
            return map.compactMapValues { $0 }
        }
    }
    /// Helper methods for String
    public enum Strings {
        /// Returns String representation of a given `value` parameter.
        ///
        /// - Parameters:
        ///   - value: An instance of any type.
        /// - Returns: A string representation of the provided parameter, or nil when this is not possible.
        public static func toString(value: Any?) -> String? {
            if let parameterConvertible = value as? ParameterConvertible {
                return parameterConvertible.paramValue
            } else if let encodable = value as? Encodable {
                return try? encodable.serializeToString()
            }

            return nil
        }

        /// Returns String representation from a given Data
        ///
        /// - Parameters:
        ///   - data: An instance of Data.
        /// - Returns: A string.
        public static func from(data: Data) -> String {
            return String(decoding: data, as: UTF8.self)
        }
    }


    /// Creates and returns a string created from the UUID
    ///
    /// - Returns: A string created from the UUID
    public static func getUUID() -> String {
        return UUID().uuidString.lowercased()
    }

    /// Gets the environment variable based on name.
    ///
    /// - Parameters:
    ///   - name: The name of the environment variable.
    /// - Returns: The value of the environment variable if presents, otherwise nil.
    public static func getEnvironmentVariable(name: String) -> String {
        return ProcessInfo.processInfo.environment[name] ?? ""
    }

    /// Creates InputStream from Base64 encoded string.
    ///
    /// - Parameters:
    ///   - data: Base64 encoded string.
    /// - Returns: InputStream.
    public static func decodeBase64ByteStream(data: String) -> InputStream {
        return InputStream(data: Data(base64Encoded: data.data(using: .utf8)!)!)
    }

    /// Creates a Data instance of a given size with random values.
    ///
    /// - Parameters:
    ///   - size: The size of  Data to create.
    /// - Returns: Data.
    public static func generateByteBuffer(size: Int) -> Data {
        var gen = SystemRandomNumberGenerator()
        return Data((0 ..< size).map { _ in UInt8.random(in: UInt8.min ... UInt8.max, using: &gen) })
    }

    /// Creates an InputStream of a given size with random Data.
    ///
    /// - Parameters:
    ///   - size: The size of  InputStream to create.
    /// - Returns: InputStream.
    public static func generateByteStream(size: Int) -> InputStream {
        return InputStream(data:generateByteBuffer(size: size))
    }

    /// Creates an InputStream from a given Data.
    ///
    /// - Parameters:
    ///   - buffer: Data.
    /// - Returns: InputStream.
    public static func generateByteStreamFromBuffer(buffer: Data) -> InputStream {
        return InputStream(data: buffer)
    }

    /// Creates a Data from a given InputStream.
    ///
    /// - Parameters:
    ///   - buffer: InputStream.
    /// - Returns: Data.
    public static func readByteStream(byteStream: InputStream) -> Data {
        byteStream.open()
        defer {
            byteStream.close()
        }

        let bufferSize = 1024
        var buffer = [UInt8](repeating: 0, count: bufferSize)
        var data = Data()

        while byteStream.hasBytesAvailable {
            let bytesRead = byteStream.read(&buffer, maxLength: bufferSize)
            data.append(buffer, count: bytesRead)
        }

        return data
    }

    /// Returns Data instance with the contents of a url.
    ///
    /// - Parameters:
    ///   - url: URL for a file to read.
    /// - Returns: Data.
    public static func readBufferFromFile(url: URL) -> Data {
        return try! Data(contentsOf: url)
    }

    /// Returns InputStream instance with the contents of a url.
    ///
    /// - Parameters:
    ///   - url: URL for a file to read.
    /// - Returns: InputStream.
    public static func readStreamFromFile(url: URL) -> InputStream {
        return InputStream(url: url)!
    }

    /// Checks if two instances of Data are equal.
    ///
    /// - Parameters:
    ///   - buffer1: First instances of Data.
    ///   - buffer2: Second instances of Data.
    /// - Returns: True if Data instances are equals, otherwise false.
    public static func bufferEquals(buffer1: Data, buffer2: Data) -> Bool {
        return buffer1 == buffer2
    }

    /// Returns the path of the temporary directory for the current user.
    ///
    /// - Returns: The path path of the temporary directory for the current user.
    public static func temporaryDirectoryPath() -> String {
        FileManager.default.temporaryDirectory.absoluteString
    }
}
