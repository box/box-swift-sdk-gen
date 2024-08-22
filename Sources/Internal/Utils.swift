import Foundation

//class BufferInputStream: InputStream {
//    private let buffer: [UInt8]
//    private var position: Int = 0
//    private var length: Int
//    private var _streamStatus: Stream.Status
//    private var _streamError: Error?
//    private var _delegate: StreamDelegate?
//    
//    init(buffer: [UInt8], length: Int) {
//        self.buffer = buffer
//        self.length = length
//        self._streamStatus = .notOpen
//        super.init(data: Data())
//    }
//    
//    deinit {
//        print("Deinit BufferInputStream!")
//    }
//    
//    override func read(_ buffer: UnsafeMutablePointer<UInt8>, maxLength len: Int) -> Int {
//        guard _streamStatus == .open else {
//            return -1 // Stream must be open to read
//        }
//        
//        // If we've reached the end of the buffer, mark the stream as atEnd
//        if position >= length {
//            _streamStatus = .atEnd
//            return 0
//        }
//        
//        // Calculate the number of bytes to read
//        let bytesToRead = min(len, length - position)
//        
//
//        let sourcePointer = self.buffer.withUnsafeBytes { $0.baseAddress! }
//        let destinationPointer = buffer
//        memcpy(destinationPointer, sourcePointer + position, bytesToRead)
//        
//
//        // Update the position
//        position += bytesToRead
//        
//        if position >= length {
//            _streamStatus = .atEnd
//        }
//        
//        return bytesToRead
//    }
//    
//    override var hasBytesAvailable: Bool {
//        return position < length && _streamStatus == .open
//    }
//    
//    override func close() {
//        position = length
//        _streamStatus = .closed
//    }
//    
//    override func open() {
//        position = 0
//        _streamStatus = .open
//    }
//    
//    override var streamStatus: Stream.Status {
//        return _streamStatus
//    }
//    
//    override var streamError: Error? {
//        return _streamError
//    }
//    
//    override var delegate: StreamDelegate? {
//        get {
//            return _delegate
//        }
//        set {
//            _delegate = newValue
//        }
//    }
//    
//    override func schedule(in _: RunLoop, forMode _: RunLoop.Mode) {}
//    
//    override func remove(from _: RunLoop, forMode _: RunLoop.Mode) {}
//    
//    #if os(iOS) || os(macOS)
//    override func property(forKey _: Stream.PropertyKey) -> Any? {
//        return nil
//    }
//    
//    override func setProperty(_: Any?, forKey _: Stream.PropertyKey) -> Bool {
//        return false
//    }
//    #endif
//}

class BufferInputStream: InputStream {
    static var globalCounter: Int = 0
    private var data: Data
    private var position: Int = 0
    private var _streamStatus: Stream.Status
    private var _streamError: Error?
    private var _delegate: StreamDelegate?
    private var instanceNumber: Int;
    
    override init(data: Data) {
        self.data = data
        self._streamStatus = .notOpen
        self.instanceNumber = Self.globalCounter
        Self.globalCounter += 1;
        super.init(data: Data())
        
        
        print("Init Buffer nr \(instanceNumber)")
    }
    
    deinit {
        print("Deinit BufferInputStream nr \(instanceNumber)")
    }
    
    override func read(_ buffer: UnsafeMutablePointer<UInt8>, maxLength len: Int) -> Int {
        guard _streamStatus == .open else {
            return -1 // Stream must be open to read
        }
        
        // If we've reached the end of the buffer, mark the stream as atEnd
        if position >= data.count {
            _streamStatus = .atEnd
            return 0
        }
        
        // Calculate the number of bytes to read
        let bytesToRead = min(len, data.count - position)
        
        // Copy data to the buffer
        let range = position..<position + bytesToRead
        data.copyBytes(to: buffer, from: range)
        
//        self.buffer.withUnsafeBytes { rawBufferPointer in
//            let basePointer = rawBufferPointer.baseAddress!.advanced(by: position)
//            memcpy(buffer, basePointer, bytesToRead)
//        }
        
        // Update the position
        position += bytesToRead
        
        if position >= data.count {
            _streamStatus = .atEnd
        }
        
        return bytesToRead
    }
    
