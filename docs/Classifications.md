# ClassificationsManager


- [List all classifications](#list-all-classifications)
- [Add classification](#add-classification)
- [Update classification](#update-classification)
- [Add initial classifications](#add-initial-classifications)

## List all classifications

Retrieves the classification metadata template and lists all the
classifications available to this enterprise.

This API can also be called by including the enterprise ID in the
URL explicitly, for example
`/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.

This operation is performed by calling function `getClassificationTemplate`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-metadata-templates-enterprise-securityClassification-6VMVochwUWo-schema/).

<!-- sample get_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema -->
```
try await client.classifications.getClassificationTemplate()
```

### Arguments

- headers `GetClassificationTemplateHeaders`
  - Headers of getClassificationTemplate method


### Returns

This function returns a value of type `ClassificationTemplate`.

Returns the `securityClassification` metadata template, which contains
a `Box__Security__Classification__Key` field that lists all the
classifications available to this enterprise.


## Add classification

Adds one or more new classifications to the list of classifications
available to the enterprise.

This API can also be called by including the enterprise ID in the
URL explicitly, for example
`/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.

This operation is performed by calling function `addClassification`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-metadata-templates-enterprise-securityClassification-6VMVochwUWo-schema--add/).

<!-- sample put_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema#add -->
```
try await client.classifications.addClassification(requestBody: [AddClassificationRequestBody(data: AddClassificationRequestBodyDataField(key: Utils.getUUID(), staticConfig: AddClassificationRequestBodyDataStaticConfigField(classification: AddClassificationRequestBodyDataStaticConfigClassificationField(colorId: Int64(4), classificationDefinition: "Other description"))))])
```

### Arguments

- requestBody `[AddClassificationRequestBody]`
  - Request body of addClassification method
- headers `AddClassificationHeaders`
  - Headers of addClassification method


### Returns

This function returns a value of type `ClassificationTemplate`.

Returns the updated `securityClassification` metadata template, which
contains a `Box__Security__Classification__Key` field that lists all
the classifications available to this enterprise.


## Update classification

Updates the labels and descriptions of one or more classifications
available to the enterprise.

This API can also be called by including the enterprise ID in the
URL explicitly, for example
`/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.

This operation is performed by calling function `updateClassification`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-metadata-templates-enterprise-securityClassification-6VMVochwUWo-schema--update/).

<!-- sample put_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema#update -->
```
try await client.classifications.updateClassification(requestBody: [UpdateClassificationRequestBody(enumOptionKey: classification.key, data: UpdateClassificationRequestBodyDataField(key: updatedClassificationName, staticConfig: UpdateClassificationRequestBodyDataStaticConfigField(classification: UpdateClassificationRequestBodyDataStaticConfigClassificationField(colorId: Int64(2), classificationDefinition: updatedClassificationDescription))))])
```

### Arguments

- requestBody `[UpdateClassificationRequestBody]`
  - Request body of updateClassification method
- headers `UpdateClassificationHeaders`
  - Headers of updateClassification method


### Returns

This function returns a value of type `ClassificationTemplate`.

Returns the updated `securityClassification` metadata template, which
contains a `Box__Security__Classification__Key` field that lists all
the classifications available to this enterprise.


## Add initial classifications

When an enterprise does not yet have any classifications, this API call
initializes the classification template with an initial set of
classifications.

If an enterprise already has a classification, the template will already
exist and instead an API call should be made to add additional
classifications.

This operation is performed by calling function `createClassificationTemplate`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-metadata-templates-schema--classifications/).

*Currently we don't have an example for calling `createClassificationTemplate` in integration tests*

### Arguments

- requestBody `CreateClassificationTemplateRequestBody`
  - Request body of createClassificationTemplate method
- headers `CreateClassificationTemplateHeaders`
  - Headers of createClassificationTemplate method


### Returns

This function returns a value of type `ClassificationTemplate`.

Returns a new `securityClassification` metadata template, which
contains a `Box__Security__Classification__Key` field that lists all
the classifications available to this enterprise.


