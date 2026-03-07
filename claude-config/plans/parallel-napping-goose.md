# Event Availability Checker: Adults + Children Support

## Context

The current event availability checker uses a single `guests` number input. We need to split this into **adults** and **children** fields with:
- Different pricing rates (adults pay `rate.amount`, children pay `rate.childRate`)
- Frontend validation: `adults + children <= spotsLeft`
- A new backend API route that validates availability, checks guest constraints, and returns pricing for the selected group

The Sanity `rate` schema already supports child pricing (`usd.childRate`, `lkr.childRate`), so no CMS schema changes are needed.

---

## Plan

### Step 1: Update `getEventPricing` utility
**File:** `apps/web/src/layouts/event-details-page/event-availability-checker/utils.ts`

- Change signature from `(event, guests: number)` to `(event, adults: number, children: number)`
- Calculate adult total: `adults * rate.amount`
- Calculate child total: `children * rate.childRate` (fallback to `rate.amount` if no childRate)
- Return breakdown with `adultTotal`, `childTotal`, `perAdultRate`, `perChildRate`
- Update `EventPricingResult` type to include adult/child breakdown

### Step 2: Update main component state
**File:** `apps/web/src/layouts/event-details-page/event-availability-checker/index.tsx`

- Replace `const [guests, setGuests] = useState(1)` with `const [adults, setAdults] = useState(1)` and `const [children, setChildren] = useState(0)`
- Update `handleReserve` to pass both `adults` and `children` as search params
- Thread `adults` and `children` through to child components

### Step 3: Update form section with two inputs
**File:** `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-form-section.tsx`

- Replace single guest `NumberInput` with two inputs: Adults (min=1) and Children (min=0)
- Add validation: `adults + children <= spotsLeft` (enforce via `max` prop on each input dynamically)
- Show validation message when total exceeds available spots

### Step 4: Update pricing section
**File:** `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-pricing-section.tsx`

- Update props from `guests: number` to `adults: number, children: number`
- Show separate line items: Adults (count x rate) and Children (count x rate) when children > 0
- Update reserve button disabled state: `adults < 1 || adults + children > spotsAvailable`

### Step 5: Update sidebar component
**File:** `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-availability-sidebar.tsx`

- Update props to pass `adults`, `children`, `onAdultsChange`, `onChildrenChange`

### Step 6: Update mobile widget
**File:** `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-mobile-widget.tsx`

- Update props from `guests` to `adults` + `children`
- Update pricing calculation call
- Update reserve button disabled state

### Step 7: Create backend event availability route
**File (new):** `apps/api/src/routes/events/event-availability.ts`

Following the pattern from `experiences/booking-calculations.ts`:

- **Zod schema:** `{ slug, adults (min 1), children (min 0, default 0) }`
- **Validation:**
  1. Fetch event from Sanity (slug, spotsLeft, start date, price)
  2. Check event exists
  3. Check event date is not in the past
  4. Check event is not sold out (`spotsLeft > 0`)
  5. Check `adults + children <= spotsLeft`
- **Pricing calculation:**
  - Adult total: `adults * price.{currency}.amount`
  - Child total: `children * price.{currency}.childRate` (fallback to amount)
  - Return both currency totals (LKR + USD)
- **Response:** `{ available: boolean, pricing: { adult: {lkr, usd}, child: {lkr, usd}, total: {lkr, usd} }, spotsLeft, reasons?: string[] }`

### Step 8: Add Sanity query for event availability
**File:** `apps/api/src/sanity/queries.ts`

- Add `eventAvailabilityQuery` GROQ query to fetch: `slug`, `name`, `spotsLeft`, `start`, `end`, `price`, `groupSize`

### Step 9: Register the route
**File:** `apps/api/src/app.ts`

- Import `eventsRouter` from `./routes/events/event-availability`
- Add `.route("/events", eventsRouter)` to the route chain

---

## Files Modified (8)
1. `apps/web/src/layouts/event-details-page/event-availability-checker/utils.ts`
2. `apps/web/src/layouts/event-details-page/event-availability-checker/index.tsx`
3. `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-form-section.tsx`
4. `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-pricing-section.tsx`
5. `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-availability-sidebar.tsx`
6. `apps/web/src/layouts/event-details-page/event-availability-checker/components/event-mobile-widget.tsx`
7. `apps/api/src/sanity/queries.ts`
8. `apps/api/src/app.ts`

## Files Created (1)
9. `apps/api/src/routes/events/event-availability.ts`

---

## Key Patterns Reused
- `rate` schema child pricing: `packages/sanity/src/schemas/common/rate.ts` (lines 19-24, 39-44)
- Experience booking calc route pattern: `apps/api/src/routes/experiences/booking-calculations.ts`
- `successResponse`/`errorResponse` helpers: `apps/api/src/utils/responses.ts`
- `NumberInput` component: `@rapid-adventures/ui/components/form/number-field`
- Sentry error capturing pattern from existing routes

## Verification
1. Run `pnpm check-types --filter=web` — confirm no type errors
2. Run `pnpm check-types --filter=api` — confirm no type errors
3. Run `pnpm lint --filter=web --filter=api` — confirm no lint errors
4. Run `pnpm build` — confirm production build passes
5. Manual test: Navigate to an event details page, verify two inputs appear, change adults/children and confirm pricing updates
6. Manual test: Verify total guests cannot exceed spots left
7. Test backend route with curl/Postman: POST to `/api/events/event-availability` with valid/invalid payloads
