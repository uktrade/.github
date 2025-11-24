## Setup the pre-commit hook framework

Several uktrade repositories already make use of the pre-commit framework for flagging code quality issues before pushing. Even in the repositories that have the pre-commit framework installed, it is still optional for an individual engineer to either avoid configuring the commit hooks, or skipping them entirely using the `--no-verify` cli argument.

As part of the go live process, each engineer making changes to the repository being reopened will be required to install the organisation wide pre-commit hooks locally. When a PR is opened, an organisation level github action will run to confirm the pre-commit hooks ran on the engineers machine and will block any PRs that have not run these hooks.

Instructions have been added to the [dbt hooks repository](https://github.com/uktrade/github-standards/blob/main/README.md#usage) to provide guidance on adding these organisation wide pre-commit hooks to an individual repository

## Setup custom properties on the repository

A set of github tags have been created at an organisation level, these must be applied to a repository to allow organisation level github actions to run on each pull request.

### Mandatory custom properties

- `reusable_workflow_opt_in`: This one has to be applied and set to `true` to allow this repository to apply the correct organisation branch protection ruleset and run the necessary github workflows on each PR

### Optional custom properties

- `is_docker`: If this repository builds a docker image, this tag should be added to run docker related github workflows
- `language`: All languages used by this repository should be selected, and github workflows will run with dedicated checks on that language.
- `ddat_portfolio`: The portfolio inside DDAT this repository belongs to. If your portfolio is missing, this can be added by raising an SRE ticket.

## Apply the correct github security policy

To add the new security policy, follow these instructions:

1. As an organisation administrator, navigate to the [security config page](https://github.com/organizations/uktrade/settings/security_products).
1. Scroll down to the **Apply configurations** sections, and enter the name of the repository to be made public in the filter input field
1. Use the checkbox next to the results list to select all repositories being made public, then use the **Apply configuration** button to select the **Default DBT security** configuration
1. A confirmation modal will appear displaying a summary of the action being made. Click the apply button
1. In the repository that has had the new policy applied, navigate to the **Advanced Security** page in the repository settings. At the top of the page there should be a banner message **Modifications to some settings have been blocked by organization administrators.**

## Ensure CODEOWNERS file exists

The organisation rulesets require a CODEOWNERS file to be present in the repository. If you don't already have one of these, github has produced [documentation explaining](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) what they are and why they are used.

## Copying the SECURITY_CHECKLIST.md file

To allow tracking of repositories that have successfully completed the reopening process, this file must be copied to the root of your repository and each of the items in the Checklist marked as completed

## Checklist

- [ ] Setup the pre-commit hook framework
- [ ] Setup custom properties on the repository
- [ ] Apply the correct github security policy
- [ ] Ensure CODEOWNERS file exists
- [ ] Copying the SECURITY_CHECKLIST.md file
- [ ] Wording TBC - understanding risk of committing to public repos
- [ ] Link TBC - link to understanding github security
