import Foundation

public enum JsonUtils {
    public static func sdToJson(data: SerializedData) throws -> Data {
        return try data.toJson()
    }

    public static func sdToUrlParams(data: SerializedData) throws -> String {
        return try data.toUrlParams()
    }
}
