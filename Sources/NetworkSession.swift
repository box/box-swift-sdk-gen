import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// The Networking Session class provides the URLSession object along with a network configuration parameters used in network communication.
open class NetworkSession {

    /// Provides an API  for downloading data from and uploading data to endpoints indicated by URL.
#if os(Linux)
    public var session: URLSession {
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }
#else
    public let session: URLSession
#endif

    /// Additional network settings.
    public let networkSettings: NetworkSettings

    /// url session configuration.
    public let configuration: URLSessionConfiguration

    /// Initializer
    ///
    /// - Parameters:
    ///   - configuration: A configuration object that specifies certain behaviors, such as caching policies, timeouts, proxies, pipelining, TLS versions to support, cookie policies, and credential storage.
    ///   - networkSettings:Additional network settings that allow you to configure things such as retryStrategy, maxRetryAttempts.
    public init(
        configuration: URLSessionConfiguration = URLSessionConfiguration.default,
        networkSettings: NetworkSettings = NetworkSettings()
    ) {
#if !os(Linux)
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
#endif
        self.configuration = configuration
        self.networkSettings = networkSettings
    }
}
