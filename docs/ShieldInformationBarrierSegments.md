# ShieldInformationBarrierSegmentsManager


- [Get shield information barrier segment with specified ID](#get-shield-information-barrier-segment-with-specified-id)
- [Update shield information barrier segment with specified ID](#update-shield-information-barrier-segment-with-specified-id)
- [Delete shield information barrier segment](#delete-shield-information-barrier-segment)
- [List shield information barrier segments](#list-shield-information-barrier-segments)
- [Create shield information barrier segment](#create-shield-information-barrier-segment)

## Get shield information barrier segment with specified ID

Retrieves shield information barrier segment based on provided ID..

This operation is performed by calling function `getShieldInformationBarrierSegmentById`.



```
try await client.shieldInformationBarrierSegments.getShieldInformationBarrierSegmentById(shieldInformationBarrierSegmentId: segmentId)
```

### Arguments

- shieldInformationBarrierSegmentId `String`
  - The ID of the shield information barrier segment. Example: "3423"
- headers `GetShieldInformationBarrierSegmentByIdHeaders`
  - Headers of getShieldInformationBarrierSegmentById method


### Returns

This function returns a value of type `ShieldInformationBarrierSegment`.

Returns the shield information barrier segment object.


## Update shield information barrier segment with specified ID

Updates the shield information barrier segment based on provided ID..

This operation is performed by calling function `updateShieldInformationBarrierSegmentById`.



```
try await client.shieldInformationBarrierSegments.updateShieldInformationBarrierSegmentById(shieldInformationBarrierSegmentId: segmentId, requestBody: UpdateShieldInformationBarrierSegmentByIdRequestBody(description: updatedSegmentDescription))
```

### Arguments

- shieldInformationBarrierSegmentId `String`
  - The ID of the shield information barrier segment. Example: "3423"
- requestBody `UpdateShieldInformationBarrierSegmentByIdRequestBody`
  - Request body of updateShieldInformationBarrierSegmentById method
- headers `UpdateShieldInformationBarrierSegmentByIdHeaders`
  - Headers of updateShieldInformationBarrierSegmentById method


### Returns

This function returns a value of type `ShieldInformationBarrierSegment`.

Returns the updated shield information barrier segment object.


## Delete shield information barrier segment

Deletes the shield information barrier segment
based on provided ID.

This operation is performed by calling function `deleteShieldInformationBarrierSegmentById`.



```
try await client.shieldInformationBarrierSegments.deleteShieldInformationBarrierSegmentById(shieldInformationBarrierSegmentId: segment.id!)
```

### Arguments

- shieldInformationBarrierSegmentId `String`
  - The ID of the shield information barrier segment. Example: "3423"
- headers `DeleteShieldInformationBarrierSegmentByIdHeaders`
  - Headers of deleteShieldInformationBarrierSegmentById method


### Returns

This function returns a value of type ``.

Empty body in response


## List shield information barrier segments

Retrieves a list of shield information barrier segment objects
for the specified Information Barrier ID.

This operation is performed by calling function `getShieldInformationBarrierSegments`.



```
try await client.shieldInformationBarrierSegments.getShieldInformationBarrierSegments(queryParams: GetShieldInformationBarrierSegmentsQueryParams(shieldInformationBarrierId: barrierId))
```

### Arguments

- queryParams `GetShieldInformationBarrierSegmentsQueryParams`
  - Query parameters of getShieldInformationBarrierSegments method
- headers `GetShieldInformationBarrierSegmentsHeaders`
  - Headers of getShieldInformationBarrierSegments method


### Returns

This function returns a value of type `ShieldInformationBarrierSegments`.

Returns a paginated list of shield information barrier segment objects.


## Create shield information barrier segment

Creates a shield information barrier segment.

This operation is performed by calling function `createShieldInformationBarrierSegment`.



```
try await client.shieldInformationBarrierSegments.createShieldInformationBarrierSegment(requestBody: CreateShieldInformationBarrierSegmentRequestBody(shieldInformationBarrier: ShieldInformationBarrierBase(id: barrierId, type: ShieldInformationBarrierBaseTypeField.shieldInformationBarrier), name: segmentName))
```

### Arguments

- requestBody `CreateShieldInformationBarrierSegmentRequestBody`
  - Request body of createShieldInformationBarrierSegment method
- headers `CreateShieldInformationBarrierSegmentHeaders`
  - Headers of createShieldInformationBarrierSegment method


### Returns

This function returns a value of type `ShieldInformationBarrierSegment`.

Returns a new shield information barrier segment object.


