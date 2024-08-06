# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.3.1](https://github.com/box/box-codegen/compare/0.3.0...0.3.1) (2024-08-06)


### Bug Fixes

* Extract `IntegrationMappingPartnerItemSlack` to `IntegrationMappingPartnerItemSlackUnion` (box/box-codegen[#530](https://github.com/box/box-codegen/issues/530)) ([#165](https://github.com/box/box-codegen/issues/165)) ([d51df9a](https://github.com/box/box-codegen/commit/d51df9a19d06db886358e94ce70551c283e5cc45))
* Improve chunked upload reliability (box/box-codegen[#529](https://github.com/box/box-codegen/issues/529)) ([#164](https://github.com/box/box-codegen/issues/164)) ([5d87629](https://github.com/box/box-codegen/commit/5d876299aa88b18accde22379950780bff100da0))
* Retry requests with 202 status code and `Retry-After` header (box/box-codegen[#538](https://github.com/box/box-codegen/issues/538)) ([#177](https://github.com/box/box-codegen/issues/177)) ([64f27b3](https://github.com/box/box-codegen/commit/64f27b3858725adaa53a10a6e8df8c0bcfe73fea))


### New Features and Enhancements

* Add `is_active` parameter to user collaboration (box/box-openapi[#437](https://github.com/box/box-codegen/issues/437)) ([#163](https://github.com/box/box-codegen/issues/163)) ([5f726bb](https://github.com/box/box-codegen/commit/5f726bbffd682934ab5731e1620489b1ee54e5a1))
* Add support for Swift 5.6 (box/box-codegen[#541](https://github.com/box/box-codegen/issues/541)) ([#180](https://github.com/box/box-codegen/issues/180)) ([04b7020](https://github.com/box/box-codegen/commit/04b7020f1220f73ad4637e6033d5539c56a64fcd))
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
