# Product Plan: Congress Guess Who

**Author:** AI Product Manager
**Date:** December 28, 2025
**Status:** Proposal

---

## Executive Summary

A "Guess Who" style game featuring members of Congress that combines entertainment with civic education. This document evaluates platform options, proposes an MVP, and outlines the go-to-market strategy.

**Recommendation:** Build as a **web-based game** embedded in Congress.wiki, with a daily challenge format inspired by Wordle's viral success.

---

## Strategic Rationale

### Why Build This?

| Factor | Assessment |
|--------|------------|
| **Mission Alignment** | ✅ Makes civic education fun and accessible |
| **Engagement Driver** | ✅ Gamification increases retention 40%+ |
| **Viral Potential** | ✅ Daily puzzles are highly shareable (Wordle effect) |
| **Content Leverage** | ✅ Uses existing Congress member data |
| **Audience Expansion** | ✅ Reaches younger/casual users who won't read legislation |
| **Differentiation** | ✅ No competitor has this |

### Target Audience

1. **Primary:** 18-35 year olds interested in politics but not policy wonks
2. **Secondary:** Teachers/educators for classroom use
3. **Tertiary:** Political junkies who want to test their knowledge

---

## Platform Decision

### Option A: iOS Native App

| Pros | Cons |
|------|------|
| Native performance | $99/year Apple Developer fee |
| Push notifications | App Store review delays |
| App Store discovery | iOS only (excludes 50%+ users) |
| Offline play | Separate codebase to maintain |
| | 6-8 week development time |

### Option B: Web App (PWA)

| Pros | Cons |
|------|------|
| Works on all devices | Slightly less "native" feel |
| Instant updates, no app review | Push notifications more limited |
| Shareable URLs | No App Store discovery |
| Embedded in Congress.wiki | |
| 2-4 week development time | |
| Existing tech stack (Next.js) | |
| Can wrap as native app later | |

### Option C: Hybrid (Capacitor/React Native)

| Pros | Cons |
|------|------|
| Single codebase | Still requires App Store approval |
| Native + web | Added complexity |
| | Longer development time |

### **Recommendation: Option B (Web App/PWA)**

