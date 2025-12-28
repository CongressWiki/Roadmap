# Congress.wiki GitHub Issues Audit

**Audit Date:** December 28, 2025
**Repository:** CongressWiki/Roadmap
**Total Issues:** 256 (252 original + 4 new epics)

---

## Executive Summary

This audit reviews all GitHub issues for the Congress.wiki roadmap repository. The issues span from foundational V1 work through the current V5 milestone. **Significant cleanup has been completed** - see Actions Completed section below.

### Actions Completed (December 28, 2025)

| Action | Result |
|--------|--------|
| Closed 14 stale SVG icon issues | #55, 56, 58, 60-67, 69, 73, 74 |
| Closed 4 experimental features | #160, 208, 209, 210 |
| Linked follow issues to Epic #249 | #77, 78, 79, 101 |
| Added priority:High to #252 | BullMQ adoption |
| Created Epic #253 | YouTube Content Pipeline |
| Created Epic #254 | Map Enhancements |
| Created Epic #255 | PTR & Financial Disclosure |
| Created Epic #256 | Collector Improvements |
| Created "Sprint: V5 Bugs" label | Applied to 11 bugs |

**Net result:** 18 issues closed, 4 epics created, 27+ issues linked to epics

---

## Issue Statistics (Post-Cleanup)

| Metric | Before | After |
|--------|--------|-------|
| **Total Issues** | 252 | 238 (net) |
| **Open Issues** | 159+ | ~145 |
| **Closed Issues** | 93 | 111 |
| **Issues with Epics** | ~25 | 52+ |

### Milestone Health

| Milestone | Open | Closed | Completion Rate | Status |
|-----------|------|--------|-----------------|--------|
| V1 | 3 | 58 | 95% | Nearly Complete |
| V2 | 1 | 20 | 95% | **Cleaned up** |
| V3 | 10 | 8 | 44% | In Progress |
| V4 | 6 | 9 | 60% | In Progress |
| V5 | 29 | 0 | 0% | Active (+4 epics) |
| No Milestone | ~96 | - | - | Needs Triage |

---

## Key Findings

### 1. Critical Issues: Stalled Milestones (V2/V3)

**Problem:** V2 and V3 have significant open issues that appear abandoned:
- V2: 15 open issues (71% incomplete) - dating back to early development
- V3: 10 open issues (56% incomplete)

