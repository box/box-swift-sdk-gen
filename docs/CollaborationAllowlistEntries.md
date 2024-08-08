# CollaborationAllowlistEntriesManager


- [List allowed collaboration domains](#list-allowed-collaboration-domains)
- [Add domain to list of allowed collaboration domains](#add-domain-to-list-of-allowed-collaboration-domains)
- [Get allowed collaboration domain](#get-allowed-collaboration-domain)
- [Remove domain from list of allowed collaboration domains](#remove-domain-from-list-of-allowed-collaboration-domains)

## List allowed collaboration domains

Returns the list domains that have been deemed safe to create collaborations
for within the current enterprise.

This operation is performed by calling function `getCollaborationWhitelistEntries`.



```
try await client.collaborationAllowlistEntries.getCollaborationWhitelistEntries()
```

### Arguments

- queryParams `GetCollaborationWhitelistEntriesQueryParams`
  - Query parameters of getCollaborationWhitelistEntries method
- headers `GetCollaborationWhitelistEntriesHeaders`
  - Headers of getCollaborationWhitelistEntries method


### Returns

This function returns a value of type `CollaborationAllowlistEntries`.

Returns a collection of domains that are allowed for collaboration.


## Add domain to list of allowed collaboration domains

Creates a new entry in the list of allowed domains to allow
collaboration for.

This operation is performed by calling function `createCollaborationWhitelistEntry`.



```
try await client.collaborationAllowlistEntries.createCollaborationWhitelistEntry(requestBody: CreateCollaborationWhitelistEntryRequestBody(direction: CreateCollaborationWhitelistEntryRequestBodyDirectionField.inbound, domain: domain))
```

### Arguments

- requestBody `CreateCollaborationWhitelistEntryRequestBody`
  - Request body of createCollaborationWhitelistEntry method
- headers `CreateCollaborationWhitelistEntryHeaders`
  - Headers of createCollaborationWhitelistEntry method


### Returns

This function returns a value of type `CollaborationAllowlistEntry`.

Returns a new entry on the list of allowed domains.


## Get allowed collaboration domain

Returns a domain that has been deemed safe to create collaborations
for within the current enterprise.

This operation is performed by calling function `getCollaborationWhitelistEntryById`.



```
try await client.collaborationAllowlistEntries.getCollaborationWhitelistEntryById(collaborationWhitelistEntryId: entry.id!)
```

### Arguments

- collaborationWhitelistEntryId `String`
  - The ID of the entry in the list. Example: "213123"
- headers `GetCollaborationWhitelistEntryByIdHeaders`
  - Headers of getCollaborationWhitelistEntryById method


### Returns

This function returns a value of type `CollaborationAllowlistEntry`.

Returns an entry on the list of allowed domains.


## Remove domain from list of allowed collaboration domains

Removes a domain from the list of domains that have been deemed safe to create
collaborations for within the current enterprise.

This operation is performed by calling function `deleteCollaborationWhitelistEntryById`.



```
try await client.collaborationAllowlistEntries.deleteCollaborationWhitelistEntryById(collaborationWhitelistEntryId: entry.id!)
```

### Arguments

- collaborationWhitelistEntryId `String`
  - The ID of the entry in the list. Example: "213123"
- headers `DeleteCollaborationWhitelistEntryByIdHeaders`
  - Headers of deleteCollaborationWhitelistEntryById method


### Returns

This function returns a value of type ``.

A blank response is returned if the entry was
successfully deleted.


