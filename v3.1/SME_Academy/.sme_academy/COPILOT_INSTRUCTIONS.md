# SME_Academy_Copilot_Instructions

You are maintaining the SME_Academy repository. Preserve `snake_case`. Do not store secrets. Treat generated content as draft unless approved. Use metadata IDs and tags. Keep learner private progress out of public leaderboards. Reference the active module, normally `modules/empvpn`.

When adding content, place it under the right module area: `library`, `wiki`, `training`, `simulations`, `splunk`, `runbooks`, `incidents`, or `quizzes`. Add tags and levels. Do not hand-link everywhere; let generated indexes and tag relationships connect content.

## v3.1 Workspace and Change Knowledge Rules

- Library items should render compact by default with expandable details.
- Favorites, bookmarks, notes, and simulation progress belong to the learner workspace under `users/<user_id>/` and should be encrypted in the full implementation.
- Do not commit high-frequency click-by-click telemetry. Commit meaningful milestones only.
- Past ServiceNow changes should be normalized into `modules/<module>/changes/<change_id>/` rather than copied as raw ticket exports.
- Learner-submitted change/runbook/recipe ideas should land in `pending_contributions/<user_id>/` until a Curator promotes them.
