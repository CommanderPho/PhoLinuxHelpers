

KDE Plasma did the window glitching square thing and then crashed completely. I did [Ctrl] + [Meta] + [Esc] which presents that weird "X" cursor. I realized it was to kill what was clicked on for the first time, and clicked on the locked-up background. 
It was killed and went entirely black. I unplugged my third monitor too.

kde



# Restic
```bash
    [halechr@LNX00052 External]$ kstart5 plasmashell
    Omitting both --window and --windowclass arguments is not recommended
    [halechr@LNX00052 External]$ kf.plasma.quick: Applet preload policy set to 1
    QObject::connect: No such slot DesktopProtocol::_k_slotRedirection(KIO::Job *, QUrl)
    file:///home/halechr/.local/share/plasma/plasmoids/org.kde.plasma.kickoff/contents/ui/Kickoff.qml:87: TypeError: Cannot read property 'height' of null
    file:///home/halechr/.local/share/plasma/plasmoids/org.kde.plasma.kickoff/contents/ui/Kickoff.qml:63: TypeError: Cannot read property 'height' of null
    QObject::connect: No such slot DesktopProtocol::_k_slotRedirection(KIO::Job *, QUrl)
    QObject::connect: No such slot DesktopProtocol::_k_slotRedirection(KIO::Job *, QUrl)
    Cyclic dependency detected between "file:///usr/share/plasma/plasmoids/org.kde.plasma.notifications/contents/ui/global/Globals.qml" and "file:///usr/share/plasma/plasmoids/org.kde.plasma.notifications/contents/ui/NotificationHeader.qml"
    Cyclic dependency detected between "file:///usr/share/plasma/plasmoids/org.kde.plasma.notifications/contents/ui/global/Globals.qml" and "file:///usr/share/plasma/plasmoids/org.kde.plasma.notifications/contents/ui/ThumbnailStrip.qml"
    file:///usr/share/plasma/plasmoids/org.kde.kscreen/contents/ui/main.qml:30:5: Unable to assign [undefined] to bool
    file:///usr/share/plasma/plasmoids/org.kde.plasma.networkmanagement/contents/ui/main.qml:95: TypeError: Cannot read property 'airplaneModeAvailable' of null
    qml: PlasmaExtras.ScrollArea is deprecated. Use PlasmaComponents3.ScrollView instead.
    QFont::setPointSizeF: Point size <= 0 (0.000000), must be greater than 0
    org.kde.plasma.pulseaudio: No object for name "alsa_output.pci-0000_00_1f.3.analog-stereo.monitor"
    QObject::connect: No such slot DesktopProtocol::_k_slotRedirection(KIO::Job *, QUrl)
    QObject::connect: No such slot DesktopProtocol::_k_slotRedirection(KIO::Job *, QUrl)
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/share/plasma/plasmoids/org.kde.plasma.battery/contents/ui/CompactRepresentation.qml:61:17: Unable to assign [undefined] to int
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    file:///usr/lib64/qt5/qml/org/kde/plasma/extras/PlaceholderMessage.qml:238:5: QML Heading: Binding loop detected for property "verticalAlignment"
    trying to show an empty dialog
    libva error: vaGetDriverNameByIndex() failed with unknown libva error, driver_name = (null)
    (node:198760) [DEP0005] DeprecationWarning: Buffer() is deprecated due to security and usability issues. Please use the Buffer.alloc(), Buffer.allocUnsafe(), or Buffer.from() methods instead.
    (Use `gitkraken --trace-deprecation ...` to show where the warning was created)
    (node:198760) [DEP0106] DeprecationWarning: crypto.createDecipher is deprecated.
    state:  unavailable
    Error: Could not connect to service. Please check your internet connection.
        at TerminalError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132060)
        at D.throwForCommonIssueTrackerErrors (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132257)
        at handleError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:113095)
        at handleError.next (<anonymous>)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748165)
        at Object.currCb [as cont] (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748555)
        at end (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746896)
        at D.cont (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746404)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748214)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
        at /usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747721
        at digestEffect (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748793)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748230)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276) {
    isTerminalError: true
    }
    The above error occurred in task call

    (node:198760) UnhandledPromiseRejectionWarning: Error: Could not connect to service. Please check your internet connection.
        at TerminalError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132060)
        at D.throwForCommonIssueTrackerErrors (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132257)
        at handleError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:113095)
        at handleError.next (<anonymous>)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748165)
        at Object.currCb [as cont] (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748555)
        at end (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746896)
        at D.cont (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746404)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748214)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
        at /usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747721
        at digestEffect (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748793)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748230)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
    (node:198760) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). To terminate the node process on unhandled promise rejection, use the CLI flag `--unhandled-rejections=strict` (see https://nodejs.org/api/cli.html#cli_unhandled_rejections_mode). (rejection id: 4)
    (node:198760) UnhandledPromiseRejectionWarning: Error: Could not connect to service. Please check your internet connection.
        at TerminalError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132060)
        at D.throwForCommonIssueTrackerErrors (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132257)
        at handleError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:113095)
        at handleError.next (<anonymous>)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748165)
        at Object.currCb [as cont] (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748555)
        at end (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746896)
        at D.cont (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746404)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748214)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
        at /usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747721
        at digestEffect (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748793)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748230)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
    (node:198760) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). To terminate the node process on unhandled promise rejection, use the CLI flag `--unhandled-rejections=strict` (see https://nodejs.org/api/cli.html#cli_unhandled_rejections_mode). (rejection id: 5)
    (node:198760) UnhandledPromiseRejectionWarning: Error: Could not connect to service. Please check your internet connection.
        at TerminalError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132060)
        at D.throwForCommonIssueTrackerErrors (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132257)
        at handleError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:113095)
        at handleError.next (<anonymous>)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748165)
        at Object.currCb [as cont] (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748555)
        at end (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746896)
        at D.cont (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746404)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748214)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
        at /usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747721
        at digestEffect (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748793)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748230)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
    (node:198760) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). To terminate the node process on unhandled promise rejection, use the CLI flag `--unhandled-rejections=strict` (see https://nodejs.org/api/cli.html#cli_unhandled_rejections_mode). (rejection id: 6)
    (node:198760) UnhandledPromiseRejectionWarning: Error: Could not connect to service. Please check your internet connection.
        at TerminalError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132060)
        at D.throwForCommonIssueTrackerErrors (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132257)
        at handleError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:113095)
        at handleError.next (<anonymous>)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748165)
        at Object.currCb [as cont] (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748555)
        at end (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746896)
        at D.cont (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746404)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748214)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
        at /usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747721
        at digestEffect (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748793)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748230)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
    (node:198760) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). To terminate the node process on unhandled promise rejection, use the CLI flag `--unhandled-rejections=strict` (see https://nodejs.org/api/cli.html#cli_unhandled_rejections_mode). (rejection id: 7)
    (node:198760) UnhandledPromiseRejectionWarning: Error: Could not connect to service. Please check your internet connection.
        at TerminalError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132060)
        at D.throwForCommonIssueTrackerErrors (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:132257)
        at handleError (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:113095)
        at handleError.next (<anonymous>)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748165)
        at Object.currCb [as cont] (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748555)
        at end (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746896)
        at D.cont (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4746404)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748214)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
        at /usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747721
        at digestEffect (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748793)
        at next (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4748230)
        at proc (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4747938)
        at pe.<computed> (/usr/share/gitkraken/resources/app.asar/src/main/static/main.bundle.js:2:4743276)
    (node:198760) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). To terminate the node process on unhandled promise rejection, use the CLI flag `--unhandled-rejections=strict` (see https://nodejs.org/api/cli.html#cli_unhandled_rejections_mode). (rejection id: 8)
    state:  checking
    state:  available
    [1] Running command (/usr/bin): '/usr/bin/git' 'version'
    [2] Running command (/bin): '/bin/git' 'version'
    [2] finished in 0.008s, code: 0
    [1] finished in 0.016s, code: 0


```

