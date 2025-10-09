## Custom properties

The uktrade account makes use of custom github properties to enforce branch protection rules and run organisation level github actions. New properties can be added by logging into github using a uktrade account and using the [custom props page](https://github.com/organizations/uktrade/settings/custom-properties)

## Branch protection

An organisation ruleset has been created to apply a minimum set of branch protection rules to each public repository in the uktrade account. These rules are to be seen as the minimum, and repository admins might decide to add additional rules to their own repositories. Organisation admins and repository admins have been added to the bypass list for this branch protection ruleset The protection rules that will be applied to each repository are:

- A PR is required for merges into the default branch (usually main)
- At least 1 approver is required before a PR can be merged
- Any conversations on the PR must be marked as resolved

As these rules are applied as an organisation ruleset, it is not possible for repository admins to add their own rules that reduce this level of protection. As an example, a repository admin could add a ruleset that drops the required number of approvers to 0 but that would have no effect as the organisation ruleset would take precedence. They could add a ruleset that sets the number of approvers to 3, and as this is not reducing the organisation ruleset protection this would take precedence