    override var hasBytesAvailable: Bool {
        return position < data.count && _streamStatus == .open
    }
    
    override func close() {
        position = data.count
        _streamStatus = .closed
    }
    
    func reset() {
        position = 0
        _streamStatus = .notOpen
    }
    
    override func open() {
        position = 0
        _streamStatus = .open
    }
    
    override var streamStatus: Stream.Status {
        return _streamStatus
    }
    
    override var streamError: Error? {
        return _streamError
    }
    
    override var delegate: StreamDelegate? {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    override func schedule(in _: RunLoop, forMode _: RunLoop.Mode) {}
    
    override func remove(from _: RunLoop, forMode _: RunLoop.Mode) {}
    
    #if os(iOS) || os(macOS)
    override func property(forKey _: Stream.PropertyKey) -> Any? {
        return nil
    }
    
    override func setProperty(_: Any?, forKey _: Stream.PropertyKey) -> Bool {
        return false
    }
    #endif
}

///// A custom input stream that reads data from a pre-allocated buffer.
//class BufferInputStream: InputStream {
//    /// Pointer to the buffer from which data is read.
////    private let buffer: UnsafePointer<UInt8>
//
//    /// Total length of the buffer.
//    private let length: Int
//    
//    /// Current reading position in the buffer.
//    private var position: Int = 0
//    
//    /// The current status of the stream.
//    private var _streamStatus: Stream.Status
//    
//    /// The error associated with the stream, if any.
//    private var _streamError: Error?
//    
//    /// The delegate for stream events.
//    private var _delegate: StreamDelegate?
//    
//    /// Initializes a new `BufferInputStream` with the specified buffer and length.
//    ///
//    /// - Parameters:
//    ///   - buffer: A pointer to the buffer from which to read data.
//    ///   - length: The length of the buffer.
//    init(buffer: UnsafePointer<UInt8>, length: Int) {
//        self.buffer = buffer
//        self.length = length
//        _streamStatus = .notOpen
//        super.init(data: Data())
//    }
//    
//    /// Reads data from the buffer into the provided buffer.
//    ///
//    /// - Parameters:
//    ///   - buffer: A pointer to the buffer where read data will be stored.
//    ///   - len: The maximum number of bytes to read.
//    /// - Returns: The number of bytes actually read, or 0 if no more data is available.
//    override func read(_ buffer: UnsafeMutablePointer<UInt8>, maxLength len: Int) -> Int {
//        // Ensure the stream is open before reading
//        guard _streamStatus == .open else {
//            return -1 // Stream must be open to read
//        }
//        
//        // If we've reached the end of the buffer, mark the stream as atEnd
//        guard position < length else {
//            _streamStatus = .atEnd
//            return 0
//        }
//        
//        // Calculate the number of bytes to read
//        let bytesToRead = min(len, length - position)
//        memcpy(buffer, self.buffer + position, bytesToRead)
//        position += bytesToRead
//        
//        // If the end of the buffer is reached, mark the stream as atEnd
//        if position >= length {
//            _streamStatus = .atEnd
//        }
//        
//        return bytesToRead
//    }
//  
//    /// Indicates whether the stream has bytes available to read.
//    override var hasBytesAvailable: Bool {
//        return position < length && _streamStatus == .open
//    }
//    
//    /// Closes the stream and sets the reading position to the end of the buffer.
//    override func close() {
//        position = length
//        _streamStatus = .closed
//    }
//    
//    /// Opens the stream and resets the reading position to the beginning of the buffer.
//    override func open() {
//        position = 0
//        _streamStatus = .open
//    }
//    
//    /// Resets the stream to its initial state without opening it.
//    func reset() {
//        position = 0
//        _streamStatus = .notOpen
//    }
//    
//    /// Returns the current status of the stream.
//    override var streamStatus: Stream.Status {
//        return _streamStatus
//    }
//    
//    /// Returns the error associated with the stream, if any.
//    override var streamError: Error? {
//        return _streamError
//    }
//    
//    /// The delegate for stream events.
//    override var delegate: StreamDelegate? {
//        get {
//            return _delegate
//        }
//        set {
//            _delegate = newValue
//        }
//    }
//    
//    /// Schedules the stream in the specified run loop for a given mode.
//    override func schedule(in _: RunLoop, forMode _: RunLoop.Mode) {}
//    
//    /// Removes the stream from the specified run loop for a given mode.
//    override func remove(from _: RunLoop, forMode _: RunLoop.Mode) {}
//    
//#if os(iOS) || os(macOS)
//
//    /// Returns a property of the stream identified by a given key.
//    override func property(forKey _: Stream.PropertyKey) -> Any? {
//        return nil
//    }
//
//    /// Sets a property of the stream identified by a given key.
//    override func setProperty(_: Any?, forKey _: Stream.PropertyKey) -> Bool {
//        return false
//    }
//
//#endif
//    
//}

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
            guard let dictionary = dictionary else {
                throw BoxSDKError(message: "Could not create object from JSON data.")
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

            throw BoxSDKError(message: "Could not create url encoded data.")
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

        /// Converts from hex string to base64 string.
        ///
        /// - Parameters:
        ///   - value: The hex string
        /// - Returns: The base64 string.
        public static func hextToBase64(value: String) -> String {
            let data = Data(fromHexString: value) ?? Data()
            return data.base64EncodedString()
        }
    }

