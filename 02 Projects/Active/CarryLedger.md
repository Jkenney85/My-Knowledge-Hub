---
type: project
status: active
area: public-research
created: 2026-07-21
target:
working_title: CarryLedger
---

# CarryLedger

> [!note] Working title
> **CarryLedger** is the recommended working name, not a final brand decision. Complete domain, social-handle, and trademark checks before publicly adopting it.

## Outcome

Create a trustworthy, neutral, searchable public record of firearm-related incidents involving concealed-carry permit holders and people lawfully carrying in permitless-carry states. Prove the concept in Missouri, Oklahoma, Kansas, Nebraska, Iowa, Illinois, and Arkansas before expanding to all 50 states and Washington, D.C.

The first usable version will:

- Discover possible new incidents and updates once per day.
- Place every discovery into a private review queue.
- Require human approval before anything becomes public.
- Publish evidence-focused incident records with source links, verification labels, and revision history.
- Let anyone search published records without an account.
- Let registered users download public data and privately suggest corrections.
- Support an administrator-run ad hoc search for older or specific incidents.

## Why it matters

Information about concealed carriers and firearm incidents is fragmented across local news, police and sheriff releases, court records, and later follow-up reporting. CarryLedger would centralize those records without arguing for or against concealed carry. Its value comes from transparent sourcing, careful distinctions between confirmed and unconfirmed claims, and a visible record of corrections.

## Tasks

Create detailed task notes in `Tasks/Task Notes` using the [[10 Templates/Task|Task template]], then link them here.

- **Next task:** Write the formal inclusion, verification, naming, privacy, correction, and removal policy; test it against 10–25 manually researched incidents from the seven pilot states.
- **Open tasks:**
  - [ ] Choose the final project name after domain and trademark screening.
  - [ ] Build a pilot source registry for each state.
  - [ ] Create the incident taxonomy and database schema.
  - [ ] Curate a small gold-standard incident set for testing.
  - [ ] Prototype the administrator review workflow before automating discovery.
  - [ ] Select the web-search and AI providers after a small cost and quality test.
  - [ ] Build the public search and incident-detail experience.
  - [ ] Add registered-user CSV export and private correction reports.
  - [ ] Backfill the first 12 months of pilot-state incidents.
  - [ ] Run a private pilot and review editorial/legal risks before launch.
- **Completed tasks:**
  - [x] Define the initial concept, audience, scope, and operating model.

## Product definition

### Purpose

- Public education and research.
- Neutral, evidence-focused presentation.
- Initial audience: the general public and gun owners.
- Free public resource at launch.
- Donations or sponsors may be added later; core records should not be paywalled.

### Geographic and historical scope

- **Pilot states:** Missouri, Oklahoma, Kansas, Nebraska, Iowa, Illinois, and Arkansas.
- **Long-term scope:** all 50 states plus Washington, D.C.; U.S. territories are excluded.
- **Initial archive:** begin with the 12 months before launch.
- **Older incidents:** research them on demand through the private ad hoc search tool.

### What qualifies as an incident

Include an event when a person is credibly reported or officially confirmed as any of the following:

- A concealed-carry permit holder.
- A person lawfully carrying concealed in a permitless-carry state, even without a permit.
- An on-duty or off-duty law-enforcement officer, armed security worker, or military member. Their professional role and duty status must be recorded so researchers can filter or interpret the case correctly.

The carrier may be the defender, alleged aggressor, victim, bystander, accidental actor, or another documented participant. The person does not have to fire or draw the firearm. Qualifying events include:

- Firing a firearm.
- Drawing or displaying it.
- Brandishing or threatening with it.
- Accidental or negligent discharge.
- Loss, theft, or unauthorized access.
- Alleged unlawful use.
- Presence as a victim or bystander without drawing.
- Other firearm-related involvement that is supported by a source.

