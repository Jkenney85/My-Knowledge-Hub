---
type: idea
status: someday
area: business
created: "2026-07-08"
offer_type: custom website add-on
pricing_model: hybrid
---

# Tattoo Studio Booking

## The idea

Build a tattoo studio booking app as a premium add-on to a custom tattoo studio website package.

The app would let tattoo studios accept online appointment bookings through their website, route bookings to specific artists, collect optional tattoo intake details, and take Stripe payments for deposits or full appointment prices.

## Customer and problem

- **Customer:** Tattoo studios that already need a custom website and want a more polished booking process.
- **Problem:** Many studios rely on DMs, phone calls, generic forms, or disconnected payment links to manage bookings. This creates back-and-forth, missed details, unclear artist availability, and friction around deposits.
- **Current alternative:** Instagram DMs, email forms, Calendly-style tools, manual Google Calendar management, or generic booking platforms that do not feel tailored to tattoo studios.

## Proposed value

- Add a professional booking flow directly inside the studio website.
- Let customers choose an artist as part of the booking process.
- Give each artist their own availability and calendar.
- Let studios define their own appointment types instead of forcing fixed categories.
- Collect optional tattoo-specific intake details without making the booking process feel too heavy.
- Support Stripe payments for deposits or full appointment payment up front.
- Give the studio/admin team one place to manage artists, appointment types, bookings, payments, and customer details.
- Position the feature as a premium add-on that increases the value of a custom website project.

## Client-facing booking flow

1. Customer selects a studio-defined appointment type.
2. Customer selects the artist they want to book with.
3. Customer chooses from that artist's available dates and times.
4. Customer enters contact information.
5. Customer can optionally add tattoo intake details:
   - Placement
   - Approximate size
   - Style
   - Reference images
   - Budget
   - Notes
6. Customer pays either a deposit or the full appointment price through Stripe.
7. Customer receives confirmation, payment receipt, and appointment reminders.

## Studio/admin features

- Manage artists.
- Manage artist availability and calendars.
- Manage studio-defined appointment types.
- View and manage bookings.
- Review customer intake details and uploaded references.
- Track Stripe payment status.
- Configure whether appointment types require a deposit, full payment, or either option.
- Send or trigger customer notifications for confirmations, reminders, and receipts.

## Calendar approach

Start with an internal calendar managed inside the studio website/admin.

Design the system so Google Calendar sync can be added later as an optional feature. The initial product should not depend on Google Calendar, but the data model should leave room for external calendar IDs, sync status, and artist-level calendar connections.

## Payments

- Use Stripe for payment processing.
- Support deposit-only booking.
- Support full appointment payment up front.
- Leave room for appointment-type-level payment rules.
- Track payment status in the admin dashboard.
- Use Stripe receipts where possible, with website-level confirmation notifications layered on top.

## Offer positioning

This should be sold as a premium add-on to a full custom tattoo studio website, not as the base package.

The pricing model should be hybrid:

- One-time setup/build fee.
- Ongoing monthly maintenance or managed feature fee.

Exact pricing is to define later.

## Assumptions

- Tattoo studios will value booking tools more if they are integrated directly into a polished custom website.
- Artist-specific availability is important enough to be part of the first version.
- Studios need flexibility around appointment types because each studio packages services differently.
- Optional intake fields are better than required fields for keeping the booking flow lightweight.
- Stripe support for deposits and full payments will be a strong selling point.

## Build prompt

Use this prompt to generate the first working version of the app:

