Welcome to my new dbt project!

# product-data-enrichment

A dbt project designed to transform and enrich raw product data by integrating metadata from a seed file containing product category mappings, business units, and activation flags.

This project includes:
- Staging models for raw product data
- A seed (`product_categories.csv`) with category descriptions and business units
- A mart model (`enriched_products`) that joins the above for analytics
- An analysis file summarizing active category performance
- Tests to ensure data quality and consistency

## Purpose

This project is ideal for organizations looking to:
- Centralize and standardize product metadata
- Enable consistent reporting by enriching base product datasets
- Validate and clean category-level data for analytics

## Tech Stack



- **dbt (data build tool)**
- **Snowflake** 


## Structure

