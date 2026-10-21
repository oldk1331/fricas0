
; )package "BOOT"

(IN-PACKAGE "BOOT")

; syGeneralErrorHere() ==
;    pos := tokPosn($stok)
;    ncSoftError(pos, '"Improper syntax.", [])

(DEFUN |syGeneralErrorHere| ()
  (PROG (|pos|)
    (RETURN
     (PROGN
      (SETQ |pos| (|tokPosn| |$stok|))
      (|ncSoftError| |pos| "Improper syntax." NIL)))))

; syIgnoredFromTo(pos1, pos2) ==
;   if pfGlobalLinePosn pos1 = pfGlobalLinePosn pos2 then
;       ncSoftError(position_from_to(pos1, pos2), '"Ignored.", [])
;   else
;       ncSoftError(position_from(pos1), '"Ignored from here", [])
;       ncSoftError(position_to(pos2), '"to here.", [])

(DEFUN |syIgnoredFromTo| (|pos1| |pos2|)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL (|pfGlobalLinePosn| |pos1|) (|pfGlobalLinePosn| |pos2|))
       (|ncSoftError| (|position_from_to| |pos1| |pos2|) "Ignored." NIL))
      ('T (|ncSoftError| (|position_from| |pos1|) "Ignored from here" NIL)
       (|ncSoftError| (|position_to| |pos2|) "to here." NIL))))))

; npMissingMate(close,open)==
;    ncSoftError(tokPosn open, '"Missing mate.", [])
;    npMissing close

(DEFUN |npMissingMate| (|close| |open|)
  (PROG ()
    (RETURN
     (PROGN
      (|ncSoftError| (|tokPosn| |open|) "Missing mate." NIL)
      (|npMissing| |close|)))))

; npMissing s==
;    ncSoftError(tokPosn($stok), '"Possibly missing a %b %1 %d", [PNAME(s)])
;    THROW("TRAPPOINT","TRAPPED")

(DEFUN |npMissing| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      (|ncSoftError| (|tokPosn| |$stok|) "Possibly missing a %b %1 %d"
       (LIST (PNAME |s|)))
      (THROW 'TRAPPOINT 'TRAPPED)))))

; pfSourceStok x==
;        if pfLeaf? x
;        then x
;        else if null pfParts x
;             then 'NoToken
;             else pfSourceStok pfFirst x

