## Setup the pre-commit hook framework

Several uktrade repositories already make use of the pre-commit framework for flagging code quality issues before pushing. Even in the repositories that have the pre-commit framework installed, it is still optional for an individual engineer to either avoid configuring the commit hooks, or skipping them entirely using the `--no-verify` cli argument.

As part of the go live process, each engineer making changes to the repository being reopened will be required to install the organisation wide pre-commit hooks locally. When a PR is opened, an organisation level github action will run to confirm the pre-commit hooks ran on the engineers machine and will block any PRs that have not run these hooks.

Instructions have been added to the [dbt hooks repository](https://github.com/uktrade/dbt-hooks/blob/main/docs/Installation.md) to provide guidance on adding these organisation wide pre-commit hooks to an individual repository

## Setup tagging on repo

A set of github tags have been created at an organisation level, these must be applied to a repository to allow organisation level github actions to run on each pull request.

## Checklist

- [ ] `pre-commit` installation instructions followed
- [ ] Organisation tags added
