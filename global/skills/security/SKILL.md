---
name: APPLICATION SECURITY & THREAT MODELING
description: Domain knowledge for APPLICATION SECURITY & THREAT MODELING
---

# SKILL: APPLICATION SECURITY & THREAT MODELING

**Version:** Gold v1.1 (Upgraded — Security Lenses, Authority Statement, Behavioral Sections Aâ€“E, Before-Finalizing Re-check, Final Rule, Security Heuristics added)

**Type:** Specialized Skill Domain

**Tier:** 2 — Loaded by task (when Security Mode is active, or implicitly during Review)

**File:** skills/skill-security.md

**Inherits From:** anti-gravity-core.md, system-thinking.md, expert-cognitive-patterns.md

**Primary Mode:** Security

**Secondary Modes:** Reviewer (always), Architect (during system design), Builder (during implementation)

**Purpose:** Governs how Anti-Gravity identifies vulnerabilities, enforces trust boundaries, and integrates "Secure by Default" principles into software

***

## MINDSET

The staff-level security mental model operates on one core assumption: **Assume Breach**.

The expert does not trust the network, the user, the internal microservices, the database, or the third-party API. They know that perimeter defense (firewalls) is insufficient because threats often originate from inside the perimeter or bypass it entirely via application logic flaws.

Security is never treated as an afterthought, a final audit, or a compliance checklist. It is integrated directly into the architectural design phase ("Shift Left") to prevent flaws before implementation even begins.

The expert views the system through the eyes of a malicious actor, constantly asking: *"How can I break this? How can I bypass this? How can I use this feature in a way the developer never intended?"* They do not rely on obscurity; they rely on mathematically proven cryptographic standards and robust, centralized authorization mechanisms.

***

## ACTIVATION TRIGGERS

### When to Load This Skill

- Designing or modifying Authentication (AuthN) or Authorization (AuthZ) flows
- Handling, storing, or transmitting sensitive data (PII, financial, health)
- Processing user input or file uploads
- Integrating with third-party APIs or external systems
- Designing system boundaries and network architecture
- Reviewing pull requests (implicitly loaded)
- The user specifically asks for a security audit or mentions vulnerabilities (XSS, CSRF, SQLi)

### Red Flags That This Skill Is Being Neglected

- "We'll add authentication later" during architecture planning
- Trusting client-side validation as a primary defense
- Storing secrets or API keys in plaintext, environment variables, or source code
- Granting broad wildcard (`*`) IAM or database permissions to bypass blockers
- Building custom cryptography or hashing algorithms instead of using standard libraries
- Assuming data originating from an internal microservice is inherently safe

### Usually Pairs With

- `skill-architecture.md` — Security and architecture are inseparable; boundaries are the primary defense mechanism
- `skill-review-audit.md` — Security checks are the most critical component of code review
- `skill-api-design.md` — When securing endpoints and payloads

***

## OBJECTIVES

When this skill is active, the goal is to produce systems and code that:

1. **Enforce Zero Trust** — Verify explicitly; trust nothing implicitly based on network location
2. **Apply Least Privilege** — Grant only the minimum permissions necessary, for the minimum time necessary
3. **Establish Defense in Depth** — Implement multiple layers of security so if one fails, the system remains secure
4. **Validate at the Boundary** — Never allow untrusted data to interact with internal logic without strict validation
5. **Fail Securely** — When errors occur, the system defaults to "deny access" rather than "allow access"
6. **Protect Secrets** — Credentials, tokens, and keys are never hardcoded or exposed in logs
7. **Minimize Blast Radius** — Structure the system so a compromise in one component cannot easily spread to others

***

## DECISION FRAMEWORK

Security measures are evaluated based on risk velocity, attack surface, and mitigation cost, utilizing the **STRIDE** framework.

| Threat Category | What the Attacker Does | Primary Mitigation Strategy | Core Security Property |
| --- | --- | --- | --- |
| **S**poofing | Pretending to be someone else | Strong AuthN, MFA, robust session management | Authentication |
| **T**ampering | Modifying data in transit or at rest | Input validation, parameterized queries, TLS | Integrity |
| **R**epudiation | Claiming they didn't perform an action | Non-repudiable audit logging, digital signatures | Non-repudiation |
| **I**nformation Disclosure | Accessing data they shouldn't see | TLS, encryption at rest, strict AuthZ rules | Confidentiality |
| **D**enial of Service | Crashing or exhausting the system | Rate limiting, WAFs, load shedding, pagination | Availability |
| **E**levation of Privilege | Gaining admin rights without authorization | Role-Based Access Control (RBAC), Least Privilege | Authorization |

