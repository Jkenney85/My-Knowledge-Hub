---
type: reference
status: draft
area: business
created: 2026-09-27
tags: [business, waterfield-detailing, website, lovable]
---

# Website Build Prompts

Back to [[Website Plan]] · Prices from [[Services & Pricing]]

Paste one phase at a time into Lovable. Get each phase working and live before starting the next.
Before pasting, check prices against [[Services & Pricing]] and fill in the `[BRACKETED]` placeholders.

---

## Phase 1: Launch site, booking requests, admin

```text
Build a website and private admin app for "Waterfield Detailing," a small neighborhood car detailing business in Blue Springs, Missouri. The owner details cars in his own driveway and offers free pickup and drop-off within the neighborhood. He works weeknight evenings and weekends and plans to grow into full-time mobile detailing.

This is Phase 1 of 3. Design the database so Phases 2 (real-time slot booking, automated texts) and 3 (online payments, automation) can be added later without rebuilding.

Use Lovable Cloud for the database, authentication and file storage.

BRAND
- Brand only: no owner name or personal photo anywhere on the site.
- Voice: friendly, trustworthy, local ("your neighborhood detailer"), plain language.
- No logo yet. Use a simple text wordmark "Waterfield Detailing".
- Placeholder palette: deep navy, water blue or teal accent, clean white and light gray. Define all colors and fonts as design tokens in one place so the brand can be swapped out easily later.
- Mobile-first. Most customers will visit from a phone via a text or neighborhood Facebook post.

PUBLIC PAGES
1. Home
   - Hero with a clear "Book a Detail" button.
   - "How it works": Book → I pick up your car → Detail → Car returned clean. Free neighborhood pickup and drop-off.
   - Services preview with starting prices.
   - Referral program callout.
   - Short FAQ preview, and a final booking call to action.
2. Services & Pricing: full menu (data below), what's included, add-ons, large-vehicle surcharge, Maintenance Detail, deposit and cancellation policy.
3. Book: booking request form (details below).
4. FAQ.
5. Contact: a simple message form and a text/call number [PHONE NUMBER]. Do NOT show a street address anywhere on the site.
6. Terms and Privacy Policy. Use the Terms text I'll paste separately (from my Terms & Policies note) exactly as written. For the Privacy Policy, create a simple placeholder page covering what customer data is collected, how texts and photos are used, and that data is never sold. Link both in the footer and next to the SMS consent checkbox.
7. Gallery and Testimonials: build the components but keep them HIDDEN until the admin publishes real content. Never show placeholder or made-up reviews to visitors.

SERVICES (store in the database so the admin can edit prices; show on the site)
- Exterior Detail: $69 car / $89 SUV-truck, ~1.5–2 hrs. Foam pre-wash and two-bucket hand wash, wheels/tires/wells, door jambs, bug and tar removal, spray sealant, exterior glass, tire dressing.
- Interior Detail: $139 car / $169 SUV-truck, ~2.5–3 hrs. Full vacuum including trunk and under seats, steam clean of vents/cupholders/console/high-touch surfaces, plastics and vinyl cleaned and dressed, leather cleaned and conditioned, stain spot-treatment, floor mats, interior glass.
- Full Detail (interior + exterior): $209 car / $249 SUV-truck, ~4–5 hrs. Everything in both.
- Maintenance Detail: $119 car / $139 SUV-truck. Touchless exterior wash, sealant top-up and light interior. Only for vehicles that had a Full Detail in the last 30 days.
- Large 3-row SUVs, minivans and full-size trucks: +$25.
- Add-ons: Pet hair removal (from $30), Seat and carpet shampoo/extraction ($40), Odor treatment ($30). Heavily soiled vehicles are quoted after the customer texts a photo.
- Launch offer (toggle on/off in admin): first 10 Full Details $169 car / $199 SUV-truck in exchange for before/after photo permission and an honest review.

POLICIES (show on the site)
- Deposit: 30% of the service price, rounded to the nearest dollar, applied to the final bill. Strongly encouraged at booking. The site should clearly show the deposit amount for the selected service.
- Payment: online card payments (coming in a later phase) or Venmo [VENMO HANDLE]. For now, show Venmo instructions after a booking request is submitted.
- Cancellation: full deposit refund for cancellations 48+ hours before the appointment. Cancellations within 48 hours or no-shows forfeit the deposit.
- Referral program: when an existing customer refers a new customer, both get $10 off their next 3 services (one $10 credit per service; each extra referral adds 3 more credits; credits don't expire; referral credits don't combine with the launch offer).
- Hours: Mon–Fri evenings starting 4:30 PM (1 car per evening); Sat–Sun starting 9:00 AM (up to 3 cars per day, max 2 Full Details).

BOOKING REQUEST FORM (Phase 1 = request, confirmed manually by the owner)
- Customer: name, mobile phone, email (optional), street address (used for pickup; never shown publicly).
- Vehicle: year, make, model, color, size (Car / SUV-truck / Large 3-row SUV-minivan-full-size truck). Allow adding more than one vehicle.
- Service and add-ons, with a live price estimate and 30% deposit amount.
- Preferred date and time window, plus a backup choice. Validate: weeknights same-day OK (1 car per evening); weekends need 24 hours notice (max 3 cars and 2 Full Details per day).
- Pickup and drop-off, or "I'll bring it over" (both options).
- Condition notes (pet hair, stains, smoke, sand) and optional photo upload.
- "Referred by" (optional name or phone).
- SMS consent checkbox, unchecked by default: "I agree to receive appointment texts from Waterfield Detailing. Msg frequency varies. Msg & data rates may apply. Reply STOP to opt out." Required to submit.
- Spam protection (honeypot field + basic rate limiting).
- After submitting: a confirmation screen with a summary, the deposit amount, Venmo instructions, and "I'll text you shortly to confirm your time."
- If the phone number matches an existing customer, attach the request to that customer instead of creating a duplicate.

REBOOK LINK
- Each customer gets a unique, unguessable rebook link (no login). Opening it pre-fills the booking form with their contact info and saved vehicles.
- In admin, a "Copy rebook link" button on each customer profile.

ADMIN (owner only, email login; no customer logins)
- Dashboard: new requests, today's and this week's jobs, balances due.
- Calendar view (day and week) of confirmed jobs.
- Booking requests: review, then confirm (set the final date/time), decline, or convert to a job. Flag "inside / outside neighborhood". Add an optional travel fee line to any booking.
- Customers: profile with contact info, address, inside/outside neighborhood, SMS consent status and timestamp, notes, all vehicles, full job history, referral info, credits remaining, rebook link. Search by name, phone or vehicle.
- Vehicles: year, make, model, color, size class, notes. Multiple per customer.
- Jobs: service, add-ons, travel fee, discounts (launch offer, referral credit), total, deposit (30%), balance due. Status: requested, confirmed, in progress, completed, cancelled, no-show.
- Job photos: upload before and after photos (multiple, from a phone camera) to each job. Private by default. A per-photo "OK to publish" toggle feeds the public Gallery.
- Payment tracking (manual for now): record deposit and payments with amount, method (Venmo, card, cash), date and note. Record refunds. Show balance due.
- Referral tracking (manual for now): link a new customer to their referrer, then grant, use and view credits.
- Testimonials: add real testimonials (name shown as first name + last initial) with a publish toggle.
- Settings: edit services and prices, add-ons, the launch offer toggle, business hours, blocked dates.

SECURITY
- Row-level security on every table. The public can only create booking requests and contact messages, and read published services, gallery photos and testimonials.
- All customer data, addresses, notes and unpublished photos are admin-only.

Build it clean, fast and accessible (good contrast, large tap targets, labeled form fields).
```

