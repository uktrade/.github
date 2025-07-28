# GitHub Repository Security Audit

DBT GitHub repositories need to follow security standards. This template helps repository admins to review and log adherence to the security standards.

To use this template, raise a pull request and add `&template=security_audit.md` to the URL.

### Automated Scanning

- [ ] [GitHub secret scanning](https://docs.github.com/en/code-security/secret-scanning) is enabled with push protection
- [ ] [GitHub Dependabot](https://docs.github.com/en/code-security/getting-started/dependabot-quickstart-guide) is enabled
- [ ] [GitHub Code Scanning](https://docs.github.com/en/code-security/code-scanning/introduction-to-code-scanning/about-code-scanning) is enabled
- [ ] [GitHub Actions](https://docs.github.com/en/actions) is enabled
- [ ] Custom [reusable workflow] is enabled

### Code Review

- [ ] Default pull_request_template.md has been updated with project-specific information
- [ ] CONTRIBUTING.md contains project-specific advice and explain the code review process

### Incidents

- [ ] SECURITY.md is imported or updated with project-specific information
- [ ] Contributors are aware of the implications of and risks associated with committing to a UK goverment department's public repository
- [ ] Contributors are familiar with the incident management response documented in SECURITY.md

### Access
 
- [ ] Teams have the correct access to the repository and follow principle of least priviledge
- [ ] Teams with responsibility for code are defined in [CODEOWNERS.md](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [ ] A limited set of invidiuals have admin rights and can bypass branch protection rules