(DEFUN |pfSourceStok| (|x|)
  (PROG ()
    (RETURN
     (COND ((|pfLeaf?| |x|) |x|) ((NULL (|pfParts| |x|)) '|NoToken|)
           ('T (|pfSourceStok| (|pfFirst| |x|)))))))

; npTrapForm(x)==
;    a:=pfSourceStok x
;    EQ(a,'NoToken)=>
;          syGeneralErrorHere()
;          THROW("TRAPPOINT","TRAPPED")
;    np_trap_form(a)

(DEFUN |npTrapForm| (|x|)
  (PROG (|a|)
    (RETURN
     (PROGN
      (SETQ |a| (|pfSourceStok| |x|))
      (COND
       ((EQ |a| '|NoToken|)
        (PROGN (|syGeneralErrorHere|) (THROW 'TRAPPOINT 'TRAPPED)))
       ('T (|np_trap_form| |a|)))))))

; np_trap_form(a) ==
;    ncSoftError(tokPosn(a), '"Improper syntax.", [])
;    THROW("TRAPPOINT","TRAPPED")

(DEFUN |np_trap_form| (|a|)
  (PROG ()
    (RETURN
     (PROGN
      (|ncSoftError| (|tokPosn| |a|) "Improper syntax." NIL)
      (THROW 'TRAPPOINT 'TRAPPED)))))

; npTrap()== np_trap_form($stok)

(DEFUN |npTrap| () (PROG () (RETURN (|np_trap_form| |$stok|))))

; npRecoverTrap()==
;   npFirstTok()
;   pos1 := tokPosn $stok
;   npMoveTo 0
;   pos2 := tokPosn $stok
;   syIgnoredFromTo(pos1, pos2)
;   npPush [pfWrong(pfDocument ['"pile syntax error"],pfListOf [])]

(DEFUN |npRecoverTrap| ()
  (PROG (|pos2| |pos1|)
    (RETURN
     (PROGN
      (|npFirstTok|)
      (SETQ |pos1| (|tokPosn| |$stok|))
      (|npMoveTo| 0)
      (SETQ |pos2| (|tokPosn| |$stok|))
      (|syIgnoredFromTo| |pos1| |pos2|)
      (|npPush|
       (LIST
        (|pfWrong| (|pfDocument| (LIST "pile syntax error"))
         (|pfListOf| NIL))))))))

; npListAndRecover(f)==
;    a:=$stack
;    b:=nil
;    $stack:=nil
;    done:=false
;    c:=$inputStream
;    while not done repeat
;      found:=CATCH("TRAPPOINT",APPLY(f,nil))
;      if found="TRAPPED"
;      then
;         $inputStream:=c
;         npRecoverTrap()
;      else if not found
;           then
;             $inputStream:=c
;             syGeneralErrorHere()
;             npRecoverTrap()
;      if npEqKey "BACKSET"
;      then
;         c:=$inputStream
;      else if npEqPeek "BACKTAB"
;           then
;              done:=true
;           else
;             $inputStream:=c
;             syGeneralErrorHere()
;             npRecoverTrap()
;             if npEqPeek "BACKTAB"
;             then done:=true
;             else
;                 npNext()
;                 c:=$inputStream
;      b:=cons(npPop1(),b)
;    $stack:=a
;    npPush NREVERSE b

(DEFUN |npListAndRecover| (|f|)
  (PROG (|a| |b| |done| |c| |found|)
    (RETURN
     (PROGN
      (SETQ |a| |$stack|)
      (SETQ |b| NIL)
      (SETQ |$stack| NIL)
      (SETQ |done| NIL)
      (SETQ |c| |$inputStream|)
      ((LAMBDA ()
         (LOOP
          (COND (|done| (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |found| (CATCH 'TRAPPOINT (APPLY |f| NIL)))
                  (COND
                   ((EQ |found| 'TRAPPED) (SETQ |$inputStream| |c|)
                    (|npRecoverTrap|))
                   ((NULL |found|) (SETQ |$inputStream| |c|)
                    (|syGeneralErrorHere|) (|npRecoverTrap|)))
                  (COND ((|npEqKey| 'BACKSET) (SETQ |c| |$inputStream|))
                        ((|npEqPeek| 'BACKTAB) (SETQ |done| T))
                        (#1# (SETQ |$inputStream| |c|) (|syGeneralErrorHere|)
                         (|npRecoverTrap|)
                         (COND ((|npEqPeek| 'BACKTAB) (SETQ |done| T))
                               (#1# (|npNext|) (SETQ |c| |$inputStream|)))))
                  (SETQ |b| (CONS (|npPop1|) |b|))))))))
      (SETQ |$stack| |a|)
      (|npPush| (NREVERSE |b|))))))

; npMoveTo n==
;       if null $inputStream
;       then true
;       else
;            if npEqPeek "BACKTAB"
;            then if n=0
;                 then true
;                 else (npNext();npMoveTo(n-1))
;            else if npEqPeek "BACKSET"
;                 then if n=0
;                      then true
;                      else (npNext();npMoveTo n)
;                  else if npEqKey "SETTAB"
;                       then npMoveTo(n+1)
;                       else (npNext();npMoveTo n)

(DEFUN |npMoveTo| (|n|)
  (PROG ()
    (RETURN
     (COND ((NULL |$inputStream|) T)
           ((|npEqPeek| 'BACKTAB)
            (COND ((EQL |n| 0) T) (#1='T (|npNext|) (|npMoveTo| (- |n| 1)))))
           ((|npEqPeek| 'BACKSET)
            (COND ((EQL |n| 0) T) (#1# (|npNext|) (|npMoveTo| |n|))))
           ((|npEqKey| 'SETTAB) (|npMoveTo| (+ |n| 1)))
           (#1# (|npNext|) (|npMoveTo| |n|))))))
