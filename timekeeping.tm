<TeXmacs|2.1>

<style|<tuple|generic|literate>>

<\body>
  <doc-data|<doc-title|Time Keeping with TeXmacs>>

  <section|Goals>

  <\itemize>
    <item>I want to be able to define tasks in a document

    <item>I want to be able to measure the time I work on a task with a
    start- and a stop-timer

    <item>I want to be able to tell if a task is <em|todo>, <em|in progress>
    or <em|done>
  </itemize>

  <section|Needed Modules>

  <\scm-chunk|timekeeping/progs/timekeeping.scm|false|true>
    (use-modules (ice-9 match))
  </scm-chunk>

  <section|Keeping Time>

  For the purpose of keeping the total time spent on a task, we will define a
  global variable: <scm|start-time>, which holds the <scm|(current-time)>
  from when the task was begun.

  <\scm-chunk|timekeeping/progs/timekeeping.scm|true|true>
    (define start-time #f)

    \;

    (define (start-task)

    \ \ (set! start-time (current-time)))
  </scm-chunk>

  Then, when the task is done, we just need to get the <scm|(current-time)>
  again, get the difference, compute a human-readable time format from that
  and we're done!

  <\scm-chunk|timekeeping/progs/timekeeping.scm|true|true>
    (define (seconds-\<gtr\>minutes-w/o-hours sec)

    \ \ (modulo (inexact-\<gtr\>exact (round (/ sec 60.0))) 60))

    \;

    (define (seconds-\<gtr\>hours-w/o-minutes sec)

    \ \ (inexact-\<gtr\>exact (round (/ sec 3600.0))))

    \;

    (define (seconds-\<gtr\>time sec)

    \ \ (let ((minutes (seconds-\<gtr\>minutes-w/o-hours sec))

    \ \ \ \ \ \ \ \ (hours (seconds-\<gtr\>hours-w/o-minutes sec)))

    \ \ \ \ (string-concatenate (list (number-\<gtr\>string hours)\ 

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ":"

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (number-\<gtr\>string
    minutes)))))

    \;

    (define (stop-task)

    \ \ (let* ((finish-time (current-time))

    \ \ \ \ \ \ \ \ \ (diff (abs (- finish-time start-time))))

    \ \ \ \ (seconds-\<gtr\>time diff)))
  </scm-chunk>

  <section|User Interface>

  This next code block defines two shortcuts: <verbatim|start.> just starts
  the timer and <verbatim|stop.> stops it and inserts the time that has
  passed.

  <\scm-chunk|timekeeping/progs/timekeeping.scm|true|false>
    (kbd-map\ 

    \ \ ("s t a r t ." (start-task))

    \ \ ("s t o p ." (insert (stop-task)))))
  </scm-chunk>

  <section|Defining the plugin>

  <\scm-chunk|timekeeping/progs/init-timekeeping.scm|false|false>
    (plugin-configure timekeeping

    \ \ (:require #t))

    \;

    (load "timekeeping.scm")
  </scm-chunk>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|5|2>>
    <associate|chunk-timekeeping/progs/init-timekeeping.scm-1|<tuple|timekeeping/progs/init-timekeeping.scm|?>>
    <associate|chunk-timekeeping/progs/timekeeping.scm-1|<tuple|timekeeping/progs/timekeeping.scm|?>>
    <associate|chunk-timekeeping/progs/timekeeping.scm-2|<tuple|timekeeping/progs/timekeeping.scm|?>>
    <associate|chunk-timekeeping/progs/timekeeping.scm-3|<tuple|timekeeping/progs/timekeeping.scm|?>>
    <associate|chunk-timekeeping/progs/timekeeping.scm-4|<tuple|timekeeping/progs/timekeeping.scm|?>>
    <associate|chunk-~/.TeXmacs/plugins/timekeeping/progs/init-timekeeping.scm-1|<tuple|~/.TeXmacs/plugins/timekeeping/progs/init-timekeeping.scm|2>>
    <associate|chunk-~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm-1|<tuple|~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm|1>>
    <associate|chunk-~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm-2|<tuple|~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm|1>>
    <associate|chunk-~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm-3|<tuple|~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm|1>>
    <associate|chunk-~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm-4|<tuple|~/.TeXmacs/plugins/timekeeping/progs/timekeeping.scm|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Goals>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Needed
      Modules> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Keeping
      Time> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>User
      Interface> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Defining
      the plugin> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>