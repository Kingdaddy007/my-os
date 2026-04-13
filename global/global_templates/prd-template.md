# TEMPLATE: PRODUCT REQUIREMENTS DOCUMENT (PRD)

**Version:** Gold v1.0
**Layer:** 9 — Output Contract
**Tier:** 3 — Loaded on demand
**File:** templates/prd-template.md
**Purpose:** Standardized format for documenting comprehensive product requirements for larger initiatives — more detailed than a feature plan, used for multi-sprint or multi-feature work.
**Loaded When:** Planning a major product initiative, documenting requirements for a new product area, or creating specs for complex multi-feature work.

***

## WHEN TO USE THIS TEMPLATE

Use this template when:

- Planning a major initiative spanning multiple sprints
- Defining requirements for a new product area
- Creating comprehensive specs that multiple engineers will work from
- Documenting requirements for external stakeholders or partners

Use a **Feature Plan** instead when:

- The feature fits in one sprint
- Only one engineer is working on it
- The scope is relatively clear and bounded

***

## THE TEMPLATE

***

### PRD: [Initiative Name]

***

## Metadata

| Field | Value |
| :--- | :--- |
| Author | [Name] |
| Date | [YYYY-MM-DD] |
| Status | [Draft / In Review / Approved / In Progress / Complete] |
| Target Release | [Quarter / Sprint / Date] |
| Stakeholders | [Who needs to approve or be informed] |

***

## 1. Executive Summary

> 2–3 sentences: What are we building, for whom, and why NOW?

[Summary]

***

## 2. Background

[What context or history led to this document? Describe the current situation, the business or user need, and what has changed that makes this relevant now.]

***

## 3. Problem Definition

### The Problem

[What user or business problem are we solving? Be specific — include data, quotes, or evidence where possible.]

### Who Is Affected

| User Segment | Size | Frequency of Problem | Severity |
| :--- | :--- | :--- | :--- |
| [Segment 1] | [N users] | [How often] | [High/Med/Low] |
| [Segment 2] | [N users] | [How often] | [High/Med/Low] |

### Current State

[How do users handle this today? What are the pain points?]

### Why Now

[Why is this the right time to solve this? What has changed? What is the cost of NOT doing this?]

***

## 4. Goals and Success Metrics

### Primary Goal

[One sentence: what outcome are we driving toward]

### Success Metrics

| Metric | Current Baseline | Target | Measurement Method | Timeframe |
| :--- | :--- | :--- | :--- | :--- |
| [Metric 1] | [Current value] | [Target value] | [How measured] | [When to evaluate] |
| [Metric 2] | [Current value] | [Target value] | [How measured] | [When to evaluate] |
| [Metric 3] | [Current value] | [Target value] | [How measured] | [When to evaluate] |

### Non-Goals

> What are we explicitly NOT trying to achieve?

- [Non-goal 1]
- [Non-goal 2]
- [Non-goal 3]

***

## 5. Users

- **Primary users:** [Who they are]
- **Secondary users:** [Who they are]
- **Internal stakeholders:** [Who they are]

***

## 6. User Stories

### Must Have (Core)

