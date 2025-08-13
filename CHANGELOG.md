# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.6.2](https://github.com/box/box-swift-sdk-gen/compare/0.6.1...0.6.2) (2025-08-13)


### Bug Fixes

* Fix downscope token to use `retrieveToken` method for token retrieval (box/box-codegen[#731](https://github.com/box/box-swift-sdk-gen/issues/731)) ([#459](https://github.com/box/box-swift-sdk-gen/issues/459)) ([8992b32](https://github.com/box/box-swift-sdk-gen/commit/8992b32e9dd058fc77b4d68418da81b162aea315))
* Fix parsing `Date` into query parameters (box/box-codegen[#729](https://github.com/box/box-swift-sdk-gen/issues/729)) ([#449](https://github.com/box/box-swift-sdk-gen/issues/449)) ([1a95d0c](https://github.com/box/box-swift-sdk-gen/commit/1a95d0c80e0bd29dc1b467e7e98e6f5e6196ddfb))
* Specify events `next_stream_position` property type as `int64` (box/box-openapi[#535](https://github.com/box/box-swift-sdk-gen/issues/535)) ([#502](https://github.com/box/box-swift-sdk-gen/issues/502)) ([795fe1c](https://github.com/box/box-swift-sdk-gen/commit/795fe1c7f0aa6074145b675fce4dd8e1432b0a64))


### New Features and Enhancements

* Add `downloadZip` method (box/box-codegen[#765](https://github.com/box/box-swift-sdk-gen/issues/765)) ([#505](https://github.com/box/box-swift-sdk-gen/issues/505)) ([c03589d](https://github.com/box/box-swift-sdk-gen/commit/c03589d6add3ee6d548f10b5380031cd38284e42))
* Add `rawData` property (box/box-codegen[#724](https://github.com/box/box-swift-sdk-gen/issues/724)) ([#445](https://github.com/box/box-swift-sdk-gen/issues/445)) ([77405ad](https://github.com/box/box-swift-sdk-gen/commit/77405adc986adb8a1ce3bcff051ea8c481dbfd9d))
* add AI agents warnings; allow for more types of metadata value (box/box-openapi[#520](https://github.com/box/box-swift-sdk-gen/issues/520)) ([#435](https://github.com/box/box-swift-sdk-gen/issues/435)) ([af1dc12](https://github.com/box/box-swift-sdk-gen/commit/af1dc12763f9a84691573fd3ba8307925fc017d6))
* add AI spreadsheet processor (box/box-openapi[#533](https://github.com/box/box-swift-sdk-gen/issues/533)) ([#484](https://github.com/box/box-swift-sdk-gen/issues/484)) ([14726d1](https://github.com/box/box-swift-sdk-gen/commit/14726d1952f5ddb2414f723a0b18fa5226269a64))
* Add Archive Public API (box/box-openapi[#540](https://github.com/box/box-swift-sdk-gen/issues/540)) ([#509](https://github.com/box/box-swift-sdk-gen/issues/509)) ([8266386](https://github.com/box/box-swift-sdk-gen/commit/82663868c61a31f43b229c6f24e29737913662a0))
* Add CI for swift (box/box-codegen[#755](https://github.com/box/box-swift-sdk-gen/issues/755)) ([#494](https://github.com/box/box-swift-sdk-gen/issues/494)) ([76a3337](https://github.com/box/box-swift-sdk-gen/commit/76a3337bed9bfc4629ec7dcb9af86bec4aa710f3))
* add hubs API beta endpoints (box/box-openapi[#531](https://github.com/box/box-swift-sdk-gen/issues/531)) ([#476](https://github.com/box/box-swift-sdk-gen/issues/476)) ([a05aa5f](https://github.com/box/box-swift-sdk-gen/commit/a05aa5fe2aaade1d7bdd7acb90c82fcb3a3bf262))
* Add new Hubs APIs and Hubs items API (box/box-openapi[#538](https://github.com/box/box-swift-sdk-gen/issues/538)) ([#503](https://github.com/box/box-swift-sdk-gen/issues/503)) ([9058c45](https://github.com/box/box-swift-sdk-gen/commit/9058c45c0bcd3e7f294a1bedac151637001aec63))
* Add new schema for `Metadata Error` (box/box-openapi[#539](https://github.com/box/box-swift-sdk-gen/issues/539)) ([#504](https://github.com/box/box-swift-sdk-gen/issues/504)) ([2e9ecf9](https://github.com/box/box-swift-sdk-gen/commit/2e9ecf9477854656958b715674b8aa0413508d31))
* Add security settings properties on sign template schema (box/box-openapi[#518](https://github.com/box/box-swift-sdk-gen/issues/518)) ([#426](https://github.com/box/box-swift-sdk-gen/issues/426)) ([a741a73](https://github.com/box/box-swift-sdk-gen/commit/a741a7305e2b2d174bc325e35ea9b77548a38095))
* add Shield Lists APIs (box/box-openapi[#528](https://github.com/box/box-swift-sdk-gen/issues/528)) ([#462](https://github.com/box/box-swift-sdk-gen/issues/462)) ([b5993b0](https://github.com/box/box-swift-sdk-gen/commit/b5993b096b4fceb77301f76eba1c17225b2844d6))
* Add support for `additionalProperties` with Any value (box/box-codegen[#711](https://github.com/box/box-swift-sdk-gen/issues/711)) ([#427](https://github.com/box/box-swift-sdk-gen/issues/427)) ([7fbf706](https://github.com/box/box-swift-sdk-gen/commit/7fbf7069eff66afddc328066f8aeb7321b249eea))
* Add support for `nullable` fields (box/box-codegen[#700](https://github.com/box/box-swift-sdk-gen/issues/700)) ([#420](https://github.com/box/box-swift-sdk-gen/issues/420)) ([5d0ff41](https://github.com/box/box-swift-sdk-gen/commit/5d0ff414b325db92db44c580cebb5636ab33553f))
* add support of IBM models to AI API (box/box-openapi[#522](https://github.com/box/box-swift-sdk-gen/issues/522)) ([#436](https://github.com/box/box-swift-sdk-gen/issues/436)) ([0717222](https://github.com/box/box-swift-sdk-gen/commit/071722246402e0ec2439ae1e5e3d26bca45a049f))
* Expose `makeRequest` method in `BoxClient` (box/box-codegen[#687](https://github.com/box/box-swift-sdk-gen/issues/687)) ([#408](https://github.com/box/box-swift-sdk-gen/issues/408)) ([7ba7d09](https://github.com/box/box-swift-sdk-gen/commit/7ba7d091b0c832276daa571fad2a7db75469676d))
* Improve AI integration test (box/box-codegen[#758](https://github.com/box/box-swift-sdk-gen/issues/758)) ([#499](https://github.com/box/box-swift-sdk-gen/issues/499)) ([3c7e717](https://github.com/box/box-swift-sdk-gen/commit/3c7e717c6ca076caf1a963b3f60d3bd88f8c4bff))
* Sanitize response body when throwing `BoxAPIError` (box/box-codegen[#760](https://github.com/box/box-swift-sdk-gen/issues/760)) ([#498](https://github.com/box/box-swift-sdk-gen/issues/498)) ([2afc793](https://github.com/box/box-swift-sdk-gen/commit/2afc7936dac87dee22adff3e22def92913f5854c))
* Support `getDownloadUrl` in Swift (box/box-codegen[#751](https://github.com/box/box-swift-sdk-gen/issues/751)) ([#491](https://github.com/box/box-swift-sdk-gen/issues/491)) ([5916ede](https://github.com/box/box-swift-sdk-gen/commit/5916ede7454a1926de195e77b9a158c2af0fae2b))
* Support new tools in AI Studio (box/box-openapi[#534](https://github.com/box/box-swift-sdk-gen/issues/534)) ([#485](https://github.com/box/box-swift-sdk-gen/issues/485)) ([e793d7b](https://github.com/box/box-swift-sdk-gen/commit/e793d7b3a03e8d58ce6adb63a894a0330ae154d1))
* Support sensitive data sanitization in errors (box/box-codegen[#695](https://github.com/box/box-swift-sdk-gen/issues/695)) ([#415](https://github.com/box/box-swift-sdk-gen/issues/415)) ([330ca9a](https://github.com/box/box-swift-sdk-gen/commit/330ca9ad17cbc79c93ffb114fd56c09a41f92694))
* Update legal holds and AI models (box/box-openapi[#526](https://github.com/box/box-swift-sdk-gen/issues/526)) ([#460](https://github.com/box/box-swift-sdk-gen/issues/460)) ([caa848a](https://github.com/box/box-swift-sdk-gen/commit/caa848ac977c7fedeacbe018339d27b9d948bb1e))

### [0.6.1](https://github.com/box/box-swift-sdk-gen/compare/0.6.0...0.6.1) (2025-03-18)


### Bug Fixes

* Add `verification_phone_number` property to create sign request (box/box-openapi[#515](https://github.com/box/box-swift-sdk-gen/issues/515)) ([#391](https://github.com/box/box-swift-sdk-gen/issues/391)) ([717b3a8](https://github.com/box/box-swift-sdk-gen/commit/717b3a8b285dfab92a9446cbd84443caa8dde148))


### New Features and Enhancements

* Add find app item for shared link endpoint (box/box-openapi[#514](https://github.com/box/box-swift-sdk-gen/issues/514)) ([#390](https://github.com/box/box-swift-sdk-gen/issues/390)) ([07b9be5](https://github.com/box/box-swift-sdk-gen/commit/07b9be5d523f3d3fb89bdbb240e4ca9628a3736d))
* Add hubs support to `/ai/ask` (box/box-codegen[#656](https://github.com/box/box-swift-sdk-gen/issues/656)) ([#364](https://github.com/box/box-swift-sdk-gen/issues/364)) ([9a49864](https://github.com/box/box-swift-sdk-gen/commit/9a4986499eaefffdb4f2593968d59eaf030f516f))
* Add Integration Mappings Teams API (box/box-openapi[#517](https://github.com/box/box-swift-sdk-gen/issues/517)) ([#393](https://github.com/box/box-swift-sdk-gen/issues/393)) ([b9ed4e3](https://github.com/box/box-swift-sdk-gen/commit/b9ed4e35d17f85c1d2bc2a4e9e148ae009551348))
* Expose token storage for authentication classes (box/box-codegen[#682](https://github.com/box/box-swift-sdk-gen/issues/682)) ([#400](https://github.com/box/box-swift-sdk-gen/issues/400)) ([08221e5](https://github.com/box/box-swift-sdk-gen/commit/08221e59cabc4042ea1d43bf578c2069ad66b444))
* Support AI Studio API (box/box-codegen[#626](https://github.com/box/box-swift-sdk-gen/issues/626)) ([#375](https://github.com/box/box-swift-sdk-gen/issues/375)) ([802571d](https://github.com/box/box-swift-sdk-gen/commit/802571dd34977ae2ebf674dbdddd3e140829b819))
* Support unknown enum values in Swift (box/box-codegen[#670](https://github.com/box/box-swift-sdk-gen/issues/670)) ([#382](https://github.com/box/box-swift-sdk-gen/issues/382)) ([8fe7ff4](https://github.com/box/box-swift-sdk-gen/commit/8fe7ff45fa4e45f743acd4450270d945b0afd393))
* Support upload with preflight check (box/box-codegen[#676](https://github.com/box/box-swift-sdk-gen/issues/676)) ([#399](https://github.com/box/box-swift-sdk-gen/issues/399)) ([1befb4c](https://github.com/box/box-swift-sdk-gen/commit/1befb4c1b4898375ea3ab353c7149fd10adc1f17))
* Update `/ai/extract_structured` response schema (box/box-codegen[#641](https://github.com/box/box-swift-sdk-gen/issues/641)) ([#358](https://github.com/box/box-swift-sdk-gen/issues/358)) ([430611a](https://github.com/box/box-swift-sdk-gen/commit/430611a0036258d5f3ff8e1c6de0b833255ce0ed))

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
