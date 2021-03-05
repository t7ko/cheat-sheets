
Screen is a linux utility to create login sessions that do not depend on a
terminal.

* Initial config:
   * vim ~/.screenrc
   * Add:
      * `autodetach on`

* Create a session:
   * `screen -S NAME`
   * If it fails "cannot open your terminal":
      * run `script /dev/null`
      * try screen again
      * also, read this: https://makandracards.com/makandra/2533-solve-screen-error-cannot-open-your-terminal-dev-pts-0-please-check
* Disconnect/detach:
   * `CTRL-A CTRL-D`
   * or
   * `CTRL-A : detach <Enter>`
* Exit:
   * `CTRL-A \` -- kills all windows and programs in a session.
* Reattach:
   * `screen -r` -- if only one session
   * `screen -ls` -- see list of sessions
   * `screen -S NAME` -- to reattach named session by name
   * `screen -rd PID` -- if already attached (e.g. lost internet while
     connected).  `PID` to be taken from `screen -ls`.
* Windows:
   * `ctrl-a c` create new
   * `ctrl-a n` switch to next
   * `ctrl-a p` switch to previous
   * `hardstatus alwayslastline '%{= kg}[ %{G}%H %{g}][%= %{= kB}%?%-Lw%?%{+b r}(%{G}%n*%f %t%?(%u)%?%{r})%{-b B}%?%+Lw%?%?%= %{g}%]'`
      * add this line to .screenrc
* 
