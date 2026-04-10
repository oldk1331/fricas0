
; )package "BOOT"

(IN-PACKAGE "BOOT")

; get_op_implementation(op, sig, pred, predicates, dom, domname) ==
;     $returnNowhereFromGoGet: local := true
;     predValue := evalDomainOpPred(dom, pred, predicates)
;     null predValue =>
;         'unexported
;     slot := compiledLookup(op, sig, dom) =>
;         [f, :r] := slot
;         f = 'nowhere => 'nowhere           --see replaceGoGetSlot
;         f = function makeSpadConstant => 'constant
;         f = function IDENTITY => 'constant
;         f = function newGoGet =>
;             substitute('_%, domname, devaluate(first(r)))
;         null VECP r => systemError devaluateList r
;         substitute('_%, domname, devaluate(r))
;     'nowhere

(DEFUN |get_op_implementation| (|op| |sig| |pred| |predicates| |dom| |domname|)
  (PROG (|$returnNowhereFromGoGet| |r| |f| |slot| |predValue|)
    (DECLARE (SPECIAL |$returnNowhereFromGoGet|))
    (RETURN
     (PROGN
      (SETQ |$returnNowhereFromGoGet| T)
      (SETQ |predValue| (|evalDomainOpPred| |dom| |pred| |predicates|))
      (COND ((NULL |predValue|) '|unexported|)
            ((SETQ |slot| (|compiledLookup| |op| |sig| |dom|))
             (PROGN
              (SETQ |f| (CAR |slot|))
              (SETQ |r| (CDR |slot|))
              (COND ((EQ |f| '|nowhere|) '|nowhere|)
                    ((EQUAL |f| #'|makeSpadConstant|) '|constant|)
                    ((EQUAL |f| #'IDENTITY) '|constant|)
                    ((EQUAL |f| #'|newGoGet|)
                     (|substitute| '% |domname| (|devaluate| (CAR |r|))))
                    ((NULL (VECP |r|)) (|systemError| (|devaluateList| |r|)))
                    (#1='T (|substitute| '% |domname| (|devaluate| |r|))))))
            (#1# '|nowhere|))))))