| # | As a... | I want to... | So that I can... | Acceptance Criteria |
| :--- | :--- | :--- | :--- | :--- |
| 1 | [User type] | [Action] | [Outcome] | [How to verify it's done] |
| 2 | [User type] | [Action] | [Outcome] | [Acceptance criteria] |
| 3 | [User type] | [Action] | [Outcome] | [Acceptance criteria] |

### Should Have

| # | As a... | I want to... | So that I can... | Acceptance Criteria |
| :--- | :--- | :--- | :--- | :--- |
| 4 | [User type] | [Action] | [Outcome] | [Acceptance criteria] |
| 5 | [User type] | [Action] | [Outcome] | [Acceptance criteria] |

### Could Have (Nice to Have)

| # | As a... | I want to... | So that I can... | Acceptance Criteria |
| :--- | :--- | :--- | :--- | :--- |
| 6 | [User type] | [Action] | [Outcome] | [Acceptance criteria] |

***

## 7. Scope and Phasing

### Phase 1: [Name] — [Target Date]

**Goal:** [What Phase 1 accomplishes]

- [Deliverable 1]
- [Deliverable 2]
- [Deliverable 3]

**Success Gate:** [What must be true before moving to Phase 2]

***

### Phase 2: [Name] — [Target Date]

**Goal:** [What Phase 2 accomplishes]

- [Deliverable 1]
- [Deliverable 2]

**Depends On:** [Phase 1 completion + any other dependencies]

***

### Phase 3: [Name] — [Target Date] *(if applicable)*

**Goal:** [What Phase 3 accomplishes]

- [Deliverable 1]
- [Deliverable 2]

***

### Explicitly Out of Scope

- [Item 1 — why excluded]
- [Item 2 — why excluded]

***

## 8. Functional Requirements

### [Feature Area 1]

| # | Requirement | Priority | Notes |
| :--- | :--- | :--- | :--- |
| FR-1 | [Specific requirement] | Must | [Implementation notes] |
| FR-2 | [Specific requirement] | Must | [Notes] |
| FR-3 | [Specific requirement] | Should | [Notes] |

### [Feature Area 2]

| # | Requirement | Priority | Notes |
| :--- | :--- | :--- | :--- |
| FR-4 | [Specific requirement] | Must | [Notes] |
| FR-5 | [Specific requirement] | Should | [Notes] |

***

## 9. Non-Functional Requirements

| Category | Requirement | Target | Rationale |
| :--- | :--- | :--- | :--- |
| Performance | [Requirement] | [Specific target] | [Why this matters] |
| Scalability | [Requirement] | [Specific target] | [Why] |
| Security | [Requirement] | [Standard] | [Why] |
| Accessibility | [Requirement] | [Standard] | [Why] |
| Reliability | [Requirement] | [Specific target] | [Why] |
| Maintainability | [Requirement] | [Target] | [Why] |
| Observability | [Requirement] | [Target] | [Why] |
| Compliance | [Requirement] | [Standard] | [Why] |

***

## 10. User Flow and Experience Notes

[Describe the important flows, states, and how the user is expected to move through this feature or product behavior.]

### States to Design

- Loading state
- Empty state
- Error state
- Success state

### Mobile Considerations

[Mobile-specific design or behavior requirements]

### Accessibility Requirements

[Specific accessibility requirements beyond baseline]

***

## 11. Technical Considerations

### Architecture Impact

[How does this affect the existing architecture?]

### Data Model Changes

[New entities, schema changes, migration requirements]

### API Changes

[New endpoints, modified endpoints, backward compatibility]

### Infrastructure Impact

[New services, scaling requirements, cost implications]

### Security Implications

[Auth changes, new trust boundaries, data sensitivity]

### Third-Party Dependencies

[New integrations, vendor dependencies, API dependencies]

***

## 12. Constraints

What limits the solution space?

- [Time / deadline constraints]
- [Compliance or regulatory constraints]
- [Architecture constraints]
- [Staffing or capacity constraints]
- [Integration constraints]
- [Delivery commitments]

***

## 13. Risks and Mitigations

| # | Risk | Likelihood | Impact | Mitigation Plan | Owner |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | [Risk] | [H/M/L] | [H/M/L] | [Mitigation plan] | [Who] |
| 2 | [Risk] | [H/M/L] | [H/M/L] | [Mitigation plan] | [Who] |
| 3 | [Risk] | [H/M/L] | [H/M/L] | [Mitigation plan] | [Who] |

### Riskiest Assumptions

- **Assumption 1:** [Statement] — Validation plan: [How to test]
- **Assumption 2:** [Statement] — Validation plan: [How to test]

***

## 14. Dependencies

- [Dependency 1]
- [Dependency 2]
- [Dependency 3]

***

## 15. Launch Plan

### Rollout Strategy

[Big bang / phased rollout / feature flag / beta group / canary deployment]

### Launch Criteria

- [ ] [Criterion 1 — what must be true to launch]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

### Monitoring Plan

[What to monitor post-launch, what alerts to set up, who is responsible]

### Rollback Plan

- [How to roll back if launch goes badly]

### Communication Plan

- [Who needs to know — users, support, sales, marketing, internal teams]

***

## 16. Post-Launch Validation

[What should be checked or reviewed after launch? What signals confirm the initiative is working as intended? When is the first review checkpoint?]

***

## 17. Open Questions

| # | Question | Needed By | Owner | Status |
| :--- | :--- | :--- | :--- | :--- |
| 1 | [Question] | [Date] | [Who] | [Open / Answered] |
| 2 | [Question] | [Date] | [Who] | [Open / Answered] |

***

## Approval

| Role | Name | Date | Status |
| :--- | :--- | :--- | :--- |
| Product | [Name] | [Date] | [Approved / Pending] |
| Engineering | [Name] | [Date] | [Approved / Pending] |
| Design | [Name] | [Date] | [Approved / Pending] |
