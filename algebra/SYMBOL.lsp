
(SDEFUN |SYMBOL;writeOMSym| ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (COND
         ((SPADCALL |x| (QREFELT % 18))
          (|error| "Cannot convert a scripted symbol to OpenMath"))
         ('T (SPADCALL |dev| |x| (QREFELT % 22))))) 

(SDEFUN |SYMBOL;OMwrite;Omd%BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 23))))
             (|SYMBOL;writeOMSym| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 24))))))) 

(SDEFUN |SYMBOL;convert;%If;3| ((|s| (%)) (% (|InputForm|)))
        (SPROG
         ((|n| (|InputForm|))
          (|ls|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|)))))
          (#1=#:G48 NIL) (#2=#:G49 NIL) (A (|List| (|InputForm|)))
          (#3=#:G50 NIL) (#4=#:G51 NIL) (B (|List| (|InputForm|)))
          (#5=#:G52 NIL) (#6=#:G53 NIL) (C (|List| (|InputForm|)))
          (#7=#:G54 NIL) (#8=#:G55 NIL) (D (|List| (|InputForm|)))
          (#9=#:G56 NIL) (#10=#:G57 NIL) (E (|List| (|InputForm|)))
          (|a| #11=(|InputForm|)) (|b| #11#) (#12=#:G58 NIL) (|e| NIL)
          (#13=#:G59 NIL) (FF (|List| (|List| (|InputForm|)))) (#14=#:G60 NIL)
          (F NIL) (#15=#:G61 NIL) (G (|List| (|InputForm|)))
          (|d| (|InputForm|)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 29)))
              (COND ((NULL (SPADCALL |s| (QREFELT % 18))) (EXIT |n|)))
              (LETT |ls| (SPADCALL |s| (QREFELT % 31)))
              (LETT A
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |e| NIL) (LETT #2# (QVELT |ls| 0)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |e| (QREFELT % 34)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT B
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |e| NIL) (LETT #4# (QVELT |ls| 1)) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |e| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (SPADCALL |e| (QREFELT % 34)) #3#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (LETT C
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |e| NIL) (LETT #6# (QVELT |ls| 2)) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |e| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (SPADCALL |e| (QREFELT % 34)) #5#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT D
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |e| NIL) (LETT #8# (QVELT |ls| 3)) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |e| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (SPADCALL |e| (QREFELT % 34)) #7#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT E
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |e| NIL) (LETT #10# (QVELT |ls| 4)) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |e| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS (SPADCALL |e| (QREFELT % 34)) #9#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT |a| (SPADCALL '|script| (QREFELT % 35)))
              (LETT |b| (SPADCALL '|construct| (QREFELT % 35)))
              (LETT FF
                    (PROGN
                     (LETT #12# NIL)
                     (SEQ (LETT |e| NIL) (LETT #13# (LIST A B C D E)) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |e| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #12# (CONS (CONS |b| |e|) #12#))))
                          (LETT #13# (CDR #13#)) (GO G190) G191
                          (EXIT (NREVERSE #12#)))))
              (LETT G
                    (PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT F NIL) (LETT #15# FF) G190
                          (COND
                           ((OR (ATOM #15#) (PROGN (LETT F (CAR #15#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL F (QREFELT % 37)) #14#))))
                          (LETT #15# (CDR #15#)) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
              (LETT |d| (SPADCALL (CONS |b| G) (QREFELT % 37)))
              (EXIT (SPADCALL (LIST |a| |n| |d|) (QREFELT % 37)))))) 

(MAKEPROP '|SYMBOL;convert;2%;4| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |SYMBOL;convert;2%;4| ((|s| (%)) (% (|Symbol|))) |s|) 

(SDEFUN |SYMBOL;coerce;S%;5| ((|s| (|String|)) (% (%))) (VALUES (INTERN |s|))) 

(MAKEPROP '|SYMBOL;=;2%B;6| '|SPADreplace| 'EQUAL) 

(SDEFUN |SYMBOL;=;2%B;6| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQUAL |x| |y|)) 

(SDEFUN |SYMBOL;hashUpdate!;Hs%Hs;7|
        ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |SYMBOL;<;2%B;8| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL |x| (QREFELT % 18))
          (COND ((SPADCALL |y| (QREFELT % 18)) (|lt_sexp| |x| |y|))
                (#1='T 'T)))
         ((SPADCALL |y| (QREFELT % 18)) NIL) (#1# (|lt_sexp| |x| |y|)))) 

(SDEFUN |SYMBOL;coerce;%Of;9| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|ss|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|)))))
          (|rsl| (|List| (|List| (|OutputForm|)))) (|si| NIL) (#1=#:G81 NIL)
          (#2=#:G80 NIL) (|se| (|OutputForm|)) (|sl| (|List| (|OutputForm|)))
          (|x0| (|OutputForm|)) (|a| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((NULL (SPADCALL |x| (QREFELT % 18))) (SPADCALL |x| (QREFELT % 46)))
           ('T
            (SEQ (LETT |ss| (SPADCALL |x| (QREFELT % 31)))
                 (LETT |rsl|
                       (LIST (QVELT |ss| 3) (QVELT |ss| 2) (QVELT |ss| 1)
                             (QVELT |ss| 0)))
                 (LETT |sl| NIL)
                 (SEQ (LETT |si| NIL) (LETT #1# |rsl|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ
                         (COND
                          ((NULL |sl|)
                           (COND
                            ((NULL |si|)
                             (EXIT
                              (PROGN (LETT #2# |$NoValue|) (GO #3=#:G72)))))))
                         (LETT |se|
                               (COND ((EQL (LENGTH |si|) 1) (|SPADfirst| |si|))
                                     ('T (SPADCALL |si| (QREFELT % 47)))))
                         (EXIT (LETT |sl| (CONS |se| |sl|)))))
                       #3# (EXIT #2#))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (LETT |x0|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT % 29)) (QREFELT % 46))
                        |sl| (QREFELT % 48)))
                 (LETT |a| (QVELT |ss| 4))
                 (EXIT
                  (COND ((NULL |a|) |x0|)
                        ('T (SPADCALL |x0| |a| (QREFELT % 49))))))))))) 

(SDEFUN |SYMBOL;subscript;%L%;10|
        ((|sy| (%)) (|lx| (|List| (|OutputForm|))) (% (%)))
        (SPADCALL |sy| (LIST |lx| NIL NIL NIL NIL) (QREFELT % 52))) 

(SDEFUN |SYMBOL;elt;%L%;11| ((|sy| (%)) (|lx| (|List| (|OutputForm|))) (% (%)))
        (SPADCALL |sy| |lx| (QREFELT % 54))) 

(SDEFUN |SYMBOL;superscript;%L%;12|
        ((|sy| (%)) (|lx| (|List| (|OutputForm|))) (% (%)))
        (SPADCALL |sy| (LIST NIL |lx| NIL NIL NIL) (QREFELT % 52))) 

(SDEFUN |SYMBOL;argscript;%L%;13|
        ((|sy| (%)) (|lx| (|List| (|OutputForm|))) (% (%)))
        (SPADCALL |sy| (LIST NIL NIL NIL NIL |lx|) (QREFELT % 52))) 

(SDEFUN |SYMBOL;patternMatch;%P2Pmr;14|
        ((|x| (%)) (|p| (|Pattern| #1=(|Integer|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 61))) 

(SDEFUN |SYMBOL;patternMatch;%P2Pmr;15|
        ((|x| (%)) (|p| (|Pattern| #1=(|Float|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 67))) 

(SDEFUN |SYMBOL;convert;%P;16| ((|x| (%)) (% (|Pattern| (|Float|))))
        (SPADCALL |x| (QREFELT % 70))) 

(SDEFUN |SYMBOL;convert;%P;17| ((|x| (%)) (% (|Pattern| (|Integer|))))
        (SPADCALL |x| (QREFELT % 72))) 

(SDEFUN |SYMBOL;syprefix|
        ((|sc|
          (|Record| (|:| |sub| (|List| (|OutputForm|)))
                    (|:| |sup| (|List| (|OutputForm|)))
                    (|:| |presup| (|List| (|OutputForm|)))
                    (|:| |presub| (|List| (|OutputForm|)))
                    (|:| |args| (|List| (|OutputForm|)))))
         (% (|String|)))
        (SPROG
         ((|ns| (|List| (|Integer|))) (#1=#:G95 NIL) (|n| NIL) (#2=#:G96 NIL))
         (SEQ
          (LETT |ns|
                (LIST (LENGTH (QVELT |sc| 0)) (LENGTH (QVELT |sc| 1))
                      (LENGTH (QVELT |sc| 2)) (LENGTH (QVELT |sc| 3))))
          (EXIT
           (SPADCALL
            (CONS
             (STRCONC (QREFELT % 26)
                      (|SYMBOL;istring| (LENGTH (QVELT |sc| 4)) %))
             (PROGN
              (LETT #1# NIL)
              (SEQ (LETT |n| NIL) (LETT #2# |ns|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |n| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #1# (CONS (|SYMBOL;istring| |n| %) #1#))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT (NREVERSE #1#)))))
            (QREFELT % 74)))))) 

(SDEFUN |SYMBOL;syscripts|
        ((|sc|
          (|Record| (|:| |sub| (|List| (|OutputForm|)))
                    (|:| |sup| (|List| (|OutputForm|)))
                    (|:| |presup| (|List| (|OutputForm|)))
                    (|:| |presub| #1=(|List| (|OutputForm|)))
                    (|:| |args| (|List| (|OutputForm|)))))
         (% (|List| (|OutputForm|))))
        (SPROG ((|all| #1#))
               (SEQ (LETT |all| (QVELT |sc| 3))
                    (LETT |all| (SPADCALL (QVELT |sc| 2) |all| (QREFELT % 75)))
                    (LETT |all| (SPADCALL (QVELT |sc| 1) |all| (QREFELT % 75)))
                    (LETT |all| (SPADCALL (QVELT |sc| 0) |all| (QREFELT % 75)))
                    (EXIT (SPADCALL |all| (QVELT |sc| 4) (QREFELT % 75)))))) 

(SDEFUN |SYMBOL;script;%L%;20|
        ((|sy| (%)) (|ls| (|List| (|List| (|OutputForm|)))) (% (%)))
        (SPROG
         ((|sc|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|))))))
         (SEQ (LETT |sc| (VECTOR NIL NIL NIL NIL NIL))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 0 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 1 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 2 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 3 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 4 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (EXIT (SPADCALL |sy| |sc| (QREFELT % 76)))))) 

(SDEFUN |SYMBOL;script;%R%;21|
        ((|sy| (%))
         (|sc|
          (|Record| (|:| |sub| (|List| (|OutputForm|)))
                    (|:| |sup| (|List| (|OutputForm|)))
                    (|:| |presup| (|List| (|OutputForm|)))
                    (|:| |presub| (|List| (|OutputForm|)))
                    (|:| |args| (|List| (|OutputForm|)))))
         (% (%)))
        (COND
         ((SPADCALL |sy| (QREFELT % 18))
          (|error| "Cannot add scripts to a scripted symbol"))
         ('T
          (CONS
           (SPADCALL
            (SPADCALL
             (STRCONC (|SYMBOL;syprefix| |sc| %)
                      (SPADCALL (SPADCALL |sy| (QREFELT % 29)) (QREFELT % 77)))
             (QREFELT % 41))
            (QREFELT % 50))
           (|SYMBOL;syscripts| |sc| %))))) 

(SDEFUN |SYMBOL;string;%S;22| ((|e| (%)) (% (|String|)))
        (COND ((NULL (SPADCALL |e| (QREFELT % 18))) (PNAME |e|))
              ('T (|error| "Cannot form string from non-atomic symbols.")))) 

(SDEFUN |SYMBOL;anyRadix| ((|n| (|Integer|)) (|s| (|String|)) (% (|String|)))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|ns| (|String|)) (#1=#:G126 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ns| "")
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |qr| (|divide_INT| |n| (QCSIZE |s|)))
                           (LETT |n| (QCAR |qr|))
                           (LETT |ns|
                                 (SPADCALL
                                  (SPADCALL |s|
                                            (+ (QCDR |qr|)
                                               (SPADCALL |s| (QREFELT % 79)))
                                            (QREFELT % 81))
                                  |ns| (QREFELT % 82)))
                           (EXIT
                            (COND
                             ((ZEROP |n|)
                              (PROGN (LETT #1# |ns|) (GO #2=#:G125))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |SYMBOL;new;%;24| ((% (%)))
        (SPROG ((|sym| (|String|)))
               (SEQ
                (LETT |sym| (|SYMBOL;anyRadix| (QREFELT % 6) (QREFELT % 15) %))
                (SETELT % 6 (+ (QREFELT % 6) 1))
                (EXIT (SPADCALL (STRCONC "%" |sym|) (QREFELT % 41)))))) 

(SDEFUN |SYMBOL;new;2%;25| ((|x| (%)) (% (%)))
        (SPROG
         ((|u| (|Union| (|Integer|) "failed")) (|n| (|Integer|))
          (|xx| (|String|)))
         (SEQ
          (LETT |n|
                (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 9) (QREFELT % 85)))
                     (EXIT
                      (COND ((QEQCAR |u| 1) 0) (#1='T (+ (QCDR |u|) 1))))))
          (SPADCALL (QREFELT % 9) |x| |n| (QREFELT % 86))
          (LETT |xx|
                (COND
                 ((NULL (SPADCALL |x| (QREFELT % 18)))
                  (SPADCALL |x| (QREFELT % 77)))
                 ('T (SPADCALL (SPADCALL |x| (QREFELT % 29)) (QREFELT % 77)))))
          (LETT |xx| (STRCONC "%" |xx|))
          (LETT |xx|
                (COND
                 ((>=
                   (SPADCALL
                    (SPADCALL |xx| (SPADCALL |xx| (QREFELT % 87))
                              (QREFELT % 81))
                    (QREFELT % 14) (QREFELT % 88))
                   (SPADCALL (QREFELT % 14) (QREFELT % 79)))
                  (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT % 16) %)))
                 (#1#
                  (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT % 14) %)))))
          (COND
           ((NULL (SPADCALL |x| (QREFELT % 18)))
            (EXIT (SPADCALL |xx| (QREFELT % 41)))))
          (EXIT
           (SPADCALL (SPADCALL |xx| (QREFELT % 41))
                     (SPADCALL |x| (QREFELT % 31)) (QREFELT % 76)))))) 

(SDEFUN |SYMBOL;resetNew;V;26| ((% (|Void|)))
        (SPROG ((|k| NIL) (#1=#:G152 NIL))
               (SEQ (SETELT % 6 0)
                    (SEQ (LETT |k| NIL)
                         (LETT #1# (SPADCALL (QREFELT % 9) (QREFELT % 91)))
                         G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (SPADCALL |k| (QREFELT % 9) (QREFELT % 92))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL (QREFELT % 93)))))) 

(SDEFUN |SYMBOL;scripted?;%B;27| ((|sy| (%)) (% (|Boolean|)))
        (NULL (ATOM |sy|))) 

(MAKEPROP '|SYMBOL;of_list| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SYMBOL;of_list| ((|x| (%)) (% (|List| (|OutputForm|)))) |x|) 

(SDEFUN |SYMBOL;name;2%;29| ((|sy| (%)) (% (%)))
        (SPROG ((|str| (|String|)) (|si| (|NonNegativeInteger|)))
               (SEQ
                (COND ((NULL (SPADCALL |sy| (QREFELT % 18))) |sy|)
                      ('T
                       (SEQ
                        (LETT |str|
                              (SPADCALL (|SPADfirst| (|SYMBOL;of_list| |sy| %))
                                        (QREFELT % 77)))
                        (LETT |si| (+ (+ (QREFELT % 27) 4) 2))
                        (EXIT
                         (SPADCALL
                          (SPADCALL |str|
                                    (SPADCALL |si| (QCSIZE |str|)
                                              (QREFELT % 96))
                                    (QREFELT % 97))
                          (QREFELT % 41))))))))) 

(SDEFUN |SYMBOL;scripts;%R;30|
        ((|sy| (%))
         (%
          (|Record| (|:| |sub| (|List| (|OutputForm|)))
                    (|:| |sup| (|List| (|OutputForm|)))
                    (|:| |presup| (|List| (|OutputForm|)))
                    (|:| |presub| (|List| (|OutputForm|)))
                    (|:| |args| (|List| (|OutputForm|))))))
        (SPROG
         ((|lscripts| (|List| (|List| (|OutputForm|)))) (|str| (|String|))
          (|j| NIL) (#1=#:G169 NIL) (#2=#:G161 NIL)
          (|nscripts| (|List| (|NonNegativeInteger|))) (|m| (|Integer|))
          (|n| NIL) (#3=#:G170 NIL) (|i| NIL)
          (|allscripts| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((NULL (SPADCALL |sy| (QREFELT % 18))) (VECTOR NIL NIL NIL NIL NIL))
           ('T
            (SEQ (LETT |nscripts| (LIST 0 0 0 0 0))
                 (LETT |lscripts| (LIST NIL NIL NIL NIL NIL))
                 (LETT |str|
                       (SPADCALL (|SPADfirst| (|SYMBOL;of_list| |sy| %))
                                 (QREFELT % 77)))
                 (LETT |m| (PROGN |nscripts| 1))
                 (SEQ (LETT |j| (+ (QREFELT % 27) 1))
                      (LETT #1# (+ (+ (QREFELT % 27) 4) 1)) (LETT |i| |m|) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |nscripts| |i|
                                  (PROG1
                                      (LETT #2#
                                            (-
                                             (SPADCALL |str| |j|
                                                       (QREFELT % 81))
                                             (QREFELT % 28)))
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT % 100))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))
                 (LETT |nscripts|
                       (SPADCALL (CDR |nscripts|) (|SPADfirst| |nscripts|)
                                 (QREFELT % 101)))
                 (LETT |allscripts| (CDR (|SYMBOL;of_list| |sy| %)))
                 (LETT |m| (PROGN |lscripts| 1))
                 (SEQ (LETT |n| NIL) (LETT #3# |nscripts|) (LETT |i| |m|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((< (LENGTH |allscripts|) |n|)
                          (|error| "Improper script count in symbol"))
                         ('T
                          (SEQ
                           (SPADCALL |lscripts| |i|
                                     (SPADCALL |allscripts| |n|
                                               (QREFELT % 102))
                                     (QREFELT % 103))
                           (EXIT
                            (LETT |allscripts|
                                  (SPADCALL |allscripts| |n|
                                            (QREFELT % 104)))))))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT #3# (CDR #3#))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (VECTOR (SPADCALL |lscripts| |m| (QREFELT % 105))
                          (SPADCALL |lscripts| (+ |m| 1) (QREFELT % 105))
                          (SPADCALL |lscripts| (+ |m| 2) (QREFELT % 105))
                          (SPADCALL |lscripts| (+ |m| 3) (QREFELT % 105))
                          (SPADCALL |lscripts| (+ |m| 4)
                                    (QREFELT % 105)))))))))) 

(SDEFUN |SYMBOL;istring| ((|n| (|Integer|)) (% (|String|)))
        (COND ((> |n| 9) (|error| "Can have at most 9 scripts of each kind"))
              ('T (QAREF1 (QREFELT % 13) (+ |n| (PROGN (QREFELT % 13) 0)))))) 

(SDEFUN |SYMBOL;sample;%;32| ((% (%))) (SPADCALL "aSymbol" (QREFELT % 41))) 

(DECLAIM (NOTINLINE |Symbol;|)) 

(DEFUN |Symbol;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Symbol|))
          (LETT % (GETREFV 108))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Symbol| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 0)
          (QSETREFV % 9 (SPADCALL (QREFELT % 8)))
          (QSETREFV % 13
                    (SPADCALL (LIST #1="0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
                              (QREFELT % 12)))
          (QSETREFV % 14 "0123456789")
          (QSETREFV % 15 "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
          (QSETREFV % 16 "abcdefghijklmnopqrstuvwxyz")
          (QSETREFV % 26 "*")
          (QSETREFV % 27 (QCSIZE (QREFELT % 26)))
          (QSETREFV % 28 (|STR_to_CHAR| #1#))
          %))) 

(DEFUN |Symbol| ()
  (SPROG NIL
         (PROG (#1=#:G174)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Symbol|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Symbol|
                             (LIST (CONS NIL (CONS 1 (|Symbol;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Symbol|)))))))))) 

(MAKEPROP '|Symbol| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|count| (|AssociationList| $$ 78)
              (0 . |empty|) '|xcount| (|List| 40) (|PrimitiveArray| 40)
              (4 . |construct|) '|istrings| '|nums| 'ALPHAS '|alphas|
              (|Boolean|) |SYMBOL;scripted?;%B;27| (|Void|) (|Symbol|)
              (|OpenMathDevice|) (9 . |OMputVariable|) (15 . |OMputObject|)
              (20 . |OMputEndObject|) |SYMBOL;OMwrite;Omd%BV;2| '|hd| '|lhd|
              '|ord0| |SYMBOL;name;2%;29|
              (|Record| (|:| |sub| 53) (|:| |sup| 53) (|:| |presup| 53)
                        (|:| |presub| 53) (|:| |args| 53))
              |SYMBOL;scripts;%R;30| (|InputForm|) (|OutputForm|)
              (25 . |convert|) (30 . |convert|) (|List| %) (35 . |convert|)
              |SYMBOL;convert;%If;3| |SYMBOL;convert;2%;4| (|String|)
              |SYMBOL;coerce;S%;5| |SYMBOL;=;2%B;6| (|HashState|)
              |SYMBOL;hashUpdate!;Hs%Hs;7| |SYMBOL;<;2%B;8| (40 . |outputForm|)
              (45 . |commaSeparate|) (50 . |scripts|) (56 . |prefix|)
              |SYMBOL;coerce;%Of;9| (|List| 53) |SYMBOL;script;%L%;20|
              (|List| 33) |SYMBOL;subscript;%L%;10| |SYMBOL;elt;%L%;11|
              |SYMBOL;superscript;%L%;12| |SYMBOL;argscript;%L%;13|
              (|PatternMatchResult| 78 20) (|Pattern| 78)
              (|PatternMatchSymbol| 78) (62 . |patternMatch|)
              (|PatternMatchResult| 78 %) |SYMBOL;patternMatch;%P2Pmr;14|
              (|PatternMatchResult| (|Float|) 20) (|Pattern| (|Float|))
              (|PatternMatchSymbol| (|Float|)) (69 . |patternMatch|)
              (|PatternMatchResult| (|Float|) %)
              |SYMBOL;patternMatch;%P2Pmr;15| (76 . |coerce|)
              |SYMBOL;convert;%P;16| (81 . |coerce|) |SYMBOL;convert;%P;17|
              (86 . |concat|) (91 . |concat|) |SYMBOL;script;%R%;21|
              |SYMBOL;string;%S;22| (|Integer|) (97 . |minIndex|) (|Character|)
              (102 . |elt|) (108 . |concat|) |SYMBOL;new;%;24|
              (|Union| 78 '"failed") (114 . |search|) (120 . |setelt!|)
              (127 . |maxIndex|) (132 . |position|) |SYMBOL;new;2%;25|
              (|List| $$) (138 . |keys|) (143 . |remove!|) (149 . |void|)
              |SYMBOL;resetNew;V;26| (|UniversalSegment| 78) (153 . SEGMENT)
              (159 . |elt|) (|NonNegativeInteger|) (|List| 98)
              (165 . |setelt!|) (172 . |concat|) (178 . |first|)
              (184 . |setelt!|) (191 . |rest|) (197 . |elt|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SYMBOL;sample;%;32|) %))
              (|SingleInteger|))
           '#(~= 203 |superscript| 209 |subscript| 215 |string| 221 |smaller?|
              226 |sign| 232 |scripts| 237 |scripted?| 242 |script| 247
              |sample| 259 |resetNew| 263 |positive?| 267 |patternMatch| 272
              |new| 286 |negative?| 295 |name| 300 |min| 305 |max| 311 |latex|
              317 |hashUpdate!| 322 |hash| 328 |elt| 333 |convert| 339 |coerce|
              359 |argscript| 369 |OMwrite| 375 >= 399 > 405 = 411 <= 417 <
              423)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL NIL |Hashable&| |SetCategory&|
                     NIL |PartialOrder&| NIL |OpenMath&| |BasicType&| NIL NIL
                     NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|PatternMatchable| 78)
                      (|PatternMatchable| (|Float|))
                      (|ComparableRepresentation|) (|Hashable|) (|SetCategory|)
                      (|CoercibleTo| 33) (|PartialOrder|) (|ConvertibleTo| 32)
                      (|OpenMath|) (|BasicType|) (|ConvertibleTo| 20)
                      (|ConvertibleTo| 59) (|ConvertibleTo| 65))
                   (|makeByteWordVec2| 107
                                       '(0 7 0 8 1 11 0 10 12 2 21 19 0 20 22 1
                                         21 19 0 23 1 21 19 0 24 1 33 32 0 34 1
                                         32 0 20 35 1 32 0 36 37 1 33 0 20 46 1
                                         33 0 36 47 2 33 0 0 36 48 2 33 0 0 36
                                         49 3 60 58 20 59 58 61 3 66 64 20 65
                                         64 67 1 65 0 20 70 1 59 0 20 72 1 40 0
                                         36 74 2 53 0 0 0 75 1 40 78 0 79 2 40
                                         80 0 78 81 2 40 0 80 0 82 2 7 84 2 0
                                         85 3 7 78 0 2 78 86 1 40 78 0 87 2 40
                                         78 80 0 88 1 7 90 0 91 2 7 84 2 0 92 0
                                         19 0 93 2 95 0 78 78 96 2 40 0 0 95 97
                                         3 99 98 0 78 98 100 2 99 0 0 98 101 2
                                         53 0 0 98 102 3 51 53 0 78 53 103 2 53
                                         0 0 98 104 2 51 53 0 78 105 2 0 17 0 0
                                         1 2 0 0 0 53 56 2 0 0 0 53 54 1 0 40 0
                                         77 2 0 17 0 0 1 1 1 78 0 1 1 0 30 0 31
                                         1 0 17 0 18 2 0 0 0 51 52 2 0 0 0 30
                                         76 0 0 0 106 0 0 19 94 1 1 17 0 1 3 0
                                         68 0 65 68 69 3 0 62 0 59 62 63 1 0 0
                                         0 89 0 0 0 83 1 1 17 0 1 1 0 0 0 29 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 40 0 1 2 0
                                         43 43 0 44 1 0 107 0 1 2 0 0 0 53 55 1
                                         0 32 0 38 1 0 59 0 73 1 0 20 0 39 1 0
                                         65 0 71 1 0 33 0 50 1 0 0 40 41 2 0 0
                                         0 53 57 1 0 40 0 1 2 0 19 21 0 1 2 0
                                         40 0 17 1 3 0 19 21 0 17 25 2 0 17 0 0
                                         1 2 0 17 0 0 1 2 0 17 0 0 42 2 0 17 0
                                         0 1 2 0 17 0 0 45)))))
           '|lookupComplete|)) 
