
; )package "BOOT"

(IN-PACKAGE "BOOT")

; makeLongStatStringByProperty _
;  (listofnames, listofclasses, property, classproperty, units, flag) ==
;   total := 0
;   str := '""
;   otherStatTotal := GET('other, property)
;   insignificantStat := 0
;   for [name,class,:ab] in listofnames repeat
;     cl := first LASSOC(class, listofclasses)
;     n := GET(name, property)
;     PUT(cl, classproperty, n + GET(cl, classproperty))
;     total := total + n
;     name = 'other or flag ~= 'long => 'iterate
;     if significantStat? n then
;         str := makeStatString(str, n, name, flag)
;     else
;         insignificantStat := insignificantStat + n
;   if flag = 'long then
;     str := makeStatString(str, otherStatTotal + insignificantStat, 'other, flag)
;   else
;     for [class,name,:ab] in listofclasses repeat
;       n := GET(name, classproperty)
;       str := makeStatString(str, n, ab, flag)
;   total := STRCONC(normalizeStatAndStringify total,'" ", units)
;   str = '"" =>  total
;   STRCONC(str, '" = ", total)

(DEFUN |makeLongStatStringByProperty|
       (|listofnames| |listofclasses| |property| |classproperty| |units|
        |flag|)
  (PROG (|total| |str| |otherStatTotal| |insignificantStat| |name| |ISTMP#1|
         |class| |ab| |cl| |n|)
    (RETURN
     (PROGN
      (SETQ |total| 0)
      (SETQ |str| "")
      (SETQ |otherStatTotal| (GET '|other| |property|))
      (SETQ |insignificantStat| 0)
      ((LAMBDA (|bfVar#2| |bfVar#1|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#1|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#1|))
                  (SETQ |ISTMP#1| (CDR |bfVar#1|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |class| (CAR |ISTMP#1|))
                        (SETQ |ab| (CDR |ISTMP#1|))
                        #1#)))
                 (PROGN
                  (SETQ |cl| (CAR (LASSOC |class| |listofclasses|)))
                  (SETQ |n| (GET |name| |property|))
                  (PUT |cl| |classproperty| (+ |n| (GET |cl| |classproperty|)))
                  (SETQ |total| (+ |total| |n|))
                  (COND
                   ((OR (EQ |name| '|other|) (NOT (EQ |flag| '|long|)))
                    '|iterate|)
                   (#1#
                    (COND
                     ((|significantStat?| |n|)
                      (SETQ |str| (|makeStatString| |str| |n| |name| |flag|)))
                     (#1#
                      (SETQ |insignificantStat|
                              (+ |insignificantStat| |n|))))))))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |listofnames| NIL)
      (COND
       ((EQ |flag| '|long|)
        (SETQ |str|
                (|makeStatString| |str|
                 (+ |otherStatTotal| |insignificantStat|) '|other| |flag|)))
       (#1#
        ((LAMBDA (|bfVar#4| |bfVar#3|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#4|)
                  (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#3|)
                   (PROGN
                    (SETQ |class| (CAR |bfVar#3|))
                    (SETQ |ISTMP#1| (CDR |bfVar#3|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |name| (CAR |ISTMP#1|))
                          (SETQ |ab| (CDR |ISTMP#1|))
                          #1#)))
                   (PROGN
                    (SETQ |n| (GET |name| |classproperty|))
                    (SETQ |str| (|makeStatString| |str| |n| |ab| |flag|))))))
            (SETQ |bfVar#4| (CDR |bfVar#4|))))
         |listofclasses| NIL)))
      (SETQ |total|
              (STRCONC (|normalizeStatAndStringify| |total|) " " |units|))
      (COND ((EQUAL |str| "") |total|) (#1# (STRCONC |str| " = " |total|)))))))

; normalizeStatAndStringify t ==
;   FLOATP t =>
;       not significantStat? t => '"0"
;       fmtStr := STRCONC('"~,", STRINGIMAGE $timePrintDigits, '"F")
;       FORMAT(nil, fmtStr, t)
;   INTEGERP t => FORMAT(nil, '"~:d", t)
;   STRINGIMAGE t

(DEFUN |normalizeStatAndStringify| (|t|)
  (PROG (|fmtStr|)
    (RETURN
     (COND
      ((FLOATP |t|)
       (COND ((NULL (|significantStat?| |t|)) "0")
             (#1='T
              (PROGN
               (SETQ |fmtStr|
                       (STRCONC "~," (STRINGIMAGE |$timePrintDigits|) "F"))
               (FORMAT NIL |fmtStr| |t|)))))
      ((INTEGERP |t|) (FORMAT NIL "~:d" |t|)) (#1# (STRINGIMAGE |t|))))))

; makeStatString(oldstr,time,abb,flag) ==
;   not significantStat? time => oldstr
;   opening := (flag = 'long => '"("; '" (")
;   timestr := normalizeStatAndStringify time
;   oldstr = '"" => STRCONC(timestr, opening, abb, '")")
;   STRCONC(oldstr, '" + ", timestr, opening, abb, '")")

(DEFUN |makeStatString| (|oldstr| |time| |abb| |flag|)
  (PROG (|opening| |timestr|)
    (RETURN
     (COND ((NULL (|significantStat?| |time|)) |oldstr|)
           (#1='T
            (PROGN
             (SETQ |opening| (COND ((EQ |flag| '|long|) "(") (#1# " (")))
             (SETQ |timestr| (|normalizeStatAndStringify| |time|))
             (COND
              ((EQUAL |oldstr| "") (STRCONC |timestr| |opening| |abb| ")"))
              (#1#
               (STRCONC |oldstr| " + " |timestr| |opening| |abb| ")")))))))))

; significantStat? s ==
;   INTEGERP s => s ~= 0
;   s >= 0.1^$timePrintDigits

(DEFUN |significantStat?| (|s|)
  (PROG ()
    (RETURN
     (COND ((INTEGERP |s|) (NOT (EQL |s| 0)))
           ('T (NOT (< |s| (EXPT 0.1 |$timePrintDigits|))))))))

; peekTimedName() == IFCAR $timedNameStack

(DEFUN |peekTimedName| () (PROG () (RETURN (IFCAR |$timedNameStack|))))

; popTimedName() ==
;   name := IFCAR $timedNameStack
;   $timedNameStack := IFCDR $timedNameStack
;   name

(DEFUN |popTimedName| ()
  (PROG (|name|)
    (RETURN
     (PROGN
      (SETQ |name| (IFCAR |$timedNameStack|))
      (SETQ |$timedNameStack| (IFCDR |$timedNameStack|))
      |name|))))

; pushTimedName name ==
;   PUSH(name,$timedNameStack)

(DEFUN |pushTimedName| (|name|)
  (PROG () (RETURN (PUSH |name| |$timedNameStack|))))

; startTimingProcess name ==
;   updateTimedName peekTimedName()
;   pushTimedName name

(DEFUN |startTimingProcess| (|name|)
  (PROG ()
    (RETURN
     (PROGN (|updateTimedName| (|peekTimedName|)) (|pushTimedName| |name|)))))

; stopTimingProcess name ==
;   (name ~= peekTimedName()) and null $InteractiveMode =>
;     keyedSystemError("S2GL0015",[name,peekTimedName()])
;   updateTimedName peekTimedName()
;   popTimedName()

(DEFUN |stopTimingProcess| (|name|)
  (PROG ()
    (RETURN
     (COND
      ((AND (NOT (EQUAL |name| (|peekTimedName|))) (NULL |$InteractiveMode|))
       (|keyedSystemError| 'S2GL0015 (LIST |name| (|peekTimedName|))))
      ('T (PROGN (|updateTimedName| (|peekTimedName|)) (|popTimedName|)))))))

; DEFPARAMETER($oldElapsedSpace, 0)

(DEFPARAMETER |$oldElapsedSpace| 0)

; DEFPARAMETER($oldElapsedGCTime, 0.0)

(DEFPARAMETER |$oldElapsedGCTime| 0.0)

; DEFPARAMETER($oldElapsedTime, 0.0)

(DEFPARAMETER |$oldElapsedTime| 0.0)

; DEFPARAMETER($timePrintDigits, 2)

(DEFPARAMETER |$timePrintDigits| 2)

; DEFPARAMETER($timedNameStack, '(other))

(DEFPARAMETER |$timedNameStack| '(|other|))

; DEFPARAMETER($interpreterTimedNames, '(
; -- name         class abbrev
;   (algebra        2 .   B) _
;   (analysis       1 .   A) _
;   (coercion       1 .   C) _
;   (compilation    3 .   T) _
;   (debug          3 .   D) _
;   (evaluation     2 .   E) _
;   (gc             4 .   G) _
;   (history        3 .   H) _
;   (instantiation  3 .   I) _
;   (load           3 .   L) _
;   (modemaps       1 .   M) _
;   (optimization   3 .   Z) _
;   (querycoerce    1 .   Q) _
;   (other          3 .   O) _
;   (diskread       3 .   K) _
;   (resolve        1 .   R) _
;   (print          3 .   P) _
;   ))

(DEFPARAMETER |$interpreterTimedNames|
  '((|algebra| 2 . B) (|analysis| 1 . A) (|coercion| 1 . C)
    (|compilation| 3 . T) (|debug| 3 . D) (|evaluation| 2 . E) (|gc| 4 . G)
    (|history| 3 . H) (|instantiation| 3 . I) (|load| 3 . L) (|modemaps| 1 . M)
    (|optimization| 3 . Z) (|querycoerce| 1 . Q) (|other| 3 . O)
    (|diskread| 3 . K) (|resolve| 1 . R) (|print| 3 . P)))

; DEFPARAMETER($interpreterTimedClasses, '(
; -- number class name    short name
;   ( 1    interpreter     .  IN) _
;   ( 2    evaluation      .  EV) _
;   ( 3    other           .  OT) _
;   ( 4    reclaim         .  GC) _
;   ))

(DEFPARAMETER |$interpreterTimedClasses|
  '((1 |interpreter| . IN) (2 |evaluation| . EV) (3 |other| . OT)
    (4 |reclaim| . GC)))

; initializeTimedNames(listofnames,listofclasses) ==
;   for [name,:.] in listofnames repeat
;     PUT(name, 'TimeTotal, 0.0)
;     PUT(name, 'SpaceTotal,  0)
;   for [.,name,:.] in listofclasses repeat
;     PUT( name, 'ClassTimeTotal, 0.0)
;     PUT( name, 'ClassSpaceTotal,  0)
;   $timedNameStack := '(other)
;   computeElapsedTime()
;   computeElapsedSpace()
;   PUT('gc, 'TimeTotal, 0.0)
;   PUT('gc, 'SpaceTotal,  0)
;   NIL

(DEFUN |initializeTimedNames| (|listofnames| |listofclasses|)
  (PROG (|name| |ISTMP#1|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#6| |bfVar#5|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#5|) (PROGN (SETQ |name| (CAR |bfVar#5|)) #1#)
                 (PROGN
                  (PUT |name| '|TimeTotal| 0.0)
                  (PUT |name| '|SpaceTotal| 0)))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))))
       |listofnames| NIL)
      ((LAMBDA (|bfVar#8| |bfVar#7|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |bfVar#7| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#7|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bfVar#7|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |name| (CAR |ISTMP#1|)) #1#)))
                 (PROGN
                  (PUT |name| '|ClassTimeTotal| 0.0)
                  (PUT |name| '|ClassSpaceTotal| 0)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |listofclasses| NIL)
      (SETQ |$timedNameStack| '(|other|))
      (|computeElapsedTime|)
      (|computeElapsedSpace|)
      (PUT '|gc| '|TimeTotal| 0.0)
      (PUT '|gc| '|SpaceTotal| 0)
      NIL))))

; updateTimedName name ==
;   count := (GET(name, 'TimeTotal) or 0) + computeElapsedTime()
;   PUT(name, 'TimeTotal, count)
;   count := (GET(name, 'SpaceTotal) or 0) + computeElapsedSpace()
;   PUT(name, 'SpaceTotal, count)

(DEFUN |updateTimedName| (|name|)
  (PROG (|count|)
    (RETURN
     (PROGN
      (SETQ |count|
              (+ (OR (GET |name| '|TimeTotal|) 0) (|computeElapsedTime|)))
      (PUT |name| '|TimeTotal| |count|)
      (SETQ |count|
              (+ (OR (GET |name| '|SpaceTotal|) 0) (|computeElapsedSpace|)))
      (PUT |name| '|SpaceTotal| |count|)))))

; makeLongTimeString(listofnames,listofclasses) ==
;   makeLongStatStringByProperty(listofnames, listofclasses,  _
;                                'TimeTotal, 'ClassTimeTotal, _
;                                '"sec", $printTimeIfTrue)

(DEFUN |makeLongTimeString| (|listofnames| |listofclasses|)
  (PROG ()
    (RETURN
     (|makeLongStatStringByProperty| |listofnames| |listofclasses| '|TimeTotal|
      '|ClassTimeTotal| "sec" |$printTimeIfTrue|))))

; makeLongSpaceString(listofnames,listofclasses) ==
;   makeLongStatStringByProperty(listofnames, listofclasses,    _
;                                'SpaceTotal, 'ClassSpaceTotal, _
;                                '"bytes", $printStorageIfTrue)

(DEFUN |makeLongSpaceString| (|listofnames| |listofclasses|)
  (PROG ()
    (RETURN
     (|makeLongStatStringByProperty| |listofnames| |listofclasses|
      '|SpaceTotal| '|ClassSpaceTotal| "bytes" |$printStorageIfTrue|))))

; DEFPARAMETER($inverseTimerTicksPerSecond, 1.0/$timerTicksPerSecond)

(DEFPARAMETER |$inverseTimerTicksPerSecond| (/ 1.0 |$timerTicksPerSecond|))

; computeElapsedTime() ==
;   currentTime:= get_run_time()
;   currentGCTime:= elapsedGcTime()
;   gcDelta := currentGCTime - $oldElapsedGCTime
;   elapsedSeconds:= $inverseTimerTicksPerSecond *
;      (currentTime-$oldElapsedTime-gcDelta)
;   PUT('gc, 'TimeTotal, GET('gc, 'TimeTotal) +
;                    $inverseTimerTicksPerSecond*gcDelta)
;   $oldElapsedTime := currentTime
;   $oldElapsedGCTime := currentGCTime
;   elapsedSeconds

(DEFUN |computeElapsedTime| ()
  (PROG (|elapsedSeconds| |gcDelta| |currentGCTime| |currentTime|)
    (RETURN
     (PROGN
      (SETQ |currentTime| (|get_run_time|))
      (SETQ |currentGCTime| (|elapsedGcTime|))
      (SETQ |gcDelta| (- |currentGCTime| |$oldElapsedGCTime|))
      (SETQ |elapsedSeconds|
              (* |$inverseTimerTicksPerSecond|
                 (- (- |currentTime| |$oldElapsedTime|) |gcDelta|)))
      (PUT '|gc| '|TimeTotal|
       (+ (GET '|gc| '|TimeTotal|)
          (* |$inverseTimerTicksPerSecond| |gcDelta|)))
      (SETQ |$oldElapsedTime| |currentTime|)
      (SETQ |$oldElapsedGCTime| |currentGCTime|)
      |elapsedSeconds|))))

; computeElapsedSpace() ==
;   currentElapsedSpace := HEAPELAPSED()
;   elapsedBytes := currentElapsedSpace - $oldElapsedSpace
;   $oldElapsedSpace := currentElapsedSpace
;   elapsedBytes

(DEFUN |computeElapsedSpace| ()
  (PROG (|elapsedBytes| |currentElapsedSpace|)
    (RETURN
     (PROGN
      (SETQ |currentElapsedSpace| (HEAPELAPSED))
      (SETQ |elapsedBytes| (- |currentElapsedSpace| |$oldElapsedSpace|))
      (SETQ |$oldElapsedSpace| |currentElapsedSpace|)
      |elapsedBytes|))))

; timedAlgebraEvaluation(code) ==
;   startTimingProcess 'algebra
;   r := eval code
;   stopTimingProcess 'algebra
;   r

(DEFUN |timedAlgebraEvaluation| (|code|)
  (PROG (|r|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|algebra|)
      (SETQ |r| (|eval| |code|))
      (|stopTimingProcess| '|algebra|)
      |r|))))

; timedOptimization(code) ==
;   startTimingProcess 'optimization
;   r := lispize code
;   if $reportOptimization then
;     sayBrightlyI bright '"Optimized LISP code:"
;     pp r
;   stopTimingProcess 'optimization
;   r

(DEFUN |timedOptimization| (|code|)
  (PROG (|r|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|optimization|)
      (SETQ |r| (|lispize| |code|))
      (COND
       (|$reportOptimization|
        (|sayBrightlyI| (|bright| "Optimized LISP code:")) (|pp| |r|)))
      (|stopTimingProcess| '|optimization|)
      |r|))))

; timedEVALFUN(code) ==
;   startTimingProcess 'evaluation
;   r := timedEvaluate code
;   stopTimingProcess 'evaluation
;   r

(DEFUN |timedEVALFUN| (|code|)
  (PROG (|r|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|evaluation|)
      (SETQ |r| (|timedEvaluate| |code|))
      (|stopTimingProcess| '|evaluation|)
      |r|))))

; timedEvaluate code ==
;   code is ["LIST",:a] and #a > 200 =>
;     "append"/[eval ["LIST",:x] for x in splitIntoBlocksOf200 a]
;   eval code

(DEFUN |timedEvaluate| (|code|)
  (PROG (|a|)
    (RETURN
     (COND
      ((AND (CONSP |code|) (EQ (CAR |code|) 'LIST)
            (PROGN (SETQ |a| (CDR |code|)) #1='T) (< 200 (LENGTH |a|)))
       ((LAMBDA (|bfVar#10| |bfVar#9| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#9|) (PROGN (SETQ |x| (CAR |bfVar#9|)) NIL))
             (RETURN |bfVar#10|))
            (#1#
             (SETQ |bfVar#10| (APPEND |bfVar#10| (|eval| (CONS 'LIST |x|))))))
           (SETQ |bfVar#9| (CDR |bfVar#9|))))
        NIL (|splitIntoBlocksOf200| |a|) NIL))
      (#1# (|eval| |code|))))))