**Rationale:**
1. Congress.wiki already has PWA infrastructure
2. Viral sharing requires URLs (can't share iOS app plays easily)
3. Lower risk - validate concept before native investment
4. Faster to market
5. Can wrap with Capacitor for App Store later if successful

---

## Game Design

### Core Mechanic: "Congressle"

Inspired by Wordle, players guess which Congress member matches the clues.

#### Daily Challenge Mode

```
┌─────────────────────────────────────────┐
│           CONGRESSLE #142               │
│         Guess today's member            │
├─────────────────────────────────────────┤
│                                         │
│  🔍 Enter a Congress member's name...   │
│                                         │
├─────────────────────────────────────────┤
│  Your Guesses:                          │
│                                         │
│  Nancy Pelosi                           │
│  ✅Party  ❌State  ❌Age  ⬆️Seniority   │
│                                         │
│  Adam Schiff                            │
│  ✅Party  ✅State  ❌Age  ⬇️Seniority   │
│                                         │
│  Ted Lieu                               │
│  ✅Party  ✅State  ✅Age  ✅Seniority   │
│  🎉 CORRECT! 3/6 guesses                │
│                                         │
├─────────────────────────────────────────┤
│  [Share Results]  [View Profile]        │
└─────────────────────────────────────────┘
```

#### Clue Categories

| Category | Hint Type | Example |
|----------|-----------|---------|
| Party | Exact match | ✅ Democrat |
| State | Exact match | ❌ (shows actual state) |
| Chamber | Exact match | ✅ House |
| Age | Higher/Lower | ⬆️ Older |
| Seniority | Higher/Lower | ⬇️ Less senior |
| Gender | Exact match | ✅ Female |
| Region | Close/Far | 🟡 Same region |

#### Game Modes

1. **Daily Challenge** (MVP)
   - One puzzle per day, same for everyone
   - Shareable results grid (like Wordle)
   - Streak tracking

2. **Practice Mode** (V1.1)
   - Unlimited random puzzles
   - Choose difficulty (current Congress only vs all time)
   - Timed mode

3. **Multiplayer** (V2)
   - Head-to-head races
   - Party challenge (guess opposing party members)
   - Classroom mode with leaderboard

4. **Learning Mode** (V2)
   - Hints include educational facts
   - "Did you know?" after each guess
   - Links to member profiles

---

## MVP Scope

### In Scope (Week 1-3)

| Feature | Priority | Effort |
|---------|----------|--------|
| Daily puzzle generation | P0 | M |
| Member search/autocomplete | P0 | S |
| Guess validation & hints | P0 | M |
| Results sharing (text grid) | P0 | S |
| Streak tracking (persistent for logged-in users, localStorage for guests) | P1 | S |
| Mobile-responsive design | P0 | M |
| Basic stats (games played, win %) | P1 | S |

### Out of Scope (Post-MVP)

- Leaderboards
- Multiplayer
- Historical Congress members
- Achievements/badges

> **Note:** User authentication already exists on Congress.wiki and will be leveraged for persistent game state.

### Technical Requirements

- **Frontend:** Next.js (existing stack)
- **Data:** Existing Congress member database
- **Auth:** Existing user authentication system
- **State:** Database for logged-in users, localStorage fallback for guests
- **Sharing:** Web Share API + fallback copy
- **Analytics:** Track completions, shares, streaks

---

## User Experience Flow

### First-Time User

```
1. Land on congress.wiki/game or congressle.com
2. See brief tutorial (3 screens)
3. Play today's puzzle
4. Win/lose → See stats
5. Share results → Viral loop
6. CTA: "Want to learn more about [Member]?" → Profile
```

### Returning User

```
1. Return to game
2. See streak reminder
3. Play today's puzzle
4. Compare to yesterday's performance
5. Optional: Practice mode
```

---

## Sharing Mechanism (Viral Engine)

### Share Format

```
Congressle #142 🏛️ 3/6

🟩⬜⬜⬆️
🟩🟩⬜⬇️
🟩🟩🟩🟩

congress.wiki/game
```

### Share Channels

1. **Twitter/X** - Political audience
2. **Instagram Stories** - Screenshot-friendly
3. **iMessage/WhatsApp** - Direct sharing
4. **Reddit** - r/politics, r/wordle
5. **Discord** - Political servers

---

## Success Metrics

### Primary KPIs

| Metric | Target (Month 1) | Target (Month 6) |
|--------|------------------|------------------|
| Daily Active Players | 1,000 | 10,000 |
| Completion Rate | 70% | 75% |
| Share Rate | 15% | 20% |
| Return Rate (next day) | 40% | 50% |

### Secondary KPIs

| Metric | Target |
|--------|--------|
| Average guesses to win | 3.5-4.0 |
| Profile click-through | 10% |
| Congress.wiki signups from game | 5% |
| Social mentions | 100/week |

---

## Go-to-Market Strategy

### Launch Plan

**Week -2: Soft Launch**
- Deploy to congress.wiki/game
- Internal testing
- Fix critical bugs

**Week -1: Beta**
- Share with political Twitter
- Gather feedback
- Tune difficulty

**Week 0: Public Launch**
- Announce on Congress.wiki
- Post to Reddit (r/politics, r/wordle, r/webgames)
- Reach out to political influencers
- Press release to political media

**Week 1-4: Growth**
- Daily social posts with puzzle hints
- Partner with civics educators
- Create "Congressional Guess Who" challenge
- Influencer seeding

### Content Calendar

| Day | Content |
|-----|---------|
| Monday | "New week, new members to guess!" |
| Tuesday | Hint about today's puzzle |
| Wednesday | Mid-week stats (hardest puzzle so far) |
| Thursday | Throwback to interesting past puzzles |
| Friday | Weekend challenge preview |

---

## Competitive Analysis

| Game | Concept | Daily? | Congress Focus? |
|------|---------|--------|-----------------|
| Wordle | Word guessing | ✅ | ❌ |
| Poeltl | NBA players | ✅ | ❌ |
| Weddle | NFL players | ✅ | ❌ |
| Actorle | Actors | ✅ | ❌ |
| **Congressle** | Congress members | ✅ | ✅ |

**Gap:** No daily puzzle game exists for political/civic content.

---

## Risk Assessment

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Low engagement | Medium | High | Start with core political audience |
| Too easy/hard | Medium | Medium | Tune difficulty based on data |
| Controversial members | Low | High | Include all members equally |
| Copied by competitors | Low | Low | First mover advantage |
| Server costs | Low | Low | Static generation possible |

---

## Development Estimate

### Phase 1: MVP (3 weeks)

| Task | Effort | Owner |
|------|--------|-------|
| Game UI components | 5 days | Frontend |
| Daily puzzle logic | 3 days | Backend |
| Member search/autocomplete | 2 days | Frontend |
| Sharing functionality | 2 days | Frontend |
| Stats & streaks | 2 days | Frontend |
| Testing & polish | 3 days | All |

### Phase 2: Enhancements (2 weeks)

| Task | Effort |
|------|--------|
| Practice mode | 3 days |
| Difficulty settings | 2 days |
| Leaderboards | 3 days |
| Achievements/badges | 3 days |

### Phase 3: iOS App (Optional, 4 weeks)

| Task | Effort |
|------|--------|
| Capacitor wrapper | 3 days |
| Native adjustments | 5 days |
| App Store submission | 5 days |
| Push notifications | 5 days |

---

## Resource Requirements

### MVP

- 1 Frontend developer (3 weeks)
- 1 Designer (1 week for UI/branding)
- Existing Congress data (no new collection)
- Existing hosting infrastructure

### Total Cost Estimate

| Item | Cost |
|------|------|
| Development (3 weeks) | Internal |
| Design | Internal |
| Hosting | Negligible (static) |
| Marketing | $0 (organic) |
| **Total MVP** | **$0 additional** |

---

## Decision Points

### Go/No-Go Criteria (Week 4)

| Metric | Go | No-Go |
|--------|-----|-------|
| DAU | >500 | <100 |
| Completion rate | >50% | <30% |
| Share rate | >5% | <1% |
| Organic growth | Yes | Declining |

### Pivot Options

If game underperforms:
1. **Pivot to quiz format** - Multiple choice instead of guess
2. **Pivot to trivia** - Facts about bills/votes
3. **Kill and learn** - Apply learnings to other engagement features

---

## Appendix: Name Options

| Name | Domain Available? | Notes |
|------|-------------------|-------|
| Congressle | congressle.com - Check | Wordle-style |
| Capitol Clue | capitolclue.com - Check | Mystery vibe |
| Who's Who in Congress | Long | Descriptive |
| Chamber Guess | chamberguess.com - Check | Simple |
| The Hill Game | thehillgame.com - Check | DC insider |

**Recommendation:** "Congressle" - Clear Wordle connection, memorable

---

## Next Steps

1. ✅ Review and approve plan
2. Create GitHub issue with detailed specs
3. Design UI mockups
4. Develop MVP (3 weeks)
5. Soft launch to beta testers
6. Public launch
7. Monitor metrics and iterate

---

*Plan created by AI Product Manager - December 28, 2025*
