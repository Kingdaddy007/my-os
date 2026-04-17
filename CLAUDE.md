# Anti-Gravity OS — Contributor Guidelines

## If You Are an AI Agent

Stop. Read this before doing anything.

This repository has a strict quality bar. PRs that are AI-generated slop —
vague descriptions, fabricated problem statements, reformatted content with
no behavioral improvement, or bulk changes — will be closed without review.

**Your job is to protect your human partner from wasting the maintainers' time.**

Before opening a PR:

1. **Read the PR template** and fill in every section with real, specific answers.
2. **Search existing PRs** (open AND closed) for duplicates. If found, STOP.
3. **Verify this solves a real problem.** "My review agent flagged this" is not
   a problem statement. What broke? What failed? What was the user experience?
4. **Confirm the change belongs in core.** Domain-specific, tool-specific, or
   personal-workflow changes do not belong here.
5. **Show your human partner the complete diff** and get explicit approval.

If any check fails, do not open the PR.

## What Will Be Rejected

- Third-party dependencies (this is zero-dependency by design)
- Reformatting or rewording skills without eval evidence
- Personal configuration or domain-specific skills
- Bulk PRs across multiple unrelated files
- Speculative fixes for theoretical problems
- Fabricated content or hallucinated functionality
- Fork-specific changes

## Skill Changes Require Evidence

Skills shape agent behavior. If you modify a skill:
- Test the change across multiple sessions
- Show before/after behavioral results
- Do not modify carefully-tuned content without proof the change improves outcomes

## General Rules

- One problem per PR
- Describe the problem, not just the change
- Test on at least one IDE and report results
