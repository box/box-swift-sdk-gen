import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// The Networking Session class provides the URLSession object along with a network configuration parameters used in network communication.
open class NetworkSession {

    /// Additional headers, which are appended to each API request
    public let additionalHeaders: [String: String]

    /// Custom base urls
    public let baseUrls: BaseUrls

    /// Provides an API  for downloading data from and uploading data to endpoints indicated by URL.
    public let session: URLSession

    /// url session configuration.
    public let configuration: URLSessionConfiguration

    /// Additional network settings.
    public let networkSettings: NetworkSettings

    /// Initializer
    ///
    /// - Parameters:
    ///   - additionalHeaders: A dictionary of headers, which are appended to each API request
    ///   - configuration: A configuration object that specifies certain behaviors, such as caching policies, timeouts, proxies, pipelining, TLS versions to support, cookie policies, and credential storage.
    ///   - networkSettings:Additional network settings that allow you to configure things such as retryStrategy, maxRetryAttempts.
    public init(
        additionalHeaders: [String: String] = [:],
        configuration: URLSessionConfiguration = URLSessionConfiguration.default,
        networkSettings: NetworkSettings = NetworkSettings(),
        baseUrls: BaseUrls = BaseUrls()
    ) {
        self.additionalHeaders = additionalHeaders
        self.configuration = configuration
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        self.networkSettings = networkSettings
        self.baseUrls = baseUrls
    }

    /// Generate a fresh network session by duplicating the existing configuration and network parameters,
    /// while also including additional headers to be attached to every API call.
    ///
    /// - Parameters:
    ///   - additionalHeaders: Dictionary of headers, which are appended to each API request
    public func withAdditionalHeaders(additionalHeaders: [String: String]) -> NetworkSession {
        return NetworkSession(additionalHeaders: Utils.Dictionary.merge(self.additionalHeaders, additionalHeaders), configuration: self.configuration, networkSettings: networkSettings, baseUrls: baseUrls)
    }

    /// Generate a fresh network session by duplicating the existing configuration and network parameters,
    /// while also including custom base urls to be used for every API call.
    ///
    /// - Parameters:
    ///   - baseUrls: Custom base urls
    public func withCustomBaseUrls(baseUrls: BaseUrls) -> NetworkSession {
        return NetworkSession(additionalHeaders: self.additionalHeaders, configuration: self.configuration, networkSettings: networkSettings, baseUrls: baseUrls)
    }
}
