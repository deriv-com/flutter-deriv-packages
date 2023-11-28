## Commit Rules:

This commits rules is set to ensure all the developers follows a uniform way of writing commits so that it is easy to read the changes made and also automate versioning.
The commits are based on [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/) which is a widely followed convention for commits. While writing a commit message to any changes made to code base, make sure it reflects the changes and follows the conventions i.e:

```
change_type(package_name): short description/subject line...

Long Description...
```

Here,

change_type means the type of changes like `feat`,`fix` and so on.

package_name means which packages this changes is for. This is optional.

short discription/subject line means about the changes

Long Description are optional. Add it if its required to reflect the changes in more detail.

For eg:

Lets say the changes is about implementing a new feature which is about new social login mechanism in `deriv_auth` package.

```
feat(deriv_auth): add UI for sign in page

- create reusable text field using global app theme
- add bloc for sign in logic implementation
- add google services for authentication
```
### Breaking Changes Indicator
Breaking changes should be indicated by an `!` before the `:` in the subject line e.g. `feat(api)!: remove status endpoint`
* Is an **optional** part of the format

More changes types:

| Changes Types | Meaning                    | Description                                                                                                   |
| ------------- | -------------------------- | ------------------------------------------------------------------------------------------------------------- |
| feat          | Features                   | A new feature                                                                                                 |
| fix           | Bug Fixes                  | A bug fix                                                                                                     |
| chore         | Chores                     | Other changes that don’t modify src or test files                                                             |
| docs          | Docume­ntation             | Docume­ntation only changes                                                                                   |
| revert        | Reverts                    | Reverts a previous commit                                                                                     |
| refactor      | Code Refact­oring          | A code change that neither fixes a bug nor adds a feature                                                     |
| test          | Tests                      | Adding missing tests or correcting existing tests                                                             |
| style         | Styles                     | Changes that do not affect the meaning of the code (white­ -space, format­ting, missing semi-c­olons, etc)    |
| perf          | Perfor­mance Improv­ements | A code change that improves perfor­mance                                                                      |
| build         | Builds                     | Changes that affect the build system or external depend­encies (example scopes: gulp, broccoli, npm)          |
| ci            | Continuous Integr­ations   | Changes to our CI config­uration files and scripts (example scopes: Travis, Circle, Browse­rStack, SauceLabs) |

Optional: If you would like to pre populate your commit box with the commit template then you can do it by adding `.gitmessage` inside `.github` folder to commit template for that project with the following command.(Note: This won't work if you write commit via terminal.)

`git config commit.template "YOUR_PROJECT_PATH/.github/.gitmessage"`

### Examples
* ```
  feat: add email notifications on new direct messages
  ```
* ```
  feat(shopping cart): add the amazing button
  ```
* ```
  feat!: remove ticket list endpoint

  refers to JIRA-1337

  BREAKING CHANGES: ticket enpoints no longer supports list all entites.
  ```
* ```
  fix(api): handle empty message in request body
  ```
* ```
  fix(api): fix wrong calculation of request body checksum
  ```
* ```
  fix: add missing parameter to service call

  The error occurred because of <reasons>.
  ```
* ```
  perf: decrease memory footprint for determine uniqe visitors by using HyperLogLog
  ```
* ```
  build: update dependencies
  ```
* ```
  build(release): `bump version to 1.0.0
  ```
* ```
  refactor: implement fibonacci number calculation as recursion
  ```
* ```
  style: remove empty line
  ```
## PR Rules:

This Rules is set to create a uniform way of submitting Pull requests where all the necessary information for the changes are listed in the title, or description. There is a standard template for creating PR. When you are creating a PR to any repo always make sure:

- you have titled it following conventional pattern and also included all the necessary information in it.
  for eg:
  Title: `feat(deriv_auth): [MOBC-299] Add ability to sign in with google`

  Here,</br> The title defines:

  - what type the changes/PR is about like feature, bug fixes, documentations, refactor. </br>
  - which package/app is this PR for.(optional) </br>
  - the clickup card id - short title that describes the changes </br>

- you have added detailed description that gives enough information about the PR.
- you have commits only relevant to your changes and not other's commit which shouldn't be there.

  Also, it is always better to squash commits that are only relevant to any particular PR. Such as changes requested through PR review. If these changes does not reflects any really meaning or value in the main project history then it is always better to squash such commits into one. It helps to maintain a clean commit history.

  **The template looks something like this:**

        <!-- Please refer to this [guide](https://github.com/regentmarkets/flutter-deriv-packages/blob/master/.github/GIT_RULES.md#pr-rules) for any confusion while creating the PR -->

        **Clickup link:** <!-- Add your clickup link here, Remove this line if this PR is not for a task -->
        **Fixes issue:** #<!-- Issue number here, Remove this line if this PR isn't related to any issue -->

        This PR contains the following changes:

        <!-- Provide a description or list of changes -->

        - [ ] ✨ New feature (non-breaking change which adds functionality)
        - [ ] 🛠️ Bug fix (non-breaking change which fixes an issue)
        - [ ] ❌ Breaking change (fix or feature that would cause existing functionality to change)
        - [ ] 🧹 Code refactor
        - [ ] ✅ Build configuration change
        - [ ] 📝 Documentation
        - [ ] 🗑️ Chore

        ### Developers Note (Optional)

        <!-- REMOVE THIS SECTION IF IT IS NOT NEEDED.>

        <!-- Add the reason of making changes in this approach so that it will be helpful to reviewers while reviewing it. -->

        ## Pre-launch Checklist (For PR creator)

        As a creator of this PR:

        <!-- Put an `x` in all the boxes that apply ([x]) -->

        - [ ] ✍️ I have included clickup id and package/app_name in the PR title. <!-- Find the guide [here](https://github.com/regentmarkets/flutter-deriv-packages/blob/master/.github/GIT_RULES.md#pr-rules) -->
        - [ ] 👁️ I have gone through the code and removed any temporary changes (commented lines, prints, debug statements etc.).
        - [ ] ⚒️ I have fixed any errors/warnings shown by the analyzer/linter.
        - [ ] 📝 I have added documentation, comments and logging wherever required.
        - [ ] 🧪 I have added necessary tests for these changes.
        - [ ] 🔎 I have ensured all existing tests are passing.

        ## Reviewers

        <!-- Tag the reviewers of this PR -->

        ## Pre-launch Checklist (For Reviewers)

        As a reviewer I ensure that:

        - [ ] ✴️ This PR follows the standard PR template.
        - [ ] ✴️ The information in this PR properly reflects the code changes.
        - [ ] 🧪 All the necessary tests for this PR's are passing.

        ## Pre-launch Checklist (For QA)

        - [ ] 👌 It passes the acceptance criteria.

        ## Pre-launch Checklist (For Maintainer)

        - [ ] [MAINTAINER_NAME] I make sure this PR fulfills its purpose.
