---
type: course-note
status: active
area: trading
created: 2026-09-23
source_type: youtube
course: Peachy Investor (YouTube)
lesson: The BEST Asian Session Trading Strategy for Gold
duration: 40:07
source: https://www.youtube.com/watch?v=di_UoCcHen8
instrument: GC / MGC
tags: [trading/education, peachy-investor, orb, gold, asian-session, ema-bands]
---

# Asian Session Gold ORB Model

A complete evening trading model for gold, pitched at people who can't trade the New York session. Combines an opening-range box, a strict time-of-day filter, and the 4/9 EMA bands. Same house as the bootcamp lessons, so the [[Top Down Analysis]] bias work is assumed as the foundation.

> [!important] The thesis in one line
> ORB is just a box around price at a specific time. The box is not the edge — **the time of day you act on it is.**

> [!note] All times converted
> The video speaks in Eastern. Everything below is **Central** (your clock), with ET in brackets.

---

## The clock

| Central | Eastern | What it is |
|---|---|---|
| **5:00 PM** | 18:00 | CME gold session open — ORB starts here |
| **5:05 PM** | 18:05 | 5-minute ORB box closes |
| **5:15 PM** | 18:15 | 15-minute ORB box closes |
| **7:00 PM** | 20:00 | Tokyo open — volume starts to creep in |
| **7:45 PM** | 20:45 | The 15-min candle here "does a lot" |
| **8:00 PM** | 21:00 | **Hong Kong pre-open — the golden window** |

> [!warning] The rule that carries the strategy
> **Do not participate before 7:00 PM Central.** Breaks above or below the ORB during the first two hours are explicitly dismissed as fake-outs. She is direct that this is where she was repeatedly chopped out before she understood the timing, and that most viewers are trading "willy-nilly right out of the 5 PM open" with no volume behind it.

The 8:00 PM slot is where the session's real trend tends to set up. She groups 8:00, 8:15 and 8:30 CT together as the zone that matters.

---

## Drawing the ORB

Two boxes, both anchored at the 5:00 PM CT open:

- **5-minute box** — the first 5-min candle
- **15-minute box** — the first three 5-min candles

Why these and not the more common variants: back-testing preference, nothing more principled. She says so plainly and invites you to test your own.

**The boxes are not used as a breakout system.** The break direction is not the signal. What's used is the *reaction* at the box edges and, on wider ranges, at the 50% midline.

---

## Building the bias

Order of operations, before any entry:

1. **Higher-timeframe bias first** — the top-down work from [[Top Down Analysis]]. KPLs, 4H candle reactions, whether a level held.
2. **Fallback if you skipped step 1: read the New York session.** What did NY do? Lower highs and a bearish NY ORB → lean bearish into the evening. This is the practical shortcut for an evening trader who wasn't at the screens during the day.
3. **Prior session range** — if the prior session was range-bound, its support and resistance make good targets. If it trended, use that for directional lean.
4. **Then the ORB reaction.** Rejection of ORB high → bearish. Break and hold above → bullish. Candles closing below ORB low with only wicks poking above = sellers are present in the box.

> [!important] Stated bluntly in the video
> The box is not magic. Traders who back-test the box alone and find it fails are leaving out the bias work that makes it function. That's an unusually honest admission for this genre and it's the single most important caveat on the whole model.

---

## Entry

**Never the initial break.** The Asian session almost always gives a second chance — often a third. Waiting costs little and buys a defined risk point.

The sequence:

1. Price breaks out of / rejects the ORB
2. Wait for the **retest** — back to the box edge, or to the 50% midline on a wider range
3. Rule of thumb on a larger candle: want roughly **50% of it to hold**
4. Look for the **reaction candle** at the level — the same concept as [[Intro to Charting]]
5. Micro trend break for confirmation: lower highs stalling out, then the candle flips direction
6. Enter as close to the ORB level as possible

She executes on the **1-minute**, occasionally checking the 15-second for early entries.

### The bands entry

The 4 and 9 EMA, **derived from the 5-minute** and displayed on the 1-minute. Green = uptrend, red = downtrend, **yellow = compression**.

Her favourite continuation entry is the **deep retrace**: price pulls back into the bands, the bands compress and turn yellow, and she watches for absorption — a buyer or seller stepping in — then enters as the trend resumes.

**Critically: bands are only used after 8:00 PM CT**, when volume can sustain a trend. Same time gate as everything else.

---

## Risk and management

- **Stop:** just outside the ORB — above (or below) the reaction candles that pushed into the box and got rejected. A wider alternative is the last candle before the move started; she considers that too much.
- **Break-even:** move quickly once price works, then trail.
- **But:** she has recently been *slower* to go break-even on gold, because moves get stopped out just before running. She attributes this to market makers or algos hunting stops.
- **Targets:** base hits. Measure the prior leg — expect the next leg to be similar. Then the next KPL or prior-session level.
- **ORB as magnet:** if price runs far from the ORB it often retraces back to it later in the session.

> [!warning] Unresolved contradiction
> "Go break-even quickly" and "be patient about going break-even because you'll get stopped before the real move" are both stated, minutes apart, with no rule distinguishing them. This is a genuine gap you'd have to resolve yourself with your own data.

---

## Key takeaways

1. Time of day is the strategy. Before 7 PM Central, don't.
2. 8 PM Central is the window that matters.
3. The ORB box is a reaction zone, not a breakout trigger.
4. Never take the initial break — the retest is the trade, and it almost always comes.
5. Bias comes from higher timeframe or, failing that, from what New York did.
6. Base hits. Size the target off the prior leg.

---

## Credibility notes

*Worth holding in mind — my assessment, not the video's content.*

- **Sponsored.** NinjaTrader sponsors the video; there's an affiliate link and a prop-firm discount code. The strategy content seems independent of this, but it's a funnel to a paid academy throughout.
- **Regime-dependent sample.** Every example is from late August / early September, a period she repeatedly describes as unusually volatile — war headlines, gold at all-time highs. A model that works in a high-volatility trending regime may not survive a quiet one. The examples are not cherry-picked within that window, which she's careful to say, but the window itself is narrow.
- **"Extensive back-testing" is claimed, never shown.** No data, no sample size, no win rate for the 6:05/6:15 ORB choice over alternatives.
- **No position sizing.** Dollar figures ($800, $1,500) are quoted with no account size or risk percentage, which makes them impossible to evaluate.
- **Platform lag flagged by her own footage** — TradingView execution delay on gold during the Asian session cost her a chunk of one exit. Relevant if you plan to execute from TradingView rather than NinjaTrader.

---

## Open questions to test

- Does the 7 PM / 8 PM CT gate hold up as a filter on MGC, measurably? This is the claim most worth verifying because the whole model rests on it.
- 5-min vs 15-min ORB — which produces better reactions on MGC specifically?
- Does the "prior leg size" target heuristic beat a fixed R multiple?
- Resolve the break-even contradiction with your own journal data: does moving to BE early cost more than it saves on MGC?
- How does this interact with the [[Peachy KPLs]] levels — does an ORB edge that coincides with a prior-day or overnight level produce a better reaction than one that doesn't?

---

## Tooling

[Asian Gold ORB + Bands — TradingView indicator](../Claude/2026-09-23-asian-orb-bands.pine) — Pine v6. Plots both ORB boxes with 50% midlines, shades the three time windows, and draws the 4/9 EMA bands anchored to the 5-minute with compression detection. Alerts on prime-window open, ORB retest, and deep retrace.

Evening routine: [[Asian Session Evening Checklist]]

---

Related: [[Intro to Charting]] · [[Top Down Analysis]] · Return to [[Trading Dashboard]].
