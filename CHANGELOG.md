# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [0.6.0](https://github.com/box/box-swift-sdk-gen/compare/0.5.0...0.6.0) (2025-01-27)


### Bug Fixes

* Add missing token scope (box/box-openapi[#490](https://github.com/box/box-swift-sdk-gen/issues/490)) ([#319](https://github.com/box/box-swift-sdk-gen/issues/319)) ([220134e](https://github.com/box/box-swift-sdk-gen/commit/220134efb4ba42628de51561749ae218707d5121))
* Change signature of `readBufferFromFile` method (box/box-codegen[#575](https://github.com/box/box-swift-sdk-gen/issues/575)) ([#250](https://github.com/box/box-swift-sdk-gen/issues/250)) ([21e08ff](https://github.com/box/box-swift-sdk-gen/commit/21e08ff673da44c0dfe502c5fbbc14e382ef368b))
* Correct types of `paged` and `thumb` properties in File representation (box/box-openapi[#503](https://github.com/box/box-swift-sdk-gen/issues/503)) ([#347](https://github.com/box/box-swift-sdk-gen/issues/347)) ([58ff930](https://github.com/box/box-swift-sdk-gen/commit/58ff9305b34306ca506b08d43b72f95349322172))
* fix `IntegrationMapping` schemas description (box/box-openapi[#463](https://github.com/box/box-swift-sdk-gen/issues/463)) ([#257](https://github.com/box/box-swift-sdk-gen/issues/257)) ([794f315](https://github.com/box/box-swift-sdk-gen/commit/794f31548687b4e78e6f96b1a922e7e32dce0b9b))
* Fix invalid variant config for Integration mapping Slack (box/box-openapi[#492](https://github.com/box/box-swift-sdk-gen/issues/492)) ([#322](https://github.com/box/box-swift-sdk-gen/issues/322)) ([97f4f94](https://github.com/box/box-swift-sdk-gen/commit/97f4f944555997b5e09afd66eb9c07008fae8a94))
* Fix order of fields in the `IntegrationMapping` schema (box/box-openapi[#497](https://github.com/box/box-swift-sdk-gen/issues/497)) ([#335](https://github.com/box/box-swift-sdk-gen/issues/335)) ([cb28e6d](https://github.com/box/box-swift-sdk-gen/commit/cb28e6db015d84b59e6dccf6a2fa90c26de20efa))
* remove unused parameter from `SignRequest` (box/box-openapi[#489](https://github.com/box/box-swift-sdk-gen/issues/489)) ([#310](https://github.com/box/box-swift-sdk-gen/issues/310)) ([879897b](https://github.com/box/box-swift-sdk-gen/commit/879897bec80669a46effc2528ec19ce15d7df3b1))
* Support status codes with no content (box/box-codegen[#604](https://github.com/box/box-swift-sdk-gen/issues/604)) ([#284](https://github.com/box/box-swift-sdk-gen/issues/284)) ([5823d2b](https://github.com/box/box-swift-sdk-gen/commit/5823d2b1591cb1c817e36a43a78cb41498fcf1b4))
* update client error schema to support schema errors (box/box-openapi[#467](https://github.com/box/box-swift-sdk-gen/issues/467)) ([#259](https://github.com/box/box-swift-sdk-gen/issues/259)) ([40e2279](https://github.com/box/box-swift-sdk-gen/commit/40e2279e222df4a88278125a6a9a13ee4605cd69))
* update collaboration, metadata and collection resources (box/box-openapi[#483](https://github.com/box/box-swift-sdk-gen/issues/483)) ([#286](https://github.com/box/box-swift-sdk-gen/issues/286)) ([f5b190a](https://github.com/box/box-swift-sdk-gen/commit/f5b190a648f0c567abe688bd111a5b7c779a036c))


### New Features and Enhancements

* Add `aiAgent` info to `AiResponse` (box/box-openapi[#485](https://github.com/box/box-swift-sdk-gen/issues/485)) ([#304](https://github.com/box/box-swift-sdk-gen/issues/304)) ([b614a6f](https://github.com/box/box-swift-sdk-gen/commit/b614a6fe72689ed56947b05cac26a5b62104a621))
* add AI LLM endpoint AWS `params` (box/box-openapi[#478](https://github.com/box/box-swift-sdk-gen/issues/478)) ([#267](https://github.com/box/box-swift-sdk-gen/issues/267)) ([36ee37d](https://github.com/box/box-swift-sdk-gen/commit/36ee37d96ce0a50292036c02e4663fd124544736))
* Add Box Sign shared requests (box/box-openapi[#504](https://github.com/box/box-swift-sdk-gen/issues/504)) ([#348](https://github.com/box/box-swift-sdk-gen/issues/348)) ([2f5e2f1](https://github.com/box/box-swift-sdk-gen/commit/2f5e2f150d45f833fda2ef6e61e6c946ed0c36ad))
* Add support for replacing the network client implementation (box/box-codegen[#629](https://github.com/box/box-swift-sdk-gen/issues/629)) ([#313](https://github.com/box/box-swift-sdk-gen/issues/313)) ([e08a117](https://github.com/box/box-swift-sdk-gen/commit/e08a117c34e782b83a1fdd7a471938351cd00c6e))
* Expose method for making custom HTTP requests (box/box-codegen[#610](https://github.com/box/box-swift-sdk-gen/issues/610)) ([#297](https://github.com/box/box-swift-sdk-gen/issues/297)) ([f7da2e3](https://github.com/box/box-swift-sdk-gen/commit/f7da2e31f8e49cdd0b0e62e798d7d93bcea6c50b))
* Support `ai/extract` and `ai/extract_structured` endpoints (box/box-codegen[#564](https://github.com/box/box-swift-sdk-gen/issues/564)) ([#239](https://github.com/box/box-swift-sdk-gen/issues/239)) ([9b5d6e9](https://github.com/box/box-swift-sdk-gen/commit/9b5d6e9f31cbcc2411f34be1572ec91c7e4808cf))
* Support Box Doc Gen API (box/box-codegen[#644](https://github.com/box/box-swift-sdk-gen/issues/644)) ([#343](https://github.com/box/box-swift-sdk-gen/issues/343)) ([8ef2533](https://github.com/box/box-swift-sdk-gen/commit/8ef25335ecba4fcf2243c8043edc7edc46dbe932))
* Support get collection by ID endpoint (box/box-codegen[#595](https://github.com/box/box-swift-sdk-gen/issues/595)) ([#276](https://github.com/box/box-swift-sdk-gen/issues/276)) ([112828f](https://github.com/box/box-swift-sdk-gen/commit/112828fc499c3148c385dde6adb4fcfe5b791495))
* Support optional `userId` parameter for updating files, folders and web links (box/box-openapi[#488](https://github.com/box/box-swift-sdk-gen/issues/488)) ([#308](https://github.com/box/box-swift-sdk-gen/issues/308)) ([8bd13d0](https://github.com/box/box-swift-sdk-gen/commit/8bd13d024e7f74a15c3377ddfd54bfcdbec71e2b))
* update client error schema to support schema errors (box/box-openapi[#467](https://github.com/box/box-swift-sdk-gen/issues/467)) ([#266](https://github.com/box/box-swift-sdk-gen/issues/266)) ([4bcf843](https://github.com/box/box-swift-sdk-gen/commit/4bcf8439b03e8f3726e51f210bfa71ed3d8d6793))
* Use `retrieveAuthorizationHeader` method in fetch (box/box-codegen[#565](https://github.com/box/box-swift-sdk-gen/issues/565)) ([#235](https://github.com/box/box-swift-sdk-gen/issues/235)) ([f68e141](https://github.com/box/box-swift-sdk-gen/commit/f68e14174476a40b959280c391475ac8fef644e1))

## [0.6.0](https://github.com/box/box-swift-sdk-gen/compare/0.5.0...0.6.0) (2025-01-27)


### Bug Fixes

* Add missing token scope (box/box-openapi[#490](https://github.com/box/box-swift-sdk-gen/issues/490)) ([#319](https://github.com/box/box-swift-sdk-gen/issues/319)) ([220134e](https://github.com/box/box-swift-sdk-gen/commit/220134efb4ba42628de51561749ae218707d5121))
* Change signature of `readBufferFromFile` method (box/box-codegen[#575](https://github.com/box/box-swift-sdk-gen/issues/575)) ([#250](https://github.com/box/box-swift-sdk-gen/issues/250)) ([21e08ff](https://github.com/box/box-swift-sdk-gen/commit/21e08ff673da44c0dfe502c5fbbc14e382ef368b))
* Correct types of `paged` and `thumb` properties in File representation (box/box-openapi[#503](https://github.com/box/box-swift-sdk-gen/issues/503)) ([#347](https://github.com/box/box-swift-sdk-gen/issues/347)) ([58ff930](https://github.com/box/box-swift-sdk-gen/commit/58ff9305b34306ca506b08d43b72f95349322172))
* fix `IntegrationMapping` schemas description (box/box-openapi[#463](https://github.com/box/box-swift-sdk-gen/issues/463)) ([#257](https://github.com/box/box-swift-sdk-gen/issues/257)) ([794f315](https://github.com/box/box-swift-sdk-gen/commit/794f31548687b4e78e6f96b1a922e7e32dce0b9b))
* Fix invalid variant config for Integration mapping Slack (box/box-openapi[#492](https://github.com/box/box-swift-sdk-gen/issues/492)) ([#322](https://github.com/box/box-swift-sdk-gen/issues/322)) ([97f4f94](https://github.com/box/box-swift-sdk-gen/commit/97f4f944555997b5e09afd66eb9c07008fae8a94))
* Fix order of fields in the `IntegrationMapping` schema (box/box-openapi[#497](https://github.com/box/box-swift-sdk-gen/issues/497)) ([#335](https://github.com/box/box-swift-sdk-gen/issues/335)) ([cb28e6d](https://github.com/box/box-swift-sdk-gen/commit/cb28e6db015d84b59e6dccf6a2fa90c26de20efa))
* remove unused parameter from `SignRequest` (box/box-openapi[#489](https://github.com/box/box-swift-sdk-gen/issues/489)) ([#310](https://github.com/box/box-swift-sdk-gen/issues/310)) ([879897b](https://github.com/box/box-swift-sdk-gen/commit/879897bec80669a46effc2528ec19ce15d7df3b1))
* Support status codes with no content (box/box-codegen[#604](https://github.com/box/box-swift-sdk-gen/issues/604)) ([#284](https://github.com/box/box-swift-sdk-gen/issues/284)) ([5823d2b](https://github.com/box/box-swift-sdk-gen/commit/5823d2b1591cb1c817e36a43a78cb41498fcf1b4))
* update client error schema to support schema errors (box/box-openapi[#467](https://github.com/box/box-swift-sdk-gen/issues/467)) ([#259](https://github.com/box/box-swift-sdk-gen/issues/259)) ([40e2279](https://github.com/box/box-swift-sdk-gen/commit/40e2279e222df4a88278125a6a9a13ee4605cd69))
* update collaboration, metadata and collection resources (box/box-openapi[#483](https://github.com/box/box-swift-sdk-gen/issues/483)) ([#286](https://github.com/box/box-swift-sdk-gen/issues/286)) ([f5b190a](https://github.com/box/box-swift-sdk-gen/commit/f5b190a648f0c567abe688bd111a5b7c779a036c))


### New Features and Enhancements

* Add `aiAgent` info to `AiResponse` (box/box-openapi[#485](https://github.com/box/box-swift-sdk-gen/issues/485)) ([#304](https://github.com/box/box-swift-sdk-gen/issues/304)) ([b614a6f](https://github.com/box/box-swift-sdk-gen/commit/b614a6fe72689ed56947b05cac26a5b62104a621))
* add AI LLM endpoint AWS `params` (box/box-openapi[#478](https://github.com/box/box-swift-sdk-gen/issues/478)) ([#267](https://github.com/box/box-swift-sdk-gen/issues/267)) ([36ee37d](https://github.com/box/box-swift-sdk-gen/commit/36ee37d96ce0a50292036c02e4663fd124544736))
* Add Box Sign shared requests (box/box-openapi[#504](https://github.com/box/box-swift-sdk-gen/issues/504)) ([#348](https://github.com/box/box-swift-sdk-gen/issues/348)) ([2f5e2f1](https://github.com/box/box-swift-sdk-gen/commit/2f5e2f150d45f833fda2ef6e61e6c946ed0c36ad))
* Add support for replacing the network client implementation (box/box-codegen[#629](https://github.com/box/box-swift-sdk-gen/issues/629)) ([#313](https://github.com/box/box-swift-sdk-gen/issues/313)) ([e08a117](https://github.com/box/box-swift-sdk-gen/commit/e08a117c34e782b83a1fdd7a471938351cd00c6e))
* Expose method for making custom HTTP requests (box/box-codegen[#610](https://github.com/box/box-swift-sdk-gen/issues/610)) ([#297](https://github.com/box/box-swift-sdk-gen/issues/297)) ([f7da2e3](https://github.com/box/box-swift-sdk-gen/commit/f7da2e31f8e49cdd0b0e62e798d7d93bcea6c50b))
* Support `ai/extract` and `ai/extract_structured` endpoints (box/box-codegen[#564](https://github.com/box/box-swift-sdk-gen/issues/564)) ([#239](https://github.com/box/box-swift-sdk-gen/issues/239)) ([9b5d6e9](https://github.com/box/box-swift-sdk-gen/commit/9b5d6e9f31cbcc2411f34be1572ec91c7e4808cf))
* Support Box Doc Gen API (box/box-codegen[#644](https://github.com/box/box-swift-sdk-gen/issues/644)) ([#343](https://github.com/box/box-swift-sdk-gen/issues/343)) ([8ef2533](https://github.com/box/box-swift-sdk-gen/commit/8ef25335ecba4fcf2243c8043edc7edc46dbe932))
* Support get collection by ID endpoint (box/box-codegen[#595](https://github.com/box/box-swift-sdk-gen/issues/595)) ([#276](https://github.com/box/box-swift-sdk-gen/issues/276)) ([112828f](https://github.com/box/box-swift-sdk-gen/commit/112828fc499c3148c385dde6adb4fcfe5b791495))
* Support optional `userId` parameter for updating files, folders and web links (box/box-openapi[#488](https://github.com/box/box-swift-sdk-gen/issues/488)) ([#308](https://github.com/box/box-swift-sdk-gen/issues/308)) ([8bd13d0](https://github.com/box/box-swift-sdk-gen/commit/8bd13d024e7f74a15c3377ddfd54bfcdbec71e2b))
* update client error schema to support schema errors (box/box-openapi[#467](https://github.com/box/box-swift-sdk-gen/issues/467)) ([#266](https://github.com/box/box-swift-sdk-gen/issues/266)) ([4bcf843](https://github.com/box/box-swift-sdk-gen/commit/4bcf8439b03e8f3726e51f210bfa71ed3d8d6793))
* Use `retrieveAuthorizationHeader` method in fetch (box/box-codegen[#565](https://github.com/box/box-swift-sdk-gen/issues/565)) ([#235](https://github.com/box/box-swift-sdk-gen/issues/235)) ([f68e141](https://github.com/box/box-swift-sdk-gen/commit/f68e14174476a40b959280c391475ac8fef644e1))

## [0.5.0](https://github.com/box/box-codegen/compare/0.4.0...0.5.0) (2024-09-11)


### Bug Fixes

* Fix variants in metadata query results (box/box-openapi[#456](https://github.com/box/box-codegen/issues/456)) ([#232](https://github.com/box/box-codegen/issues/232)) ([be2fa52](https://github.com/box/box-codegen/commit/be2fa52bb0d086f6c9b20fd5c3bdcad4b98f3f37))


### New Features and Enhancements

* add Hubs Beta (box/box-openapi[#453](https://github.com/box/box-codegen/issues/453)) ([#220](https://github.com/box/box-codegen/issues/220)) ([546f487](https://github.com/box/box-codegen/commit/546f487bde9dae2407ff65620eb6e6a81e45b149))

## [0.4.0](https://github.com/box/box-codegen/compare/0.3.1...0.4.0) (2024-09-05)


### Bug Fixes

* Add missing fields to Sign Template Signer and fix AI schema (box/box-openapi[#451](https://github.com/box/box-codegen/issues/451)) ([#206](https://github.com/box/box-codegen/issues/206)) ([31920e6](https://github.com/box/box-codegen/commit/31920e67692c16b0600c4c9f4c279e22d02e4598))
* Fix `IntegrationMapping` schemas (box/box-codegen[#551](https://github.com/box/box-codegen/issues/551)) ([#203](https://github.com/box/box-codegen/issues/203)) ([0074ee3](https://github.com/box/box-codegen/commit/0074ee326627d01057cf50cb257d2291b646ab08))


### New Features and Enhancements

* Fix chunk upload in Swift (box/box-codegen[#555](https://github.com/box/box-codegen/issues/555)) ([#215](https://github.com/box/box-codegen/issues/215)) ([93ff568](https://github.com/box/box-codegen/commit/93ff5686415d99aa807d57d9e062f5a96380d707))
* Include URL into `FetchOptions` (box/box-codegen[#549](https://github.com/box/box-codegen/issues/549)) ([#208](https://github.com/box/box-codegen/issues/208)) ([b65822d](https://github.com/box/box-codegen/commit/b65822d379b1d5e9be7b179ed754e725f5a499fa))

### [0.3.1](https://github.com/box/box-codegen/compare/0.3.0...0.3.1) (2024-08-22)


### Bug Fixes

* Extract `IntegrationMappingPartnerItemSlack` to `IntegrationMappingPartnerItemSlackUnion` (box/box-codegen[#530](https://github.com/box/box-codegen/issues/530)) ([#165](https://github.com/box/box-codegen/issues/165)) ([d51df9a](https://github.com/box/box-codegen/commit/d51df9a19d06db886358e94ce70551c283e5cc45))
* Improve chunked upload reliability (box/box-codegen[#529](https://github.com/box/box-codegen/issues/529)) ([#164](https://github.com/box/box-codegen/issues/164)) ([5d87629](https://github.com/box/box-codegen/commit/5d876299aa88b18accde22379950780bff100da0))
* Retry requests with 202 status code and `Retry-After` header (box/box-codegen[#538](https://github.com/box/box-codegen/issues/538)) ([#177](https://github.com/box/box-codegen/issues/177)) ([64f27b3](https://github.com/box/box-codegen/commit/64f27b3858725adaa53a10a6e8df8c0bcfe73fea))


### New Features and Enhancements

* Add `is_active` parameter to user collaboration (box/box-openapi[#437](https://github.com/box/box-codegen/issues/437)) ([#163](https://github.com/box/box-codegen/issues/163)) ([5f726bb](https://github.com/box/box-codegen/commit/5f726bbffd682934ab5731e1620489b1ee54e5a1))
* Add new parameters to Box AI methods and introduce `AiResponseFull` variant (box/box-openapi[#446](https://github.com/box/box-codegen/issues/446)) ([#201](https://github.com/box/box-codegen/issues/201)) ([7c09090](https://github.com/box/box-codegen/commit/7c0909032733742cb5a019c897910ced2e9d6788))
* Add support for Swift 5.6 (box/box-codegen[#541](https://github.com/box/box-codegen/issues/541)) ([#180](https://github.com/box/box-codegen/issues/180)) ([04b7020](https://github.com/box/box-codegen/commit/04b7020f1220f73ad4637e6033d5539c56a64fcd))
* parametrise chunked uploads endpoint urls (box/box-openapi[#444](https://github.com/box/box-codegen/issues/444)) ([#192](https://github.com/box/box-codegen/issues/192)) ([ea18f9e](https://github.com/box/box-codegen/commit/ea18f9e5eb6558edb29ff378bceb5528ccd4fcfb))
* Support AI Agent API (box/box-codegen[#531](https://github.com/box/box-codegen/issues/531)) ([#170](https://github.com/box/box-codegen/issues/170)) ([fc9a00b](https://github.com/box/box-codegen/commit/fc9a00bdcaffeaccfd87caad73fe666fb46c36ab))

## [0.3.0](https://github.com/box/box-codegen/compare/v0.2.0...v0.3.0) (2024-06-28)


### Bug Fixes

* Change base urls (box/box-codegen[#491](https://github.com/box/box-codegen/issues/491)) ([#115](https://github.com/box/box-codegen/issues/115)) ([d0a7adb](https://github.com/box/box-codegen/commit/d0a7adb201c823313f0a5de25fa4fc5469590c97))
* Fix Box AI endpoints (box/box-openapi[#418](https://github.com/box/box-codegen/issues/418)) ([#88](https://github.com/box/box-codegen/issues/88)) ([022f83a](https://github.com/box/box-codegen/commit/022f83aaa7fbe3f4292a06527875123ecc7b99f0))
* Fix CI for auto update pull requests (box/box-codegen[#506](https://github.com/box/box-codegen/issues/506)) ([#135](https://github.com/box/box-codegen/issues/135)) ([a62e238](https://github.com/box/box-codegen/commit/a62e238534cb625dbc98cbe59c98939c78b74f4a))
* fix deserialisation of Union with array in Swift (box/box-codegen[#486](https://github.com/box/box-codegen/issues/486)) ([#94](https://github.com/box/box-codegen/issues/94)) ([4f187be](https://github.com/box/box-codegen/commit/4f187bed1e88c93c1258be8723a39b45129ff21f))
* Fix metadata filter resource (box/box-openapi[#419](https://github.com/box/box-codegen/issues/419)) ([#90](https://github.com/box/box-codegen/issues/90)) ([b04f7ce](https://github.com/box/box-codegen/commit/b04f7ceee9bca4f1f19d66401f38636e7737b4b1))
* Fix schemas for updating classification on a file and folder (box/box-openapi[#423](https://github.com/box/box-codegen/issues/423)) ([#104](https://github.com/box/box-codegen/issues/104)) ([caa9d2b](https://github.com/box/box-codegen/commit/caa9d2b7d0a6c2728f543fa19acb7859f21fb5c9))
* improve wording for box sign (box/box-openapi[#424](https://github.com/box/box-codegen/issues/424)) ([#111](https://github.com/box/box-codegen/issues/111)) ([4fa69f0](https://github.com/box/box-codegen/commit/4fa69f01ca3a2a7fc8dcdc71cbecb03c469a83e6))


### New Features and Enhancements

*  add missing marker pagination fields and introduce new event type `(box/box-openapi[#431](https://github.com/box/box-codegen/issues/431))` ([#136](https://github.com/box/box-codegen/issues/136)) ([b186b11](https://github.com/box/box-codegen/commit/b186b11a2c591cd4fdd3b50733750a7bb4ec94e9))
* Add support for `visionOS` and add privacy manifest file for swift `(box/box-codegen[#510](https://github.com/box/box-codegen/issues/510))` ([#139](https://github.com/box/box-codegen/issues/139)) ([7fc76fc](https://github.com/box/box-codegen/commit/7fc76fc1799db0a50ad22eb047d013c4597c5277))
* Add support for Date in Swift (box/box-codegen[#488](https://github.com/box/box-codegen/issues/488)) ([#103](https://github.com/box/box-codegen/issues/103)) ([7e1ea1a](https://github.com/box/box-codegen/commit/7e1ea1af553cc8458eb9026c777608f7929e686d))
* Improve chunk upload in Swift `(box/box-codegen[#515](https://github.com/box/box-codegen/issues/515))` ([#143](https://github.com/box/box-codegen/issues/143)) ([b8099ab](https://github.com/box/box-codegen/commit/b8099ab41ea5b8706e14285a0f9db2fd3c0a7a6d))
* move notification suppression to public schema (box/box-openapi[#425](https://github.com/box/box-codegen/issues/425)) ([#113](https://github.com/box/box-codegen/issues/113)) ([069be60](https://github.com/box/box-codegen/commit/069be60613889b45b396bbe22262c5f8df32b158))
* Move schemas to separate modules (box/box-codegen[#483](https://github.com/box/box-codegen/issues/483)) ([#99](https://github.com/box/box-codegen/issues/99)) ([c7a8506](https://github.com/box/box-codegen/commit/c7a85069544c28e2be918eafd9e240f39660ead3))
* Start throwing common errors `(box/box-codegen[#516](https://github.com/box/box-codegen/issues/516))` ([#147](https://github.com/box/box-codegen/issues/147)) ([d12bbb7](https://github.com/box/box-codegen/commit/d12bbb7d06bd3fcf39c31e316f1047065b56baac))
* Support Box AI endpoints (box/box-openapi[#416](https://github.com/box/box-codegen/issues/416)) ([#86](https://github.com/box/box-codegen/issues/86)) ([175ab82](https://github.com/box/box-codegen/commit/175ab82c18dc390bcd4c8e20aea8e405a2e31c4d))
* Support chunk upload in Swift `(box/box-codegen[#513](https://github.com/box/box-codegen/issues/513))` ([#142](https://github.com/box/box-codegen/issues/142)) ([9e0b4e2](https://github.com/box/box-codegen/commit/9e0b4e26a9283b5900ae0fe0fa858394b732f51b))
* support excluding endpoints and schemas in parser (box/box-codegen[#487](https://github.com/box/box-codegen/issues/487)) ([#100](https://github.com/box/box-codegen/issues/100)) ([af9e171](https://github.com/box/box-codegen/commit/af9e171c101703c98ff9a53093d7fc9c306137d9))
