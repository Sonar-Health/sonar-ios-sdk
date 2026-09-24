# Changelog

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
