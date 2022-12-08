================================================================================
= REAPER Note Maps for Toontrack Drum Libraries
=
= Created by Jeff Alexander aka "godprobe"
=  http://www.jeffalexander.com/
=  http://www.godprobe.com/
=
= Last updated: 2011 August 20th
================================================================================
1 ABOUT
     default
     renamed
     unique
     minimal
2 INCLUDED Toontrack LIBRARY NOTE MAPS
3 ADDITIONAL NOTE MAPS
4 USAGE/TIPS
5 COMMENTS
6 CREDITS
7 HELP MAKE IT BETTER!
8 CHANGELOG



=== ABOUT ===

This is a set of Note Maps for Cockos's REAPER sequencer software and
Toontrack Music's drum libraries.  There are four variations of each
Note Map: default, renamed, unique, and minimal.

Ideally, they should help a person find each kit piece and articulation
faster and easier while editing MIDI drum sequences.

- default -

The "default" version is a map of the Toontrack default MIDI mapping for
each library.  It includes all the default Note Mappings and uses the
naming conventions in the Toontrack tools themselves.  The naming in
Toontrack's PDF MIDI Layout documents may differ from the naming here.

- renamed -

The "ren" version is similar to the "default", but uses a custom naming
scheme that abbreviates most of the kit piece names.  Additionally, the
Note numbers are included for easier reference.  The spacing uses Alt-255
"space" characters since REAPER won't format multiple spaces for an indent.
I'm not sure if this will look correct on other REAPER installations and
would appreciate any screenshot feedback if it looks odd on your system.

- unique -

The "unique" version simplifies the "ren" Note Map by removing any extra
"aliases" (duplicate mappings of the same kit piece articulation).  This
version prioritizes first GM mappings, then Toontrack's usual practices
(based on the default mapping of all Toontrack libraries), and finally
succumbs to a subjective interpretation if the "proper" unique choice is
still difficult to determine.

An example of the "subjective interpretation" would be the "hatsTrig" and
"hatsTipTrig" articulations.  Normally available on either Notes 7 & 8 or
Notes 19 & 20, this differs conflictingly in the Twisted Kit EZX and the
Claustrophobic EZX when compared to all other Toontrack libraries available
at the time of writing.  I went with Notes 7 & 8 since the omission of any
mapping on Note 8 in Twisted seemed, subjectively, to be the more likely
inconsistency.

Please note that the "unique" mappings will probably *not* match Toontrack's
own MIDI files.  I considered them, but immediately ran into duplicates and
differences of the preferred Note number in the Pop/Rock MIDI.  I didn't
check if it became more consistent with other libraries.

- minimal -

The "min" version takes things a step further and removes any articulation
names that may be distracting when trying to compose a drum track in the
MIDI editor.  All left-limbed articulations are usually removed, as are the
"trig" articulations as well as any other articulations that might be
sonically redundant.  In theory, this should be the easiest and most
"lightweight" version to work with for editing your drum tracks.  Sometimes,
I'm not entirely sure if there *isn't* a difference between the "left" and
"right" articulations (particularly with the Latin Percussion EZX), so it
may be worth experimenting with those on your own.  Also, for kits with two
kick drums, disabling the Humanize feature in EZDrummer or the Alternate
function of the Humanize feature in Superior will allow you to use the left
and right kick triggers independently.



=== INCLUDED Toontrack LIBRARY NOTE MAPS ===

Some, I simply don't own.  Others, I either haven't gotten to them yet or
they aren't released yet.  Otherwise, here's what's finished and included...

 [Default/Renamed/Unique/Minimal] Type: Library Name

 [d/r/u/m] EZD: Pop/Rock
 [d/r/u/m] EZX: Cocktail
 [d/r/u/m] EZX: Vintage Rock
 [d/r/u/m] EZX: Latin Percussion
 [d/r/u/m] EZX: Drumkit From Hell
 [d/r/u/m] EZX: Nashville
 [d/r/u/m] EZX: Claustrophobic
 [d/r/u/m] EZX: Twisted Kit
 [d/r/u/m] EZX: Funkmasters Clyde & Jab'O
 [d/r/u/m] EZX: Jazz
 [d/r/u/m] EZX: Electronic
 [d/r/u/m] EZX: Metalheads
 [d/r/u/m] EZX: The Classic / 4-Mic
 [d/r/u/m] EZX: Number 1 Hits
 [d/r/u/m] SD2: Avatar
 [d/r/u/m] SDX: Allaire
 [d/r/u/m] SDX: Hit Factory
 [d/r/u/m] SDX: Metal Foundry
 [d/r/u/m] SDX: Custom & Vintage
 [d/r/u/m] SDX: Joe Barresi Evil Drums
 [d/r/u/m] SDX: Music City USA
 [-/-/-/-] { unreleased } SDX: Jazz



=== ADDITIONAL NOTE MAPS ===

A blank Note Map and a General MIDI Drums Note Map are also included.
Occasionally the blank Note Map may be preferred as a "reset" though it
should mostly be unnecessary.  Also note that loading a Note Map over
existing mapped entries will overwrite only those entries that are in
the new map (existing mappings will persist if not overwritten).



=== USAGE/TIPS ===

In REAPER...

Create a new MIDI Item on a new track. (Ctrl-T, Insert > New MIDI Item)

