#!/bin/bash
# Congress.wiki Roadmap - Immediate Backlog Actions
# Run this script with: GITHUB_TOKEN=your_token ./scripts/immediate-actions.sh
# Or: gh auth login first, then run with: USE_GH_CLI=1 ./scripts/immediate-actions.sh

set -e

REPO="CongressWiki/Roadmap"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "========================================"
echo "Congress.wiki Roadmap - Immediate Actions"
echo "========================================"
echo ""

# Check authentication
if [ -n "$USE_GH_CLI" ]; then
    if ! command -v gh &> /dev/null; then
        echo -e "${RED}Error: gh CLI not found. Install it or use GITHUB_TOKEN instead.${NC}"
        exit 1
    fi
    echo -e "${GREEN}Using GitHub CLI for authentication${NC}"
    API_CMD="gh api"
else
    if [ -z "$GITHUB_TOKEN" ]; then
        echo -e "${RED}Error: GITHUB_TOKEN not set.${NC}"
        echo "Usage: GITHUB_TOKEN=your_token ./scripts/immediate-actions.sh"
        echo "   Or: USE_GH_CLI=1 ./scripts/immediate-actions.sh (after gh auth login)"
        exit 1
    fi
    echo -e "${GREEN}Using GITHUB_TOKEN for authentication${NC}"
    AUTH_HEADER="Authorization: Bearer $GITHUB_TOKEN"
fi

# Function to make API calls
api_call() {
    local method=$1
    local endpoint=$2
    local data=$3

    if [ -n "$USE_GH_CLI" ]; then
        if [ -n "$data" ]; then
            echo "$data" | gh api -X "$method" "$endpoint" --input -
        else
            gh api -X "$method" "$endpoint"
        fi
    else
        if [ -n "$data" ]; then
            curl -s -X "$method" "https://api.github.com$endpoint" \
                -H "$AUTH_HEADER" \
                -H "Accept: application/vnd.github+json" \
                -d "$data"
        else
            curl -s -X "$method" "https://api.github.com$endpoint" \
                -H "$AUTH_HEADER" \
                -H "Accept: application/vnd.github+json"
        fi
    fi
}

echo ""
echo "========================================"
echo "ACTION 1: Close Stale V1/V2 SVG Icon Requests"
echo "========================================"
echo ""

# SVG Icon issues from 2022 to close
SVG_ISSUES=(55 56 58 60 61 62 63 64 65 66 67 69 73 74)

CLOSE_COMMENT="Closing as part of backlog grooming (December 2025). This SVG icon request has been open since February 2022 without implementation. If this icon is still needed, please open a new issue with updated requirements."

for issue in "${SVG_ISSUES[@]}"; do
    echo -e "${YELLOW}Closing #$issue...${NC}"

    # Add comment
    api_call POST "/repos/$REPO/issues/$issue/comments" "{\"body\": \"$CLOSE_COMMENT\"}" > /dev/null

    # Close issue
    result=$(api_call PATCH "/repos/$REPO/issues/$issue" '{"state": "closed", "state_reason": "not_planned"}')
    state=$(echo "$result" | jq -r '.state // "error"')

    if [ "$state" == "closed" ]; then
        echo -e "  ${GREEN}✓ Closed${NC}"
    else
        echo -e "  ${RED}✗ Failed to close${NC}"
    fi
done

echo ""
echo "========================================"
echo "ACTION 2: Link Follow Requests to Epic #249"
echo "========================================"
echo ""

# Follow-related issues to update
FOLLOW_ISSUES=(77 78 79 101)

LINK_COMMENT="This issue is now tracked under Epic #249 (Unified entity following & notifications). Please see that epic for the consolidated implementation plan and updates."

for issue in "${FOLLOW_ISSUES[@]}"; do
    echo -e "${YELLOW}Updating #$issue with epic reference...${NC}"

    # Add comment linking to epic
    result=$(api_call POST "/repos/$REPO/issues/$issue/comments" "{\"body\": \"$LINK_COMMENT\"}")
    id=$(echo "$result" | jq -r '.id // "error"')

    if [ "$id" != "error" ] && [ "$id" != "null" ]; then
        echo -e "  ${GREEN}✓ Comment added${NC}"
    else
        echo -e "  ${RED}✗ Failed to add comment${NC}"
    fi
done

# Update Epic #249 body to reference sub-issues
echo -e "${YELLOW}Updating Epic #249 with sub-issue references...${NC}"

EPIC_UPDATE="## Summary

We have three separate On Deck requests to let users follow Elected Officials (#77), bills (#78), and committees (#79), plus a standalone notification system (#101). Delivering them piecemeal would duplicate work on subscription models, notification delivery, and UI affordances.

## Related Issues
- #77 - Ability to follow elected officials
- #78 - Ability to follow Bills
- #79 - Ability to follow Committees
- #101 - Notification system

## Proposal
1. Define a single subscription primitive that can target any entity (legislation, EO, committee, geography).
2. Map subscription events to outbound channels (email, push, site inbox) with opt-in preferences.
3. Provide reusable UI affordances (follow button, manage sheet, digest settings).
4. Sequence MVP scope (e.g., follow legislation + EO first) and capture blockers (auth, rate limits, storage).

## Acceptance criteria
- Shared data model + API contract for subscriptions is documented.
- Notifications backlog references this epic for reuse.
- Individual follow requests (#77/#78/#79) can be converted into sub-tasks once scope is approved."

api_call PATCH "/repos/$REPO/issues/249" "{\"body\": $(echo "$EPIC_UPDATE" | jq -Rs .)}" > /dev/null
echo -e "  ${GREEN}✓ Epic #249 updated${NC}"

echo ""
echo "========================================"
echo "ACTION 3: Add Priority Label to #252"
echo "========================================"
echo ""

echo -e "${YELLOW}Adding priority:High label to #252 (BullMQ adoption)...${NC}"
result=$(api_call POST "/repos/$REPO/issues/252/labels" '{"labels": ["priority:High"]}')
labels=$(echo "$result" | jq -r '.[].name // "error"' 2>/dev/null | tr '\n' ', ')

if [[ "$labels" == *"priority:High"* ]]; then
    echo -e "  ${GREEN}✓ Label added${NC}"
else
    echo -e "  ${RED}✗ Failed to add label${NC}"
fi

echo ""
echo "========================================"
echo "SUMMARY"
echo "========================================"
echo ""
echo -e "${GREEN}Completed immediate backlog actions:${NC}"
echo "  • Closed 14 stale SVG icon issues (#55-74)"
echo "  • Linked 4 follow/notification issues to Epic #249"
echo "  • Added priority:High label to #252"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  • Review closed issues for any that should be reopened"
echo "  • Consider closing remaining V2/V3 stale issues"
echo "  • Run the mobile bug sprint for V5"
echo ""