```text
Build a complete tattoo studio website with a seamless booking app built directly into the site.

This should feel like a real custom website for a modern tattoo studio, not a generic booking tool with a few tattoo labels added. The booking experience should be part of the studio's brand, flow naturally from the public website, and include Stripe payments for appointment deposits or full appointment payments.

Primary goal:

Create a production-minded MVP that can be deployed either through Lovable or run locally in Docker. The app should include a polished public tattoo studio website, a customer booking flow, Stripe payment integration, and a practical admin dashboard for the studio.

Deployment requirements:

- The project must be easy to deploy to Lovable or a similar managed app builder environment.
- The project must also be runnable as a local Docker instance.
- Include a `Dockerfile` and `docker-compose.yml` for local development.
- Include clear setup instructions for both deployment paths.
- Use environment variables for secrets and deployment-specific settings.
- Document required environment variables, including database connection details, Stripe keys, webhook secrets, app URL, and email settings.
- Do not hard-code secrets.

Core website requirements:

- Build a complete tattoo studio website, not just the booking module.
- Include public pages for:
  - Home
  - Artists
  - Artist profile/detail pages
  - Gallery or portfolio
  - Booking
  - Contact
- The visual design should feel premium, modern, editorial, and appropriate for a tattoo studio.
- The website should be responsive and polished on mobile and desktop.
- The booking call-to-action should be visible from the public site without feeling bolted on.

Booking flow requirements:

- Customers must be able to book appointments from the website.
- The booking flow must support studio-defined appointment types.
- Customers must choose an artist during booking.
- Each artist must have their own availability/calendar.
- Start with an internal calendar managed inside the app/admin.
- Design the data model so Google Calendar sync can be added later per artist, but do not require Google Calendar for the MVP.
- Prevent double-booking for the same artist and time slot.
- Show clear available and unavailable time slots.
- Show clear booking status states.
- The flow should be simple enough for mobile users.

Customer booking steps:

1. Choose an appointment type.
2. Choose an artist.
3. Choose an available date and time from that artist's calendar.
4. Enter customer contact details.
5. Optionally enter tattoo intake details.
6. Choose deposit or full payment when the appointment type allows both.
7. Pay with Stripe.
8. See a booking confirmation page.
9. Receive confirmation and receipt notifications.

Optional tattoo intake fields:

- Placement
- Approximate size
- Style
- Reference images
- Budget
- Notes

Stripe payment requirements:

- Integrate Stripe for real payment flow scaffolding.
- Support deposit-only booking.
- Support full appointment payment up front.
- Allow each appointment type to define payment behavior:
  - deposit required
  - full payment required
  - customer can choose deposit or full payment
- Use Stripe Checkout or Payment Intents, whichever is most reliable for the selected stack.
- Implement Stripe webhook handling to update booking/payment status.
- Store Stripe payment IDs and payment status.
- Do not store raw card details.
- Include success and cancel flows.
- Make it clear where live Stripe keys, test Stripe keys, and webhook secrets go.

Admin dashboard requirements:

- Include protected admin authentication.
- Include a quiet, practical dashboard for studio staff.
- Admin should be able to manage:
  - Artists
  - Artist profiles
  - Artist availability/calendars
  - Appointment types
  - Deposit/full-payment rules
  - Bookings
  - Customer intake details
  - Reference image uploads
  - Payment status
- Include booking list and booking detail views.
- Include a calendar-style view or schedule view for upcoming appointments.
- Include useful empty states and validation messages.

Data model requirements:

Create a relational data model that supports:

- Studio settings
- Artists
- Artist availability windows
- Appointment types
- Customers
- Bookings
- Tattoo intake details
- Reference image uploads
- Payments
- Notification events
- Future Google Calendar sync fields, such as external calendar ID, external event ID, sync status, and last synced time

Notifications:

- Include email notification scaffolding for:
  - Booking confirmation
  - Payment receipt or payment confirmation
  - Appointment reminders
- Email is enough for the MVP.
- Leave room for SMS notifications later.

Seed/demo data:

- Include realistic demo data for a sample tattoo studio.
- Include multiple artists with different styles.
- Include portfolio/gallery examples.
- Include studio-defined appointment types.
- Include artist availability.
- Include sample bookings with different payment statuses.

Technical expectations:

- Use a modern full-stack web framework suitable for a custom client website.
- Use a relational database.
- Use a clean component structure.
- Keep the MVP lean, but avoid throwaway code.
- Include form validation.
- Include loading, empty, success, cancel, and error states.
- Include basic security practices for admin routes, uploads, payments, and environment variables.
- Store uploaded reference images safely and associate them with booking intake records.
- Make the code easy to extend for Google Calendar sync, SMS reminders, and production hosting.

UX guidance:

- The booking app must feel embedded in the website, not like a third-party redirect unless Stripe requires it for payment.
- Optional intake fields should be helpful but not intimidating.
- The public site should sell trust, artist quality, and easy booking.
- The admin area should prioritize speed, clarity, and repeat use.
- Do not use a generic SaaS dashboard look for the public website.
- Do not make the homepage a vague landing page. It should clearly be a tattoo studio website.

Deliverables:

- Working public tattoo studio website.
- Working booking flow.
- Working admin dashboard.
- Database schema and seed data.
- Stripe payment integration scaffolding with webhook route.
- Local Docker setup with `Dockerfile` and `docker-compose.yml`.
- Lovable-friendly setup notes.
- README with setup steps, environment variables, local Docker instructions, Stripe testing instructions, and deployment notes.
- Notes on what is complete, what is mocked, and what should be built next.
- TODOs for Google Calendar sync, SMS reminders, production email delivery, production file storage, and final security hardening.
```

## Smallest useful test

- [ ] Create a simple mock booking flow for one sample studio.
- [ ] Define the admin dashboard screens needed for artists, appointment types, bookings, and payments.
- [ ] Talk to at least one tattoo studio or artist about whether this would reduce their booking friction.
- [ ] Validate whether studios prefer deposit-only, full payment, or flexible payment rules by appointment type.
- [ ] Sketch the add-on offer and decide what ongoing maintenance would include.

## Open decisions

- [ ] Price range for setup/build fee.
- [ ] Monthly maintenance or managed feature price.
- [ ] Whether SMS notifications are included by default or offered as an upgrade.
- [ ] Whether customer accounts are needed, or if booking should stay guest-based.
- [ ] Whether reference image uploads should be stored in the website admin or linked from external storage.
- [ ] How Google Calendar sync should be packaged when added.

## Evidence and results

-

## Decision

- [ ] Test
- [ ] Turn into a project
- [ ] Keep for later
- [ ] Archive
