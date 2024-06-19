import Foundation

struct SHA1 {
    // Hash initial values
    private static let h0: UInt32 = 0x67452301
    private static let h1: UInt32 = 0xEFCDAB89
    private static let h2: UInt32 = 0x98BADCFE
    private static let h3: UInt32 = 0x10325476
    private static let h4: UInt32 = 0xC3D2E1F0

    static func sha1(data: Data) -> Data {
        var message = data
        let messageLength = UInt64(message.count * 8)

        // Padding the message
        message.append(0x80)
        while (message.count % 64) != 56 {
            message.append(0x00)
        }

        // Append the length of the original message as a 64-bit big-endian integer
        let lengthBytes = messageLength.bigEndian
        message.append(value: lengthBytes)

        // Initialize hash values
        var h:[UInt32]=[SHA1.h0,SHA1.h1,SHA1.h2,SHA1.h3,SHA1.h4]

        // Process the message in successive 512-bit chunks
        for chunkOffset in stride(from: 0, to: message.count, by: 64) {
            let chunk = message[chunkOffset..<chunkOffset + 64]
            var words = [UInt32](repeating: 0, count: 80)

            // Break chunk into sixteen 32-bit big-endian words
            for i in 0..<16 {
                let start = chunk.index(chunk.startIndex, offsetBy: i * 4)
                let end = chunk.index(start, offsetBy: 4)
                words[i] = UInt32(bigEndian: chunk[start..<end].withUnsafeBytes { $0.load(as: UInt32.self) })
            }

            // Extend the sixteen 32-bit words into eighty 32-bit words
            for i in 16..<80 {
                words[i] = leftRotate(words[i - 3] ^ words[i - 8] ^ words[i - 14] ^ words[i - 16], by: 1)
            }

            // Initialize hash value for this chunk
            var a = h[0]
            var b = h[1]
            var c = h[2]
            var d = h[3]
            var e = h[4]

            // Main loop
            for i in 0..<80 {
                var f: UInt32 = 0
                var k: UInt32 = 0

                switch i {
                case 0...19:
                    f = (b & c) | ((bitwiseNot(b)) & d)
                    k = 0x5A827999
                case 20...39:
                    f = b ^ c ^ d
                    k = 0x6ED9EBA1
                case 40...59:
                    f = (b & c) | (b & d) | (c & d)
                    k = 0x8F1BBCDC
                case 60...79:
                    f = b ^ c ^ d
                    k = 0xCA62C1D6
                default:
                    break
                }

                let temp = leftRotate(a, by: 5) &+ f &+ e &+ k &+ words[i]
                e = d
                d = c
                c = leftRotate(b, by: 30)
                b = a
                a = temp
            }

            // Add this chunk's hash to result so far
            h[0] = h[0] &+ a
            h[1] = h[1] &+ b
            h[2] = h[2] &+ c
            h[3] = h[3] &+ d
            h[4] = h[4] &+ e
        }

        // Produce the final hash value (big-endian)
        var hash = Data()
        [h[0], h[1], h[2], h[3], h[4]].forEach {
            let bigEndianValue = $0.bigEndian
            hash.append(value:  bigEndianValue)
        }

        return hash
    }

    private static func bitwiseNot<T: FixedWidthInteger>(_ value: T) -> T {
        return value ^ T.max
    }

    private static func leftRotate(_ value: UInt32, by bits: UInt32) -> UInt32 {
        return (value << bits) | (value >> (32 - bits))
    }
}
