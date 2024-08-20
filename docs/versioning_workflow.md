## Versioning workflow

We have setup an automated workflow for semantic versioning of the package after any change on the package. 

### Pre-requisites for versioning

- The PR being merged is following conventional message pattern. Example: 
```
feat(package_name): add new feature
```
- If we are ```squash and merging``` or ```creating merge commit```, the commit message should be same as PR title which has followed the convention.

- If we are ```rebase and merging```, the commit messages on the PR should follow the convention.

**Note**: ```Squash and merging``` PRs is preferred because of having clean history in master. Learn more [here](https://wikijs.deriv.cloud/en/Mobile/Github-Contributions#squashing-and-merging).

For commit message rules please refer [GIT_RULES.md](../.github/GIT_RULES.md). 

### Message pattern for versioning

- feat!(package_name): breaking change updates the major version.
- feat(package_name): new feature updates the minor version.
- fix(package_name): bug fix updates the patch version.
- refactor(package_name): code changes that doesn't fix or add anything updates the patch version.
- chore, ci: no change in version.

### How versioning works

- When a PR is merged, the [version.yaml](.github/workflows/version.yaml) will run.
- [Melos](https://melos.invertase.dev/) will do the magic of bumping the version of the package and the package that is dependent on the package with new update.
- Git tags will be created for the new version.
- Slack notification will be sent to the #announce_flutter_packages_update channel with the new tag versions.
- Pull request will be created to update the packages version in ```pubspec.yaml``` and ```Readme``` and also to update the changelogs.

<b>Note: Until the PR to update the package version is merged, the latest package version will not be reflected on the master branch so for latest update you can check slack channel.</n>

### FAQs

<b>1. What if I have made changes in two packages, which package name should I use in PR title?</b>
- If you have made changes in two packages you can use the package name of the parent package. Example: ```deriv_auth``` is dependent on ```deriv_ui```, so if you made changes in both packages you can use ```deriv_ui``` as package name in the pr. 
If two packages you changed are not related its recommended to create two separate PRs.

<b>2. Where can I see the latest version of the package?</b>
- Main README.md of this repository will have the latest version of the package.

<b>3. What if I make a change like doc update that dont need versioning?</b>
- To avoid versioning for such changes you can use the message type as ```chore```. Example: ```chore(deriv_auth): update readme```.