Do not treat presence, an arrest, or a charge as proof of wrongdoing. Record allegations, official findings, and final outcomes as separate facts.

### First-version boundaries

The first version will not include:

- Nationwide automated coverage.
- Public comments or discussion threads.
- Maps, charts, or aggregate statistical dashboards.
- Real-time discovery.
- Automatic publication by AI.
- Public API access.
- Multiple administrator roles.
- Paid research features.
- Mobile applications.

## Public experience

### Visitor flow

1. Open the website without registering.
2. Search by keywords or use filters.
3. View a list of matching incident records.
4. Open an incident page to see the neutral summary, classifications, verification state, sources, relevant state-law reference, and revision history.
5. Register only if the visitor wants to download data or submit a private correction.

### Search and filters

The first version should support:

- Free-text search across titles, summaries, locations, and public names.
- Date or date range.
- State, city, county, or approximate neighborhood.
- Incident type.
- Carrier role and firearm action.
- Permit or lawful-carry status.
- Verification level.
- Injuries and deaths.
- Case status and legal outcome.

Search results should default to newest first and make verification and case status visible without opening the full record.

### Registered-user capabilities

- Download a sanitized CSV of public incident data.
- Submit a private correction report tied to a specific incident.
- Provide correction text and supporting links or documents.
- View a confirmation that the report was received.

Registration is not required to browse or search. Downloaded data must exclude hidden names, precise private locations, internal notes, private reports, archived source copies, and other nonpublic fields.

## Incident page

Each public record should contain:

- Clear, factual title.
- Incident date and, if known, approximate time.
- State, county, city, and approximate neighborhood—not a precise address.
- Concise evidence-based narrative.
- Carrier's role in the event.
- Firearm action: not handled, possessed, displayed, drawn, fired, accidentally discharged, lost, stolen, or unknown.
- Carry basis: permit confirmed, permit credibly reported, lawful permitless carry credibly reported, lawful permitless carry confirmed, unknown, disputed, or not applicable.
- Injuries and deaths, with counts and roles where sources support them.
- Investigation, charge, court, and final outcome information.
- Verification label and case-status label.
- Last-reviewed and last-updated dates.
- News articles, agency releases, court records, and other source citations.
- A link to the relevant official state carry-law source as it applied on the incident date.
- Dated public revision history explaining material changes.
- A private-correction link for registered users.

## Status model

Do not compress different kinds of uncertainty into one label. Use separate fields.

### Public evidence status

- **Unconfirmed:** plausible report exists, but evidence is limited or conflicting.
- **Credibly reported:** one or more credible sources report the fact, but no authoritative confirmation has been located.
- **Officially confirmed:** supported by an agency release, court record, official document, or equivalent primary source.

### Public case status

- Unknown.
- Under investigation.
- Case pending.
- Resolved.

### Legal outcome

- No arrest reported.
- Arrested; charges unknown.
- Charges filed.
- No charges or charges declined.
- Charges dismissed.
- Plea entered.
- Acquitted.
- Convicted.
- Civil case pending or resolved.
- Other or unknown.

Never label an incident “justified,” “defensive,” “criminal,” or “unlawful” as an editorial conclusion. Use those terms only when clearly attributed to an official finding or source, and store the attribution.

### Internal workflow status

- Discovered.
- Needs triage.
- Needs research.
- Possible duplicate.
- Ready for review.
- Approved and published.
- Rejected with reason.
- Monitoring for updates.
- Archived or removed.

## People, names, and privacy

- Names are optional public fields controlled by the administrator during review.
- Names of minors are always hidden publicly and in data exports.
- Victim names are hidden by default and may be shown only through an explicit administrator override.
- Other names may be published only when they are already public in credible sources and publication adds meaningful identification value.
- Store public-display permission separately from the name itself.
- Record role, age range, duty status, and other nonidentifying attributes only when relevant and sourced.
- Avoid precise home addresses, personal contact information, family-member details, and unnecessary sensitive information.