**Open V2 Issues (High Priority):**
- #96: Redesign Committee Pages (Individual)
- #95: Redesign Committees Page
- #79: Ability to follow Committees
- #78: Ability to follow Bills
- #77: Ability to follow elected officials
- Multiple SVG icon requests (#55-67, 74)

**Recommendation:**
- Review V2/V3 issues for relevance
- Close or move irrelevant issues
- Promote still-relevant issues to V5

---

### 2. Duplicate/Overlapping Issues

**Visual Identity & AI Images:**
- #251: Epic: Visual identity & generative imagery
- #214: Research AI image gen models for puck images
- #161: Generate Puck like images for legislation, CDRs, and EOs
- #163: Gif of EO action shot for EO profile hero

**Recommendation:** Consolidate under Epic #251

**Following/Notifications:**
- #249: Epic: Unified entity following & notifications
- #101: Notification system
- #77-79: Individual follow features (EOs, Bills, Committees)

**Recommendation:** Convert #77-79 to sub-issues of Epic #249

**Calendar/Schedule:**
- #250: Epic: Congress calendar & schedule surfaces
- #132: Congress calendar
- #147: Schedule page
- #154: Add speeches to UI

**Recommendation:** Link these to Epic #250

---

### 3. Issues Missing Required Labels

**Only 1 open issue lacks priority labels:**
- #252: Adopt BullMQ for Collector job orchestration

**Note:** The backlog is well-labeled with priority tags. Most issues have appropriate `priority:High/Medium/Low` and `effort:XS/S/M/L/XL` labels.

**Recommendation:** Add `priority:High` to #252 (significant infrastructure improvement)

---

### 4. Mobile Issues Cluster (Well-Organized)

**Positive:** V5 has a well-tagged set of mobile bugs:
- #244: Mobile: Prevent double padding on AI summary
- #237: Mobile: Fix spacing inconsistency on legislation profile
- #236: Mobile: Progress chip hovercard not opening on iOS/touch
- #234: Mobile: Fix "show on map" button centering
- #233: Mobile: Fix 404 page overflow
- #232: Mobile: Fix map mode fill color issue on iOS
- #231: Mobile: Fix scroll restoration issue

**Recommendation:** Consider grouping into a "Mobile QA Sprint" milestone

---

### 5. Large Backlog of Low-Priority Items

**100+ issues marked `priority:Low`** or without priority, including:
- SVG icon requests (#55-74) - Many from V1/V2
- YouTube video uploads (#170, 220-224)
- Experimental features (tvOS, iOS apps, games)
- Nice-to-have enhancements

**Recommendation:**
- Archive or close issues older than 2 years without activity
- Move aspirational/experimental items to a "Future Ideas" discussion or separate board

---

### 6. V5 Milestone Analysis (Current Focus)

**25 open issues** - Well-structured with good labeling:

| Priority | Count |
|----------|-------|
| High | 15 |
| Medium | 8 |
| Low | 2 |

**High-Value V5 Items:**
1. #252: Adopt BullMQ for Collector job orchestration (Infrastructure)
2. #248: Show series for each legislation type in introduced over time chart
3. #247: Add supporters section to legislation profile
4. #243: Filter out non-law legislation types by default
5. #239: Add map summary to bottom of map
6. #238: Collector: Prevent URL IDs from having partial segments (Bug)
7. #235: Refactor universal nav for easy navigation
8. #228: Fix legislation rank inaccuracy (Bug)
9. #225: Fix legislation introduced over time chart on country page (Bug)

**V5 Bugs (Fix First):**
- #244, #237, #236, #234, #233, #232, #231, #230: Mobile issues
- #238: Collector URL bug
- #228: Legislation rank inaccuracy
- #225: Chart bug

---

### 7. Missing Epic Structure

**Problem:** Many related issues are disconnected.

**Recommended New Epics:**
1. **Epic: SVG Icon Library** - Consolidate #55-74 icons
2. **Epic: YouTube Content Pipeline** - Consolidate #170, 219-224
3. **Epic: Map Enhancements** - Consolidate #143, 155-158, 192-195, 212
4. **Epic: PTR/Financial Disclosure** - Consolidate #134, 181-184, 217
5. **Epic: Collector Improvements** - Consolidate #53, 189, 190, 197, 238

---

### 8. Aging Issues Without Activity

**Issues from V1/V2 still open (2+ years):**
- #1: Mark new bills (V1)
- #2: Data visualization bills over time (V1)
- #17: Render Roll Calls (V3)
- #53: Create bridge table for amendment relations (V2)
- #55-74: Various SVG icons

**Recommendation:** Review and close/archive stale issues

---

## Priority Recommendations

### Immediate Actions (This Week) ✅ COMPLETED

1. ~~**Close stale V1/V2 icons requests**~~ - ✅ 14 SVG icons closed
2. ~~**Link follow requests (#77-79, #101)**~~ - ✅ Linked to Epic #249
3. ~~**Add priority:High label to #252**~~ - ✅ Label added

### Short-Term Actions (This Month) ✅ COMPLETED

4. ~~**Archive "Future Ideas"**~~ - ✅ Closed #160, 208, 209, 210
5. ~~**Create missing Epics**~~ - ✅ Created #253, 254, 255, 256
6. ~~**Bug sprint**~~ - ✅ Created "Sprint: V5 Bugs" label, applied to 11 issues

### Medium-Term Actions (This Quarter)

7. **Formally close V1** - Only 3 issues remain; evaluate if still relevant
8. **Re-evaluate V2/V3** - Either complete or move remaining issues to V5
9. **Establish SLAs** - Define max age for issues before auto-archival

---

## Backlog Health Score (Updated)

| Category | Before | After | Notes |
|----------|--------|-------|-------|
| Issue Labeling | 8/10 | 9/10 | #252 now has priority:High |
| Milestone Organization | 5/10 | 6/10 | V2 cleaned up; V5 active |
| Duplicate Management | 4/10 | 7/10 | Issues linked to epics |
| Epic Structure | 7/10 | 9/10 | 8 epics now (#249-256) |
| Issue Freshness | 5/10 | 7/10 | 18 stale issues closed |
| **Overall** | **5.8/10** | **7.6/10** | Significant improvement |

---

## Recommended Roadmap Focus

### V5 Execution Order

**Phase 1: Bug Fixes**
1. Mobile bugs (#231-237, 244)
2. Collector URL bug (#238)
3. Legislation rank fix (#228)
4. Chart fix (#225)

**Phase 2: Core Features**
1. BullMQ infrastructure (#252)
2. Navigation refactor (#235)
3. Legislation profile enhancements (#247, 248)
4. Map improvements (#239)

**Phase 3: Enhancements**
1. Filter improvements (#243)
2. UI polish (#240, 241, 242, 246)
3. Automation (#245)

---

## Conclusion

The Congress.wiki roadmap has a healthy mix of feature requests and a clear V5 focus, but suffers from accumulated technical debt in issue management. The primary concerns are:

1. **Stalled V2/V3 milestones** creating confusion about project status
2. **100+ issues without milestones** lacking clear prioritization
3. **Duplicate/overlapping issues** that should be consolidated

With focused grooming effort, the backlog can be streamlined from 252 issues to a more manageable ~100-120, with clear epic ownership and milestone assignment.

---

*Audit conducted by AI Product Manager*