View the new MIDI item. (Ctrl-Alt-E may work, or double-click on it)

Rather than the Piano Roll view, Named Notes works better here (Alt-2)

Load up the preferred Note Map (File > Load note names from file...)

If you wish, especially with the "unique" version, hide the unnamed rows.
(View > Hide unused and unnamed note rows)

Assuming you have the proper Toontrack library loaded on the track that
corresponds to the Note Map you loaded, the Note labels in the MIDI editor
should now match the kit.

Additionally, depending on the size of your MIDI editor window, some of
the Note Mapping names may be cut off.  You can only zoom out to 100% in
REAPER's MIDI editor window so if the names are getting cut off and you
want to see them, you'll have to resize the window to a smaller height.
Ctrl-MouseWheel zooms vertically and resizes the text labels.  Once the
zoom level is at your preference, you can resize the window back to the
original height if you want, taking care not to zoom too far in again.

TIP: working with Toontrack's MIDI?  Load the "default" Note Map, and
then load the "unique" or "minimal" Note Map.  Because of the altered
naming scheme when compared to "default", it should be easy to pick out
the notes that don't correspond to the unique or minimal mapping.



=== COMMENTS ===

I think the abbreviations will mostly be self-explanatory, but if not...

 SD     Snare Drum
 KD     Kick Drum
 RT     Rack Tom
 FT     Floor Tom
 HH     Hi-Hat
 cG     Generic Cymbal
 cC     Crash Cymbal
 cR     Ride Cymbal
 cN     China Cymbal
 cS     Splash Cymbal
 cK     Spock Cymbal
 cB     Bell Cymbal
 cL     Clash Cymbal (n/a)
 cZ     Sizzle Cymbal (n/a)
 cW     Swish Cymbal (n/a)
 cF     Finger Cymbal (n/a)
 XX     Miscellaneous kit piece

All cymbals other than the Hi-Hat are usually prefixed with a lower-case "c".
Some of them are identified as multiple types and so multiple letters follow
the lower-case "c". Any additional kit piece identification (i.e. "1", "2",
"A", "B", etc.) follows after a colon ":" symbol.  And in some of the more
unusual situations, kit piece slots may not be abbreviated at all.

Mappings marked with an asterisk ("*") are articulations not loaded by
default in the Toontrack software.  Most brushed hits are a good example.
You may have to load a different kit piece into the corresponding kit
slot (with the EZ series), or adjust the Tool Settings (with the Superior
series), or both (again, with the Superior series).

Additionally, sometimes not all articulations are mapped by default.  In the
Nashville EZX, for example, the snare drum's Right Muted, Open Slap, Closed
Slap, Open Rim Right, and Open Rim Left articulations are not mapped to any
MIDI Note by default.  To play them on the default mapping, read on...

The asterisked articulations will often play a substitute articulation when
the asterisked articulation isn't available for the current kit piece/tool
selection.  It might even be substituted with one of the unmapped
articulations mentioned above.  (The substitutions are not user-editable.)

So when the "14-inch Ludwig Black Beauty - Fingers" kit piece is selected in
the Nashville EZX, many of the stick tool articulations become asterisked
and those articulations are now substituted with the otherwise-unmapped
articulations mentioned before.  Those Toontrack people are pretty smart. :)

Lastly, if you haven't seen it already, check out my
"Toontrack Drums - Default MIDI Mapping" spreadsheet...
https://spreadsheets.google.com/ccc?key=0AsWMEXuWvqSIdFBaNnBhTFBBZXJZb1F0UThzVXhibmc&hl=en
...it's got lots of fancy colors and prettiness to gawk at.



=== CREDITS ===

Thank you to everyone at Toontrack and Cockos for the excellent software,
and to all the helpful people on the forums!  Additionally, thank you to
the Notepad++ team for creating such a simple and useful text editor!



=== HELP MAKE IT BETTER! ===

I really want to be able to do two additional things with these Note Maps:
color-code them and re-order them so that all the kit pieces can be better
organized, grouped, and visualized.

Please cast a vote on the REAPER forum to get these features implemented...

- Colored Note Names
     Vote: http://forum.cockos.com/project.php?issueid=1233
     Discuss: http://forum.cockos.com/showthread.php?t=42978
- Re-Sortable Note Map
     Vote: http://forum.cockos.com/project.php?issueid=1402
     Discuss: http://forum.cockos.com/showthread.php?t=43919

And if you have any corrections/contributions to, problems/issues with,
suggestions/optimizations for, or even questions/dreams about these maps,
please feel free to send me a PM on the Toontrack forum.  I go by the
nickname "godprobe" there and elsewhere.  Thanks!  -jeff



=== CHANGELOG ===
2011.08.20 - version 1.04
- fixed a minor EZX Claustrophobic "renamed" mistake
- fixed extra entries in SDX Custom & Vintage "unique" and "minimal"
- added EZX Metalheads
- added EZX Number 1 Hits

2011.03.25 - Version 1.03
- added EZX The Classic / 4-Mic

2010.12.05 - Version 1.02
- fixed a minor SDX Hit Factory "unique" mistake
- added SDX Joe Barresi Evil Drums

2010.07.02 - Version 1.01
- fixed EZX Latin Percussion "unique" numbering
- added EZX Electronic

2010.05.20 - Version 1.00
- first release
