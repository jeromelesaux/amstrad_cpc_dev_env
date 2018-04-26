Update from v2.9.6 to v2.9.6b changelog:

- Fixed a problem in splash-screen on non-Windows OS
- Default soundbuffer changed to 4096 bytes to avoid sound lags on non-Windows OS
- Improved the JavaCPC MovieMaker, it is fps accurate now, and also simulteanously plays a mp3 file, if is present
- Added a cheat ;-)

Update from v2.9.4/5 to v2.9.6 changelog:

- Several bugfixes in JavaCPC Paint
- Rasterpaint: Re-arranged the GUI
- Fixed 4mb ram expansion port problems (Re-arranged port numbers)
- Fixed some Z80 cycles (Probably implemented new bugs now)
- Added possibility to update FutureOS ROMs directly from FutureOS Server (Menu: Help -> Check for FutureOS Update)
- New .EXE Icons (Thanks to Paul Barrick for the nice pixelart- CPC 464!)
- Major and minor bugfixes in CPC emulation
- Re-wrote PAL filter
- Re-wrote parts of the sound emulation (Tape-noise is seperated now and less annoying)
- Bugfix in FDC emulation: Fixed RPM and added "Match Sector" to commands
- Updated the startup-splash screen
- Bugfixes in MagicCPCDiskImage: Corrected filesize for binary and basic files, fixed filesize for creating directory
- RasterPaint: Added line-mode: INKs change each line only
- Added: New bugs, problems, funny behavior (As usual)

Update from v2.9.3 to v2.9.4 changelog:

- Fixed the raster code for RasterPaint. Old code caused bad behavior in FDC and PPI ports.
- Reimplemented port-behavior problems for FDC emulation. (I once disabled them, for internal testings)
- RasterPaint: Function added to export the raster screens directly as executable binaries.
- RasterPaint: Raster table and screen pixeldata are simply crunched now (When export binaries)
- Removed "New CPC / Old CPC" setting. For CPC Plus / New CPC you need the source file. By default it renders for old CPC.
- Added: RasterScreen.asm for developers (To assemble for New generation CPCs, too)

Update from v2.9.20 to 2.9.3 changelog:

- Added application "RasterPaint". Convert pictures to rasterized MODE 1 screens.
- Fixed "READ" , "INCLUDE" instructions in Z80 assembler
- Added "REPEAT", "REND" instructions in Z80 assembler
- Fixed GateArray raster change positions (More or less)
- Fixed a crash in CRTC / GA emulation
- Added several new bugs and problems :-P

Update from v2.9m to 2.9.20 changelog:

- Fixed FDC emulation (For some reason, games like Fres Fighter Turbo did not work)
- Bugfix in Assembler: READ "filename.asm" / INCLUDE "filename.asm" fixed.
- Minor bugfixes in GUI
- Added amstrad.eu chat
- Several minor fixes / improvements
- CPC display is now zoomable when you use your mousewheel

Update from v2.9l to 2.9m changelog:

- Fixed Roland Radio player application
- Removed (unnecessary) check for Update.jar, added it as manual menu entry: Help - Check JavaCPC
- Fixed some things in CRTC emulation (And probably added new bugs)
- Added CNGSoft's compacted games to Amstrad BDD
- Some minor fixes in CPC emulation (Nothing noticeable for the user)

Update from v2.9j to 2.9l changelog:

- Bugfixes in Amstrad BDD Gui, CPC-Power should work now, list is stored locally

Update from v2.9h to 2.9j changelog:

- Bugfixes in Amstrad BDD Gui, CPC-Power should work now in testmode
- RolandRadio added to Desktop (Listen and enjoy the music from rolandradio.net)
- Triple size option for display size added (Fuckings to GreatXerox :-P )
- Minor bugfix in FDC emulation

Update from v2.9e to 2.9h changelog:

- GUI improvements for BDD databases, CPC-Power added, but no database is available yet!
- RAM-Management rewritten and 4MB RAM expansion added
- Fixed faulty start of JavaCPC on non-Windows OS (Hopefully)
- Internal samples will not playback when non-Windows OS is detected

Update from v2.9 to 2.9e changelog:

- Hotfix in tape emulation, removed a bug, which caused a division by zero in some cases.
- RAM-ROM management rewritten. The emulator doesnt define a new CPC after each ROM change. Just changes the roms, and thats it.
- Added a nice startmenu to "AMSTRAD" logo, when used as Desktop.
- Small resetbutton added to emulator window.
- few GUI improvements for BDD databases. (You now can also search for a game)

Update from v2.8 to v2.9 changelog:

- BDD CPC file databases added: JavaCPC Games and JavaCPC Demos
- Z80 turbo mode integrated (Accessible in System configuration)
- Internal ROM font editor improved (Access: ALT + F11)

Update from v2.7 to v2.8 changelog:

- Amstrad.eu BDD added (Play games directly from <a href="http://www.amstrad.eu" rel="external">www.amstrad.eu</a> database)
- Bugfix in BASIC autotype and autoboot
- Some GUI changes
- Some parts are partially translated into German, French or Spanish (Translation is still in progress)