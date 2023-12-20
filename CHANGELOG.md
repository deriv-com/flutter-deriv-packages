# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2023-12-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`deriv_auth` - `v1.2.1`](#deriv_auth---v121)
 - [`deriv_auth_ui` - `v0.0.2+1`](#deriv_auth_ui---v0021)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `deriv_auth_ui` - `v0.0.2+1`

---

#### `deriv_auth` - `v1.2.1`

 - **FIX**(deriv_auth): local currencies fromJson authorize_model.dart ([#367](https://github.com/regentmarkets/flutter-deriv-packages/issues/367)). ([4d39a44a](https://github.com/regentmarkets/flutter-deriv-packages/commit/4d39a44a2de970219b241db43bb06b2022f04a3f))


## 2023-12-13

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`analytics` - `v1.0.2`](#analytics---v102)
 - [`deriv_auth` - `v1.2.0`](#deriv_auth---v120)
 - [`deriv_auth_ui` - `v0.0.2`](#deriv_auth_ui---v002)
 - [`deriv_date_range_picker` - `v0.0.1+2`](#deriv_date_range_picker---v0012)
 - [`deriv_dependency_injector` - `v1.0.2`](#deriv_dependency_injector---v102)
 - [`deriv_env` - `v0.0.1+2`](#deriv_env---v0012)
 - [`deriv_numpad` - `v1.0.2`](#deriv_numpad---v102)
 - [`deriv_theme` - `v2.2.0`](#deriv_theme---v220)
 - [`deriv_ui` - `v0.0.2`](#deriv_ui---v002)
 - [`deriv_expandable_bottom_sheet` - `v0.0.1+2`](#deriv_expandable_bottom_sheet---v0012)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `deriv_expandable_bottom_sheet` - `v0.0.1+2`

---

#### `analytics` - `v1.0.2`

 - **REVERT**(analytics): versioning and CHANGELOG. ([81a3a0df](https://github.com/regentmarkets/flutter-deriv-packages/commit/81a3a0df27208bd200009415855c6cb944d016e3))
 - **REFACTOR**(analytics): [MOBC-546] Creating unified analytics package. ([#315](https://github.com/regentmarkets/flutter-deriv-packages/issues/315)). ([fd1d8ed3](https://github.com/regentmarkets/flutter-deriv-packages/commit/fd1d8ed345d4ecf91c5f6c1463c5196b40abcbf6))

#### `deriv_auth` - `v1.2.0`

 - **FEAT**(deriv_auth): [DERG-1299] add user agent to login ([#341](https://github.com/regentmarkets/flutter-deriv-packages/issues/341)). ([37f5b763](https://github.com/regentmarkets/flutter-deriv-packages/commit/37f5b763d8a679ff1d458fc4e9b82578f4eecf83))

#### `deriv_auth_ui` - `v0.0.2`

 - **REFACTOR**(deriv_auth_ui): [MOBC-629] Adding semantics to UI components ([#321](https://github.com/regentmarkets/flutter-deriv-packages/issues/321)). ([36a0c1fa](https://github.com/regentmarkets/flutter-deriv-packages/commit/36a0c1faa0b47d4f735a79daf67c9e2c0089938e))
 - **REFACTOR**: deriv country selection cubit. ([5b0d5f0c](https://github.com/regentmarkets/flutter-deriv-packages/commit/5b0d5f0c37ecd732739204d2a41c334779803945))
 - **REFACTOR**: deriv country selection cubit. ([e88f6332](https://github.com/regentmarkets/flutter-deriv-packages/commit/e88f6332844433953a63ff5933612ea2e115b045))
 - **REFACTOR**: make countries non-nullable. ([e65d7587](https://github.com/regentmarkets/flutter-deriv-packages/commit/e65d7587e334e82486f6510a50015784adf6fddd))
 - **REFACTOR**: add eof and remove deprecated lint. ([c2c7a80a](https://github.com/regentmarkets/flutter-deriv-packages/commit/c2c7a80a5fe39f747897a8a6be09701d125716e9))
 - **REFACTOR**: auth state handler. ([84e2099d](https://github.com/regentmarkets/flutter-deriv-packages/commit/84e2099d65abe8585c64773254fca99059b3b4cb))
 - **REFACTOR**: auth state handling in signup and set password page. ([05c12d53](https://github.com/regentmarkets/flutter-deriv-packages/commit/05c12d53906de229d316fdbcf18396e4b34aed1f))
 - **FIX**: spacing after social flag. ([d782c86a](https://github.com/regentmarkets/flutter-deriv-packages/commit/d782c86a69eae3489e261060c7eacf63eb2da9d0))
 - **FIX**: add missing ok label in referal dialog. ([086fc636](https://github.com/regentmarkets/flutter-deriv-packages/commit/086fc636bdae24da873a9931e7b053b50e6b1a73))
 - **FIX**: reset password button alignment. ([411b2115](https://github.com/regentmarkets/flutter-deriv-packages/commit/411b2115d0f891b61036e601c5f26045e3a861f3))
 - **FIX**: change color to general. ([cac78e49](https://github.com/regentmarkets/flutter-deriv-packages/commit/cac78e49f1650fe1ba5f7698b97ce7a5adaa1308))
 - **FEAT**: [MOBC-608] auth ui setting page ([#320](https://github.com/regentmarkets/flutter-deriv-packages/issues/320)). ([ce8d202b](https://github.com/regentmarkets/flutter-deriv-packages/commit/ce8d202bc1636f29ca99475d645d99aead663e57))
 - **FEAT**: add flag for social login. ([016f3902](https://github.com/regentmarkets/flutter-deriv-packages/commit/016f3902d6d110f76446a0cc4ce0edfa2f35dd8a))
 - **FEAT**: reset pass success page. ([afb19891](https://github.com/regentmarkets/flutter-deriv-packages/commit/afb1989104a02fc3e8c03a55e1b35216500be422))
 - **FEAT**: add gesture detector in get started layout. ([185928c6](https://github.com/regentmarkets/flutter-deriv-packages/commit/185928c6d8489d8edf3732a58cf05d91b0cac71b))
 - **FEAT**: country consent added in country_selection_layout. ([7cc23945](https://github.com/regentmarkets/flutter-deriv-packages/commit/7cc239455f1169777f8c11d78487f1e39e35e76b))
 - **FEAT**: add social button flag. ([f8f95171](https://github.com/regentmarkets/flutter-deriv-packages/commit/f8f9517127a5cda26eed12c290f702c8623826e9))
 - **FEAT**: add auth error state handler in set password page. ([737ed84a](https://github.com/regentmarkets/flutter-deriv-packages/commit/737ed84a282869bce1bbde00794309e9e9fc2b34))
 - **FEAT**: add auth error state handler in sign up page. ([b7910157](https://github.com/regentmarkets/flutter-deriv-packages/commit/b79101574ac82790c8acb3fb5cda93dfb6274500))
 - **FEAT**: add deriv auth error state handler. ([6818ff32](https://github.com/regentmarkets/flutter-deriv-packages/commit/6818ff321b0875a039013e339e55cabba683a4fb))
 - **DOCS**: update documentation based on latest changes. ([4ba23ea9](https://github.com/regentmarkets/flutter-deriv-packages/commit/4ba23ea9b791d5d1d6aaf54fd4562ba1232e4259))

#### `deriv_date_range_picker` - `v0.0.1+2`

 - **FIX**: change color to general. ([cac78e49](https://github.com/regentmarkets/flutter-deriv-packages/commit/cac78e49f1650fe1ba5f7698b97ce7a5adaa1308))

#### `deriv_dependency_injector` - `v1.0.2`

 - **REFACTOR**(deriv_dependency_injector): [MOBC-534] deprecate deriv dependency injector ([#347](https://github.com/regentmarkets/flutter-deriv-packages/issues/347)). ([92426f15](https://github.com/regentmarkets/flutter-deriv-packages/commit/92426f15eaa5caa529724590e006fd0f65d6800e))

#### `deriv_env` - `v0.0.1+2`

 - **REFACTOR**(deriv_env): make package independent of env file ([#318](https://github.com/regentmarkets/flutter-deriv-packages/issues/318)). ([a7242c81](https://github.com/regentmarkets/flutter-deriv-packages/commit/a7242c81b97fda70a622d7bbbb97fe997067117a))

#### `deriv_numpad` - `v1.0.2`

 - **FIX**: change color to general. ([cac78e49](https://github.com/regentmarkets/flutter-deriv-packages/commit/cac78e49f1650fe1ba5f7698b97ce7a5adaa1308))

#### `deriv_theme` - `v2.2.0`

 - **FEAT**: Ayaan/Added margins 112 and 164 ([#319](https://github.com/regentmarkets/flutter-deriv-packages/issues/319)). ([bf625820](https://github.com/regentmarkets/flutter-deriv-packages/commit/bf6258206b4bb4cbdd1ef6744e07e2adb8d0d5ee))

#### `deriv_ui` - `v0.0.2`

 - **REFACTOR**(deriv_auth_ui): [MOBC-629] Adding semantics to UI components ([#321](https://github.com/regentmarkets/flutter-deriv-packages/issues/321)). ([36a0c1fa](https://github.com/regentmarkets/flutter-deriv-packages/commit/36a0c1faa0b47d4f735a79daf67c9e2c0089938e))
 - **FIX**: change color to general. ([cac78e49](https://github.com/regentmarkets/flutter-deriv-packages/commit/cac78e49f1650fe1ba5f7698b97ce7a5adaa1308))
 - **FEAT**: country consent added in country_selection_layout. ([7cc23945](https://github.com/regentmarkets/flutter-deriv-packages/commit/7cc239455f1169777f8c11d78487f1e39e35e76b))


## 2023-12-12

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`deriv_dependency_injector` - `v1.0.1`](#deriv_dependency_injector---v101)

---

#### `deriv_dependency_injector` - `v1.0.1`

 - **REFACTOR**(deriv_dependency_injector): [MOBC-534] deprecate deriv dependency injector ([#347](https://github.com/regentmarkets/flutter-deriv-packages/issues/347)). ([92426f15](https://github.com/regentmarkets/flutter-deriv-packages/commit/92426f15eaa5caa529724590e006fd0f65d6800e))


## 2023-12-08

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`analytics` - `v1.0.1`](#analytics---v101)

---

#### `analytics` - `v1.0.1`

 - **REVERT**(analytics): versioning and CHANGELOG. ([81a3a0df](https://github.com/regentmarkets/flutter-deriv-packages/commit/81a3a0df27208bd200009415855c6cb944d016e3))
 - **REFACTOR**(analytics): [MOBC-546] Creating unified analytics package. ([#315](https://github.com/regentmarkets/flutter-deriv-packages/issues/315)). ([fd1d8ed3](https://github.com/regentmarkets/flutter-deriv-packages/commit/fd1d8ed345d4ecf91c5f6c1463c5196b40abcbf6))


## 2023-12-04

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`deriv_auth` - `v1.1.0`](#deriv_auth---v110)
 - [`deriv_auth_ui` - `v0.0.1+3`](#deriv_auth_ui---v0013)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `deriv_auth_ui` - `v0.0.1+3`

---

#### `deriv_auth` - `v1.1.0`

 - **FEAT**(deriv_auth): [DERG-1299] add user agent to login ([#341](https://github.com/regentmarkets/flutter-deriv-packages/issues/341)). ([37f5b763](https://github.com/regentmarkets/flutter-deriv-packages/commit/37f5b763d8a679ff1d458fc4e9b82578f4eecf83))


## 2023-11-29

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`deriv_auth_ui` - `v0.0.1+2`](#deriv_auth_ui---v0012)
 - [`deriv_ui` - `v0.0.1+2`](#deriv_ui---v0012)

---

#### `deriv_auth_ui` - `v0.0.1+2`

 - **REFACTOR**(deriv_auth_ui): [MOBC-629] Adding semantics to UI components ([#321](https://github.com/regentmarkets/flutter-deriv-packages/issues/321)). ([36a0c1fa](https://github.com/regentmarkets/flutter-deriv-packages/commit/36a0c1faa0b47d4f735a79daf67c9e2c0089938e))

#### `deriv_ui` - `v0.0.1+2`

 - **REFACTOR**(deriv_auth_ui): [MOBC-629] Adding semantics to UI components ([#321](https://github.com/regentmarkets/flutter-deriv-packages/issues/321)). ([36a0c1fa](https://github.com/regentmarkets/flutter-deriv-packages/commit/36a0c1faa0b47d4f735a79daf67c9e2c0089938e))


## 2023-11-28

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`deriv_theme` - `v2.1.0`](#deriv_theme---v210)
 - [`deriv_date_range_picker` - `v0.0.1+1`](#deriv_date_range_picker---v0011)
 - [`deriv_ui` - `v0.0.1+1`](#deriv_ui---v0011)
 - [`deriv_auth_ui` - `v0.0.1+1`](#deriv_auth_ui---v0011)
 - [`deriv_expandable_bottom_sheet` - `v0.0.1+1`](#deriv_expandable_bottom_sheet---v0011)
 - [`deriv_numpad` - `v1.0.1`](#deriv_numpad---v101)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `deriv_date_range_picker` - `v0.0.1+1`
 - `deriv_ui` - `v0.0.1+1`
 - `deriv_auth_ui` - `v0.0.1+1`
 - `deriv_expandable_bottom_sheet` - `v0.0.1+1`
 - `deriv_numpad` - `v1.0.1`

---

#### `deriv_theme` - `v2.1.0`

 - **FEAT**: Ayaan/Added margins 112 and 164 ([#319](https://github.com/regentmarkets/flutter-deriv-packages/issues/319)). ([bf625820](https://github.com/regentmarkets/flutter-deriv-packages/commit/bf6258206b4bb4cbdd1ef6744e07e2adb8d0d5ee))


## 2023-11-27

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`deriv_env` - `v0.0.1+1`](#deriv_env---v0011)

---

#### `deriv_env` - `v0.0.1+1`

 - **REFACTOR**(deriv_env): make package independent of env file ([#318](https://github.com/regentmarkets/flutter-deriv-packages/issues/318)). ([a7242c81](https://github.com/regentmarkets/flutter-deriv-packages/commit/a7242c81b97fda70a622d7bbbb97fe997067117a))