    /// Helper methods for Date
    public enum Dates {
        static let dateFormatter = DateFormatter(dateFormat: "yyyy-MM-dd")
        static let dateFormatterWithSeconds = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ssxxx")
        static let dateFormatterWithMilliseconds = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSxxx")

        /// Converts string in ISO 8601 format to Date
        /// - Parameters:
        ///   - dateTime: String which represents date in ISO 8601 format `yyyy-MM-dd'T'HH:mm:ssxxx`
        /// - Returns: Date
        /// - Throws: GeneralError
        public static func dateTimeFromString(dateTime: String) throws -> Date {
            let result = dateFormatterWithSeconds.date(from: dateTime) ??
            dateFormatterWithMilliseconds.date(from: dateTime)

            guard let result = result else {
                throw BoxSDKError(message: "Could not create Date from provided string \(dateTime)")
            }

            return result
        }

        /// Converts Date to string in ISO 8601 format
        /// - Parameters:
        ///   - dateTime: Date
        /// - Returns: String
        public static func  dateTimeToString(dateTime: Date) -> String {
            return dateFormatterWithSeconds.string(from: dateTime)
        }

        /// Converts string in ISO 8601 format `yyyy-MM-dd` to Date
        /// - Parameters:
        ///   - date: String which represents date in ISO 8601 format `yyyy-MM-dd`
        /// - Returns: Date
        /// - Throws: GeneralError
        public static func  dateFromString(date: String) throws -> Date {
            guard let date = dateFormatter.date(from: date) else {
                throw BoxSDKError(message: "Could not create Date from provided string \(date)")
            }

            return date
        }

