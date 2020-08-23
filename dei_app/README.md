# DeiApp

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


## Generators

mix phx.gen.html Campaigns Campaign campaigns is_anonymous:boolean email:string work_category:text is_race_multiselect:boolean is_compensation_requested:boolean is_compensation_a_range:boolean reference_gender_male:integer reference_gender_female:integer reference_gender_other:integer reference_race_asian:integer reference_race_black_or_african_american:integer reference_race_native_american_or_alaskan_native:integer reference_race_native_hawaiian_or_other_pacific_islander:integer reference_race_white:integer reference_race_other:integer reference_ethnicity_hispanic_latinx:integer

mix phx.gen.html Responses Response responses campaign_id:references:campaigns email:string gender:string races:array:string hispanic_latinx:boolean work_category:string tenure:integer compensation:integer compensation_range:string 