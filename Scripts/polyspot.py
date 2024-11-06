#!/bin/python3

import dbus
import time
import argparse

def getSongInfo():
    try:
        # connect to spotify session bus with dbus
        # https://stackoverflow.com/a/33923095
        session_bus = dbus.SessionBus()
        spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
        spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")
        
        # read metadata of currently playing track
        metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")
        metaDict = {}
        for key, value in metadata.items():
            metaDict[key] = value
        title = metaDict["xesam:title"]
        artist = str(metaDict["xesam:artist"][0])
        return {"success": True, "title": title, "artist": artist}
    # catches dbus errors runtime errors kinda - stolen from 
    # https://github.com/PrayagS/polybar-spotify
    except Exception as e:
        if isinstance(e, dbus.exceptions.DBusException):
            error = "dbus error. perhaps spotify isn't running?"
            return {"success": False, "error": error}
        else:
            return {"seccess": False, "error": e}

# formats the string so it is the correct legnth as given by the chars argument
def formatDisplay(title, artist, chars):
    formatted = ""
    dispString = title + " - " + artist
    dispLength = len(dispString)
    # only messes with the string if it's too long to display
    if dispLength > chars:
        dispString += "   "
        dispLength = len(dispString)
        t = int(time.time() * 3)
        t = t % dispLength
        end = (t + chars) % dispLength
        if end > t:
            formatted += dispString[t:end]
        else:
            formatted += dispString[t:]
            formatted += dispString[:end]
    else:
        formatted = dispString
    return formatted

def arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("-c", "--chars", nargs='?', type=int, help="Choose the length of the song string to display")
    args = parser.parse_args()
    try:
        chars = int(args.chars)
    except:
        chars = 50
    return chars

def main():
    # determine how long the display string will be
    chars = arguments()
    song = getSongInfo()
    display = ""
    if song["success"]:
        display = formatDisplay(song["title"], song["artist"], chars)
    else:
        display = song["error"]
    print(display)

main()