---

## Phase 2: Real online booking + text messages

```text
Phase 2 for Waterfield Detailing: turn booking requests into real-time slot booking, and add automated text messages with Twilio (use the Lovable Twilio connector).

AVAILABILITY
- Hours: Mon–Fri 4:30–8:00 PM; Sat–Sun 9:00 AM–3:00 PM (America/Chicago time).
- Each service has a duration (Exterior 2h, Interior 3h, Full 5h, Maintenance 2h; editable in admin; add-ons can add time).
- Capacity rules (editable in admin): weeknights 1 job per evening, starting 4:30 PM. Weekends up to 3 jobs per day with a max of 2 Full Details; schedule start times back-to-back from 9:00 AM using service durations plus a 30-minute buffer. Jobs may run past closing, but the last weekend job must start by 3:00 PM.
- Minimum notice: weeknights same-day with at least 2 hours' notice; weekends 24 hours.
- Book up to 4 weeks ahead.
- Admin can block dates or times and override hours for a specific day.
- Prevent double-booking at the database level, not just in the UI.

BOOKING FLOW
- Customer picks service, add-ons and vehicle, then sees only open time slots and books.
- Bookings are auto-confirmed. Admin can still reschedule or cancel.
- Keep the Phase 1 request form as a fallback ("Don't see a time that works? Send a request").
- Customers can cancel or reschedule via a unique link in their confirmation text. The 48-hour deposit refund rule is shown at that moment.

TEXT MESSAGES (only to customers with SMS consent; honor STOP/HELP)
1. Booking confirmation: date, time, service, total, deposit amount and payment options, cancel/reschedule link.
2. Reminder the day before (weekend jobs) or the morning of (weeknight jobs).
3. "Your car is ready": sent when the admin marks a job completed.
4. Thank-you 3 days after completion, with a review link [GOOGLE REVIEW LINK] and their rebook link.
- Log every sent text on the customer profile.
- Admin can also send a one-off text from a customer profile.

ADMIN ADDITIONS
- Revenue summary: by week and month, by service, average per car, deposits collected, refunds, referral discounts given.
- Expense tracking: date, vendor, category (supplies, equipment, fuel, insurance, fees, other), amount, receipt photo, note. Monthly and yearly totals, plus CSV export for taxes.
```

---

## Phase 3: Online payments + automation

```text
Phase 3 for Waterfield Detailing: online payments and automation.

PAYMENTS (Stripe)
- At booking, offer "Pay 30% deposit now (recommended)", "Pay in full now", or "Pay later by Venmo or in person". Highlight the deposit option.
- Deposit amount = 30% of the booking total, rounded to the nearest dollar.
- Automatically record Stripe payments on the job, and update balance due and status.
- Admin can issue full refunds for cancellations 48+ hours ahead (one click) and partial refunds at their discretion.
- Payment link for the balance included in the "Your car is ready" text.
- Venmo payments are still recorded manually by the admin.

REFERRAL AUTOMATION
- When a new customer's first job is completed and paid, grant 3 × $10 credits to both the new customer and their referrer.
- Apply one available credit automatically at checkout (not combined with the launch offer). Show credits remaining in texts and on the rebook page.

AUTOMATION
- Auto-mark no-shows when the admin flags them, and apply the deposit forfeit per policy.
- Maintenance Detail nudge text about 3 weeks after a customer's Full Detail, before the 30-day window closes (only with SMS consent).
```

---

## Notes
- **Carrier registration for texting** must be approved before Phase 2 texts go live. Start it early. See [[Website Plan#Text messaging (SMS)]].
- **Terms:** paste the customer-facing section of [[Terms & Policies]] into Lovable after Phase 1 is built. Have an attorney review it before launch.
