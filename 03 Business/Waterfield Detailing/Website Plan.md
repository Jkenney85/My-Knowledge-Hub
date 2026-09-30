---
type: project
status: planning
area: business
created: 2026-09-27
tags: [business, waterfield-detailing, website]
---

# Website Plan

Back to [[Waterfield Detailing - Overview|Waterfield Detailing]] · Related: [[Services & Pricing]], [[Operations]]

Planning only for now. The build prompt will be added here once scoping is done.

## Goals
- Show services, pricing and photos, and make it easy to get in touch.
- Full online booking.
- Private admin side to track customers: customer profiles with vehicles, service history and notes.

## Platform
- **Lovable** (decided). Same platform used for JKWebCo client sites. Lovable's built-in backend handles the database, login and admin pages.
- Bonus: doubles as a JKWebCo portfolio piece and a possible template for other local service businesses.

## Branding
Starting from scratch; nothing exists yet.
- [ ] Domain name (check availability, e.g. waterfielddetailing.com)
- [ ] Logo
- [ ] Color palette and fonts
- [ ] Tagline and brand voice
- The build prompt should use placeholder branding that's easy to swap out later.

## Site content
- **Brand only.** No personal name or photo for now. Write in a friendly, local "your neighborhood detailer" voice.
- No photos or testimonials yet. The build uses clearly marked placeholders.
- **Never publish placeholder or made-up reviews.** The testimonials section stays hidden until real ones exist.

### Content to gather
- [ ] Before and after photos of my cars and friends' cars. Same angles each time: front 3/4, rear 3/4, wheel close-up, driver seat, carpet/floor, dash, cargo area.
- [ ] Short testimonials from friends I've detailed for, with permission to use their first name and last initial.
- [ ] A few photos of the setup (foam cannon in action, steam cleaner) with no house or street numbers visible.
- [ ] Google Business Profile, to collect reviews that can be shown on the site later.

## Build phases
Each phase builds on the same database, so nothing gets rebuilt.

### Phase 1: Launch
- Marketing site: services, pricing, photos, about, service area, FAQ, contact.
- Booking **request** form: service, vehicle, preferred date/time, pickup or drop-off. Saved to the database.
- Confirm bookings manually by text.
- Admin (login required): customers, vehicles, notes, booking requests.

### Phase 2: Real online booking
- Customers pick an actual open time slot.
- Availability comes from the hours I set (weeknights and weekends) and each service's length.
- Blocks double-bookings.
- Email or text confirmation.

### Phase 3: Payments and automation
- Online deposits and payments.
- Automatic reminders.
- Referral credits tracked automatically (see [[Services & Pricing#Referral program]]).

## Payments (decided so far)
- Customers can pay **online** (card) or with **Venmo**.
- **Strongly encourage a deposit** at booking to cut down on no-shows.
- Venmo payments can't be verified automatically. Mark them paid by hand in the admin.
- **Deposit: 30% of the service price**, rounded to the nearest dollar and applied to the final bill.
- **Cancellation:** full deposit refund if cancelled **48+ hours** before the appointment.
- Assumed (confirm): cancelling within 48 hours or a no-show means the deposit is kept.

| Service | Price | 30% deposit |
|---|---|---|
| Exterior Detail (car / SUV-truck) | $69 / $89 | $21 / $27 |
| Interior Detail | $139 / $169 | $42 / $51 |
| Full Detail | $209 / $249 | $63 / $75 |
| Maintenance Detail | $119 / $139 | $36 / $42 |

## Service area
- **No hard limit on the site for now.** I screen every request myself.
- The booking form collects the address. The admin shows a simple "inside / outside neighborhood" flag I set when reviewing.
- The admin can add a **travel fee** line to a booking when I accept one from outside the neighborhood. See draft tiers in [[Services & Pricing#Travel fees (draft, not active)]].

## Admin side (only I log in)
| Feature | Details | Phase |
|---|---|---|
| Customer profiles | Name, phone, email, address, inside/outside neighborhood, text consent, notes | 1 |
| Vehicles | Multiple per customer: year, make, model, color, size class (car / SUV-truck / large), notes (pet hair, stains, etc.) | 1 |
| Bookings and jobs | Service, add-ons, travel fee, status (requested, confirmed, in progress, done, cancelled, no-show) | 1 |
| Calendar view | Upcoming jobs by day and week | 1 |
| Before and after photos | Uploaded per job. Walkaround damage record + marketing (mark photos "OK to publish") | 1 |
| Payment tracking | Deposit (30%) paid?, balance due, method (card / Venmo / cash), refunds | 1 (manual), 3 (automatic) |
| Referral tracking | Who referred whom, credits earned, used and remaining | 1 (manual), 3 (automatic) |
| Revenue summary | By week or month, by service, average per car | 2 |
| Expense tracking | Supplies and equipment, category, receipt photo, for taxes | 2 |

## Availability (for Phase 2 booking)
| Day | Hours | Notice |
|---|---|---|
| Mon–Fri | 4:30–8:00 PM | Same-day OK (assumed: at least 2 hours before start) |
| Sat–Sun | 9:00 AM–3:00 PM | 24 hours minimum |

- Assumed (confirm): bookings open up to **4 weeks** ahead, with a **30-minute buffer** between jobs for pickup and drop-off.
- **Daily limits (decided):** weeknights **1 car per evening**, and a Full Detail is allowed. Weekends up to **3 cars per day, max 2 Full Details**.
- Hours are **start windows**, not hard end times. Jobs can run past closing; I'll make the time. The last weekend job starts by 3:00 PM.
- Admin can block off dates (vacation, weather) and override hours.
- Winter: it's dark by ~5:15 PM after Nov 1, so weeknight jobs need work lights.

## Customer accounts
- **No customer logins for now.** Only I log in, to the admin side.
- Returning customers get a **rebook link by text** instead, with their info and vehicle already filled in.

## Text messaging (SMS)
- **Provider: Twilio**, using Lovable's built-in Twilio connector.
- **Texts sent (default, adjust as needed):**
  1. Booking confirmation, with deposit or payment info
  2. Reminder the day before
  3. "Your car is ready" / drop-off notice
  4. Thank-you a few days later, with a review request and rebook link
- **Cost (approx.):** about $0.0083 per text plus carrier fees of ~$0.0025–0.0062, $1.15/month for a local number, and ~$19.50 upfront + ~$1.50/month for carrier registration. Roughly **$5/month** at ~40 cars.
- **Carrier registration is required** for texting from a regular 10-digit number. The sole proprietor option needs no tax ID. Approval can take days to weeks, so **start before launch**.
- **Consent:** the booking form needs an unchecked "I agree to receive texts" checkbox. Every text honors STOP to opt out.
- Use a local 816 number for a neighborly feel. (A toll-free number avoids carrier registration but needs its own verification.)
- Before going live: turn on SMS Pumping Protection and review geo permissions in Twilio.

## Open questions
- [x] **What to do when customers don't pay or refuse to pay.** Answered in [[Terms & Policies]].
- [ ] Is the deposit optional-but-encouraged for everyone, or required for some bookings (e.g. new customers)?

## Build prompts
Ready to paste into Lovable, one per phase: [[Website Build Prompts]]
