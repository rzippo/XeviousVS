# XeviousVS

Developed as project for Java Programming exam.
Focus of the project was to strictly follow a waterfall process to design a Java application, hence the folder structure indicating the steps of the process.

XeviousVS is a simple multiplayer game, where players control a space ship with the intent to hit and destroy the opponent's one, in a shoot 'em up fashion.
Given the scope and intent of the project, most technical issues are dealt lightly in order to achieve the simplest solution that works, prioritizing features presence (and documentation) over technical soundness.

Notably:
- Player history is recorded and shown at each login, that is games played, wins and win/loss ration. However there is no authentication, but direct database accesses.
- There is a matchmaking system to automatically find opponents to play with. This is implemented through a database table, which is directly accessed by clients.
- Communication between clients runs on TCP, and received commands are immediately executed. This leaves the game exposed to desynchronization issues due to network and processing delays.
- There is a game recovery system, which allow players to resume a game after one or both clients crash. To enstablish the new connection clients use a database table which is directly accessed, similarly to the matchmaking phase.