# Sample AI-Driven Data Validation Rules for Investment Book of Record (IBOR) Applications

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). In another [section](https://github.com/TavroOrg/Agent-Metadata-Specification/blob/main/industry/Investment%20Management%20-%20AI-Driven%20Data%20Quality%20Checks%20on%20Securitized%20Products.md), we also covered all the relevant artifacts for AI-driven data quality checks for securitized products in the investment management industry. In this section, we discuss sample AI-Driven Data Validation Rules for IBOR applications like Aladdin and Charles River.

Summary Table - IBOR Critical Data Element (CDE)

<table align="center">
  <thead>
    <tr>
      <th>CDE #</th>
      <th>IBOR CDE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Current Pool Factor</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Constant Prepayment Rate (CPR)</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Weighted Average Coupon (WAC)</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Weighted Average Maturity (WAM), months</td>
    </tr>
    <tr>
      <td>5</td>
      <td>Weighted Average Life (WAL), years</td>
    </tr>
    <tr>
      <td>6</td>
      <td>Clean Market Price</td>
    </tr>
    <tr>
      <td>7</td>
      <td>Accrued Interest</td>
    </tr>
    <tr>
      <td>8</td>
      <td>Tranche Classification Code</td>
    </tr>
    <tr>
      <td>9</td>
      <td>Credit Enhancement / Subordination Level (%)</td>
    </tr>
    <tr>
      <td>10</td>
      <td>Underlying Pool Delinquency Rate (%)</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 1: Summary table for IBOR Critical Data Element (CDE)</em>
</p>

## Field 1: Current Pool Factor

The pool factor represents the remaining outstanding principal balance as a fraction of the original balance (0.0 to 1.0), critical for Mortgage-Backed Security (MBS) / Asset-Backed Security (ABS) positions.

**Validation Rules:**

- Must be a decimal value between 0.000001 and 1.000000 (exclusive of zero; a factor of exactly 0 means the bond has paid off)
- Must be ≤ the prior month's factor (pool factors are monotonically decreasing)
- If factor change (month-over-month) exceeds 5%, flag for manual review — abnormal prepayment speed
- Must reconcile with custodian/trustee report within ±0.0001 tolerance
- Null or missing factor for any active securitized position is a Critical error

## Field 2: Constant Prepayment Rate (CPR)

CPR is the annualized percentage of the remaining principal expected to prepay. It is used in duration/convexity and cash flow modeling.

**Validation Rules:**

- Must be between 0.00% and 100.00%
- 1-month CPR implied by actual factor change must be within +/-10 Public Securities Association (PSA) of the model assumption
- If CPR > 50%, escalate as a potential data error unless corroborated by trustee remittance data
- Must be refreshed at minimum monthly; stale CPR (>35 days old) triggers a Warning
- CPR must be consistent with the deal's collateral type (for example, Agency MBS CPR benchmarks differ from non-Agency CMBS)

## Field 3: Weighted Average Coupon (WAC)

The weighted average interest rate of the underlying loan pool, used to project interest cash flows.

**Validation Rules:**

- Must be greater than 0.00% and less than 25.00% for residential mortgage pools
- WAC must be >= the security's stated pass-through rate (net WAC after servicing fees)
- Month-over-month WAC change must not exceed +/-50 bps without a supporting explanation (for example, pool composition change)
- WAC must be sourced from the trustee remittance report; manual overrides require a logged justification
- For Collateralized Loan Obligations (CLOs): WAC of underlying loan pool must align with the weighted average spread (WAS) plus a benchmark rate within a reasonable tolerance

## Field 4: Weighted Average Maturity (months)

The weighted average number of months to maturity of the loans in the pool, critical for duration calculations.

**Validation Rules:**

- Must be a positive integer (months), not exceeding 360 for residential MBS (30-year pools)
- WAM must decrease by approximately 1 month per calendar month; a decrease of >2 or an increase of any amount (outside of a deal restructure event) is flagged
- WAM must be consistent with WAL (Weighted Average Life) - if WAM < WAL, flag as Critical data inconsistency
- Null WAM for any non-cash securitized position is a Critical error
- WAM must reconcile with trustee/data vendor (Bloomberg, Intex) within +/-2 months

## Field 5: Weighted Average Life (years)

WAL measures the average time (in years) that each dollar of principal is expected to be outstanding, central to risk and duration analytics.

**Validation Rules:**

- Must be > 0 and <= 30 years for standard ABS/MBS structures
- WAL must be re-calculated whenever CPR or factor is updated
- WAL must be <= stated legal final maturity of the tranche
- For agency Collateralized-Mortgage Obligation (CMO) tranches (PAC, TAC, Sequential), WAL must fall within the published PAC band at the pricing speed; breaches require annotation
- WAL change of >1.5 years between monthly cycles without a corresponding CPR change triggers a Warning

## Field 6: Clean Market Price

The market price of the securitized instrument, used for mark-to-market valuation in the IBOR.

**Validation Rules:**

- Must be between 0.01 and 200.00 (as a percentage of par) for standard fixed income securitized products
- Price must be sourced from an approved pricing vendor (for example, Bloomberg BVAL, ICE Data Services, Markit); manual prices require dual approval
- Price tolerance check: flagged if deviation from prior day exceeds +/-3 points (300 bps) without a corresponding market event
- For non-agency/illiquid tranches: if no third-party price is available for >5 business days, position must be escalated to the Valuation Committee
- Price must be dated as of the current business date; stale prices (T-1 or older) during an open valuation period are a Critical error

## Field 7: Accrued Interest

The interest that has accumulated on the security since the last coupon payment date, required for full settlement price and P&L calculation.

**Validation Rules:**

- Must equal: (Current Face x WAC / 12 x Days Accrued / Days in Period) within a tolerance of +/-$0.01 per $1M face
- Day count convention must match the deal's prospectus (for example, 30/360 for agency MBS, Actual/360 for some ABS)
- Accrued interest must reset to $0.00 on the coupon payment date; non-zero accrual post-payment is a Critical error
- For interest-only (IO) strips: accrued interest calculation must reference the notional balance, not current face
- Negative accrued interest values are not permitted except for specific inverse floater structures (requires flag)

## Field 8: Tranche Classification Code

The classification of the securitized tranche (for example, PAC, TAC, SEQ, SUP, IO, PO, NAS, Z-bond, CLO AAA, CMBS A4), which drives cash flow waterfall and analytics model selection.

PAC - Planned Amortization Class  
TAC - Targeted Amortization Class  
SEQ - Sequential  
SUP - Support (Companion)  
IO - Interest Only  
PO - Principal Only  
NAS - Non-Accelerated Security  
Z-Bond - Accrual Bond  
CLO AAA - Collateralized Loan Obligation AAA  
CMBS A4 - Commercial Mortgaged-Backed Security A4

**Validation Rules:**

- Must map to an approved tranche type enumeration in Aladdin's reference data taxonomy; unknown or unmapped codes are a Critical error
- Tranche type must be consistent with the deal structure in Intex or Bloomberg (cross-reference required at onboarding and quarterly)
- IO and PO strips must have their current_face and notional_balance fields populated separately; conflating them is a Critical error
- Z-bonds (accrual tranches) must have their accrual logic enabled; if accrued_interest is $0.00 for a Z-bond in its accrual period, flag as Critical
- CLO tranches must carry a valid rating from at least one Nationally Recognized Statistical Rating Organization (NRSRO); missing rating for a rated tranche is a Warning

## Field 9: Credit Enhancement / Subordination Level (%)

The percentage of subordination or credit support available to protect the tranche from losses, sourced from deal remittance reports.

**Validation Rules:**

- Must be between 0.00% and 100.00%
- Credit support must be monotonically non-increasing over time (it can only decrease as losses are absorbed or prepayments reduce subordination)
- An increase in credit support >0.50% month-over-month requires a logged explanation (for example, deal restructure, error correction)
- For investment-grade ABS tranches, credit support falling below the original deal threshold (per prospectus) must trigger a risk alert to portfolio management
- Null or missing credit support for non-agency securitized positions is a Warning (critical for risk reporting positions)

## Field 10: Underlying Pool Delinquency Rate (%)

The percentage of the underlying loan pool that is 30, 60, or 90+ days past due, a key credit quality indicator for non-agency MBS, ABS, and CLOs.

**Validation Rules:**

- Must be between 0.00% and 100.00%
- Must be decomposed into 30-day, 60-day, and 90+-day buckets; total must equal the sum of buckets within +/-0.01%
- Month-over-month increase of >5% in the 90+ day bucket triggers an automatic credit watch flag for portfolio management
- Delinquency rate must be sourced from the trustee remittance report; if the last update is >35 days old, the field is considered stale (Warning)
- For CLOs: delinquency rate must be reconciled against the Overcollateralization (OC) test results; a failing OC test with a delinquency rate below 1% is a data inconsistency requiring review
