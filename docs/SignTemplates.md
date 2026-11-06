# SignTemplatesManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/SignTemplates.md](https://github.com/box/box-ios-sdk/blob/main/docs/SignTemplates.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [List Box Sign templates](#list-box-sign-templates)
- [Get Box Sign template by ID](#get-box-sign-template-by-id)

## List Box Sign templates

Gets Box Sign templates created by a user.

This operation is performed by calling function `getSignTemplates`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-sign-templates/).

<!-- sample get_sign_templates -->
```
try await client.signTemplates.getSignTemplates(queryParams: GetSignTemplatesQueryParams(limit: Int64(2)))
```

### Arguments

- queryParams `GetSignTemplatesQueryParams`
  - Query parameters of getSignTemplates method
- headers `GetSignTemplatesHeaders`
  - Headers of getSignTemplates method


### Returns

This function returns a value of type `SignTemplates`.

Returns a collection of templates.


## Get Box Sign template by ID

Fetches details of a specific Box Sign template.

This operation is performed by calling function `getSignTemplateById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-sign-templates-id/).

<!-- sample get_sign_templates_id -->
```
try await client.signTemplates.getSignTemplateById(templateId: signTemplates.entries![0].id!)
```

### Arguments

- templateId `String`
  - The ID of a Box Sign template. Example: "123075213-7d117509-8f05-42e4-a5ef-5190a319d41d"
- headers `GetSignTemplateByIdHeaders`
  - Headers of getSignTemplateById method


### Returns

This function returns a value of type `SignTemplate`.

Returns details of a template.