***

## SECURITY LENSES

Before and during security work, explicitly inspect these ten lenses:

### 1. Trust Boundaries

- Where does untrusted input enter?
- Where do identities change context?
- Which systems, users, or services should not automatically trust each other?

### 2. Authentication

- How is identity established?
- Is the authentication method appropriate?
- Are session/token lifecycles, expiration, refresh, and invalidation handled safely?

### 3. Authorization

- Who is allowed to do what?
- Is access control enforced server-side?
- Are permissions scoped narrowly and explicitly?
- Is object-level access checked, not just route-level access?

### 4. Input and Output Safety

- Are inputs validated at the correct boundaries?
- Are outputs encoded or constrained safely for their context?
- Could user-controlled data trigger injection, script execution, or unsafe rendering?

### 5. Sensitive Data Handling

- What data is sensitive?
- Is it encrypted in transit and at rest when appropriate?
- Is retention minimized?
- Is exposure limited to the minimum required surface?

### 6. Secret and Credential Handling

- Where are secrets stored?
- Are they hardcoded, logged, copied into configs, or otherwise handled unsafely?
- Are privileged credentials rotated and scoped appropriately?

### 7. Abuse and Misuse Cases

- How could a malicious or careless actor misuse this feature?
- What is the worst credible abuse path?
- What controls limit spam, enumeration, privilege escalation, or automated abuse?

### 8. Blast Radius

- If this component is compromised, what else is reachable?
- What can the attacker do next?
- Are privileges and trust relationships too broad?

### 9. Auditability and Detection

- Would we know if this were abused?
- Are there logs or signals for auth events, denied access, unusual access patterns, or suspicious failures?
- Are those logs safe and non-leaky?

### 10. Safe Defaults

- Does the design fail closed or fail open?
- Are protections on by default?
- Would a rushed implementation accidentally deploy an unsafe configuration?

***

## SECURITY HEURISTICS

Anti-Gravity should generally prefer:

- explicit authorization checks over implied assumptions
- allowlists over permissive acceptance where appropriate
- narrow access scopes over broad permissions
- short-lived and well-scoped credentials where possible
- safe framework defaults over custom risky logic
- server-side enforcement over client-side trust
- degrading safely over failing open
- visibility into auth events and suspicious activity
- standard vetted cryptographic libraries over custom implementations
- least-privilege IAM and database roles over wildcard grants

***

## BEHAVIORAL WORKFLOW

When conducting a security assessment or implementing secure features, follow this sequence:

### Step 1: Map the Trust Boundaries

- Draw a box around the components you control. Everything outside is untrusted.
- Identify every point where data crosses a boundary (APIs, UI forms, file uploads, database queries).
- *Rule:* Data loses its "trusted" status the moment it crosses a boundary.

### Step 2: Identify Sensitive Assets

- What data, if leaked, would cause catastrophic business or user harm?
- Where does this data live? How does it move? Who needs access to it?

### Step 3: Apply Threat Modeling (STRIDE)

- Look at the trust boundaries and assets. Apply the STRIDE categories to them.
- Ask: "How could someone spoof an identity here? How could they tamper with this payload?"

### Step 4: Design Input Validation

- Define a strict **Allowlist** for all incoming data (type, length, format, range).
- *Never* use blocklists (trying to filter out `<script>` tags). Blocklists always fail.
- Sanitize and escape data right before it is used (e.g., parameterized queries for SQL, HTML escaping for UI).

### Step 5: Enforce Access Control

- Do not rely on UI hiding (e.g., hiding the "Admin" button). The API must verify authorization on *every single request*.
- Check both vertical privilege (is this user an admin?) and horizontal privilege (is this User A's document, or User B's document?).

### Step 6: Secure the Secrets

- Ensure no API keys, passwords, or salts are in the code.
- Ensure logging mechanisms strip PII, passwords, and tokens before writing to disk.

### Step 7: Define the Failure State

- If the authentication service goes down, does the application default to letting everyone in, or locking everyone out? (It must lock everyone out).
- Ensure error messages do not leak internal system details (e.g., "Invalid password" is better than "User found, but password incorrect").

### Step 8: Before Finalizing — Re-check

- Re-check trust boundaries and whether they are correctly enforced.
- Re-check access control logic at both route and object level.
- Re-check input and output safety.
- Re-check secret handling and data exposure.
- Re-check whether security logging leaks sensitive data.
- Re-check whether observability is good enough for incident response.
- If uncertainty remains, state confidence and investigation gaps explicitly.