The site needs a clear correction, removal, and identity-dispute process before launch.

## Sources and evidence

### Starting source types

1. Police and sheriff releases.
2. Court records and official case information.
3. Local news outlets.
4. Later expansion to additional credible sources.

Create a source registry for each state containing the source name, jurisdiction, URL or feed, source type, access method, reliability notes, terms or reuse restrictions, and last-successful check.

### Source handling

- Save source title, publisher, author when available, publication date, URL, retrieval date, and source type.
- Preserve an internal evidence copy or snapshot only when the publisher's terms, copyright rules, and the search provider's storage terms allow it.
- Store a content hash so changed source material can be detected.
- Show citations, links, and short attributed excerpts publicly—not full copied articles.
- Mark broken links and keep the record's citation metadata.
- Tie important factual fields to one or more supporting sources so a reviewer can see why a fact is present.

## AI-assisted discovery

AI is a research assistant. It may find, compare, classify, summarize, and suggest. It may never publish, silently change a record, decide guilt, or make a final legal determination.

### Daily discovery run

Run once daily for the seven pilot states:

1. Collect new items from configured agency feeds, court sources, local-news feeds, and web-search queries.
2. Search each state using a maintained set of phrases related to concealed carry, permitless carry, defensive gun use, display, discharge, lost weapons, permit holders, and case updates.
3. Normalize URLs and remove obvious duplicate pages.
4. Compare each result with existing incidents using date, geography, names, agencies, and semantic similarity.
5. Classify the result as a likely new incident, likely update, possible duplicate, or irrelevant.
6. Extract a proposed structured record with a citation attached to each important claim.
7. Assign source-quality and extraction-confidence indicators.
8. Place the candidate in the private review queue.
9. Show an alert inside the administrator dashboard.

The daily report should separate:

- Likely new incidents.
- Likely updates to published incidents.
- Low-confidence leads.
- Possible duplicates.
- Source failures that need attention.

### Ad hoc historical search

The administrator enters:

- Date or approximate date.
- Location.
- Keywords.
- Short description.

The system expands that input into multiple searches, collects related sources, groups duplicate coverage, builds a timeline, identifies contradictions, and proposes either a new candidate or an update to an existing record. Results remain private until reviewed.

### Update monitoring

Published incidents with an investigation or pending case should remain on a monitoring list. The daily job should search using incident-specific names, case numbers, agencies, locations, and distinctive phrases. Proposed changes must show the old value, new value, source, and reason before approval.

### Cost-control approach

- Use free agency and publisher feeds first.
- Use web search only for gaps, broader discovery, and ad hoc research.
- Deduplicate before sending content to an AI model.
- Send extracted article text rather than unnecessary page markup.
- Use a smaller, lower-cost model for relevance and extraction; reserve a stronger model for conflicting or complex cases.
- Cache search queries and content fingerprints.
- Set daily request and spending limits.
- Keep the search and AI providers behind adapters so either can be replaced.

