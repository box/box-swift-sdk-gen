import Foundation

extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) -> Data {
        return try! encoder.encode(self)
    }

    func serialize(with encoder: JSONEncoder = JSONEncoder()) -> String {
        return String(decoding: self.encode(with: encoder), as: UTF8.self)
    }
}

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }

    static func deserialize(with decoder: JSONDecoder = JSONDecoder(), from string: String) throws -> Self {
        return try self.decode(with: decoder, from: string.data(using: .utf8)!)
    }
}
