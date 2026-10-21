
(SDEFUN |OUTBOX;coerce;%Of;1| ((|x| (%)) (% (|OutputForm|)))
        (|coerceRe2E| |x|
                      (ELT
                       (|Record| (|:| |ht| (|NonNegativeInteger|))
                                 (|:| |dp| (|NonNegativeInteger|))
                                 (|:| |wd| (|NonNegativeInteger|))
                                 (|:| |ct| (|List| (|String|))))
                       0))) 

(MAKEPROP '|OUTBOX;empty;%;2| '|SPADreplace| '(XLAM NIL (VECTOR 0 0 0 NIL))) 

(SDEFUN |OUTBOX;empty;%;2| ((% (%))) (VECTOR 0 0 0 NIL)) 

(SDEFUN |OUTBOX;box;S%;3| ((|s| (|String|)) (% (%)))
        (VECTOR 1 0 (QCSIZE |s|) (LIST |s|))) 

(MAKEPROP '|OUTBOX;height;%Nni;4| '|SPADreplace|
          '(XLAM (|box|) (QVELT |box| 0))) 

(SDEFUN |OUTBOX;height;%Nni;4| ((|box| (%)) (% (|NonNegativeInteger|)))
        (QVELT |box| 0)) 

(MAKEPROP '|OUTBOX;depth;%Nni;5| '|SPADreplace| '(XLAM (|box|) (QVELT |box| 1))) 

(SDEFUN |OUTBOX;depth;%Nni;5| ((|box| (%)) (% (|NonNegativeInteger|)))
        (QVELT |box| 1)) 

(MAKEPROP '|OUTBOX;width;%Nni;6| '|SPADreplace| '(XLAM (|box|) (QVELT |box| 2))) 

(SDEFUN |OUTBOX;width;%Nni;6| ((|box| (%)) (% (|NonNegativeInteger|)))
        (QVELT |box| 2)) 

(MAKEPROP '|OUTBOX;lines;%L;7| '|SPADreplace| '(XLAM (|box|) (QVELT |box| 3))) 

(SDEFUN |OUTBOX;lines;%L;7| ((|box| (%)) (% (|List| (|String|))))
        (QVELT |box| 3)) 

(SDEFUN |OUTBOX;empty?;%B;8| ((|box| (%)) (% (|Boolean|)))
        (COND
         ((ZEROP (SPADCALL |box| (QREFELT % 12)))
          (ZEROP (SPADCALL |box| (QREFELT % 13))))
         ('T NIL))) 

(SDEFUN |OUTBOX;pad;4NniM;9|
        ((|t| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
         (% (|Mapping| % %)))
        (SPROG NIL
               (SEQ
                (CONS #'|OUTBOX;pad;4NniM;9!0| (VECTOR |b| |t| |r| |l| %))))) 

(SDEFUN |OUTBOX;pad;4NniM;9!0| ((|box| NIL) ($$ NIL))
        (PROG (% |l| |r| |t| |b|)
          (LETT % (QREFELT $$ 4))
          (LETT |l| (QREFELT $$ 3))
          (LETT |r| (QREFELT $$ 2))
          (LETT |t| (QREFELT $$ 1))
          (LETT |b| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|w| NIL) (|nw| NIL) (|nh| NIL) (|nd| NIL) (|emptyLine| NIL)
              (#1=#:G27 NIL) (|boxline| NIL) (#2=#:G28 NIL) (|line| NIL)
              (#3=#:G29 NIL) (|i| NIL) (#4=#:G30 NIL) (|newLines| NIL))
             (SEQ (LETT |w| (SPADCALL |box| (QREFELT % 14)))
                  (LETT |nw|
                        (SPADCALL (SPADCALL |l| |w| (QREFELT % 19)) |r|
                                  (QREFELT % 19)))
                  (LETT |nh|
                        (SPADCALL |t| (SPADCALL |box| (QREFELT % 12))
                                  (QREFELT % 19)))
                  (LETT |nd|
                        (SPADCALL |b| (SPADCALL |box| (QREFELT % 13))
                                  (QREFELT % 19)))
                  (LETT |emptyLine|
                        (SPADCALL |nw| (SPADCALL " " (QREFELT % 21))
                                  (QREFELT % 22)))
                  (LETT |newLines| (SPADCALL (QREFELT % 23)))
                  (SEQ (LETT |i| (|spadConstant| % 26)) (LETT #1# |t|) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |newLines|
                               (SPADCALL (SPADCALL |emptyLine| (QREFELT % 27))
                                         |newLines| (QREFELT % 28)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |boxline| NIL)
                       (LETT #2# (SPADCALL |box| (QREFELT % 16))) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |boxline| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |line| (SPADCALL |emptyLine| (QREFELT % 27)))
                            (SEQ (LETT |i| (|spadConstant| % 26))
                                 (LETT #3# |w|) G190
                                 (COND ((> |i| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |line|
                                             (SPADCALL |i| |l| (QREFELT % 19))
                                             (SPADCALL |boxline| |i|
                                                       (QREFELT % 30))
                                             (QREFELT % 31))))
                                 (LETT |i| (+ |i| 1)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |newLines|
                                   (SPADCALL |line| |newLines|
                                             (QREFELT % 28)))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| (|spadConstant| % 26)) (LETT #4# |b|) G190
                       (COND ((> |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |newLines|
                               (SPADCALL (SPADCALL |emptyLine| (QREFELT % 27))
                                         |newLines| (QREFELT % 28)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR |nh| |nd| |nw|
                           (SPADCALL |newLines| (QREFELT % 32)))))))))) 

(SDEFUN |OUTBOX;hcenter;NniM;10|
        ((|w| (|NonNegativeInteger|)) (% (|Mapping| % %)))
        (SPROG NIL (SEQ (CONS #'|OUTBOX;hcenter;NniM;10!0| (VECTOR % |w|))))) 

(SDEFUN |OUTBOX;hcenter;NniM;10!0| ((|box| NIL) ($$ NIL))
        (PROG (|w| %)
          (LETT |w| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|d| NIL) (|r| NIL) (|l| NIL))
                   (SEQ
                    (LETT |d|
                          (SPADCALL |w| (SPADCALL |box| (QREFELT % 14))
                                    (QREFELT % 35)))
                    (EXIT
                     (COND
                      ((SPADCALL |d| (|spadConstant| % 36) (QREFELT % 38))
                       (|error| "cannot fit into box"))
                      ('T
                       (SEQ
                        (LETT |l|
                              (SPADCALL
                               (SPADCALL |d|
                                         (SPADCALL (|spadConstant| % 26)
                                                   (QREFELT % 40))
                                         (QREFELT % 41))
                               (QREFELT % 42)))
                        (LETT |r| |l|)
                        (COND
                         ((SPADCALL |d| (QREFELT % 43))
                          (LETT |l|
                                (SPADCALL |l| (|spadConstant| % 26)
                                          (QREFELT % 19)))))
                        (EXIT
                         (SPADCALL |box|
                                   (SPADCALL (|spadConstant| % 36)
                                             (|spadConstant| % 36) |l| |r|
                                             (QREFELT % 34)))))))))))))) 

(SDEFUN |OUTBOX;vconcat;LNniI%;11|
        ((|lb| (|List| %)) (|h| (|NonNegativeInteger|)) (|adjust| (|Integer|))
         (% (%)))
        (SPROG
         ((#1=#:G53 NIL) (#2=#:G54 NIL) (|w| (|NonNegativeInteger|))
          (#3=#:G55 NIL) (#4=#:G56 NIL) (#5=#:G43 NIL) (#6=#:G57 NIL)
          (#7=#:G58 NIL) (#8=#:G46 NIL) (#9=#:G59 NIL) (|b| NIL)
          (#10=#:G60 NIL) (|newLines| (|List| (|String|))) (|d| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |lb| (QREFELT % 46)) (SPADCALL (QREFELT % 8)))
                (#11='T
                 (SEQ
                  (LETT |w|
                        (SPADCALL
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |b| NIL) (LETT #2# |lb|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |b| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS (SPADCALL |b| (QREFELT % 14))
                                             #1#))))
                               (LETT #2# (CDR #2#)) (GO G190) G191
                               (EXIT (NREVERSE #1#))))
                         (QREFELT % 48)))
                  (LETT |newLines|
                        (COND
                         ((< |adjust| 0)
                          (SPADCALL
                           (PROGN
                            (LETT #3# NIL)
                            (SEQ (LETT |b| NIL) (LETT #4# |lb|) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |b| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |b|
                                                     (SPADCALL 0 0 0
                                                               (PROG1
                                                                   (LETT #5#
                                                                         (- |w|
                                                                            (SPADCALL
                                                                             |b|
                                                                             (QREFELT
                                                                              %
                                                                              14))))
                                                                 (|check_subtype2|
                                                                  (>= #5# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #5#))
                                                               (QREFELT % 34)))
                                           (QREFELT % 16))
                                          #3#))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           (QREFELT % 50)))
                         ((> |adjust| 0)
                          (SPADCALL
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT |b| NIL) (LETT #7# |lb|) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |b| (CAR #7#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |b|
                                                     (SPADCALL 0 0
                                                               (PROG1
                                                                   (LETT #8#
                                                                         (- |w|
                                                                            (SPADCALL
                                                                             |b|
                                                                             (QREFELT
                                                                              %
                                                                              14))))
                                                                 (|check_subtype2|
                                                                  (>= #8# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #8#))
                                                               0
                                                               (QREFELT % 34)))
                                           (QREFELT % 16))
                                          #6#))))
                                 (LETT #7# (CDR #7#)) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           (QREFELT % 50)))
                         (#11#
                          (SPADCALL
                           (PROGN
                            (LETT #9# NIL)
                            (SEQ (LETT |b| NIL) (LETT #10# |lb|) G190
                                 (COND
                                  ((OR (ATOM #10#)
                                       (PROGN (LETT |b| (CAR #10#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |b|
                                                     (SPADCALL |w|
                                                               (QREFELT % 44)))
                                           (QREFELT % 16))
                                          #9#))))
                                 (LETT #10# (CDR #10#)) (GO G190) G191
                                 (EXIT (NREVERSE #9#))))
                           (QREFELT % 50)))))
                  (LETT |d| (- (LENGTH |newLines|) |h|))
                  (EXIT
                   (COND ((< |d| 0) (|error| "vconcat: negative depth"))
                         (#11# (VECTOR |h| |d| |w| |newLines|)))))))))) 

(SDEFUN |OUTBOX;vconcat;LNni%;12|
        ((|lb| (|List| %)) (|h| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |lb| |h| 0 (QREFELT % 51))) 

(SDEFUN |OUTBOX;hconcat;L%;13| ((|lb| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G86 NIL) (#2=#:G87 NIL) (|h| #3=(|NonNegativeInteger|))
          (#4=#:G88 NIL) (#5=#:G89 NIL) (|d| #3#) (#6=#:G90 NIL) (#7=#:G91 NIL)
          (|w| (|NonNegativeInteger|)) (|emptyLine| (|String|)) (|i| NIL)
          (#8=#:G92 NIL) (|newLine| (|String|)) (|b| NIL) (#9=#:G93 NIL)
          (|wb| (|NonNegativeInteger|)) (|hb| (|NonNegativeInteger|))
          (|ix| (|Integer|)) (|line| (|String|)) (|j| NIL) (#10=#:G94 NIL)
          (|wx| (|NonNegativeInteger|)) (|newLines| (|List| (|String|))))
         (SEQ
          (COND ((SPADCALL |lb| (QREFELT % 46)) (SPADCALL (QREFELT % 8)))
                ('T
                 (SEQ
                  (LETT |h|
                        (SPADCALL
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |b| NIL) (LETT #2# |lb|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |b| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS (SPADCALL |b| (QREFELT % 12))
                                             #1#))))
                               (LETT #2# (CDR #2#)) (GO G190) G191
                               (EXIT (NREVERSE #1#))))
                         (QREFELT % 48)))
                  (LETT |d|
                        (SPADCALL
                         (PROGN
                          (LETT #4# NIL)
                          (SEQ (LETT |b| NIL) (LETT #5# |lb|) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |b| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS (SPADCALL |b| (QREFELT % 13))
                                             #4#))))
                               (LETT #5# (CDR #5#)) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         (QREFELT % 48)))
                  (LETT |w|
                        (SPADCALL (ELT % 19)
                                  (PROGN
                                   (LETT #6# NIL)
                                   (SEQ (LETT |b| NIL) (LETT #7# |lb|) G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN (LETT |b| (CAR #7#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL |b| (QREFELT % 14))
                                                 #6#))))
                                        (LETT #7# (CDR #7#)) (GO G190) G191
                                        (EXIT (NREVERSE #6#))))
                                  (QREFELT % 54)))
                  (LETT |emptyLine|
                        (|make_string_code| |w| (|STR_to_CHAR| " ")))
                  (LETT |newLines| NIL)
                  (SEQ (LETT |i| 1) (LETT #8# (+ |h| |d|)) G190
                       (COND ((|greater_SI| |i| #8#) (GO G191)))
                       (SEQ (LETT |newLine| (COPY-SEQ |emptyLine|))
                            (LETT |wx| 0)
                            (SEQ (LETT |b| NIL) (LETT #9# |lb|) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN (LETT |b| (CAR #9#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |wb| (SPADCALL |b| (QREFELT % 14)))
                                      (LETT |hb| (SPADCALL |b| (QREFELT % 12)))
                                      (LETT |ix| (+ (- |hb| |h|) |i|))
                                      (COND
                                       ((< 0 |ix|)
                                        (COND
                                         ((<= |ix|
                                              (+ |hb|
                                                 (SPADCALL |b|
                                                           (QREFELT % 13))))
                                          (SEQ
                                           (LETT |line|
                                                 (SPADCALL
                                                  (SPADCALL |b| (QREFELT % 16))
                                                  |ix| (QREFELT % 55)))
                                           (EXIT
                                            (SEQ (LETT |j| 1) (LETT #10# |wb|)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |j| #10#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SPADCALL |newLine|
                                                             (+ |wx| |j|)
                                                             (SPADCALL |line|
                                                                       |j|
                                                                       (QREFELT
                                                                        % 30))
                                                             (QREFELT % 31))))
                                                 (LETT |j| (|inc_SI| |j|))
                                                 (GO G190) G191
                                                 (EXIT NIL))))))))
                                      (EXIT (LETT |wx| (+ |wx| |wb|))))
                                 (LETT #9# (CDR #9#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |newLines| (CONS |newLine| |newLines|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |h| |d| |w| (NREVERSE |newLines|))))))))) 

(DECLAIM (NOTINLINE |OutputBox;|)) 

(DEFUN |OutputBox;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OutputBox|))
          (LETT % (GETREFV 57))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OutputBox| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |OutputBox| ()
  (SPROG NIL
         (PROG (#1=#:G96)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OutputBox|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OutputBox|
                             (LIST (CONS NIL (CONS 1 (|OutputBox;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OutputBox|)))))))))) 

(MAKEPROP '|OutputBox| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |OUTBOX;coerce;%Of;1|
              |OUTBOX;empty;%;2| (|String|) |OUTBOX;box;S%;3|
              (|NonNegativeInteger|) |OUTBOX;height;%Nni;4|
              |OUTBOX;depth;%Nni;5| |OUTBOX;width;%Nni;6| (|List| 9)
              |OUTBOX;lines;%L;7| (|Boolean|) |OUTBOX;empty?;%B;8| (0 . +)
              (|Character|) (6 . |char|) (11 . |new|) (17 . |empty|)
              (|SingleInteger|) (21 . |1|) (25 . |1|) (29 . |copy|)
              (34 . |cons|) (|Integer|) (40 . |elt|) (46 . |setelt!|)
              (53 . |reverse!|) (|Mapping| % %) |OUTBOX;pad;4NniM;9| (58 . -)
              (64 . |0|) (68 . |0|) (72 . <) (78 . |1|) (82 . -) (87 . |shift|)
              (93 . |qcoerce|) (98 . |odd?|) |OUTBOX;hcenter;NniM;10|
              (|List| $$) (103 . |empty?|) (|List| 11) (108 . |max|) (|List| %)
              (113 . |concat|) |OUTBOX;vconcat;LNniI%;11|
              |OUTBOX;vconcat;LNni%;12| (|Mapping| 11 11 11) (118 . |reduce|)
              (124 . |elt|) |OUTBOX;hconcat;L%;13|)
           '#(|width| 130 |vconcat| 135 |pad| 148 |lines| 156 |height| 161
              |hconcat| 166 |hcenter| 171 |empty?| 176 |empty| 181 |depth| 185
              |coerce| 190 |box| 195)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 6))
                             (|makeByteWordVec2| 56
                                                 '(2 11 0 0 0 19 1 20 0 9 21 2
                                                   9 0 11 20 22 0 15 0 23 0 24
                                                   0 25 0 11 0 26 1 9 0 0 27 2
                                                   15 0 9 0 28 2 9 20 0 29 30 3
                                                   9 20 0 29 20 31 1 15 0 0 32
                                                   2 29 0 0 0 35 0 11 0 36 0 29
                                                   0 37 2 29 17 0 0 38 0 29 0
                                                   39 1 29 0 0 40 2 29 0 0 0 41
                                                   1 11 0 29 42 1 29 17 0 43 1
                                                   45 17 0 46 1 47 11 0 48 1 15
                                                   0 49 50 2 47 11 53 0 54 2 15
                                                   9 0 29 55 1 0 11 0 14 2 0 0
                                                   49 11 52 3 0 0 49 11 29 51 4
                                                   0 33 11 11 11 11 34 1 0 15 0
                                                   16 1 0 11 0 12 1 0 0 49 56 1
                                                   0 33 11 44 1 0 17 0 18 0 0 0
                                                   8 1 0 11 0 13 1 0 6 0 7 1 0
                                                   0 9 10)))))
           '|lookupComplete|)) 
