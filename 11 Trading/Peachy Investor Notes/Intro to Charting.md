---
type: course-note
status: active
area: trading
created: 2026-09-15
course: 10 Day Futures Bootcamp
module: Charting Crash Course
lesson: Intro to Charting
duration: 17:43
source: https://whop.com/the-peachy-investor/exp_SXclVo5OHByVJv/app/courses/cors_EWyHr56dwJ7V1/lessons/lesn_LldNtP7pEtGAp/
tags: [trading/education, peachy-investor, charting, market-structure, price-action]
---

# Intro to Charting

Three concepts for reading a chart, each building on the last: **market structure**, **key pivot levels**, and **candlestick reactions at those levels**. Examples walked through live on NQ, 4H down to intraday.

> [!note] Note provenance
> Built from the lesson's caption track, not from watching the screen. Concepts and rules are complete; the visual pattern recognition (what a good reaction wick actually looks like) is not captured here. Re-watch the timestamps flagged below.

---

## 1. Market structure and trend — `0:00–6:35`

**Definitions**

- **Uptrend** = higher lows. Each pullback bottoms above the last.
- **Downtrend** = lower highs. Each bounce tops below the last.

**Rule: establish higher-timeframe trend before dropping down.** Know the general direction on the 4H before analyzing execution timeframes.

**Key nuance — a pullback is not a reversal.** A few days of downward movement inside a bullish 4H structure is a pullback, not a break of structure. But the inverse also holds: being bullish on the 4H does *not* mean only taking longs. A trendline break on the 1H is a valid short back toward the higher-timeframe structure. Price ebbs and flows between the two.

### Trendlines are subjective — `3:12`

Demonstrated by drawing three different, all technically valid, trendlines off the same swing. As distance from the original touch points grows, the lines diverge — in the example, one projected a reversal near 27,419 and another near 27,500.

> [!warning] Do not use trendlines as KPLs
> Trendlines are a **guide to market structure**, never a level price is expected to pivot off of. Five traders will have five different lines on the same chart.

### SMAs as an objective structure read — `4:35`

Add two higher-timeframe simple moving averages:

| MA | Color | Meaning |
|---|---|---|
| 50 SMA | green | faster structure |
| 200 SMA | red | slower structure |

- 50 above 200 → **golden cross** → general uptrend
- 200 above 50 → **death cross** → general downtrend
- Price *between* the 50 and 200 → pullback
- Price above the 50 in a golden cross → strong uptrend

MAs recalculate per timeframe. A full cross to the downside on the 1H can be an early warning of a coming break of structure on the 4H.

---

## 2. Key pivot levels (KPLs) — `6:35–8:57`

A **KPL** is a level where price is expected to pivot, pull back to, or react at.

**The levels marked:**

- Prior day high / prior day low (regular New York hours)
- Overnight high / overnight low (6:00 PM open → 9:30 AM next day)
- The 50 and 200 SMAs on the 1H, 4H and daily

**Why SMAs over hand-drawn horizontals:** horizontals are subjective. In the example, two equally defensible lines off the same cluster sat at 27,365.50 and 27,352.75. The SMA is the SMA — no two traders disagree. Extending SMA levels horizontally also tends to surface old multi-touch areas, so fewer lines need marking manually.

**Trade-off:** SMAs shift on every candle close, so manual marking means remarking each hourly/4H/daily close. (The course's own indicator automates this — the concept works with plain SMAs regardless.)

---

## 3. Candlestick reactions at key levels — `8:57–17:00`

> [!important] The core mechanic of the lesson
> Stop analyzing every candle and every pattern across the chart. Candles only matter **at** your key levels.

### Reaction candle → action candle

1. **Reaction candle** — price reaches the KPL. Its wick shows who is defending the level. A long upper wick means sellers were waiting there and pushed price down; a long lower wick means buyers stepped in.
2. **Action candle** — the candle that follows. It confirms which side won and where the trend is going.

Colour can mislead. A green candle with a large upper wick that got rejected at a level is a **bearish** reaction candle — what matters is the rejection, not the close colour.

**Only read wicks at or very near key levels.** Reading every wick mid-trend leads to burnout.

### Supporting reads

- **Subjective levels are zones, not lines.** When a KPL is hand-drawn, mark the range between the plausible draws and expect a reaction anywhere in it, not an exact touch.
- **Doji candles** signal buyers and sellers in balance — a reversal tell at a level. Two back-to-back dojis at the same level is a much stronger signal than one.
- **Rule of threes.** Roughly the third time price tests a level, it breaks. Course analogy: punch a wall once and your fist may not go through; keep punching and it eventually does.

### Entry and stop — `15:26`

- **Entry:** let the reaction candle fully play out, then enter on the **action candle**, as close to the level as possible.
- **Stop:** at the **pivot point** — the price where the trade becomes invalid. For a short off a level, that is above the reaction candle's high / above the zone.
- **Target:** let price ebb and flow to the next KPL in that direction.
- **Management:** trail the stop at successive pivot points. If price stalls against a forming level before target, close in profit and wait for the next bounce.

### Session timing filters

- **11:00 AM ET reversals** — momentum can be fast; trail stops more aggressively. *(10:00 AM Central)*
- **Lunch lull, 12:00–1:00 PM ET** — lower volume, chop. Place stops below the consolidation and accept break-even; a stop-out here often sets up a clean re-entry. *(11:00 AM–12:00 PM Central)*

---

## Timestamps worth re-watching

| Time | Why |
|---|---|
| `3:12` | Trendline subjectivity demo — the justification for the whole SMA-as-KPL approach |
| `11:00` | First full reaction → action sequence on a rejection |
| `12:30` | Reaction/action sequence at the overnight low, multiple bounces |
| `15:26` | Entry and stop placement rules — short segment, easy to miss |

---

## Key takeaways

1. Higher-timeframe structure first, always. Pullback ≠ reversal.
2. Trendlines describe structure; they do not locate entries.
3. Objective levels (SMAs, prior day / overnight high-low) beat hand-drawn lines because everyone sees the same thing.
4. Candle analysis is only valid **at** a key level.
5. Reaction candle shows who is defending; action candle confirms. Enter on the action candle.
6. Stop goes where the trade is invalid, not at a fixed distance.

---

## Open questions to test

*My prompts, not lesson content — for testing against evidence before adopting.*

- Does the reaction/action sequence hold on MES/MCL/MGC, or is it tuned to NQ's range and volatility?
- How does "enter on the action candle" interact with the existing VWAP pullback rules — is it the same rejection concept under a different name? See [[2026-06-17-vwap-pullback-guide|VWAP pullback guide]].
- What sample size does the rule of threes need before it is trusted over just reading the reaction?
- Do the 50/200 SMA levels add anything over VWAP and the 9 EMA on a 1–5 min chart, or are they redundant?

---

## Tooling

[Peachy KPLs — TradingView indicator](../Claude/2026-09-15-peachy-kpls.pine) — Pine v6. Plots the levels from section 2 of this note: prior day high/low, overnight high/low, and the 50/200 SMAs from 1H, 4H and daily. Includes a touch counter on the session levels for the rule of threes, and alerts on a KPL test and on a third touch.

---

Next: [[Top Down Analysis]] · Return to [[Trading Dashboard]].
