
(MAKEPROP '|JFRICAS;setIOHook| '|SPADreplace| '|set_spad_io_hook|) 

(SDEFUN |JFRICAS;setIOHook|
        ((|fun| (|Mapping| (|Void|) (|Symbol|) (|SExpression|))) (% (|Void|)))
        (|set_spad_io_hook| |fun|)) 

(SDEFUN |JFRICAS;ioIndexZZ| ((% (|Integer|)))
        (SPROG ((|sex| (|SExpression|)))
               (SEQ (LETT |sex| (EVAL (READ-FROM-STRING "|$IOindex|")))
                    (EXIT
                     (COND
                      ((SPADCALL |sex| (QREFELT % 9))
                       (SPADCALL |sex| (QREFELT % 11)))
                      ('T -1)))))) 

(SDEFUN |JFRICAS;ioIndex| ((|n| (|Integer|)) (% (|String|)))
        (SPROG ((|z| (|Integer|)))
               (SEQ (LETT |z| (+ (|JFRICAS;ioIndexZZ| %) |n|))
                    (EXIT (COND ((> |z| 0) (STRINGIMAGE |z|)) ('T "0")))))) 

(SDEFUN |JFRICAS;sayMarker|
        ((|markertype| (|String|)) (|n| (|Integer|)) (% (|Void|)))
        (SEQ
         (EVAL
          (READ-FROM-STRING
           (SPADCALL "(|sayMSG| \"--FORMAT:"
                     (SPADCALL |markertype|
                               (SPADCALL ":"
                                         (SPADCALL (|JFRICAS;ioIndex| |n| %)
                                                   "\")" (QREFELT % 13))
                                         (QREFELT % 13))
                               (QREFELT % 13))
                     (QREFELT % 13))))
         (EXIT (SPADCALL (QREFELT % 15))))) 

(SDEFUN |JFRICAS;jfricasIOHandler;SSeV;5|
        ((|s| (|Symbol|)) (|sex| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|be| (|String|)) (|key| (|String|)) (|markertype| (|String|))
          (|f| NIL) (#1=#:G44 NIL) (#2=#:G43 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |key| (SPADCALL |s| (QREFELT % 17))) (LETT |be| "")
                (COND
                 ((SPADCALL "start" |key| (QREFELT % 18)) (LETT |be| "BEG")))
                (COND
                 ((SPADCALL "endOf" |key| (QREFELT % 18)) (LETT |be| "END")))
                (EXIT
                 (COND ((EQUAL |be| "") (SPADCALL (QREFELT % 15)))
                       ('T
                        (SEQ
                         (COND
                          ((SPADCALL "Output" |key| (QREFELT % 19))
                           (LETT |key|
                                 (SPADCALL |key|
                                           (SPADCALL (- (QCSIZE |key|) 5)
                                                     (QCSIZE |key|)
                                                     (QREFELT % 21))
                                           (QREFELT % 22)))))
                         (LETT |key|
                               (SPADCALL |key| (SPADCALL 1 5 (QREFELT % 21))
                                         (QREFELT % 22)))
                         (LETT |markertype|
                               (SPADCALL |be|
                                         (SPADCALL ":" |key| (QREFELT % 13))
                                         (QREFELT % 13)))
                         (COND
                          ((OR (EQUAL |key| "Time") (EQUAL |key| "Storage"))
                           (EXIT (|JFRICAS;sayMarker| |markertype| -1 %))))
                         (SEQ (LETT |f| NIL)
                              (LETT #1#
                                    (LIST "Type" "Formatted" "Algebra"
                                          "Fortran" "HTML" "MathML" "TeXmacs"
                                          "TeX" "KeyedMsg"))
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |f| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQUAL |f| |key|)
                                  (PROGN
                                   (LETT #2#
                                         (|JFRICAS;sayMarker| |markertype| 0
                                          %))
                                   (GO #3=#:G42))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (EXIT (SPADCALL (QREFELT % 15)))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |JFRICAS;formatTypeTimeStorage| ((|line| (|String|)) (% (|String|)))
        (SPADCALL "<div style=\\\"text-align:right;\\\"><small>"
                  (SPADCALL |line| "</small></div>" (QREFELT % 13))
                  (QREFELT % 13))) 

(SDEFUN |JFRICAS;addSteppedOutputs|
        ((|souts| (|List| (|String|))) (|step| (|String|))
         (|outputs| (|List| (|String|))) (% (|List| (|String|))))
        (SPROG ((|outs| (|String|)) (|sout| (|String|)))
               (SEQ
                (COND ((NULL |outputs|) |souts|)
                      ('T
                       (SEQ
                        (LETT |outs|
                              (SPADCALL "," (NREVERSE |outputs|)
                                        (QREFELT % 25)))
                        (LETT |sout|
                              (SPADCALL
                               (LIST "{\"step\": " |step| ", \"outs\": ["
                                     |outs| "]}")
                               (QREFELT % 26)))
                        (EXIT (CONS |sout| |souts|)))))))) 

(SDEFUN |JFRICAS;jsonEscape| ((|c| (|Character|)) (% (|String|)))
        (SPROG ((|s| (|String|)))
               (SEQ
                (COND ((|eql_SI| |c| (|STR_to_CHAR| "\"")) "\\\"")
                      ((|eql_SI| |c| (|STR_to_CHAR| "\\")) "\\\\")
                      ((>= |c| 32) (SPADCALL |c| (QREFELT % 28)))
                      ((|eql_SI| |c| (SPADCALL 8 (QREFELT % 29))) "\\b")
                      ((|eql_SI| |c| (SPADCALL 10 (QREFELT % 29))) "\\n")
                      ((|eql_SI| |c| (SPADCALL 12 (QREFELT % 29))) "\\f")
                      ((|eql_SI| |c| (SPADCALL 13 (QREFELT % 29))) "\\r")
                      (#1='T
                       (SEQ
                        (LETT |s|
                              (SPADCALL "\\u00"
                                        (COND ((< |c| 16) "0") (#1# "1"))
                                        (QREFELT % 13)))
                        (EXIT
                         (SPADCALL |s|
                                   (SPADCALL "0123456789ABCDEF"
                                             (+ (REM |c| 16) 1) (QREFELT % 30))
                                   (QREFELT % 31))))))))) 

(SDEFUN |JFRICAS;jsonEscapeString| ((|s| (|String|)) (% (|String|)))
        (SPROG
         ((#1=#:G68 NIL) (|i| NIL) (|lc| (|List| (|Character|)))
          (|special| (|CharacterClass|)) (|t| (|String|)) (|b| (|Integer|))
          (|e| (|Integer|)))
         (SEQ
          (LETT |lc|
                (SPADCALL (LIST (|STR_to_CHAR| "\"") (|STR_to_CHAR| "\\"))
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |i| 0) G190
                                (COND ((|greater_SI| |i| 31) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |i| (QREFELT % 29))
                                              #1#))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 33)))
          (LETT |special| (SPADCALL |lc| (QREFELT % 35)))
          (EXIT
           (COND
            ((ZEROP (LETT |e| (SPADCALL |special| |s| 1 (QREFELT % 36)))) |s|)
            ('T
             (SEQ (LETT |t| "") (LETT |b| 1)
                  (SEQ G190 (COND ((NULL (> |e| 0)) (GO G191)))
                       (SEQ
                        (LETT |t|
                              (SPADCALL |t|
                                        (SPADCALL
                                         (SPADCALL |s|
                                                   (SPADCALL |b| (- |e| 1)
                                                             (QREFELT % 21))
                                                   (QREFELT % 37))
                                         (|JFRICAS;jsonEscape|
                                          (SPADCALL |s| |e| (QREFELT % 30)) %)
                                         (QREFELT % 13))
                                        (QREFELT % 13)))
                        (EXIT
                         (LETT |e|
                               (SPADCALL |special| |s| (LETT |b| (+ |e| 1))
                                         (QREFELT % 36)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |t|
                              (SPADCALL |s| (SPADCALL |b| (QREFELT % 38))
                                        (QREFELT % 37))
                              (QREFELT % 13))
                    (|STR_to_CHAR| " ") (QREFELT % 39)))))))))) 

(SDEFUN |JFRICAS;extendConstructorURLs;XhtSXht;10|
        ((|h| (|XHashTable| (|String|) (|String|))) (|url| (|String|))
         (% (|XHashTable| (|String|) (|String|))))
        (SPROG
         ((|ht| (|XHashTable| (|String|) (|String|)))
          (|rec|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|c| NIL) (#1=#:G76 NIL) (|s| (|String|)))
         (SEQ (LETT |ht| (SPADCALL (QREFELT % 41)))
              (LETT |rec| (SPADCALL (QREFELT % 44)))
              (SEQ (LETT |c| NIL)
                   (LETT #1#
                         (SPADCALL
                          (LIST (QVELT |rec| 0) (QVELT |rec| 1)
                                (QVELT |rec| 2))
                          (QREFELT % 46)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| (SPADCALL |c| (QREFELT % 17)))
                        (EXIT
                         (SPADCALL |ht| |s|
                                   (SPADCALL |h| |s| |url| (QREFELT % 47))
                                   (QREFELT % 48))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ht|)))) 

(SDEFUN |JFRICAS;addLinks;XhtM;11|
        ((|h| (|XHashTable| (|String|) (|String|)))
         (% (|Mapping| (|String|) (|String|))))
        (SPROG ((|defaultURL| (|String|)))
               (SEQ
                (LETT |defaultURL|
                      (COND
                       ((SPADCALL |h| (QREFELT % 50))
                        "https://fricas.github.io/api/")
                       ('T "")))
                (EXIT
                 (CONS #'|JFRICAS;addLinks;XhtM;11!0|
                       (VECTOR |defaultURL| |h| %)))))) 

(SDEFUN |JFRICAS;addLinks;XhtM;11!0| ((|s| NIL) ($$ NIL))
        (PROG (% |h| |defaultURL|)
          (LETT % (QREFELT $$ 2))
          (LETT |h| (QREFELT $$ 1))
          (LETT |defaultURL| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|idchars| NIL) (|n| NIL) (|p| NIL) (#1=#:G89 NIL) (|j| NIL)
              (|id| NIL) (|url| NIL) (|result| NIL) (|i| NIL))
             (SEQ
              (EXIT
               (SEQ
                (LETT |idchars|
                      (SPADCALL (|spadConstant| % 51)
                                (SPADCALL "_" (QREFELT % 52)) (QREFELT % 53)))
                (LETT |result| "") (LETT |i| (|spadConstant| % 54))
                (LETT |n| (SPADCALL |s| (QREFELT % 56)))
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |i| |n| (QREFELT % 57))) (GO G191)))
                     (SEQ
                      (LETT |p|
                            (SPADCALL (|spadConstant| % 58) |s| |i|
                                      (QREFELT % 36)))
                      (EXIT
                       (COND
                        ((SPADCALL |p| (QREFELT % 59))
                         (PROGN
                          (LETT #1#
                                (SPADCALL |result|
                                          (SPADCALL |s|
                                                    (SPADCALL |i|
                                                              (QREFELT % 38))
                                                    (QREFELT % 37))
                                          (QREFELT % 13)))
                          (GO #2=#:G88)))
                        ('T
                         (SEQ (LETT |j| |p|)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |j| |n| (QREFELT % 57))
                                        (SPADCALL
                                         (SPADCALL |s| |j| (QREFELT % 30))
                                         |idchars| (QREFELT % 60)))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |j|
                                           (SPADCALL |j| (|spadConstant| % 54)
                                                     (QREFELT % 61)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |id|
                                    (SPADCALL |s|
                                              (SPADCALL |p|
                                                        (SPADCALL |j|
                                                                  (|spadConstant|
                                                                   % 54)
                                                                  (QREFELT %
                                                                           62))
                                                        (QREFELT % 21))
                                              (QREFELT % 37)))
                              (LETT |url|
                                    (SPADCALL |h| |id| |defaultURL|
                                              (QREFELT % 47)))
                              (LETT |result|
                                    (COND
                                     ((SPADCALL |url| (QREFELT % 63))
                                      (SPADCALL |result|
                                                (SPADCALL |s|
                                                          (SPADCALL |i|
                                                                    (SPADCALL
                                                                     |j|
                                                                     (|spadConstant|
                                                                      % 54)
                                                                     (QREFELT %
                                                                              62))
                                                                    (QREFELT %
                                                                             21))
                                                          (QREFELT % 37))
                                                (QREFELT % 64)))
                                     ('T
                                      (SPADCALL
                                       (LIST |result|
                                             (SPADCALL |s|
                                                       (SPADCALL |i|
                                                                 (SPADCALL |p|
                                                                           (|spadConstant|
                                                                            %
                                                                            54)
                                                                           (QREFELT
                                                                            %
                                                                            62))
                                                                 (QREFELT %
                                                                          21))
                                                       (QREFELT % 37))
                                             "<a href=\\\"" |url| |id|
                                             ".html\\\" target=\\\"_blank\\\" "
                                             "style=\\\"color:blue;text-decoration:none;\\\">"
                                             |id| "</a>")
                                       (QREFELT % 26)))))
                              (EXIT (LETT |i| |j|)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |result|)))
              #2# (EXIT #1#))))))) 

(SDEFUN |JFRICAS;setTranslateType!;2M;12|
        ((|fun| (|Mapping| (|String|) (|String|)))
         (% (|Mapping| (|String|) (|String|))))
        (SPADCALL (QREFELT % 69) |fun| (QREFELT % 70))) 

(SDEFUN |JFRICAS;steppedOutputs| ((|out| (|String|)) (% (|String|)))
        (SPROG
         ((|trType| (|Mapping| (|String|) (|String|))) (|y| #1=(|String|))
          (|f| #1#) (|nstep| #1#) (|souts| (|List| (|String|)))
          (|step| (|String|)) (|end_marker| (|String|)) (#2=#:G120 NIL)
          (|p| (|Integer|)) (|fcontent| (|String|)) (|content_type| (|String|))
          (|line| (|String|)) (|lines| (|List| (|String|))) (#3=#:G119 NIL)
          (|content| (|String|)) (|outputs| (|List| (|String|)))
          (#4=#:G121 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |trType| (SPADCALL (QREFELT % 69) (QREFELT % 72)))
                (LETT |souts| NIL) (LETT |outputs| NIL) (LETT |step| "0")
                (LETT |lines|
                      (SPADCALL |out| (SPADCALL (QREFELT % 73))
                                (QREFELT % 74)))
                (SEQ G190 (COND ((NULL (NULL (NULL |lines|))) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |content_type| "text/plain")
                            (LETT |line|
                                  (|JFRICAS;jsonEscapeString|
                                   (|SPADfirst| |lines|) %))
                            (LETT |lines| (CDR |lines|))
                            (COND
                             ((OR (EQUAL |line| "")
                                  (EQUAL
                                   (SPADCALL |line|
                                             (SPADCALL 1
                                                       (MIN 23 (QCSIZE |line|))
                                                       (QREFELT % 21))
                                             (QREFELT % 37))
                                   "--FORMAT:END:Formatted:"))
                              (EXIT
                               (PROGN (LETT #2# |$NoValue|) (GO #5=#:G99)))))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (SPADCALL |line|
                                          (SPADCALL 1 (MIN 13 (QCSIZE |line|))
                                                    (QREFELT % 21))
                                          (QREFELT % 37))
                                "--FORMAT:BEG:" (QREFELT % 75))
                               (LETT |outputs|
                                     (CONS
                                      (SPADCALL "{\"ERROR\": \""
                                                (SPADCALL |line| "\\n\"}"
                                                          (QREFELT % 13))
                                                (QREFELT % 13))
                                      |outputs|)))
                              ('T
                               (SEQ
                                (LETT |y|
                                      (SPADCALL |line|
                                                (SPADCALL 14 (QREFELT % 38))
                                                (QREFELT % 37)))
                                (LETT |p|
                                      (SPADCALL (|STR_to_CHAR| ":") |y|
                                                (QREFELT % 76)))
                                (COND ((ZEROP |p|) (LETT |f| |y|))
                                      ('T
                                       (SEQ
                                        (LETT |f|
                                              (SPADCALL |y|
                                                        (SPADCALL 1 (- |p| 1)
                                                                  (QREFELT %
                                                                           21))
                                                        (QREFELT % 37)))
                                        (LETT |nstep|
                                              (SPADCALL |y|
                                                        (SPADCALL (+ |p| 1)
                                                                  (QREFELT %
                                                                           38))
                                                        (QREFELT % 37)))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |nstep| |step|
                                                     (QREFELT % 75))
                                           (SEQ
                                            (LETT |souts|
                                                  (|JFRICAS;addSteppedOutputs|
                                                   |souts| |step| |outputs| %))
                                            (LETT |outputs| NIL)
                                            (EXIT (LETT |step| |nstep|)))))))))
                                (LETT |content| "")
                                (LETT |end_marker|
                                      (SPADCALL "--FORMAT:END:" |y|
                                                (QREFELT % 13)))
                                (COND
                                 ((EQUAL
                                   (SPADCALL |line|
                                             (SPADCALL 1
                                                       (MIN 23 (QCSIZE |line|))
                                                       (QREFELT % 21))
                                             (QREFELT % 37))
                                   "--FORMAT:BEG:Formatted:")
                                  (PROGN (LETT #2# |$NoValue|) (GO #5#))))
                                (EXIT
                                 (COND
                                  ((SPADCALL |f| (LIST "Type" "Time" "Storage")
                                             (QREFELT % 78))
                                   (SEQ (LETT |line| (|SPADfirst| |lines|))
                                        (LETT |lines|
                                              (SPADCALL |lines| 2
                                                        (QREFELT % 79)))
                                        (LETT |p|
                                              (SPADCALL
                                               (SPADCALL |f| ": "
                                                         (QREFELT % 13))
                                               |line| 1 (QREFELT % 80)))
                                        (COND
                                         ((EQUAL |f| "Type")
                                          (LETT |content|
                                                (SPADCALL
                                                 (SPADCALL |line|
                                                           (SPADCALL (+ |p| 6)
                                                                     (QREFELT %
                                                                              38))
                                                           (QREFELT % 37))
                                                 |trType|)))
                                         ('T
                                          (LETT |content|
                                                (SPADCALL |line|
                                                          (SPADCALL |p|
                                                                    (QREFELT %
                                                                             38))
                                                          (QREFELT % 37)))))
                                        (LETT |fcontent|
                                              (|JFRICAS;formatTypeTimeStorage|
                                               |content| %))
                                        (EXIT
                                         (LETT |outputs|
                                               (CONS
                                                (SPADCALL "{\"text/html\": \""
                                                          (SPADCALL |fcontent|
                                                                    "\"}"
                                                                    (QREFELT %
                                                                             13))
                                                          (QREFELT % 13))
                                                |outputs|)))))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((EQUAL |f| "FormatMathJax")
                                      (LETT |content_type| "text/latex"))
                                     ((SPADCALL |f| (LIST "MathML" "HTML")
                                                (QREFELT % 78))
                                      (LETT |content_type| "text/html"))
                                     ((EQUAL |f| "TeX")
                                      (SEQ (LETT |content_type| "text/latex")
                                           (EXIT
                                            (LETT |content|
                                                  (|JFRICAS;jsonEscapeString|
                                                   (SPADCALL
                                                    (LIST "$"
                                                          "\\def\\sp{^}\\def\\sb{_}\\def\\leqno(#1){}"
                                                          "\\def\\erf\\{\\mathrm{erf}}\\def\\sinh{\\mathrm{sinh}}"
                                                          "\\def\\zag#1#2{{{\\left.{#1}\\right|}\\over{\\left|{#2}\\right.}}}"
                                                          "$ ")
                                                    (QREFELT % 26))
                                                   %)))))
                                     ((EQUAL |f| "KeyedMsg")
                                      (LETT |content_type| "ERROR")))
                                    (SEQ
                                     (EXIT
                                      (SEQ G190
                                           (COND
                                            ((NULL (NULL (NULL |lines|)))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |line|
                                                  (|JFRICAS;jsonEscapeString|
                                                   (|SPADfirst| |lines|) %))
                                            (LETT |lines| (CDR |lines|))
                                            (COND
                                             ((EQUAL |line| |end_marker|)
                                              (PROGN
                                               (LETT #3# |$NoValue|)
                                               (GO #6=#:G112))))
                                            (EXIT
                                             (LETT |content|
                                                   (STRCONC |content|
                                                            (SPADCALL |line|
                                                                      "\\n"
                                                                      (QREFELT
                                                                       %
                                                                       13))))))
                                           NIL (GO G190) G191 (EXIT NIL)))
                                     #6# (EXIT #3#))
                                    (EXIT
                                     (LETT |outputs|
                                           (CONS
                                            (SPADCALL "{\""
                                                      (SPADCALL |content_type|
                                                                (SPADCALL
                                                                 "\": \""
                                                                 (SPADCALL
                                                                  |content|
                                                                  "\"}"
                                                                  (QREFELT %
                                                                           13))
                                                                 (QREFELT %
                                                                          13))
                                                                (QREFELT % 13))
                                                      (QREFELT % 13))
                                            |outputs|)))))))))))))
                      #5# (EXIT #2#))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (PROGN
                  (LETT #4#
                        (SPADCALL ","
                                  (NREVERSE
                                   (|JFRICAS;addSteppedOutputs| |souts| |step|
                                    |outputs| %))
                                  (QREFELT % 25)))
                  (GO #7=#:G118)))))
          #7# (EXIT #4#)))) 

(SDEFUN |JFRICAS;handleOutput;B2S;14|
        ((|err?| (|Boolean|)) (|out| (|String|)) (% (|String|)))
        (SPADCALL
         (LIST "{\"error?\": " (COND (|err?| "true") ('T "false"))
               ", \"souts\": [" (|JFRICAS;steppedOutputs| |out| %) "]}")
         (QREFELT % 26))) 

(SDEFUN |JFRICAS;defineHandler|
        ((|name| (|String|)) (|handler| (|String|)) (% (|SExpression|)))
        (EVAL
         (READ-FROM-STRING
          (SPADCALL
           (LIST "(hunchentoot:define-easy-handler "
                 (SPADCALL "    (fricas-"
                           (SPADCALL |name|
                                     (SPADCALL " :uri \"/"
                                               (SPADCALL |name| "\") (code)"
                                                         (QREFELT % 13))
                                               (QREFELT % 13))
                                     (QREFELT % 13))
                           (QREFELT % 13))
                 "  (setf (hunchentoot:content-type*) \"text/plain\")"
                 (SPADCALL "  (format nil \"~A~%\" "
                           (SPADCALL |handler| "))" (QREFELT % 13))
                           (QREFELT % 13)))
           (QREFELT % 26))))) 

(SDEFUN |JFRICAS;initialize;V;16| ((% (|Void|)))
        (SPROG ((|formats| (|List| (|String|))) (|f| NIL) (#1=#:G131 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT % 41))
                            "https://fricas.github.io/api/" (QREFELT % 49))
                  (QREFELT % 66))
                 (QREFELT % 71))
                (EVAL
                 (READ-FROM-STRING
                  "(defvar jfricas-stream (make-string-output-stream))"))
                (EVAL
                 (READ-FROM-STRING "(defvar proxy_stdout *standard-output*)"))
                (EVAL
                 (READ-FROM-STRING
                  "(setf *standard-output* (make-synonym-stream 'proxy_stdout))"))
                (LETT |formats|
                      (LIST "Algebra" "Fortran" "Mathml" "Texmacs" "Html"
                            "OpenMath" "Tex" "Formatted"))
                (SEQ (LETT |f| NIL) (LETT #1# |formats|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (EVAL
                        (READ-FROM-STRING
                         (SPADCALL "(|setOutput"
                                   (SPADCALL |f| "| '|%initialize%|)"
                                             (QREFELT % 13))
                                   (QREFELT % 13))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EVAL
                 (READ-FROM-STRING
                  (SPADCALL
                   (LIST "(defun jfricas-eval (input)" "  (setf |$MARGIN| 0)"
                         "  (setf |$print_equatnum| NIL)"
                         "  (let* ((proxy_stdout jfricas-stream)"
                         "         (*error-output* proxy_stdout)"
                         "         (handle-output"
                         "           (|getFunctionFromDomain| '|handleOutput| '(|JFriCAS|)"
                         "                                    '(|Boolean| |String|)))"
                         "        (error? (eq (catch 'SPAD_READER (catch '|top_level|"
                         "                           (|interpret_block| input)))"
                         "                    '|restart|))"
                         "        (out (get-output-stream-string jfricas-stream))"
                         "        )"
                         "    (spadcall error? out handle-output)))")
                   (QREFELT % 26))))
                (EVAL
                 (READ-FROM-STRING
                  (SPADCALL
                   (LIST "(defun fricas-eval (code)"
                         "  (format nil \"~{~A~%~}\" (|parseAndEvalToString| code)))")
                   (QREFELT % 26))))
                (|JFRICAS;defineHandler| "jfricas" "(jfricas-eval code)" %)
                (|JFRICAS;defineHandler| "fricas" "(fricas-eval code)" %)
                (EXIT (|JFRICAS;setIOHook| (ELT % 23) %))))) 

(SDEFUN |JFRICAS;start;NniB;17| ((|p| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG ((|webserver| (|SExpression|)))
               (SEQ
                (COND
                 ((NULL (QREFELT % 6))
                  (SEQ
                   (LETT |webserver|
                         (EVAL
                          (READ-FROM-STRING
                           "(member ':HUNCHENTOOT *features*)")))
                   (EXIT
                    (COND
                     ((NULL (NULL (SPADCALL |webserver| (QREFELT % 83))))
                      (SEQ (SPADCALL (QREFELT % 82))
                           (EXIT (SETELT % 6 'T)))))))))
                (EVAL
                 (READ-FROM-STRING
                  (SPADCALL
                   (LIST "(hunchentoot:start"
                         (SPADCALL
                          "  (make-instance 'hunchentoot:easy-acceptor :port "
                          (SPADCALL (STRINGIMAGE |p|) "))" (QREFELT % 13))
                          (QREFELT % 13)))
                   (QREFELT % 26))))
                (EXIT (QREFELT % 6))))) 

(SDEFUN |JFRICAS;kernel;V;18| ((% (|Void|)))
        (SPROG ((|tf| (|TextFile|)))
               (SEQ
                (LETT |tf|
                      (SPADCALL (SPADCALL "kernel.json" (QREFELT % 86))
                                "output" (QREFELT % 88)))
                (SPADCALL |tf| "{" (QREFELT % 89))
                (SPADCALL |tf|
                          "  \"argv\": [\"python3\", \"-m\", \"jfricas.fricaskernel\", \"-f\", \"{connection_file}\"],"
                          (QREFELT % 89))
                (SPADCALL |tf| "  \"display_name\": \"FriCAS\","
                          (QREFELT % 89))
                (SPADCALL |tf| "  \"language\": \"spad\"" (QREFELT % 89))
                (SPADCALL |tf| "}" (QREFELT % 89))
                (SPADCALL |tf| (QREFELT % 90))
                (EXIT (SPADCALL (QREFELT % 15)))))) 

(SDEFUN |JFRICAS;fricaskernel;V;19| ((% (|Void|)))
        (SPROG ((|tf| (|TextFile|)))
               (SEQ
                (LETT |tf|
                      (SPADCALL (SPADCALL "fricaskernel.py" (QREFELT % 86))
                                "output" (QREFELT % 88)))
                (SPADCALL |tf| "# -*- coding: utf-8 -*-" (QREFELT % 89))
                (SPADCALL |tf| "from ipykernel.kernelbase import Kernel"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "from subprocess import Popen, run, PIPE, STDOUT"
                          (QREFELT % 89))
                (SPADCALL |tf| "import requests" (QREFELT % 89))
                (SPADCALL |tf| "import json" (QREFELT % 89))
                (SPADCALL |tf| "import os" (QREFELT % 89))
                (SPADCALL |tf| "__version__ = '3.0.0'" (QREFELT % 89))
                (SPADCALL |tf| "try:" (QREFELT % 89))
                (SPADCALL |tf| "    import notebook.notebookapp"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    static_file_path = notebook.notebookapp.DEFAULT_STATIC_FILES_PATH"
                          (QREFELT % 89))
                (SPADCALL |tf| "except:" (QREFELT % 89))
                (SPADCALL |tf| "    static_file_path = None" (QREFELT % 89))
                (SPADCALL |tf| "def get_free_port():" (QREFELT % 89))
                (SPADCALL |tf| "    import socket" (QREFELT % 89))
                (SPADCALL |tf|
                          "    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)"
                          (QREFELT % 89))
                (SPADCALL |tf| "    s.bind(('',0))" (QREFELT % 89))
                (SPADCALL |tf| "    s.listen(1)" (QREFELT % 89))
                (SPADCALL |tf| "    port = s.getsockname()[1]" (QREFELT % 89))
                (SPADCALL |tf| "    s.close()" (QREFELT % 89))
                (SPADCALL |tf| "    return port" (QREFELT % 89))
                (SPADCALL |tf| "htport = str(get_free_port())" (QREFELT % 89))
                (SPADCALL |tf| "pid = None" (QREFELT % 89))
                (SPADCALL |tf| "class httpFriCAS():" (QREFELT % 89))
                (SPADCALL |tf| "    def __init__(self, port = htport):"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        self.url = 'http://localhost:' + port + '/jfricas'"
                          (QREFELT % 89))
                (SPADCALL |tf| "    def fricas(self, code):" (QREFELT % 89))
                (SPADCALL |tf|
                          "        return(requests.post(self.url, data={'code': code}))"
                          (QREFELT % 89))
                (SPADCALL |tf| "class FriCAS(Kernel):" (QREFELT % 89))
                (SPADCALL |tf| "    implementation = 'spad'" (QREFELT % 89))
                (SPADCALL |tf| "    implementation_version = __version__"
                          (QREFELT % 89))
                (SPADCALL |tf| "    language = 'spad'" (QREFELT % 89))
                (SPADCALL |tf| "    language_version = '0.1'" (QREFELT % 89))
                (SPADCALL |tf|
                          "    language_info = {'name': 'spad', 'mimetype': 'text/plain',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                     'file_extension': '.input',}"
                          (QREFELT % 89))
                (SPADCALL |tf| "    banner = 'FriCAS Jupyter Kernel'"
                          (QREFELT % 89))
                (SPADCALL |tf| "    def __init__(self, **kwargs):"
                          (QREFELT % 89))
                (SPADCALL |tf| "        Kernel.__init__(self, **kwargs)"
                          (QREFELT % 89))
                (SPADCALL |tf| "        self.server = httpFriCAS()"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        self.fricas_operations = fricas_operations"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        self.fricas_constructors = fricas_constructors"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        self.fricas_ids = sorted(fricas_operations + fricas_constructors)"
                          (QREFELT % 89))
                (SPADCALL |tf| "    def execute_block(self, block, silent):"
                          (QREFELT % 89))
                (SPADCALL |tf| "        if block.startswith(')'):"
                          (QREFELT % 89))
                (SPADCALL |tf| "            cmd = block[1:]" (QREFELT % 89))
                (SPADCALL |tf|
                          "            if cmd in ['if', 'else', 'endif', 'fin']: return True"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "            if cmd.startswith('p'): cmd = cmd[1:]"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "            if cmd in ['q', 'qu', 'qui', 'quit']:"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                self.send_response(self.iopub_socket, 'stream',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                    {'name': 'stderr', 'text': 'Use the menu \"File -> Close and Shut Down Notebook\" to quit the notebook!'})"
                          (QREFELT % 89))
                (SPADCALL |tf| "                return False" (QREFELT % 89))
                (SPADCALL |tf| "        r = self.server.fricas(block)"
                          (QREFELT % 89))
                (SPADCALL |tf| "        if silent: return True" (QREFELT % 89))
                (SPADCALL |tf| "        if not r.ok: return False"
                          (QREFELT % 89))
                (SPADCALL |tf| "        fresult = r.json()" (QREFELT % 89))
                (SPADCALL |tf| "        stepped_outputs = fresult['souts']"
                          (QREFELT % 89))
                (SPADCALL |tf| "        if fresult['error?']:" (QREFELT % 89))
                (SPADCALL |tf| "            for so in stepped_outputs:"
                          (QREFELT % 89))
                (SPADCALL |tf| "                for data in so['outs']:"
                          (QREFELT % 89))
                (SPADCALL |tf| "                    for k in data.keys():"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        self.send_response(self.iopub_socket, 'stream',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                            {'name': 'stderr', 'text': data[k]})"
                          (QREFELT % 89))
                (SPADCALL |tf| "            return False" (QREFELT % 89))
                (SPADCALL |tf| "        for so in stepped_outputs:"
                          (QREFELT % 89))
                (SPADCALL |tf| "            if not so['outs']: continue"
                          (QREFELT % 89))
                (SPADCALL |tf| "            is_first = True" (QREFELT % 89))
                (SPADCALL |tf| "            for data in so['outs']:"
                          (QREFELT % 89))
                (SPADCALL |tf| "                if data.get('ERROR'):"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                    self.send_response(self.iopub_socket, 'stream',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        {'name': 'stderr', 'text': data.get('ERROR')})"
                          (QREFELT % 89))
                (SPADCALL |tf| "                elif is_first:" (QREFELT % 89))
                (SPADCALL |tf|
                          "                    self.send_response(self.iopub_socket, 'execute_result',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        {'execution_count': so['step'],"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                         'data': data, 'metadata': {}})"
                          (QREFELT % 89))
                (SPADCALL |tf| "                    is_first = False"
                          (QREFELT % 89))
                (SPADCALL |tf| "                else:" (QREFELT % 89))
                (SPADCALL |tf|
                          "                    self.send_response(self.iopub_socket,'display_data',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        {'data': data, 'metadata': {}})"
                          (QREFELT % 89))
                (SPADCALL |tf| "        return True" (QREFELT % 89))
                (SPADCALL |tf|
                          "    def do_execute(self, code, silent, store_history=True,"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                   user_expressions=None, allow_stdin=False):"
                          (QREFELT % 89))
                (SPADCALL |tf| "        lines = code.split('\\n')"
                          (QREFELT % 89))
                (SPADCALL |tf| "        blocks = []" (QREFELT % 89))
                (SPADCALL |tf| "        block = ''" (QREFELT % 89))
                (SPADCALL |tf| "        for line in lines:" (QREFELT % 89))
                (SPADCALL |tf| "            line = line.rstrip()"
                          (QREFELT % 89))
                (SPADCALL |tf| "            if not block:" (QREFELT % 89))
                (SPADCALL |tf| "                block = line" (QREFELT % 89))
                (SPADCALL |tf| "                continue" (QREFELT % 89))
                (SPADCALL |tf| "            l = len(block)" (QREFELT % 89))
                (SPADCALL |tf|
                          "            if block[l-1] == '_' or (line and line[0] == ' '):"
                          (QREFELT % 89))
                (SPADCALL |tf| "                block += '\\n' + line"
                          (QREFELT % 89))
                (SPADCALL |tf| "                continue" (QREFELT % 89))
                (SPADCALL |tf|
                          "            if not self.execute_block(block, silent):"
                          (QREFELT % 89))
                (SPADCALL |tf| "                return {'status': 'error',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        'execution_count': self.execution_count,"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        'payload':[], 'user_expressions':{}}"
                          (QREFELT % 89))
                (SPADCALL |tf| "            block = line" (QREFELT % 89))
                (SPADCALL |tf| "        if block:" (QREFELT % 89))
                (SPADCALL |tf|
                          "            if not self.execute_block(block, silent):"
                          (QREFELT % 89))
                (SPADCALL |tf| "                return {'status': 'error',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        'execution_count': self.execution_count,"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                        'payload':[], 'user_expressions':{}}"
                          (QREFELT % 89))
                (SPADCALL |tf| "        return {'status': 'ok',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                'execution_count': self.execution_count,"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                'payload':[], 'user_expressions':{}}"
                          (QREFELT % 89))
                (SPADCALL |tf| "    def do_shutdown(self, restart):"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        self.send_response(self.iopub_socket, 'stream',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "            {'name': 'stdout', 'text': '-- Bye. Kernel shutdown '})"
                          (QREFELT % 89))
                (SPADCALL |tf| "        try:" (QREFELT % 89))
                (SPADCALL |tf| "            r = self.server.fricas(')quit')"
                          (QREFELT % 89))
                (SPADCALL |tf| "            pid.terminate()" (QREFELT % 89))
                (SPADCALL |tf| "        except:" (QREFELT % 89))
                (SPADCALL |tf| "            print('Go down anyway ...')"
                          (QREFELT % 89))
                (SPADCALL |tf| "        return {'restart': False}"
                          (QREFELT % 89))
                (SPADCALL |tf| "    def get_identifier_part(self, code):"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        admissible = 'abcdefghijklmnopqrstuvwxyz_!?0123456789'"
                          (QREFELT % 89))
                (SPADCALL |tf| "        n = len(code)-1" (QREFELT % 89))
                (SPADCALL |tf|
                          "        while n>=0 and code[n].lower() in admissible: n -= 1"
                          (QREFELT % 89))
                (SPADCALL |tf| "        return code[n+1:]" (QREFELT % 89))
                (SPADCALL |tf| "    def do_complete(self, code, cursor_pos):"
                          (QREFELT % 89))
                (SPADCALL |tf| "        code = code[:cursor_pos]"
                          (QREFELT % 89))
                (SPADCALL |tf| "        token = self.get_identifier_part(code)"
                          (QREFELT % 89))
                (SPADCALL |tf| "        start = cursor_pos - len(token)"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        matches = [id for id in self.fricas_ids if id.startswith(token)]"
                          (QREFELT % 89))
                (SPADCALL |tf| "        return {'matches': matches,"
                          (QREFELT % 89))
                (SPADCALL |tf| "                'cursor_start': start,"
                          (QREFELT % 89))
                (SPADCALL |tf| "                'cursor_end': cursor_pos,"
                          (QREFELT % 89))
                (SPADCALL |tf| "                'metadata': dict(),"
                          (QREFELT % 89))
                (SPADCALL |tf| "                'status': 'ok'}"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    def do_inspect(self, code, cursor_pos, detail_level=0, *args, **kwargs):"
                          (QREFELT % 89))
                (SPADCALL |tf| "        data = dict()" (QREFELT % 89))
                (SPADCALL |tf| "        code = code[:cursor_pos]"
                          (QREFELT % 89))
                (SPADCALL |tf| "        token = self.get_identifier_part(code)"
                          (QREFELT % 89))
                (SPADCALL |tf| "        if token in self.fricas_operations:"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "            r = self.server.fricas(')display operation ' + token)"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        elif token in self.fricas_constructors:"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "            r = self.server.fricas(')show '+ token)"
                          (QREFELT % 89))
                (SPADCALL |tf| "        else:" (QREFELT % 89))
                (SPADCALL |tf|
                          "            return {'status' : 'ok', 'found' : False,"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                    'data' :  {}, 'metadata' : {}}"
                          (QREFELT % 89))
                (SPADCALL |tf| "        msg = 'No data from FriCAS'"
                          (QREFELT % 89))
                (SPADCALL |tf| "        if r.ok:" (QREFELT % 89))
                (SPADCALL |tf|
                          "            outs = r.json()['souts'][0]['outs']"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "            msg = ''.join([d['ERROR'] for d in outs])"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "        return {'status' : 'ok', 'found' : True,"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                'data' : {'text/plain' : msg}, 'metadata' : {}}"
                          (QREFELT % 89))
                (SPADCALL |tf| "if __name__ == '__main__':" (QREFELT % 89))
                (SPADCALL |tf|
                          "    from ipykernel.kernelapp import IPKernelApp"
                          (QREFELT % 89))
                (SPADCALL |tf| "    import itertools" (QREFELT % 89))
                (SPADCALL |tf| "    pid0 = Popen(['fricas', '-nosman',"
                          (QREFELT % 89))
                (SPADCALL |tf| "                 '-eval', ')what operations',"
                          (QREFELT % 89))
                (SPADCALL |tf| "                 '-eval', ')what categories',"
                          (QREFELT % 89))
                (SPADCALL |tf| "                 '-eval', ')what domains',"
                          (QREFELT % 89))
                (SPADCALL |tf| "                 '-eval', ')what packages',"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                 '-eval', ')quit'],stdout=PIPE,"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "                 env=dict(os.environ, FRICAS_INITFILE=''))"
                          (QREFELT % 89))
                (SPADCALL |tf| "    out = pid0.stdout.readlines()"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    lines = [s.decode('utf-8').rstrip() for s in out]"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    while not lines.pop(0).startswith('Operations whose names satisfy '): pass"
                          (QREFELT % 89))
                (SPADCALL |tf| "    fricas_operations = []" (QREFELT % 89))
                (SPADCALL |tf| "    line = lines.pop(0)" (QREFELT % 89))
                (SPADCALL |tf| "    line = lines.pop(0)" (QREFELT % 89))
                (SPADCALL |tf| "    while line:" (QREFELT % 89))
                (SPADCALL |tf| "        fricas_operations.append(line)"
                          (QREFELT % 89))
                (SPADCALL |tf| "        line = lines.pop(0)" (QREFELT % 89))
                (SPADCALL |tf|
                          "    while not lines.pop(0).startswith('--------------'): pass"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    wordlist = [x.split() for x in lines if not x.startswith('--------------')]"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    fricas_constructors = list(itertools.chain.from_iterable(wordlist))"
                          (QREFELT % 89))
                (SPADCALL |tf| "    fricas_constructors.sort()" (QREFELT % 89))
                (SPADCALL |tf| "    start = 'start(' + htport + ')$JFriCAS'"
                          (QREFELT % 89))
                (SPADCALL |tf| "    # A couple of ways to start FriCAS"
                          (QREFELT % 89))
                (SPADCALL |tf| "    # --------------------------------"
                          (QREFELT % 89))
                (SPADCALL |tf| "    # Uncomment or edit as you like."
                          (QREFELT % 89))
                (SPADCALL |tf| "    # Default:" (QREFELT % 89))
                (SPADCALL |tf| "    pid = Popen(['fricas','-eval',start])"
                          (QREFELT % 89))
                (SPADCALL |tf| "" (QREFELT % 89))
                (SPADCALL |tf|
                          "    # Start the FriCAS process in a separate terminal."
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    # That might be good for controlling FriCAS directly in case"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    # the Jupyter interface hangs or a process runs too long."
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    # Of course, the start-fricas-in-terminal way also works"
                          (QREFELT % 89))
                (SPADCALL |tf| "    # with additional fricas options."
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    ## pid = Popen(['gnome-terminal', '--title=jfricas', '--'] +"
                          (QREFELT % 89))
                (SPADCALL |tf| "    ##             ['fricas','-eval',start])"
                          (QREFELT % 89))
                (SPADCALL |tf| "" (QREFELT % 89))
                (SPADCALL |tf|
                          "    # Start the FriCAS process without opening the HyperDoc window."
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    ## pid = Popen(['fricas','-eval',start,'-noht'])"
                          (QREFELT % 89))
                (SPADCALL |tf| "" (QREFELT % 89))
                (SPADCALL |tf|
                          "    # Start the FriCAS process by calling only FRICASsys."
                          (QREFELT % 89))
                (SPADCALL |tf| "    # The following does currently not work."
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    ## pid = Popen(['fricas','-nosman','-eval',start])"
                          (QREFELT % 89))
                (SPADCALL |tf| "    # but" (QREFELT % 89))
                (SPADCALL |tf|
                          "    ## pid = Popen(['gnome-terminal', '--title=jfricas', '--'] +"
                          (QREFELT % 89))
                (SPADCALL |tf|
                          "    ##             ['fricas','-nosman','-eval',start])"
                          (QREFELT % 89))
                (SPADCALL |tf| "    # does." (QREFELT % 89))
                (SPADCALL |tf| "" (QREFELT % 89))
                (SPADCALL |tf| "    # Start the kernel." (QREFELT % 89))
                (SPADCALL |tf|
                          "    IPKernelApp.launch_instance(kernel_class=FriCAS)"
                          (QREFELT % 89))
                (SPADCALL |tf| (QREFELT % 90))
                (EXIT (SPADCALL (QREFELT % 15)))))) 

(DECLAIM (NOTINLINE |JFriCAS;|)) 

(DEFUN |JFriCAS;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|JFriCAS|))
          (LETT % (GETREFV 93))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|JFriCAS| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 NIL)
          (QSETREFV % 69
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT % 41)) (QREFELT % 66))
                     (QREFELT % 68)))
          %))) 

(DEFUN |JFriCAS| ()
  (SPROG NIL
         (PROG (#1=#:G141)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|JFriCAS|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|JFriCAS|
                             (LIST (CONS NIL (CONS 1 (|JFriCAS;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|JFriCAS|)))))))))) 

(MAKEPROP '|JFriCAS| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|initialized?| (|Boolean|)
              (|SExpression|) (0 . |integer?|) (|Integer|) (5 . |integer|)
              (|String|) (10 . |elt|) (|Void|) (16 . |void|) (|Symbol|)
              (20 . |string|) (25 . |prefix?|) (31 . |suffix?|)
              (|UniversalSegment| 10) (37 . SEGMENT) (43 . |delete|)
              |JFRICAS;jfricasIOHandler;SSeV;5| (|List| %) (49 . |join|)
              (55 . |concat|) (|Character|) (60 . |coerce|) (65 . |char|)
              (70 . |elt|) (76 . |concat|) (|List| 27) (82 . |concat|)
              (|CharacterClass|) (88 . |charClass|) (93 . |position|)
              (100 . |elt|) (106 . SEGMENT) (111 . |rightTrim|)
              (|XHashTable| 12 12) (117 . |table|)
              (|Record| (|:| |categories| 45) (|:| |domains| 45)
                        (|:| |packages| 45))
              (|BrowserInformation|) (121 . |all_constructors|) (|List| 16)
              (125 . |concat|) (130 . |elt|) (137 . |setelt!|)
              |JFRICAS;extendConstructorURLs;XhtSXht;10| (144 . |empty?|)
              (149 . |alphanumeric|) (153 . |charClass|) (158 . |union|)
              (164 . |1|) (|NonNegativeInteger|) (168 . |#|) (173 . <=)
              (179 . |upperCase|) (183 . |zero?|) (188 . |member?|) (194 . +)
              (200 . -) (206 . |empty?|) (211 . |concat|) (|Mapping| 12 12)
              |JFRICAS;addLinks;XhtM;11| (|Reference| 65) (217 . |ref|)
              '|translateType| (222 . |setref|)
              |JFRICAS;setTranslateType!;2M;12| (228 . |deref|)
              (233 . |newline|) (237 . |split|) (243 . ~=) (249 . |position|)
              (|List| 12) (255 . |member?|) (261 . |rest|) (267 . |position|)
              |JFRICAS;handleOutput;B2S;14| |JFRICAS;initialize;V;16|
              (274 . |destruct|) |JFRICAS;start;NniB;17| (|FileName|)
              (279 . |coerce|) (|TextFile|) (284 . |open|) (290 . |writeLine!|)
              (296 . |close!|) |JFRICAS;kernel;V;18|
              |JFRICAS;fricaskernel;V;19|)
           '#(|start| 301 |setTranslateType!| 306 |kernel| 311
              |jfricasIOHandler| 315 |initialize| 321 |handleOutput| 325
              |fricaskernel| 331 |extendConstructorURLs| 335 |addLinks| 341)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|initialize| ((|Void|))) T)
                                   '((|start|
                                      ((|Boolean|) (|NonNegativeInteger|)))
                                     T)
                                   '((|jfricasIOHandler|
                                      ((|Void|) (|Symbol|) (|SExpression|)))
                                     T)
                                   '((|handleOutput|
                                      ((|String|) (|Boolean|) (|String|)))
                                     T)
                                   '((|kernel| ((|Void|))) T)
                                   '((|fricaskernel| ((|Void|))) T)
                                   '((|extendConstructorURLs|
                                      ((|XHashTable| (|String|) (|String|))
                                       (|XHashTable| (|String|) (|String|))
                                       (|String|)))
                                     T)
                                   '((|addLinks|
                                      ((|Mapping| (|String|) (|String|))
                                       (|XHashTable| (|String|) (|String|))))
                                     T)
                                   '((|setTranslateType!|
                                      ((|Mapping| (|String|) (|String|))
                                       (|Mapping| (|String|) (|String|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 92
                                            '(1 8 7 0 9 1 8 10 0 11 2 12 0 0 0
                                              13 0 14 0 15 1 16 12 0 17 2 12 7
                                              0 0 18 2 12 7 0 0 19 2 20 0 10 10
                                              21 2 12 0 0 20 22 2 12 0 0 24 25
                                              1 12 0 24 26 1 12 0 27 28 1 27 0
                                              10 29 2 12 27 0 10 30 2 12 0 0 27
                                              31 2 32 0 0 0 33 1 34 0 32 35 3
                                              12 10 34 0 10 36 2 12 0 0 20 37 1
                                              20 0 10 38 2 12 0 0 27 39 0 40 0
                                              41 0 43 42 44 1 45 0 24 46 3 40
                                              12 0 12 12 47 3 40 12 0 12 12 48
                                              1 40 7 0 50 0 34 0 51 1 34 0 12
                                              52 2 34 0 0 0 53 0 10 0 54 1 12
                                              55 0 56 2 10 7 0 0 57 0 34 0 58 1
                                              10 7 0 59 2 34 7 27 0 60 2 10 0 0
                                              0 61 2 10 0 0 0 62 1 12 7 0 63 2
                                              12 0 0 0 64 1 67 0 65 68 2 67 65
                                              0 65 70 1 67 65 0 72 0 27 0 73 2
                                              12 24 0 27 74 2 12 7 0 0 75 2 12
                                              10 27 0 76 2 77 7 12 0 78 2 77 0
                                              0 55 79 3 12 10 0 0 10 80 1 8 24
                                              0 83 1 85 0 12 86 2 87 0 85 12 88
                                              2 87 12 0 12 89 1 87 0 0 90 1 0 7
                                              55 84 1 0 65 65 71 0 0 14 91 2 0
                                              14 16 8 23 0 0 14 82 2 0 12 7 12
                                              81 0 0 14 92 2 0 40 40 12 49 1 0
                                              65 40 66)))))
           '|lookupComplete|)) 
