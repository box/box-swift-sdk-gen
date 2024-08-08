# LegalHoldPoliciesManager


- [List all legal hold policies](#list-all-legal-hold-policies)
- [Create legal hold policy](#create-legal-hold-policy)
- [Get legal hold policy](#get-legal-hold-policy)
- [Update legal hold policy](#update-legal-hold-policy)
- [Remove legal hold policy](#remove-legal-hold-policy)

## List all legal hold policies

Retrieves a list of legal hold policies that belong to
an enterprise.

This operation is performed by calling function `getLegalHoldPolicies`.



```
try await client.legalHoldPolicies.getLegalHoldPolicies()
```

### Arguments

- queryParams `GetLegalHoldPoliciesQueryParams`
  - Query parameters of getLegalHoldPolicies method
- headers `GetLegalHoldPoliciesHeaders`
  - Headers of getLegalHoldPolicies method


### Returns

This function returns a value of type `LegalHoldPolicies`.

Returns a list of legal hold policies.


## Create legal hold policy

Create a new legal hold policy.

This operation is performed by calling function `createLegalHoldPolicy`.



```
try await client.legalHoldPolicies.createLegalHoldPolicy(requestBody: CreateLegalHoldPolicyRequestBody(policyName: legalHoldPolicyName, description: legalHoldDescription, isOngoing: false, filterStartedAt: filterStartedAt, filterEndedAt: filterEndedAt))
```

### Arguments

- requestBody `CreateLegalHoldPolicyRequestBody`
  - Request body of createLegalHoldPolicy method
- headers `CreateLegalHoldPolicyHeaders`
  - Headers of createLegalHoldPolicy method


### Returns

This function returns a value of type `LegalHoldPolicy`.

Returns a new legal hold policy object.


## Get legal hold policy

Retrieve a legal hold policy.

This operation is performed by calling function `getLegalHoldPolicyById`.



```
try await client.legalHoldPolicies.getLegalHoldPolicyById(legalHoldPolicyId: legalHoldPolicyId)
```

### Arguments

- legalHoldPolicyId `String`
  - The ID of the legal hold policy Example: "324432"
- headers `GetLegalHoldPolicyByIdHeaders`
  - Headers of getLegalHoldPolicyById method


### Returns

This function returns a value of type `LegalHoldPolicy`.

Returns a legal hold policy object.


## Update legal hold policy

Update legal hold policy.

This operation is performed by calling function `updateLegalHoldPolicyById`.



```
try await client.legalHoldPolicies.updateLegalHoldPolicyById(legalHoldPolicyId: legalHoldPolicyId, requestBody: UpdateLegalHoldPolicyByIdRequestBody(policyName: updatedLegalHoldPolicyName))
```

### Arguments

- legalHoldPolicyId `String`
  - The ID of the legal hold policy Example: "324432"
- requestBody `UpdateLegalHoldPolicyByIdRequestBody`
  - Request body of updateLegalHoldPolicyById method
- headers `UpdateLegalHoldPolicyByIdHeaders`
  - Headers of updateLegalHoldPolicyById method


### Returns

This function returns a value of type `LegalHoldPolicy`.

Returns a new legal hold policy object.


## Remove legal hold policy

Delete an existing legal hold policy.

This is an asynchronous process. The policy will not be
fully deleted yet when the response returns.

This operation is performed by calling function `deleteLegalHoldPolicyById`.



```
try await client.legalHoldPolicies.deleteLegalHoldPolicyById(legalHoldPolicyId: legalHoldPolicy.id)
```

### Arguments

- legalHoldPolicyId `String`
  - The ID of the legal hold policy Example: "324432"
- headers `DeleteLegalHoldPolicyByIdHeaders`
  - Headers of deleteLegalHoldPolicyById method


### Returns

This function returns a value of type ``.

A blank response is returned if the policy was
successfully deleted.