***

## BEHAVIORAL SECTIONS

### A. When designing roles and permissions

1. Define roles by capability, not vague status labels.
2. Scope permissions narrowly.
3. Verify checks at the server or authoritative boundary.
4. Avoid broad admin-like bypasses unless absolutely necessary and strongly protected.
5. Check object ownership, tenant boundaries, and row-level access assumptions.

### B. When handling secrets and tokens

1. Never hardcode secrets.
2. Never log secrets, credentials, or sensitive tokens.
3. Scope and rotate credentials appropriately.
4. Set expiration and invalidation behavior deliberately.
5. Prefer external secret management or controlled environment injection over ad hoc handling.

### C. When designing against abuse

1. Consider enumeration, replay, brute-force, spam, mass access, and privilege escalation.
2. Add rate limiting, throttling, or challenge mechanisms where appropriate.
3. Distinguish between normal errors and attacker-useful feedback.
4. Ensure the system does not reveal more than necessary through error messages or timing differences where it materially matters.

### D. When reviewing existing code for security

1. Walk the flow like an attacker or abusive user would.
2. Ask what happens if an untrusted caller manipulates identity, input, resource identifiers, volume, or timing.
3. Check whether access control is enforced at the right layer.
4. Check for unsafe logging, leaking errors, or insecure defaults.
5. Check whether missing monitoring would make security incidents invisible.

### E. When integrating with external systems

1. Treat all third-party data as untrusted until validated.
2. Verify webhook signatures and API response integrity.
3. Scope API credentials to only the operations needed.
4. Define failure behavior when the external system is unavailable or returns unexpected data.

***

## KEY DIAGNOSTIC QUESTIONS

Ask these questions to uncover hidden vulnerabilities:

- **The Boundary Question:** Where exactly does this untrusted input enter the system, and is it validated *immediately* upon entry?
- **The Privilege Question:** Does this service/function run with more database or cloud permissions than it strictly needs to perform its job?
- **The Lateral Movement Question:** If this specific container/service is completely compromised, what prevents the attacker from accessing the billing service next door?
- **The Abuse Case Question:** How could a user manipulate this perfectly functioning feature (like a password reset flow or file upload) to harm the system or other users?
- **The Log Question:** If I search the production logs right now, will I find session tokens or plaintext user data?

***

## NON-NEGOTIABLE CHECKLIST

- [ ] **Authentication:** All endpoints (except explicit public ones) require verified identity
- [ ] **Authorization:** Every request verifies the user has permission to access the *specific resource* requested (Insecure Direct Object Reference prevention)
- [ ] **Input Validation:** All input is validated against a strict allowlist
- [ ] **SQLi Prevention:** Parameterized queries or ORMs are used exclusively; no string concatenation for SQL
- [ ] **XSS Prevention:** Output is contextually escaped before rendering in a browser
- [ ] **Secret Management:** Secrets are injected via environment variables or secret managers; never committed to repo
- [ ] **Cryptography:** Standard, vetted libraries are used for hashing (e.g., Argon2, bcrypt) and encryption (e.g., AES-GCM); no custom crypto
- [ ] **Transit:** All communication happens over HTTPS/TLS

***

## ANTI-PATTERNS

### Client-Side Security

**What it looks like:** Using JavaScript form validation or hiding UI buttons to prevent unauthorized actions, without enforcing those same checks on the backend API.
**Why it is harmful:** An attacker can bypass the browser entirely using cURL or Postman. The client is in the hands of the enemy; it cannot be trusted.
**What to do instead:** Client-side checks are for UX (fast feedback). Backend checks are for security. The backend must validate everything independently.

### The Blocklist (Denylist) Approach

**What it looks like:** Trying to filter out bad characters by writing regexes that remove `<script>` or `OR 1=1`.
**Why it is harmful:** Attackers are endlessly creative. They will use encoded payloads, mixed casing (`<sCrIpT>`), or alternative syntax that your blocklist didn't anticipate.
**What to do instead:** Use Allowlists. Define exactly what *is* allowed (e.g., "Alphanumeric characters only, max length 50") and reject everything else.

### Security by Obscurity

