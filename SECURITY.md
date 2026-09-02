# BIST GitHub Public Security Policy

This policy explains how members of the public can responsibly report vulnerabilities to the Department for Business, Innovation, Science and Trade ([BIST](https://www.gov.uk/government/organisations/department-for-business-innovation-science-and-trade)).

It is intended for members of the public and external security researchers. Internal staff should instead report vulnerabilities directly to the Cyber Security team, and follow the internal [Code Repository Hardening](https://platform.readme.trade.gov.uk/managed/features/code-repository-hardening/) guidelines to minimise them.

## Reporting a vulnerability

If you believe you have found a security vulnerability, please submit a report via our [HackerOne form](https://hackerone.com/2680e4cd-0436-42a5-bd2a-37fd86367276/embedded_submissions/new).

**Scope**
- In scope: digital services operated by BIST, including repositories in the [`uktrade` GitHub organisation](https://github.com/uktrade)
- Out of scope: denial of service, social engineering, physical attacks, and reports from automated scanners without a working proof of concept

**Disclosure guidelines**
- Do **not** share vulnerability details beyond BIST and the asset owner
- HackerOne accounts are optional, but allow you to receive updates on your report
- You must agree to HackerOne’s Terms, Privacy Policy, and Disclosure Guidelines
- BIST’s Cyber Security team assists with coordination, but the asset owner is responsible for remediation

**Safe harbour**

BIST will not seek prosecution of researchers who act in good faith: stay within the scope above, avoid destructive testing, and do not access, modify or retain other users’ data.

## About This Policy

The [BIST GitHub Security Policy](https://github.com/uktrade/.github/blob/main/SECURITY.md) is defined as a [community health file](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file), so every `uktrade` repository without its own `SECURITY.md` inherits it automatically. Do not add a `SECURITY.md` to your own repository — to suggest changes, raise a PR against the [`.github` repository](https://github.com/uktrade/.github) instead.
