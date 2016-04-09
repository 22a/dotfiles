#!/usr/bin/env osascript
# Returns the current playing song in Radiant for OSX

tell application "Radiant Player"
  if it is running then
    if player state is 2 then
      set track_name to current song name
      set artist_name to current song artist

      if artist_name > 0
        # If the track has an artist set and is therefore most likely a song rather than an advert
        artist_name & " - " & track_name
      else
        # If the track doesn't have an artist set and is therefore most likely an advert rather than a song
        track_name
      end if
    end if
  end if
end tell
