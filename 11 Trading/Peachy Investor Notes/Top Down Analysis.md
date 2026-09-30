---
type: course-note
status: active
area: trading
created: 2026-09-15
course: 10 Day Futures Bootcamp
module: Charting Crash Course
lesson: Top Down Analysis
duration: 21:37
source: https://whop.com/the-peachy-investor/exp_SXclVo5OHByVJv/app/courses/cors_EWyHr56dwJ7V1/lessons/lesn_bWn2WBEWDbNZT/
tags: [trading/education, peachy-investor, top-down-analysis, bias, kpl, orb]
---

# Top Down Analysis

Taught by a second coach, building directly on [[Intro to Charting]]. Where lesson 1 taught reading a level, this one is the **process** wrapped around it: build a higher-timeframe bias first, then drop down to execute. Worked examples on MES and gold.

> [!important] Why this is the prerequisite lesson
> Every strategy the course teaches assumes you have already done this. Also called daily bias, zoom out, look left, larger point of view.

> [!note] Note provenance
> Built from the lesson's caption track, not from watching the screen. The process and rules are complete; the chart reads are not.

---

## The timeframe ladder — `0:57`

**Daily → 4H → 1H → 5m.** Analysis on the top three, execution on the 5m.

Each timeframe's SMAs measure the trend *of that timeframe* — the daily 50 is a 50-daily-candle trend, the 4H 50 is a 50-four-hour-candle trend. That is why they count as exact KPLs rather than indicators: they are a measurement, not an opinion.

**Cadence:** at minimum once a week, Sunday evening before futures open. The coach does it daily, after nine years.

> [!tip] Chart the contract you actually trade — `2:12`
> Charts don't carry across contracts. If you trade MES, do the analysis on MES, not ES. *(Directly relevant to MES/MCL/MGC.)*

---

## Step 1 — Trend and structure

- 50 over 200 = uptrend; holding above the 50 = strong uptrend. 50 under 200 = bearish.
- Market structure independently: lower highs = downtrend, higher lows = uptrend.
- Trendlines get drawn to encompass as many touch points as possible — but they stay a *guide*, same warning as lesson 1.

**1H SMAs cross far more often than 4H and are correspondingly less reliable** — still worth marking, because they act as support and resistance regardless.

---

## Step 2 — Multi-touch point levels — `7:14`

Zoom out and mark levels where price reacted strongly. **Minimum two solid reactions, ideally three.** Also known as supply and demand zones.

These are subjective — your line might sit at 75.95 where someone else's sits at 75.92 — so **draw them as zones**, not exact prices. Recent reactions count for more than old ones.

The purpose is filling the gaps: when the 50 and 200 are far apart, multi-touch levels give you something to trade toward in between.

---

## Step 3 — Two scenarios, always — `6:04`

> [!important] The core discipline of the lesson
> The output of top-down analysis is **not** a directional call. It is an if/then pair.

The wrong output: *"we're in an uptrend, so I'm long."*
The right output: *"if the 4H candle body closes back above the 50, I'm looking for bullish continuation to [level]. If it closes below trend and the 50, I'm looking for a move down to the 200 and the old support shelf at [level]."*

This is what keeps you flexible instead of married to a bias.

---

## Step 4 — Candle closes confirm, touches don't — `4:52`

A level is respected or rejected **only once a candle closes**. Wicks through a level mean nothing on their own — the example shows price touching the SMAs and then blasting straight through them by the 4H close.

- The **4H close** carries the most information.
- Waiting is hard: **set an alert at the level and come back on the close.**
- Candle *body* position relative to the level is what matters, not the wick.

---

## Trading level to level

Once bias is set, you trade from one KPL to the next — not to an arbitrary target. Break below the 1H 50 → next KPL down is the multi-touch level, then the 1H 200.

**Confluence is the filter.** A trendline alone is rarely a trade; a trendline *paired* with an exact KPL is. The MES example shows a **double confluence** — the 4H 50 and the 1H 200 landing in the same area — as the stronger destination.

### Overextension — `14:40`

A healthy trend returns to its SMAs periodically. When price is **far** from the 50, be careful taking continuation: the market needs to normalize an overbought or oversold condition, and the pullback to the SMA is how it does that. The A+ entry for a trend is the *rejection* off the trendline or SMA, not the chase after it has run.

### Look left — `16:18`

Count prior bounces at the level. Three is the charm; by the fourth test expect a break, and potentially a big move in either direction.

---

## Counter-trend is allowed — `16:57`

"The trend doesn't have to be bullish for you to be bullish." Trading against the higher-timeframe trend is fine **provided you know your target** — the next resistance — and you take it only to there. What is not allowed is trading counter-trend with no defined stall point.

---

## Layering the intraday tools — `19:01`

Bias from above, then execution structure on the 5m:

- **ORB** high and low are KPLs, and the **50% of ORB** is a pivot level worth watching — especially on a wide-range, high-volatility open.
- Example: bearish higher-timeframe bias → price rejects 50% of ORB → short continuation down to the multi-touch level identified in the daily analysis.
- **Prior day high / low as a bias filter — `20:29`:** trading below the prior daily low means making lower lows on the daily. Be bearish-focused that session. Inverse for a bullish day.
- **Lunch reversals around 11–12** *(ET — 10–11 Central)*.

---

## Key takeaways

1. Bias first, execution second. Never open the 5m chart cold.
2. The deliverable is a bullish scenario **and** a bearish scenario, phrased as if/then.
3. Only candle closes confirm a level. Set alerts rather than staring.
4. Trade level to level; take trades at confluence, not at single lines.
5. Don't chase continuation when price is stretched from the SMA — wait for the normalization.
6. Prior day low/high sets the session's directional lean.

---

## Open questions to test

*My prompts, not lesson content.*

- 50% of ORB as a pivot — does that hold up on MES/MCL/MGC, and does it add anything over the existing ORB rules? Worth a dedicated test.
- "Far from the SMA" is undefined here. Quantify it — ATR multiple? Percentage? Without a number this rule can't be followed consistently.
- The 4H-close confirmation rule implies waiting hours. Does that survive an intraday-only, flat-at-close approach, or does it only apply to the pre-session analysis?
- Does the prior-day-low bias filter beat just using VWAP position for session lean?

---

## Tooling

[Peachy KPLs — TradingView indicator](../Claude/2026-09-15-peachy-kpls.pine) already plots the exact KPLs this lesson relies on: prior day high/low, overnight high/low, and the 50/200 SMAs from 1H, 4H and daily, with the look-left touch counter.

**Not yet covered by it:** ORB high/low and the 50% ORB midpoint, and manual multi-touch zones.

---

Previous: [[Intro to Charting]] · Return to [[Trading Dashboard]].
