# WebhooksManager


- [List all webhooks](#list-all-webhooks)
- [Create webhook](#create-webhook)
- [Get webhook](#get-webhook)
- [Update webhook](#update-webhook)
- [Remove webhook](#remove-webhook)

## List all webhooks

Returns all defined webhooks for the requesting application.

This API only returns webhooks that are applied to files or folders that are
owned by the authenticated user. This means that an admin can not see webhooks
created by a service account unless the admin has access to those folders, and
vice versa.

This operation is performed by calling function `getWebhooks`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-webhooks/).

*Currently we don't have an example for calling `getWebhooks` in integration tests*

### Arguments

- queryParams `GetWebhooksQueryParamsArg`
  - Query parameters of getWebhooks method
- headers `GetWebhooksHeadersArg`
  - Headers of getWebhooks method


### Returns

This function returns a value of type `Webhooks`.

Returns a list of webhooks.


## Create webhook

Creates a webhook.

This operation is performed by calling function `createWebhook`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-webhooks/).

*Currently we don't have an example for calling `createWebhook` in integration tests*

### Arguments

- requestBody `CreateWebhookRequestBodyArg`
  - Request body of createWebhook method
- headers `CreateWebhookHeadersArg`
  - Headers of createWebhook method


### Returns

This function returns a value of type `Webhook`.

Returns the new webhook object.


## Get webhook

Retrieves a specific webhook

This operation is performed by calling function `getWebhookById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-webhooks-id/).

*Currently we don't have an example for calling `getWebhookById` in integration tests*

### Arguments

- webhookId `String`
  - The ID of the webhook. Example: "3321123"
- headers `GetWebhookByIdHeadersArg`
  - Headers of getWebhookById method


### Returns

This function returns a value of type `Webhook`.

Returns a webhook object


## Update webhook

Updates a webhook.

This operation is performed by calling function `updateWebhookById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-webhooks-id/).

*Currently we don't have an example for calling `updateWebhookById` in integration tests*

### Arguments

- webhookId `String`
  - The ID of the webhook. Example: "3321123"
- requestBody `UpdateWebhookByIdRequestBodyArg`
  - Request body of updateWebhookById method
- headers `UpdateWebhookByIdHeadersArg`
  - Headers of updateWebhookById method


### Returns

This function returns a value of type `Webhook`.

Returns the new webhook object.


## Remove webhook

Deletes a webhook.

This operation is performed by calling function `deleteWebhookById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-webhooks-id/).

*Currently we don't have an example for calling `deleteWebhookById` in integration tests*

### Arguments

- webhookId `String`
  - The ID of the webhook. Example: "3321123"
- headers `DeleteWebhookByIdHeadersArg`
  - Headers of deleteWebhookById method


### Returns

This function returns a value of type ``.

An empty response will be returned when the webhook
was successfully deleted.