        /// Converts Date to string in ISO 8601 format `yyyy-MM-dd`
        /// - Parameters:
        ///   - date: Date
        /// - Returns: String
        public static func  dateToString(date: Date) -> String {
            dateFormatter.string(from: date)
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
//         let byteArray = [UInt8](buffer)
//         return BufferInputStream(buffer: byteArray, length: byteArray.count)
        
        return BufferInputStream(data: buffer)
        
        
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

    /// Gets length of a buffer
    ///
    /// - Parameters:
    ///   - buffer: The iinstances of Data.
    /// - Returns: The length of the buffer.
    public static func bufferLength(buffer: Data) -> Int {
        return buffer.count
    }

    /// Returns the path of the temporary directory for the current user.
    ///
    /// - Returns: The path path of the temporary directory for the current user.
    public static func temporaryDirectoryPath() -> String {
        FileManager.default.temporaryDirectory.absoluteString
    }


    /// Iterates over a stream and yields chunks of it
    ///
    /// - Parameters:
    ///   - stream: InputStream to iterate over
    ///   - chunkSize: Size of chunk
    ///   - fileSize: Size of the file
    /// - Returns: The asynchronous sequence AsyncStream
    public static func iterateChunks(stream: InputStream, chunkSize: Int64, fileSize: Int64) -> RemoteDataSequence {
        return RemoteDataSequence(inputStream: stream, chunkSize: chunkSize)
//        return AsyncStream<InputStream> { continuation in
//            _Concurrency.Task {
//                try await withCheckedThrowingContinuation { c in
//                    DispatchQueue.global().asyncAfter(
//                        deadline: .now() + .milliseconds(10)
//                    ) {
//                        c.resume()
//                    }
//                }
//                stream.open()
//
//                let bufferSize = Int(chunkSize)
//                var buffer = [UInt8](repeating: 0, count: bufferSize)
//                
//                while stream.hasBytesAvailable {
//                    print("before await")
//                    try await withCheckedThrowingContinuation { c in
//                        DispatchQueue.global().asyncAfter(
//                            deadline: .now() + .milliseconds(10)
//                        ) {
//                            c.resume()
//                        }
//                    }
////                    
//                    let read = stream.read(&buffer, maxLength: buffer.count)
//                    print("READ DATA")
//                    if read < 0, let error = stream.streamError {
//                        throw error
//                    } else if read == 0 {
//                        continuation.finish()
//                        stream.close()
//                        return
//                    }
//
////                    continuation.yield(BufferInputStream(buffer: buffer, length: read))
////                    continuation.yield(BufferInputStream(data: Data(buffer.prefix(read))))
////                    print(buffer)
//                    print("END READ")
//                    continuation.yield(BufferInputStream(buffer: buffer, length: read))
//                              
//                }
//            }
//        }
    }
    
    
    public struct RemoteDataSequence: AsyncSequence {
        public typealias Element = InputStream

        var inputStream: InputStream
        var chunkSize: Int64
        
        
        
        public func makeAsyncIterator() -> RemoteDataIterator {
            inputStream.open()
            return RemoteDataIterator(inputStream: inputStream, chunkSize: chunkSize)
        }
    }
    
    public struct RemoteDataIterator: AsyncIteratorProtocol {
        var inputStream: InputStream
        var chunkSize: Int64

        public mutating func next() async throws -> InputStream? {
            print("I'm here")
            let bufferSize = Int(chunkSize)
            var buffer = [UInt8](repeating: 0, count: bufferSize)
            
            guard inputStream.hasBytesAvailable else {
                return nil
            }
            
            let read = inputStream.read(&buffer, maxLength: buffer.count)
            print("READ DATA")
            if read < 0, let error = inputStream.streamError {
                throw error
            } else if read == 0 {
                return nil
            }

//          return BufferInputStream(buffer: buffer, length: read)
            print("Return BufferInputStrem")
            return BufferInputStream(data: Data(bytes: buffer, count: read))
        }
    }

    /// Asynchronously reduces the elements of an `AsyncStream` using a specified reducer function and initial value.
    ///
    /// - Parameters:
    ///   - iterator: The `AsyncStream` providing elements to be reduced.
    ///   - reducer: A closure that combines an accumulated value (`U`) with each element of the stream (`T`) asynchronously.
    ///   - initialValue: The initial value to start the reduction.
    /// - Returns: The result of combining all elements of the stream using the provided reducer function.
    /// - Throws: Any error thrown by the `reducer` closure during the reduction process.
    public static func reduceIterator<T,U>(iterator: RemoteDataSequence, reducer: @escaping (U, T) async throws -> U, initialValue: U) async throws -> U
    {
        var result = initialValue

        for try await item in iterator {
            print("execute await on reducer begin")
            result = try await reducer(result, item as! T)
            print("execute await on reducer end")
        }

        return result
    }
}