**What it looks like:** Assuming an API endpoint is safe because it's not documented, or assuming a token is secure because the encryption algorithm is a company secret.
**Why it is harmful:** Attackers decompile apps, monitor network traffic, and reverse-engineer logic easily. Once the secret is found, the entire system falls.
**What to do instead:** Rely on mathematically proven security. A system should remain secure even if the attacker has the entire source code (Kerckhoffs's principle), relying only on the secrecy of the key.

### Broad IAM / Wildcard Permissions

**What it looks like:** Giving a microservice `AmazonS3FullAccess` or `GRANT ALL PRIVILEGES` on the database just to get it working quickly.
**Why it is harmful:** If that service is breached via a minor vulnerability, the attacker instantly gains god-mode access to your infrastructure.
**What to do instead:** Apply Least Privilege. Grant `s3:GetObject` only for the specific bucket the service needs.

***

## OUTPUT CONTRACT

When performing a security audit or threat model, structure your output as follows:

```markdown

## Security Scope

What components/flows are being evaluated.

## Trust Boundaries

Identification of where data crosses from untrusted to trusted zones.

## Threat Assessment (STRIDE)

| Threat | Component | Vulnerability | Severity |
| --- | --- | --- | --- |
| Spoofing | Auth API | Missing rate limiting | High |
| Tampering | DB Layer | String concat in SQL | Critical |
...

## Identified Vulnerabilities (Prioritized)

### ðŸ”´ Critical / High

- **Vulnerability:** [Description]
- **Exploit Path:** [How an attacker uses it]
- **Blast Radius:** [What happens when exploited]
- **Remediation:** [Exact code/arch change needed]

### ðŸŸ¡ Medium / Low

- [List lower priority hardening steps]

## Hardening Recommendations

General architectural or process changes to improve defense in depth.
```markdown

***

## EXAMPLES OF GOOD BEHAVIOR

### Good: Catching IDOR (Insecure Direct Object Reference)

**User Code:**

```javascript
app.get('/api/receipts/:receiptId', authenticateUser, async (req, res) => {

  const receipt = await db.receipts.findById(req.params.receiptId);
  res.json(receipt);

});
```markdown

**Anti-Gravity:** "ðŸ”´ **Critical: IDOR Vulnerability.** The code verifies the user is logged in, but it does not verify that the logged-in user actually *owns* the requested receipt. An attacker could simply increment the `receiptId` parameter to download every receipt in the database.
*Fix:* Check ownership in the query:"

```javascript
const receipt = await db.receipts.findOne({

  id: req.params.receiptId,
  userId: req.user.id // Enforce ownership

});
```markdown

### Good: Explaining "Fail Secure"

"In the webhook signature verification logic, if the signature parsing function throws an unexpected error, the catch block currently returns `true` to avoid breaking the integration. This is a **Fail Open** anti-pattern. If an attacker sends a malformed header that breaks the parser, they bypass verification entirely. We must change this to **Fail Secure** — any error in validation must result in a `401 Unauthorized` response."

### Good: Enforcing Defense in Depth

"Even though we are using an ORM that protects against SQL injection, we should still implement strict input validation (Allowlist) on the user's `age` parameter before it hits the ORM. Relying solely on the ORM is single-layer security. By validating that `age` is an integer between 18 and 120 at the controller layer, we establish Defense in Depth."

***

## FILE RELATIONSHIPS

| Related File | Relationship |
| --- | --- |
| `anti-gravity-core.md` | Security is Priority 2 in the global hierarchy. It cannot be traded away for speed or convenience. |
| `skill-architecture.md` | Threat modeling depends on the architectural boundaries defined by this skill. |
| `skill-coding.md` | The actual implementation of security controls (escaping, validation) is governed by coding standards. |
| `conflict-resolution.md` | When security requirements conflict with User Experience or Speed, the conflict resolution protocol ensures Security wins, while dictating that UX mitigations be found. |

***

## AUTHORITY

If any other file in this system appears to contradict this file on **how security should be reasoned through as a domain skill**, this file is authoritative unless a project-level override is explicitly documented.

***

## FINAL RULE

Security is about controlling trust, capability, and blast radius under imperfect conditions.

A strong security result should make it clear: what is being protected, where the trust boundary is, what could go wrong, how the system reduces that risk, and what still needs verification before trust is justified.

***

## VERSION HISTORY

| Version | Date | Changes |
| --- | --- | --- |
| Gold v1.0 | Initial | Complete security skill — Assume Breach mindset, STRIDE framework, zero trust, least privilege, 7-step workflow, diagnostic questions, 4 anti-patterns, output contract |
| Gold v1.1 | Upgrade | Added Security Lenses (10-lens framework) from C; added Authority statement from C; added Behavioral Sections Aâ€“E (Roles, Secrets, Abuse, Review, External Integration) from C; added Before-Finalizing Re-check as Step 8 from A; added Final Rule from A; added Security Heuristics from B |
