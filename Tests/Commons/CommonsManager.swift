import Foundation
import BoxSdkGen

public class CommonsManager {
    public init() {
    }

    public func getCcgAuth() -> BoxCCGAuth {
        let ccgConfig: CCGConfig = CCGConfig(clientId: Utils.getEnvironmentVariable(name: "CLIENT_ID"), clientSecret: Utils.getEnvironmentVariable(name: "CLIENT_SECRET"), enterpriseId: Utils.getEnvironmentVariable(name: "ENTERPRISE_ID"))
        let auth: BoxCCGAuth = BoxCCGAuth(config: ccgConfig)
        return auth
    }

    public func getDefaultClientAsUser(userId: String) async throws -> BoxClient {
        let auth: BoxCCGAuth = getCcgAuth()
        try await auth.asUser(userId: userId)
        return BoxClient(auth: auth)
    }

    public func getDefaultClient() -> BoxClient {
        let client: BoxClient = BoxClient(auth: getCcgAuth())
        return client
    }

    public func createNewFolder() async throws -> FolderFull {
        let client: BoxClient = CommonsManager().getDefaultClient()
        let newFolderName: String = Utils.getUUID()
        return try await client.folders.createFolder(requestBody: CreateFolderRequestBody(name: newFolderName, parent: CreateFolderRequestBodyParentField(id: "0")))
    }

    public func uploadNewFile() async throws -> FileFull {
        let client: BoxClient = CommonsManager().getDefaultClient()
        let newFileName: String = "\(Utils.getUUID())\(".pdf")"
        let fileContentStream: InputStream = Utils.generateByteStream(size: 1024 * 1024)
        let uploadedFiles: Files = try await client.uploads.uploadFile(requestBody: UploadFileRequestBody(attributes: UploadFileRequestBodyAttributesField(name: newFileName, parent: UploadFileRequestBodyAttributesParentField(id: "0")), file: fileContentStream))
        return uploadedFiles.entries![0]
    }

    public func getOrCreateTermsOfServices() async throws -> TermsOfService {
        let client: BoxClient = CommonsManager().getDefaultClient()
        let tos: TermsOfServices = try await client.termsOfServices.getTermsOfService()
        let numberOfTos: Int = tos.entries!.count
        if numberOfTos == 0 {
            return try await client.termsOfServices.createTermsOfService(requestBody: CreateTermsOfServiceRequestBody(status: CreateTermsOfServiceRequestBodyStatusField.enabled, text: "Test TOS", tosType: CreateTermsOfServiceRequestBodyTosTypeField.managed))
        }

        return tos.entries![0]
    }

    public func getOrCreateShieldInformationBarrier(client: BoxClient, enterpriseId: String) async throws -> ShieldInformationBarrier {
        let barriers: ShieldInformationBarriers = try await client.shieldInformationBarriers.getShieldInformationBarriers()
        let numberOfBarriers: Int = barriers.entries!.count
        if numberOfBarriers == 0 {
            return try await client.shieldInformationBarriers.createShieldInformationBarrier(requestBody: CreateShieldInformationBarrierRequestBody(enterprise: EnterpriseBase(id: enterpriseId, type: EnterpriseBaseTypeField.enterprise)))
        }

        return barriers.entries![numberOfBarriers - 1]
    }

}
