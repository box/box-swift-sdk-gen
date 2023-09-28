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
                return encodable.serialize()
            }

            return nil
        }
    }
}
