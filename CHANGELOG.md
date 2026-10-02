# Changelog

## 0.1.5

- `Sonar.observeWorkouts(_:)` calls you on the main actor when Sonar accepts workouts that are new on
  this phone, with each workout's id, activity type, indoor flag and times. It never fires for the
  import of past data. Apple Health can wake the app to deliver them, so register at launch and keep
  the returned `SonarObservation`.
- `ProviderState.lastDataSentAt` says when this phone last sent new records or deletions. A sync that
  finds nothing new leaves it unchanged, so comparing it with `lastSuccessfulSyncAt` tells whether
  Sonar has new data to process.

## 0.1.4

- Apps built without Swift's `NonisolatedNonsendingByDefault` no longer crash in `authenticate`. Every
  public async call is now `@concurrent`, as is `ClientTokenProvider`; rebuild your app against 0.1.4.
- The same user signing back in on the same app picks the sync up where it stopped instead of importing
  the history again. Anyone else still starts clean.
- After a clean run the SDK sends Sonar the apps the phone holds sleep and workout data from, when that
  list changes and at least once a day.
- A foreground run imports up to 120 days of history, up from 30, so a new connection fills faster.
- The diagnostics log records why an upload did not land: the error, the HTTP status, or a failed
  session token.

## 0.1.3

- Health types the user has not answered the permission sheet for no longer stop syncing. The other
  types keep syncing, and each pending type imports its history once the user allows it.
- While some types are pending, the state shows `request_permission`. Calling `connect` again shows
  the sheet for those types.
- When Health is restricted on the phone, the state shows `open_settings` instead of `contact_support`.
- The diagnostics log names each type waiting for permission, and records runs that fail unexpectedly.

## 0.1.2

- `authenticate(userId:clientTokenProvider:)` takes your own ID for the signed-in user. When it changes,
  the SDK signs the previous user out first. The `authenticationConflict` error is gone.
- `configure(appId:historyDays:)` chooses how far back a new connection imports, from 30 days to five
  years (1825). The default stays two years.
- The history import reads a week at a time and finishes about a third faster.
- The SDK checks in with Sonar even when there is nothing new to send, so it notices a connection taken
  over by another phone or disconnected by your backend.

## 0.1.1

- The SDK reports the phone's time zone with each sync. Sonar counts the user's days in it unless your
  backend set `profile.timezone`, and follows it when the user travels.

## 0.1.0

First beta: Apple Health connection, incremental and background sync, two years of history,
diagnostics.
