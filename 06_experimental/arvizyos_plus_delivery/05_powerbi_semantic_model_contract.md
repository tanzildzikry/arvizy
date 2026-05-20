# Power BI Semantic Model Contract

## Purpose

Define the Power BI model design contract after SQL mart design.

## Required Sections

### 1. Loaded Tables

Classify every table as:

- fact
- dimension
- disconnected control
- measure container
- helper table
- should not be loaded

### 2. Grain

Declare grain for every loaded fact and dimension.

### 3. Relationships

For every relationship define:

- from table
- from column
- to table
- to column
- cardinality
- filter direction
- active/inactive status
- relationship purpose

### 4. Date Strategy

Define:

- primary reporting date
- snapshot date
- invoice date
- event start/end date
- inactive date relationships if needed
- role-playing date requirement

### 5. Field Visibility

Define:

- hidden technical keys
- hidden raw fields
- visible business fields
- sort-by columns
- display names

### 6. Control Tables

Control/reconciliation tables should normally remain disconnected.

## Hard Rules

- No direct fact-to-fact relationship unless justified and validated.
- No many-to-many relationship unless justified and validated.
- No bidirectional filter unless justified and validated.
- No DAX approval before relationship validation.
- No reporting readiness without KPI reconciliation.

<!-- BEGIN DELIVERY REFINEMENT SEMANTIC MODEL RULES -->

## Delivery Refinement Rules

### Relationship Key Mapping

Semantic model guidance must use normalized key-to-key mapping.

Preferred:

`	ext
dim_pic[pic_key] -> fact[pic_key]
dim_customer[customer_key] -> fact[customer_key]
dim_bc[bc_key] -> fact[bc_key]
dim_event_category[event_category_key] -> fact[event_category_key]
dim_date[date_key] -> fact[date_key]
`

Avoid:

`	ext
dim_pic[pic_key] -> fact[pic_name]
dim_customer[customer_key] -> fact[customer_name]
dim_bc[bc_key] -> fact[bc_number]
`

unless those display/name fields are explicitly validated as relationship keys.

### Control Tables

Control/reconciliation tables should remain disconnected in Power BI.

They may be used for:

`	ext
KPI reconciliation cards
SQL vs Power BI variance checks
validation audit pages
`

They should not drive slicers or filter production fact tables unless explicitly justified.

### Dimension View vs Physical Dimension

The semantic model contract must state whether dimensions are:

`	ext
view-based dimensions
physical dimension tables
hybrid / pending promotion
`

If physical dimensions are not used, document the risk and validation requirements.

<!-- END DELIVERY REFINEMENT SEMANTIC MODEL RULES -->

