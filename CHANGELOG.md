# Changelog

## [v0.4.1](https://github.com/oscar-stack/vagrant-bolt/tree/v0.4.1) (2021-03-15)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/v0.4.0...v0.4.1)

**Closed issues:**

- `config.bolt.debug = true` fails when running with Bolt 3.0 [\#19](https://github.com/oscar-stack/vagrant-bolt/issues/19)

**Merged pull requests:**

- Fix config.debug = true for Bolt 3.0 [\#20](https://github.com/oscar-stack/vagrant-bolt/pull/20) ([op-ct](https://github.com/op-ct))

## [v0.4.0](https://github.com/oscar-stack/vagrant-bolt/tree/v0.4.0) (2020-12-23)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/v0.3.0...v0.4.0)

**Merged pull requests:**

- \(maint\) Change to github actions from travis [\#18](https://github.com/oscar-stack/vagrant-bolt/pull/18) ([jarretlavallee](https://github.com/jarretlavallee))
- Remove deprecated Bolt features [\#17](https://github.com/oscar-stack/vagrant-bolt/pull/17) ([jarretlavallee](https://github.com/jarretlavallee))

**Changes**

- This release requires bolt 2.16.0+
- Several deprecated features have been removed such as the following
  - `boltdir` has been changed to `project`. The `project` setting defaults to `boltdir` to avoid breaking changes
  - `run-as` has been removed from the `winrm` settings hash in the inventory file
  - `version` has been removed from the inventory file
  - `run-as` has been removed from the command line as it was overridden by the inventory file
- Acceptance tests have been fixed to use the gem installation of bolt
- Travis-CI tests have been migrated to Github Actions

## [v0.3.0](https://github.com/oscar-stack/vagrant-bolt/tree/v0.3.0) (2020-06-02)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/v0.2.1...v0.3.0)

**Merged pull requests:**

- Update inventory naming [\#16](https://github.com/oscar-stack/vagrant-bolt/pull/16) ([jarretlavallee](https://github.com/jarretlavallee))

## [v0.2.1](https://github.com/oscar-stack/vagrant-bolt/tree/v0.2.1) (2020-03-23)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/v0.2.0...v0.2.1)

**Closed issues:**

- Replace bolt argument nodes with targets [\#13](https://github.com/oscar-stack/vagrant-bolt/issues/13)

**Merged pull requests:**

- Fix config builder role filtering [\#15](https://github.com/oscar-stack/vagrant-bolt/pull/15) ([jarretlavallee](https://github.com/jarretlavallee))

## [v0.2.0](https://github.com/oscar-stack/vagrant-bolt/tree/v0.2.0) (2020-02-26)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/v0.1.2...v0.2.0)

**Merged pull requests:**

- Change nodes to targets in config [\#14](https://github.com/oscar-stack/vagrant-bolt/pull/14) ([jarretlavallee](https://github.com/jarretlavallee))
- Update to Bolt inventory v2 [\#12](https://github.com/oscar-stack/vagrant-bolt/pull/12) ([jarretlavallee](https://github.com/jarretlavallee))

## [v0.1.2](https://github.com/oscar-stack/vagrant-bolt/tree/v0.1.2) (2019-10-17)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/v0.1.1...v0.1.2)

**Merged pull requests:**

- Fix the bolt path issue and create a release [\#11](https://github.com/oscar-stack/vagrant-bolt/pull/11) ([jarretlavallee](https://github.com/jarretlavallee))
- Fix changelog version tag [\#10](https://github.com/oscar-stack/vagrant-bolt/pull/10) ([jarretlavallee](https://github.com/jarretlavallee))

## [v0.1.1](https://github.com/oscar-stack/vagrant-bolt/tree/v0.1.1) (2019-07-01)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/v0.1.0...v0.1.1)

**Merged pull requests:**

- Add changelog generation [\#9](https://github.com/oscar-stack/vagrant-bolt/pull/9) ([jarretlavallee](https://github.com/jarretlavallee))
- Clean up command line arguments and paths [\#8](https://github.com/oscar-stack/vagrant-bolt/pull/8) ([jarretlavallee](https://github.com/jarretlavallee))
- Add connect\_timeout option to inventory [\#7](https://github.com/oscar-stack/vagrant-bolt/pull/7) ([jarretlavallee](https://github.com/jarretlavallee))

## [v0.1.0](https://github.com/oscar-stack/vagrant-bolt/tree/v0.1.0) (2018-12-11)

[Full Changelog](https://github.com/oscar-stack/vagrant-bolt/compare/4574482459a0f320bb6b25557199a1612b19ea72...v0.1.0)

**Merged pull requests:**

- \(SUP-874\) Add a command line interface [\#6](https://github.com/oscar-stack/vagrant-bolt/pull/6) ([jarretlavallee](https://github.com/jarretlavallee))
- Add Support for config\_builder bolt triggers [\#5](https://github.com/oscar-stack/vagrant-bolt/pull/5) ([jarretlavallee](https://github.com/jarretlavallee))
- Add Config Options and cleanup some bad code [\#4](https://github.com/oscar-stack/vagrant-bolt/pull/4) ([jarretlavallee](https://github.com/jarretlavallee))
- Consolidate files and add some spec tests [\#3](https://github.com/oscar-stack/vagrant-bolt/pull/3) ([jarretlavallee](https://github.com/jarretlavallee))
- Add the ability to use triggers and provisioners [\#2](https://github.com/oscar-stack/vagrant-bolt/pull/2) ([jarretlavallee](https://github.com/jarretlavallee))
- Initial Implementation [\#1](https://github.com/oscar-stack/vagrant-bolt/pull/1) ([jarretlavallee](https://github.com/jarretlavallee))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