As of 2026-07-21, the [Brave Search API](https://brave.com/search/api/) is a reasonable pilot candidate because it offers web/news results and a small monthly credit. Confirm its current pricing and storage rights before implementation; search-result storage and third-party content rights require special attention.

## Recommended self-hosted architecture

### Recommended first approach

Use a Dockerized Django monolith instead of starting with many services. The difficult part of this product is editorial workflow, evidence provenance, identity protection, and revision history—not the visual frontend.

- **Application:** Django for the public website, registered-user features, private review dashboard, authentication, forms, and API endpoints.
- **Database:** PostgreSQL.
- **Search:** PostgreSQL full-text search plus trigram matching at first. Add a dedicated search engine only if real usage proves it necessary.
- **Background jobs:** Celery worker and Celery Beat for the daily run, ad hoc searches, update monitoring, exports, and retries.
- **Queue/cache:** Redis.
- **Evidence storage:** private local volume or self-hosted S3-compatible storage such as MinIO, with encrypted backups.
- **Reverse proxy and TLS:** the existing preferred Linux/Docker proxy, such as Caddy, Traefik, or Nginx.
- **Frontend:** Django templates with a small amount of HTMX or JavaScript for filters and review actions. A separate React frontend can be added later if it produces clear value.
- **AI/search integration:** provider-neutral service interfaces so the web-search API and language model can change without rewriting the application.
- **Monitoring:** structured logs, job-failure alerts inside the dashboard, uptime monitoring, and backup checks.

### Why this fits the project

- Django provides mature authentication, permissions, forms, database migrations, and a strong administration foundation.
- A monolith is easier for one person to secure, deploy, back up, and debug.
- PostgreSQL can handle the first version's structured records and search volume without another paid service.
- Every component can run in Docker on the existing Linux server.
- The design can later split discovery workers or add a search service without changing the public data model.

### Where Lovable fits

Lovable is better treated as an optional design and frontend-prototyping tool than as a required hosting provider for this project. Its official documentation says its applications are standard Vite and React projects, can sync to GitHub, and can be deployed on self-managed infrastructure. See [Lovable deployment and ownership](https://docs.lovable.dev/tips-tricks/deployment-hosting-ownership) and [Lovable GitHub sync](https://docs.lovable.dev/integrations/github).

Practical options:

1. **Recommended:** build the Django product directly and use AI coding tools for implementation.
2. Prototype the public interface in Lovable, sync the code to GitHub, and either use the design as a reference or connect the exported frontend to a documented Django API.
3. Use Lovable Cloud only for a throwaway prototype. Do not make production data portability, editorial history, or evidence storage depend on it without first testing export and restore procedures.

If Lovable is used, keep the production database schema, business rules, review workflow, and evidence-retention logic in the repository and under direct control.

## Core data model

### Main entities

- **Incident:** canonical public event record.
- **Person:** internal identity record with separate public-display controls.
- **Incident participant:** connects a person to an incident with role, duty status, carry status, and firearm action.
- **Location:** public approximate geography plus restricted internal precision if ever needed.
- **Source:** publication or official-record metadata.
- **Evidence claim:** a factual field or statement connected to supporting and contradicting sources.
- **Case event:** arrest, charge, hearing, plea, disposition, civil action, or official update.
- **Revision:** immutable record of who changed what, when, why, and from which source.
- **Discovery candidate:** private AI-produced lead before review.
- **Discovery run:** run time, queries, provider usage, failures, and counts.
- **Correction report:** private registered-user submission and its resolution.
- **State-law reference:** official link, effective dates, jurisdiction, and short neutral context.
- **User:** registered visitor or administrator; design the role field for future reviewers.
- **Export job:** who requested a download, when, filters used, and the generated sanitized file.

### Important incident fields

- Stable public incident ID and URL slug.
- Title and neutral summary.
- Incident date, time precision, and timezone.
- State, county, city, and approximate neighborhood.
- Incident types and tags.
- Evidence status, case status, and legal outcome.
- Injury and death counts.
- First published, last reviewed, and last updated timestamps.
- Public notes and methodology caveats.
- Administrator owner and internal review notes.
- Publication, monitoring, and removal status.

Use controlled vocabularies for filtering but allow an “other” value plus a note. Store “unknown,” “not reported,” “not applicable,” and “disputed” as distinct values.

## Administrator workflow

### Review a new candidate

1. Open the dashboard alert and candidate.
2. Review grouped sources and the proposed timeline.
3. Confirm the candidate is in scope.
4. Resolve possible duplicate matches.
5. Review each extracted fact and its citation.
6. Edit the summary and classifications.
7. Set public evidence status and case status separately.
8. Set name visibility for each person; minor names cannot be enabled.
9. Confirm approximate public location.
10. Add or verify the official state-law reference.
11. Approve and publish, keep for more research, merge, or reject with a reason.

### Review an update

1. Compare proposed and published values side by side.
2. Review the new source and any contradictions.
3. Accept or reject each material change.
4. Write a short public revision note.
5. Publish a new immutable revision.

### Review a correction

1. Open the private registered-user report.
2. Review its supporting evidence.
3. Independently verify the claim.
4. Update the incident if warranted.
5. Add a public revision note without exposing the reporter.
6. Mark the report accepted, partially accepted, rejected, or unable to verify.

## Editorial and safety rules

- Every public record requires human approval.
- Every material public claim requires a citation.
- Attribute allegations and disputed claims.
- Separate carry-status confidence from incident verification and legal outcome.
- Do not infer that a person carried lawfully merely because a state allows permitless carry.
- Do not infer permit status from political affiliation, training, occupation, or social-media statements.
- Do not infer guilt from arrest or charges.
- Keep AI-generated text private until reviewed and rewritten as needed.
- Record conflicting credible accounts rather than choosing one without evidence.
- Publish the methodology, inclusion rules, known coverage gaps, and correction policy.
- Mark missing data as unknown instead of silently omitting it.
- Never claim the database is a complete count of all qualifying incidents.

## Legal, ethical, and operational risks

This project handles allegations, personal identities, minors, victims, criminal proceedings, and copyrighted sources. Obtain qualified legal review before public launch.

### Primary risks and controls

- **Defamation and false implication:** use attributed language, distinct allegation/outcome fields, strong sourcing, and prompt correction procedures.
- **Minors and victims:** always hide minor names; hide victim names by default; exclude unnecessary identifying details.
- **Expunged, sealed, or corrected records:** support removal/restriction requests and maintain a private decision log.
- **Copyright and terms of service:** store only what is permitted; show links and limited excerpts publicly; document provider storage rights.
- **AI hallucination:** require field-level citations and human review; never publish unsupported synthesis.
- **Uneven reporting:** publish coverage limitations and measure source coverage by state and county.
- **Carrier-status ambiguity:** show whether permit or permitless status is confirmed, credibly reported, disputed, or unknown.
- **Security:** use strong administrator authentication, preferably passkeys or MFA; rate-limit login, corrections, ad hoc searches, and exports.
- **Sensitive evidence:** keep internal archives private, encrypted in backups, and inaccessible from public URLs.
- **Sponsor influence:** publish a sponsor-independence policy before accepting funding.

## Delivery roadmap

There is no target date yet. Advance by evidence gates instead of calendar promises.

### Phase 0 — Editorial proof

- Finalize the inclusion and exclusion rules.
- Define every status and classification.
- Manually research 10–25 varied incidents.
- Test whether two different review sessions produce consistent classifications.
- Revise the schema before coding heavily.

**Gate:** The same incident can be entered consistently, every public fact has a source, and ambiguous carry status is represented honestly.

### Phase 1 — Private foundation

- Create the Dockerized application and database.
- Add administrator authentication and backups.
- Implement incident, participant, source, evidence, case-event, and revision models.
- Build manual create/edit/review workflows.

**Gate:** A complete incident can be entered, revised, audited, exported, restored from backup, and kept private until approval.

### Phase 2 — Discovery prototype

- Add the source registry and daily scheduler.
- Integrate one search provider and one AI provider behind adapters.
- Build relevance screening, extraction, deduplication, and candidate review.
- Add ad hoc historical search.
- Test with the manual gold-standard set.

**Gate:** The system finds useful candidates with manageable noise and never publishes automatically.

### Phase 3 — Public MVP

- Build public search, filters, results, and incident pages.
- Add revision history and methodology pages.
- Add user registration, sanitized CSV export, and private correction reports.
- Add accessibility, security, rate-limit, and backup testing.

**Gate:** A user can find and understand a record, trace claims to sources, download only public fields, and privately suggest a correction.

### Phase 4 — Pilot archive and monitoring

- Build the 12-month pilot-state archive.
- Monitor pending cases for updates.
- Measure discovery precision, duplicate rate, review time, source failures, and correction volume.
- Conduct legal/editorial review before wider publicity.

**Gate:** The solo review workload is sustainable and the published methodology matches actual practice.

### Phase 5 — Expansion

- Add states in small batches.
- Add reviewer roles only when needed.
- Add maps, aggregate statistics, saved searches, alerts, public API access, donations, or sponsors after the core record system is trusted.

## Success measures

For the pilot, prioritize quality and sustainability over traffic:

- Percentage of published claims with at least one citation.
- Candidate precision: useful candidates divided by total candidates reviewed.
- Duplicate rate.
- Median review time per candidate.
- Percentage of pending cases checked successfully each day.
- Source failures by state and source type.
- Correction turnaround time.
- Number of material post-publication corrections.
- Percentage of incidents with clearly stated carry-status confidence.
- Ability to restore the service and evidence store from backup.

Do not use raw incident totals as a success metric until source coverage is measured and understood.

## Name direction

### Recommended working name: CarryLedger

Why it fits:

- Memorable and easy to say.
- “Carry” signals the subject without implying advocacy.
- “Ledger” suggests an organized, sourced public record.
- Flexible enough to include permit holders, permitless lawful carriers, bystanders, victims, professionals, and case updates.

Possible tagline: **A sourced public record of firearm incidents involving concealed carriers.**

### Alternatives

- **The Carry Record** — clear and credible, slightly less distinctive.
- **CarryTrace** — emphasizes following an incident and its updates.
- **CarryEvidence** — strongly communicates sourcing but sounds more institutional.
- **Firearm Incident Index** — extremely clear and neutral, but less memorable.
- **The Armed Record** — broad and memorable, but may sound more confrontational.

Avoid names that imply a predetermined conclusion or advocacy, such as “Good Guy,” “Gun Crime,” “Carry Watchlist,” or “Defensive Gun Tracker.” Also avoid sensational words such as “trigger,” “shootout,” or “body count.”

Before choosing a final name:

- Search federal and state trademarks.
- Check common-law use, business names, app stores, and social handles.
- Check practical domain variations.
- Test the name with both gun owners and neutral general-public users.
- Confirm the name still works if the database later includes broader firearm research.

## Open decisions

- Final name, domain, and visual identity.
- Exact data-download license and acceptable-use terms.
- Exact pilot source list for each state.
- Search API and AI model/provider.
- Whether internal source archiving is legally and contractually permitted for each source and provider.
- What evidence is sufficient to label a person a lawful permitless carrier.
- The removal and appeal process for named individuals.
- Whether exact locations should ever be stored internally.
- Whether the public CSV should require agreement to research-use terms.

## Notes and decisions

- The project is currently in idea and planning stage with no launch deadline.
- It will be built and maintained by one person using coding and AI assistance.
- Initial hosting will be the existing Linux server with Docker and local storage.
- Keep initial spending low; use free feeds and self-hosted components before paid services.
- The administrator is the only reviewer at launch, but the data model should support more roles later.
- Dashboard alerts are sufficient; email alerts are deferred.
- Public names are optional per record and controlled during review.
- Minor names are never public. Victim names are hidden unless explicitly overridden.
- The site is neutral and evidence-focused.
- Sources may support credible but unconfirmed reports, provided uncertainty is visible.
- Public records include individual incidents only; aggregate dashboards come later.

## Related

- [[02 Projects/Projects Dashboard|Projects Dashboard]]
- [[10 Templates/Project|Project template]]

## Completion checklist

- [ ] Outcome achieved
- [ ] Reusable knowledge moved to reference notes
- [ ] Related task notes completed, cancelled, or reassigned
- [ ] Project moved to `02 Projects/Completed`
