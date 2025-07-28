# GitHub Repository Security Audit

To use this template, add the `&template=security_audit.md` to the URL when creating the pull request

##################

Your repository should meet security standards before it can be made public again. You should ensure your repository meets these criteria and provide evidence that it does:

[] Your commits/pushes to GitHub should be scanned for secrets and vulnerabilities with the selected tool(s) (TBC) before they are merged to default branches.
[] Your repository should be scanned for secrets at rest periodically using GitHub secrets scanning. 
[] Your repository should only be accessible (write-access) to authorised individuals and/or teams who need this level of access to do their jobs.
[] Your team/repository should have a robust code review process in place.  
[] Dependencies in your respository should be periodically scanned and there should be a notification when a vulnerable dependency is deteced.
[] Activity and access logs for your repository should be forwarded to Sentinel for SOC monitoring. 
[] Before being given access, members of your team working on your repository should be made aware of these security standards, best practices and how to respond appropriately to a security breach.
[] Before being given access, members of your team working on your repository should be made aware of the implications of and risks associated with committing to a UK goverment department's public repository.

There are tools and solutions for ensuring and enforcing the above on your repository which you are encouraged to use. SRE can check that these features are enabled and/or made available to you, either at a repository or organisational level.

- Re-usable workflows for secret, vulnerability and code quality scanning. 
- GitHub Secrets Scanning alerts
- Dependabot alerts
- Code scanning alerts (GitHub CodeQL)

SRE will also maintain the standard [community health files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file) you are encouraged to use for your repository. 
 
