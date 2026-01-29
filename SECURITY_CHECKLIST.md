# Security Checklist

This checklist is designed to make it easier to improve the security posture of a GitHub repository.

- It is mandatory for public repositories.
- This checklist must be copied over to the root of the repository.
- The repository steward is responsible for populating the checklist, or at least approving the related pull request.
- Any feedback should be shared with the GitHub Security working group.

## Checklist

- [ ] [Setup the pre-commit hook framework](#setup-the-pre-commit-hook-framework)
- [ ] [Setup custom properties on the repository](#setup-custom-properties-on-the-repository)
- [ ] [Apply the correct github security policy](#apply-the-correct-github-security-policy)
- [ ] [Ensure CODEOWNERS file exists](#ensure-codeowners-file-exists)
- [ ] [Copy the SECURITY_CHECKLIST.md file](#copy-the-security_checklistmd-file)
- [ ] [Add Steward to Repository access](#add-at-least-one-steward-to-repository-access)
- [ ] [Create an admin team for the repository](#create-an-admin-team-for-the-repository)
- [ ] [Review and limit maintainers with admin rights to the strict minimum](#review-and-limit-maintainers-with-admin-rights-to-the-strict-minimum)
- [ ] [Review the Pull Request template](#review-pull-request-template)
- [ ] [Read GitHub documents](#read-github-documents)

## Setup the pre-commit hook framework

Several uktrade repositories already make use of the pre-commit framework for flagging code quality issues before pushing. Even in the repositories that have the pre-commit framework installed, it is still optional for an individual engineer to either avoid configuring the commit hooks, or skipping them entirely using the `--no-verify` cli argument.

As part of the go live process, each engineer making changes to the repository being reopened will be required to install the organisation wide pre-commit hooks locally. When a PR is opened, an organisation level github action will run to confirm the pre-commit hooks ran on the engineers machine and will block any PRs that have not run these hooks.

Instructions have been added to the [dbt hooks repository](https://github.com/uktrade/github-standards/blob/main/README.md#usage) to provide guidance on adding these organisation wide pre-commit hooks to an individual repository

## Setup custom properties on the repository

A set of custom properties have been created at an organisation level. These must be applied to a repository to allow organisation level github actions to run on each pull request. To access the custom properties, go to the `https://github.com/uktrade/REPO_NAME/settings/custom-properties` page.

Once these custom properties are applied, any open PRs in your repo will end up in a blocked state. GitHub PR checks are triggered by a commit, adding a check to your repo using these custom properties will not retrospectively start the checks for that commit. There are a number of ways to retrigger the checks, the easiest is using this git command. You can amend the commit message to match any naming convention used by your repo:

`git commit --allow-empty -m "ci: retrigger PR workflows" && git push`

### Mandatory custom properties

- `reusable_workflow_opt_in`: This one has to be applied and set to `true` to allow this repository to apply the correct organisation branch protection ruleset and run the necessary github workflows on each PR
- `scs_portfolio`: The portfolio inside DDAT this repository belongs to. If your portfolio is missing, this can be added by raising an SRE ticket.

### Optional custom properties

- `language`: All languages used by this repository should be selected, and github workflows will run with dedicated checks on that language.

## Apply the correct github security policy

**You must be an organisation administrator to apply this policy**

To add the new security policy, follow these instructions:

1. As an organisation administrator, navigate to the [security config page](https://github.com/organizations/uktrade/settings/security_products).
1. Scroll down to the **Apply configurations** sections, and enter the name of the repository to be made public in the filter input field
1. Use the checkbox next to the results list to select all repositories being made public, then use the **Apply configuration** button to select the **Default DBT security** configuration
1. A confirmation modal will appear displaying a summary of the action being made. Click the apply button
1. In the repository that has had the new policy applied, navigate to the **Advanced Security** page in the repository settings. At the top of the page there should be a banner message **Modifications to some settings have been blocked by organization administrators.**

### Optional: Setup CodeQL to allow PRs from repository forks

For most repositories, the default CodeQL configuration applied by the **Default DBT security** policy will be sufficient. However, this default configuration does not currently support scanning PRs raised from a fork of a repository. If your repository needs to accept PRs from a fork, you must follow these steps to switch to the advanced CodeQL setup:

1. Open the GitHub settings page, and navigate to the Advanced Security section using the left hand menu
1. Scroll down to the Code Scanning section, under the Tools sub-section there will be an item for CodeQL analysis
1. Click the ... button next to Default setup text, then choose the Switch to advanced option from the menu
1. On the popup, click the Disable CodeQL button. Although you are disabling CodeQL, there is still a branch protection rule in place that blocks a PR unless a CodeQL scan is detected. Disabling here will not allow PRs to be merged
1. The GitHub online editor will open to create a new file called codeql.yml in your repo, and the contents of this file will be prefilled with the languages CodeQL has detected in your repo. You can modify the contents of this file if needed, however you must leave the workflow name as `CodeQL Advanced`
1. Once happy with the workflow file contents, click the green Commit changes button to trigger a PR to merge this into the main branch
1. Approve and merge the PR with this workflow file. Once merged, the CodeQL scan will perform an initial scan that can take a while but you can track the progress by viewing the Actions tab for your repository

## Ensure CODEOWNERS file exists

The organisation rulesets require a CODEOWNERS file to be present in the repository. If you don't already have one of these, github has produced [documentation explaining](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) what they are and why they are used.

## Copy the SECURITY_CHECKLIST.md file

To allow tracking of repositories that have successfully completed the reopening process, this file must be copied to your repository and each of the items in the Checklist marked as completed. The file must be placed in one of the following locations in your repo:

- The root
- The .github folder
- The docs folder

## Create an admin team for the repository

To ensure correct governance of a repository, at least one steward must be added. This will usually be the most senior engineer on the team.

In addition to adding at least one Steward, a new team with the admin role must be created to allow those Stewards permission to the `Collaborators and Teams` page. A large number of repositories in the uktrade account already have an admin team setup for a repo, if this is the case you can skip the below steps and simply make sure all the Stewards are part of that admin group. If your repository does not have an admin team, follow these steps:

1. Open the `Collaborators and teams` settings page. The url for this is `https://github.com/uktrade/REPO_NAME/settings/access`
2. Click the `Create team` link
3. On the Create new team page, add a Team name in the format `REPO-NAME-admin`
4. You can optionally add a description, but leave all other options as the default
5. Click the `Create Team` button
6. On the next page, add all the Stewards to the new team
7. Go back to the `Collaborators and teams` settings page. The url for this is `https://github.com/uktrade/REPO_NAME/settings/access`
8. Click the `Add Teams` button to open the team finder autocomplete box
9. Enter the team name you used, and click the matching result in the autocomplete box
10. On the next screen, choose the `Admin` role
11. Click the `Add selection` button to complete the process

## Add at least one steward to repository access

To add a steward to a repository:

1. Open the `Collaborators and teams` settings page. The url for this is `https://github.com/uktrade/REPO_NAME/settings/access`
2. Use the `Add people` button to open the people finder autocomplete box.
3. Find and click the user who is going to be a steward
4. On the Choose a role page, select the `Steward` role.
5. Repeat for any additional users who are going to be a steward

## Review and limit maintainers with admin rights to the strict minimum

You should review who has been assigned the github `admin` role. The `write` role is sufficient to allow team members to commit changes and raise pull requests

## Review Pull Request template

If your repository does not already contain a pull_request_template.md file, by default you will inherit the template from this repository. If you are already using your own template, you should add this section to remind reviewers they should be ensuring no secret values are visible

```
## Reviewer Checklist

- [ ] I have reviewed the PR and ensured no secret values are present
```

## Read GitHub documents

There are a number of documents that have to be read and understood. These are listed in the sections below

### Review SECURITY.md policy

This repository contain the SECURITY.md file, which is inherited by all repositories in the uktrade organisation account. This file should be read and understood by the repository steward, and discussed with the team to ensure all engineers understand the tooling that has been put in place

### Review the GitHub CI/CD overview

Internal contributors to the repository should review the CI/CD overview below
![CI/CD overview](https://raw.githubusercontent.com/uktrade/.github/refs/heads/main/assets/CI-CD%20pipeline.svg)

### Review GitHub Safety Tips

Internal contributors to the repository should review the [GitHub Safety Tips](https://uktrade.atlassian.net/wiki/x/n4AEKQE)

### Message to team

You can use the below template message to send to your team with links to all the above documents

```
@Everyone please read through the following:
- [The DBT SECURITY.md file](https://github.com/uktrade/.github/blob/main/SECURITY.md)
- [GitHub Safety Tips](https://uktrade.atlassian.net/wiki/x/n4AEKQE)
- [Our CI/CD overview](https://raw.githubusercontent.com/uktrade/.github/refs/heads/main/assets/CI-CD%20pipeline.svg)

Leave a :thumbsup: on this message to confirm when you're done. We need a :thumbsup: from all contributors to comply with DBT's repo safety standards, and the whole thing should only take 15 minutes.

Please raise any questions here, and if we need to discuss further I can put some time in.
```

## More information

For more information about GitHub security standards, please refer [to this link](https://dbis.sharepoint.com/:w:/r/sites/DDaTDirectorate/Shared%20Documents/Work%20-%20GitHub%20Security/Github%20Security%20Framework/Guidelines%20and%20Policies/GitHub%20Security%20Standards%20v0.5.docx?d=wb29cd9b99ca042deb5c0cd8d670966d9&csf=1&web=1&e=6ITbnL)

For more details about the security features please refer to the [GitHub Standards](https://github.com/uktrade/github-standards) repo.
