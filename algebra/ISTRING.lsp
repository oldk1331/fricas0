
(MAKEPROP '|ISTRING;new;NniC%;1| '|SPADreplace| '|make_string_code|) 

(SDEFUN |ISTRING;new;NniC%;1|
        ((|n| (|NonNegativeInteger|)) (|c| (|Character|)) (% (%)))
        (|make_string_code| |n| |c|)) 

(MAKEPROP '|ISTRING;empty;%;2| '|SPADreplace| '(XLAM NIL (|filler_spaces| 0))) 

(SDEFUN |ISTRING;empty;%;2| ((% (%))) (|filler_spaces| 0)) 

(SDEFUN |ISTRING;empty?;%B;3| ((|s| (%)) (% (|Boolean|))) (EQL (QCSIZE |s|) 0)) 

(MAKEPROP '|ISTRING;#;%Nni;4| '|SPADreplace| 'QCSIZE) 

(SDEFUN |ISTRING;#;%Nni;4| ((|s| (%)) (% (|NonNegativeInteger|))) (QCSIZE |s|)) 

(MAKEPROP '|ISTRING;=;2%B;5| '|SPADreplace| 'EQUAL) 

(SDEFUN |ISTRING;=;2%B;5| ((|s| (%)) (|t| (%)) (% (|Boolean|))) (EQUAL |s| |t|)) 

(MAKEPROP '|ISTRING;<;2%B;6| '|SPADreplace|
          '(XLAM (|s| |t|) (CGREATERP |t| |s|))) 

(SDEFUN |ISTRING;<;2%B;6| ((|s| (%)) (|t| (%)) (% (|Boolean|)))
        (CGREATERP |t| |s|)) 

(MAKEPROP '|ISTRING;concat;3%;7| '|SPADreplace| 'STRCONC) 

(SDEFUN |ISTRING;concat;3%;7| ((|s| (%)) (|t| (%)) (% (%))) (STRCONC |s| |t|)) 

(MAKEPROP '|ISTRING;copy;2%;8| '|SPADreplace| 'COPY-SEQ) 

(SDEFUN |ISTRING;copy;2%;8| ((|s| (%)) (% (%))) (COPY-SEQ |s|)) 

(SDEFUN |ISTRING;insert;2%I%;9| ((|s| (%)) (|t| (%)) (|i| (|Integer|)) (% (%)))
        (SPADCALL
         (SPADCALL
          (SPADCALL |s| (SPADCALL (QREFELT % 6) (- |i| 1) (QREFELT % 20))
                    (QREFELT % 21))
          |t| (QREFELT % 16))
         (SPADCALL |s| (SPADCALL |i| (QREFELT % 22)) (QREFELT % 21))
         (QREFELT % 16))) 

(SDEFUN |ISTRING;coerce;%Of;10| ((|s| (%)) (% (|OutputForm|)))
        (SPADCALL |s| (QREFELT % 26))) 

(SDEFUN |ISTRING;minIndex;%I;11| ((|s| (%)) (% (|Integer|))) (QREFELT % 6)) 

(SDEFUN |ISTRING;upperCase!;2%;12| ((|s| (%)) (% (%)))
        (SPADCALL (ELT % 29) |s| (QREFELT % 31))) 

(SDEFUN |ISTRING;lowerCase!;2%;13| ((|s| (%)) (% (%)))
        (SPADCALL (ELT % 33) |s| (QREFELT % 31))) 

(SDEFUN |ISTRING;replace;%Us2%;14|
        ((|s| (%)) (|sg| (|UniversalSegment| (|Integer|))) (|t| (%)) (% (%)))
        (SPROG
         ((|l| (|Integer|)) (|m| #1=(|NonNegativeInteger|)) (|n| #1#)
          (|h| (|Integer|)) (#2=#:G40 NIL) (|r| (%)) (#3=#:G49 NIL)
          (#4=#:G50 NIL) (|i| NIL) (#5=#:G51 NIL) (|k| NIL))
         (SEQ (LETT |l| (- (SPADCALL |sg| (QREFELT % 35)) (QREFELT % 6)))
              (LETT |m| (SPADCALL |s| (QREFELT % 13)))
              (LETT |n| (SPADCALL |t| (QREFELT % 13)))
              (LETT |h|
                    (COND
                     ((SPADCALL |sg| (QREFELT % 36))
                      (- (SPADCALL |sg| (QREFELT % 37)) (QREFELT % 6)))
                     ('T (- (SPADCALL |s| (QREFELT % 38)) (QREFELT % 6)))))
              (COND
               ((OR (OR (< |l| 0) (>= |h| |m|)) (< |h| (- |l| 1)))
                (EXIT (|error| "index out of range"))))
              (LETT |r|
                    (SPADCALL
                     (PROG1 (LETT #2# (+ (- |m| (+ (- |h| |l|) 1)) |n|))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     (SPADCALL (QREFELT % 39)) (QREFELT % 9)))
              (SEQ (LETT |i| 0) (LETT #3# (- |l| 1)) (LETT |k| 0) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
                   (LETT |k| (PROG1 (|inc_SI| |k|) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 0) (LETT #4# (- |n| 1)) (LETT |k| |k|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |t| |i|))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| (+ |h| 1)) (LETT #5# (- |m| 1)) (LETT |k| |k|)
                   G190 (COND ((> |i| #5#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |ISTRING;qsetelt!;%I2C;15|
        ((|s| (%)) (|i| (|Integer|)) (|c| #1=(|Character|)) (% #1#))
        (STR_SETELT |s| (- |i| (QREFELT % 6)) |c|)) 

(SDEFUN |ISTRING;setelt!;%I2C;16|
        ((|s| (%)) (|i| (|Integer|)) (|c| #1=(|Character|)) (% #1#))
        (COND
         ((OR (< |i| (QREFELT % 6)) (> |i| (SPADCALL |s| (QREFELT % 38))))
          (|error| "index out of range"))
         ('T (STR_SETELT |s| (- |i| (QREFELT % 6)) |c|)))) 

(SDEFUN |ISTRING;substring?;2%IB;17|
        ((|part| (%)) (|whole| (%)) (|startpos| (|Integer|)) (% (|Boolean|)))
        (SPROG
         ((|np| (|Integer|)) (|nw| (|Integer|)) (|iw| NIL) (|ip| NIL)
          (#1=#:G65 NIL) (#2=#:G64 NIL) (#3=#:G63 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |np| (QCSIZE |part|)) (LETT |nw| (QCSIZE |whole|))
                (LETT |startpos| (- |startpos| (QREFELT % 6)))
                (EXIT
                 (COND ((< |startpos| 0) (|error| "index out of bounds"))
                       ((> |np| (- |nw| |startpos|)) NIL)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |iw| |startpos|) (LETT |ip| 0)
                                (LETT #1# (- |np| 1)) G190
                                (COND ((|greater_SI| |ip| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (|eql_SI| (STR_ELT |part| |ip|)
                                               (STR_ELT |whole| |iw|)))
                                    (PROGN
                                     (LETT #3#
                                           (PROGN
                                            (LETT #2# NIL)
                                            (GO #4=#:G62)))
                                     (GO #5=#:G58))))))
                                (LETT |ip|
                                      (PROG1 (|inc_SI| |ip|)
                                        (LETT |iw| (+ |iw| 1))))
                                (GO G190) G191 (EXIT NIL)))
                          #5# (EXIT #3#))
                         (EXIT 'T)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;2%2I;18|
        ((|s| (%)) (|t| (%)) (|startpos| #1=(|Integer|)) (% #1#))
        (SPROG ((|r| (|None|)))
               (SEQ (LETT |startpos| (- |startpos| (QREFELT % 6)))
                    (EXIT
                     (COND ((< |startpos| 0) (|error| "index out of bounds"))
                           ((>= |startpos| (QCSIZE |t|)) (- (QREFELT % 6) 1))
                           (#2='T
                            (SEQ (LETT |r| (|search_str| |s| |t| |startpos|))
                                 (EXIT
                                  (COND ((EQ |r| NIL) (- (QREFELT % 6) 1))
                                        (#2# (+ |r| (QREFELT % 6)))))))))))) 

(SDEFUN |ISTRING;position;C%2I;19|
        ((|c| (|Character|)) (|t| (%)) (|startpos| #1=(|Integer|)) (% #1#))
        (SPROG ((|r| NIL) (#2=#:G78 NIL) (#3=#:G77 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |startpos| (- |startpos| (QREFELT % 6)))
                      (EXIT
                       (COND ((< |startpos| 0) (|error| "index out of bounds"))
                             ((>= |startpos| (QCSIZE |t|)) (- (QREFELT % 6) 1))
                             ('T
                              (SEQ
                               (SEQ (LETT |r| |startpos|)
                                    (LETT #2# (|sub_SI| (QCSIZE |t|) 1)) G190
                                    (COND ((> |r| #2#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((|eql_SI| (STR_ELT |t| |r|) |c|)
                                        (PROGN
                                         (LETT #3# (+ |r| (QREFELT % 6)))
                                         (GO #4=#:G76))))))
                                    (LETT |r| (+ |r| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (- (QREFELT % 6) 1))))))))
                #4# (EXIT #3#)))) 

(SDEFUN |ISTRING;position;Cc%2I;20|
        ((|cc| (|CharacterClass|)) (|t| (%)) (|startpos| #1=(|Integer|))
         (% #1#))
        (SPROG ((|r| NIL) (#2=#:G87 NIL) (#3=#:G86 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |startpos| (- |startpos| (QREFELT % 6)))
                      (EXIT
                       (COND ((< |startpos| 0) (|error| "index out of bounds"))
                             ((>= |startpos| (QCSIZE |t|)) (- (QREFELT % 6) 1))
                             ('T
                              (SEQ
                               (SEQ (LETT |r| |startpos|)
                                    (LETT #2# (|sub_SI| (QCSIZE |t|) 1)) G190
                                    (COND ((> |r| #2#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (STR_ELT |t| |r|) |cc|
                                                  (QREFELT % 47))
                                        (PROGN
                                         (LETT #3# (+ |r| (QREFELT % 6)))
                                         (GO #4=#:G85))))))
                                    (LETT |r| (+ |r| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (- (QREFELT % 6) 1))))))))
                #4# (EXIT #3#)))) 

(SDEFUN |ISTRING;suffix?;2%B;21| ((|s| (%)) (|t| (%)) (% (|Boolean|)))
        (SPROG ((|m| #1=(|Integer|)) (|n| #1#))
               (SEQ (LETT |m| (SPADCALL |s| (QREFELT % 38)))
                    (LETT |n| (SPADCALL |t| (QREFELT % 38)))
                    (EXIT
                     (COND ((> |m| |n|) NIL)
                           ('T
                            (SPADCALL |s| |t| (- (+ (QREFELT % 6) |n|) |m|)
                                      (QREFELT % 43)))))))) 

(SDEFUN |ISTRING;split;%CL;22| ((|s| (%)) (|c| (|Character|)) (% (|List| %)))
        (SPROG
         ((|n| (|Integer|)) (#1=#:G99 NIL) (|j| (|Integer|)) (|i| NIL)
          (#2=#:G100 NIL) (|l| (|List| %)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 38)))
              (SEQ (LETT |i| (QREFELT % 6)) (LETT #1# |n|) G190
                   (COND
                    ((OR (> |i| #1#)
                         (NULL
                          (|eql_SI| (SPADCALL |s| |i| (QREFELT % 50)) |c|)))
                     (GO G191)))
                   (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                   (EXIT NIL))
              (LETT |l| (SPADCALL (QREFELT % 52)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((<= |i| |n|)
                        (>= (LETT |j| (SPADCALL |c| |s| |i| (QREFELT % 45)))
                            (QREFELT % 6)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |l|
                          (SPADCALL
                           (SPADCALL |s|
                                     (SPADCALL |i| (- |j| 1) (QREFELT % 20))
                                     (QREFELT % 21))
                           |l| (QREFELT % 53)))
                    (EXIT
                     (SEQ (LETT |i| |j|) (LETT #2# |n|) G190
                          (COND
                           ((OR (> |i| #2#)
                                (NULL
                                 (|eql_SI| (SPADCALL |s| |i| (QREFELT % 50))
                                           |c|)))
                            (GO G191)))
                          (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((<= |i| |n|)
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| |n| (QREFELT % 20))
                                 (QREFELT % 21))
                       |l| (QREFELT % 53)))))
              (EXIT (SPADCALL |l| (QREFELT % 54)))))) 

(SDEFUN |ISTRING;split;%CcL;23|
        ((|s| (%)) (|cc| (|CharacterClass|)) (% (|List| %)))
        (SPROG
         ((|n| (|Integer|)) (#1=#:G110 NIL) (|j| (|Integer|)) (|i| NIL)
          (#2=#:G111 NIL) (|l| (|List| %)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 38)))
              (SEQ (LETT |i| (QREFELT % 6)) (LETT #1# |n|) G190
                   (COND
                    ((OR (> |i| #1#)
                         (NULL
                          (SPADCALL (SPADCALL |s| |i| (QREFELT % 50)) |cc|
                                    (QREFELT % 47))))
                     (GO G191)))
                   (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                   (EXIT NIL))
              (LETT |l| (SPADCALL (QREFELT % 52)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((<= |i| |n|)
                        (>= (LETT |j| (SPADCALL |cc| |s| |i| (QREFELT % 48)))
                            (QREFELT % 6)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |l|
                          (SPADCALL
                           (SPADCALL |s|
                                     (SPADCALL |i| (- |j| 1) (QREFELT % 20))
                                     (QREFELT % 21))
                           |l| (QREFELT % 53)))
                    (EXIT
                     (SEQ (LETT |i| |j|) (LETT #2# |n|) G190
                          (COND
                           ((OR (> |i| #2#)
                                (NULL
                                 (SPADCALL (SPADCALL |s| |i| (QREFELT % 50))
                                           |cc| (QREFELT % 47))))
                            (GO G191)))
                          (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((<= |i| |n|)
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| |n| (QREFELT % 20))
                                 (QREFELT % 21))
                       |l| (QREFELT % 53)))))
              (EXIT (SPADCALL |l| (QREFELT % 54)))))) 

(SDEFUN |ISTRING;leftTrim;%Cc%;24|
        ((|s| (%)) (|cc| (|CharacterClass|)) (% (%)))
        (SPROG ((|n| (|Integer|)) (|i| NIL) (#1=#:G116 NIL))
               (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 38)))
                    (SEQ (LETT |i| (QREFELT % 6)) (LETT #1# |n|) G190
                         (COND
                          ((OR (> |i| #1#)
                               (NULL
                                (SPADCALL (SPADCALL |s| |i| (QREFELT % 50))
                                          |cc| (QREFELT % 47))))
                           (GO G191)))
                         (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL |s| (SPADCALL |i| |n| (QREFELT % 20))
                               (QREFELT % 21)))))) 

(SDEFUN |ISTRING;rightTrim;%Cc%;25|
        ((|s| (%)) (|cc| (|CharacterClass|)) (% (%)))
        (SPROG ((|j| NIL) (#1=#:G121 NIL))
               (SEQ
                (SEQ (LETT |j| (SPADCALL |s| (QREFELT % 38)))
                     (LETT #1# (QREFELT % 6)) G190
                     (COND
                      ((OR (< |j| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |s| |j| (QREFELT % 50)) |cc|
                                      (QREFELT % 47))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |j| (+ |j| -1)) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |s|
                           (SPADCALL (SPADCALL |s| (QREFELT % 28)) |j|
                                     (QREFELT % 20))
                           (QREFELT % 21)))))) 

(SDEFUN |ISTRING;concat;L%;26| ((|l| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G130 NIL) (#2=#:G124 #3=(|NonNegativeInteger|)) (#4=#:G122 #3#)
          (#5=#:G123 NIL) (|t| (%)) (|s| NIL) (#6=#:G131 NIL)
          (|i| (|Integer|)))
         (SEQ
          (LETT |t|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL)
                  (SEQ (LETT |s| NIL) (LETT #1# |l|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #2# (SPADCALL |s| (QREFELT % 13)))
                          (COND (#5# (LETT #4# (+ #4# #2#)))
                                ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#5# #4#) ('T 0)))
                 (SPADCALL (QREFELT % 39)) (QREFELT % 9)))
          (LETT |i| (QREFELT % 6))
          (SEQ (LETT |s| NIL) (LETT #6# |l|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |s| (CAR #6#)) NIL)) (GO G191)))
               (SEQ (SPADCALL |t| |s| |i| (QREFELT % 60))
                    (EXIT (LETT |i| (+ |i| (SPADCALL |s| (QREFELT % 13))))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (EXIT |t|)))) 

(SDEFUN |ISTRING;copyInto!;2%I%;27|
        ((|y| (%)) (|x| (%)) (|s| (|Integer|)) (% (%)))
        (SPROG
         ((|m| #1=(|NonNegativeInteger|)) (|n| #1#) (|i| NIL) (#2=#:G137 NIL))
         (SEQ (LETT |m| (SPADCALL |x| (QREFELT % 13)))
              (LETT |n| (SPADCALL |y| (QREFELT % 13)))
              (LETT |s| (- |s| (QREFELT % 6)))
              (COND
               ((OR (< |s| 0) (> (+ |s| |m|) |n|))
                (EXIT (|error| "index out of range"))))
              (SEQ (LETT |i| 0) (LETT #2# (- |m| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |y| (+ |i| |s|) (STR_ELT |x| |i|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ISTRING;join;%L%;28| ((|sep| (%)) (|l| (|List| %)) (% (%)))
        (SPROG
         ((|lensep| #1=(|NonNegativeInteger|)) (#2=#:G147 NIL) (#3=#:G140 #1#)
          (#4=#:G138 #1#) (#5=#:G139 NIL) (|s| NIL) (#6=#:G148 NIL) (|t| (%))
          (|i| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |l| (QREFELT % 62)) (SPADCALL (QREFELT % 10)))
                (#7='T
                 (SEQ (LETT |lensep| (SPADCALL |sep| (QREFELT % 13)))
                      (LETT |t|
                            (SPADCALL
                             (+
                              (PROGN
                               (LETT #5# NIL)
                               (SEQ (LETT |s| NIL) (LETT #2# |l|) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |s| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3# (SPADCALL |s| (QREFELT % 13)))
                                       (COND (#5# (LETT #4# (+ #4# #3#)))
                                             ('T
                                              (PROGN
                                               (LETT #4# #3#)
                                               (LETT #5# 'T)))))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#5# #4#) (#7# 0)))
                              (*
                               (SPADCALL (SPADCALL |l| (QREFELT % 63))
                                         (QREFELT % 64))
                               |lensep|))
                             (SPADCALL (QREFELT % 39)) (QREFELT % 9)))
                      (LETT |t|
                            (SPADCALL |t| (SPADCALL |l| (QREFELT % 65)) 1
                                      (QREFELT % 60)))
                      (LETT |i|
                            (+ 1
                               (SPADCALL (SPADCALL |l| (QREFELT % 65))
                                         (QREFELT % 13))))
                      (SEQ (LETT |s| NIL)
                           (LETT #6# (SPADCALL |l| (QREFELT % 63))) G190
                           (COND
                            ((OR (ATOM #6#) (PROGN (LETT |s| (CAR #6#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |t| (SPADCALL |t| |sep| |i| (QREFELT % 60)))
                            (LETT |i| (+ |i| |lensep|))
                            (LETT |t| (SPADCALL |t| |s| |i| (QREFELT % 60)))
                            (EXIT
                             (LETT |i| (+ |i| (SPADCALL |s| (QREFELT % 13))))))
                           (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |ISTRING;qelt;%IC;29| ((|s| (%)) (|i| (|Integer|)) (% (|Character|)))
        (STR_ELT |s| (- |i| (QREFELT % 6)))) 

(SDEFUN |ISTRING;elt;%IC;30| ((|s| (%)) (|i| (|Integer|)) (% (|Character|)))
        (COND
         ((OR (< |i| (QREFELT % 6)) (> |i| (SPADCALL |s| (QREFELT % 38))))
          (|error| "index out of range"))
         ('T (STR_ELT |s| (- |i| (QREFELT % 6)))))) 

(SDEFUN |ISTRING;elt;%Us%;31|
        ((|s| (%)) (|sg| (|UniversalSegment| (|Integer|))) (% (%)))
        (SPROG ((|l| #1=(|Integer|)) (|h| #1#))
               (SEQ (LETT |l| (- (SPADCALL |sg| (QREFELT % 35)) (QREFELT % 6)))
                    (LETT |h|
                          (COND
                           ((SPADCALL |sg| (QREFELT % 36))
                            (- (SPADCALL |sg| (QREFELT % 37)) (QREFELT % 6)))
                           ('T
                            (- (SPADCALL |s| (QREFELT % 38)) (QREFELT % 6)))))
                    (COND
                     ((OR (< |l| 0) (>= |h| (SPADCALL |s| (QREFELT % 13))))
                      (EXIT (|error| "index out of bounds"))))
                    (EXIT (SUBSTRING |s| |l| (MAX 0 (+ (- |h| |l|) 1))))))) 

(SDEFUN |ISTRING;hashUpdate!;Hs%Hs;32|
        ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |ISTRING;match?;2%CB;33|
        ((|pattern| (%)) (|target| (%)) (|dontcare| (|Character|))
         (% (|Boolean|)))
        (SPROG
         ((|n| (|Integer|)) (|m| (|Integer|)) (#1=#:G158 NIL) (#2=#:G161 NIL)
          (|s| (%)) (#3=#:G163 NIL) (#4=#:G173 NIL)
          (|i| #5=(|NonNegativeInteger|)) (|p| #5#) (#6=#:G164 NIL)
          (|q| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |pattern| (QREFELT % 38)))
                (LETT |p|
                      (PROG1
                          (LETT #1#
                                (SPADCALL |dontcare| |pattern|
                                          (LETT |m|
                                                (SPADCALL |pattern|
                                                          (QREFELT % 28)))
                                          (QREFELT % 45)))
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#)))
                (EXIT
                 (COND
                  ((EQL |p| (- |m| 1))
                   (SPADCALL |pattern| |target| (QREFELT % 14)))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |p| |m| (QREFELT % 70))
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL |pattern|
                                    (SPADCALL |m| (- |p| 1) (QREFELT % 20))
                                    (QREFELT % 21))
                          |target| (QREFELT % 71)))
                        (EXIT NIL)))))
                    (LETT |i| |p|)
                    (LETT |q|
                          (PROG1
                              (LETT #2#
                                    (SPADCALL |dontcare| |pattern| (+ |p| 1)
                                              (QREFELT % 45)))
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#)))
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |q| (- |m| 1) (QREFELT % 70)))
                           (GO G191)))
                         (SEQ
                          (LETT |s|
                                (SPADCALL |pattern|
                                          (SPADCALL (+ |p| 1) (- |q| 1)
                                                    (QREFELT % 20))
                                          (QREFELT % 21)))
                          (LETT |i|
                                (PROG1
                                    (LETT #3#
                                          (SPADCALL |s| |target| |i|
                                                    (QREFELT % 44)))
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#)))
                          (EXIT
                           (COND
                            ((EQL |i| (- |m| 1))
                             (PROGN (LETT #4# NIL) (GO #7=#:G172)))
                            ('T
                             (SEQ
                              (LETT |i| (+ |i| (SPADCALL |s| (QREFELT % 13))))
                              (LETT |p| |q|)
                              (EXIT
                               (LETT |q|
                                     (PROG1
                                         (LETT #6#
                                               (SPADCALL |dontcare| |pattern|
                                                         (+ |q| 1)
                                                         (QREFELT % 45)))
                                       (|check_subtype2| (>= #6# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|)
                                                         #6#)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((SPADCALL |p| |n| (QREFELT % 70))
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL |pattern|
                                    (SPADCALL (+ |p| 1) |n| (QREFELT % 20))
                                    (QREFELT % 21))
                          |target| (QREFELT % 49)))
                        (EXIT NIL)))))
                    (EXIT 'T)))))))
          #7# (EXIT #4#)))) 

(DECLAIM (NOTINLINE |IndexedString;|)) 

(DEFUN |IndexedString;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G182 NIL) (#2=#:G181 NIL)
    (#3=#:G180 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT |dv$| (LIST '|IndexedString| DV$1))
    (LETT % (GETREFV 84))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Character|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|Character|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Character|)
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Character|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Character|)
                                                        '(|Evalable|
                                                          (|Character|)))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory| (|Character|)
                                                        '(|BasicType|))
                                         #1#
                                         (|HasCategory| (|Character|)
                                                        '(|Hashable|))
                                         (|HasCategory| (|Character|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Character|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3# #1#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|IndexedString| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 16384))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|BasicType|))
         (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 65536))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| % 131072))
    (AND (|HasCategory| % '(|SetWithZero|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| % 262144))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| % 524288))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|))))
     (|augmentPredVector| % 1048576))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| % 2097152))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| % 4194304))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|Hashable|))
         (|augmentPredVector| % 8388608))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|BasicType|)))
      (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|Hashable|)))
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| % 16777216))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |IndexedString| (#1=#:G183)
  (SPROG NIL
         (PROG (#2=#:G184)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedString|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedString;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedString|)))))))))) 

(MAKEPROP '|IndexedString| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (|Character|) |ISTRING;new;NniC%;1| |ISTRING;empty;%;2|
              (|Boolean|) |ISTRING;empty?;%B;3| |ISTRING;#;%Nni;4|
              |ISTRING;=;2%B;5| |ISTRING;<;2%B;6| |ISTRING;concat;3%;7|
              |ISTRING;copy;2%;8| (|Integer|) (|UniversalSegment| 18)
              (0 . SEGMENT) |ISTRING;elt;%Us%;31| (6 . SEGMENT)
              |ISTRING;insert;2%I%;9| (|String|) (|OutputForm|)
              (11 . |outputForm|) |ISTRING;coerce;%Of;10|
              |ISTRING;minIndex;%I;11| (16 . |upperCase|) (|Mapping| 8 8)
              (21 . |map!|) |ISTRING;upperCase!;2%;12| (27 . |lowerCase|)
              |ISTRING;lowerCase!;2%;13| (32 . |low|) (37 . |hasHi|)
              (42 . |high|) (47 . |maxIndex|) (52 . |space|)
              |ISTRING;replace;%Us2%;14| |ISTRING;qsetelt!;%I2C;15|
              |ISTRING;setelt!;%I2C;16| |ISTRING;substring?;2%IB;17|
              |ISTRING;position;2%2I;18| |ISTRING;position;C%2I;19|
              (|CharacterClass|) (56 . |member?|) |ISTRING;position;Cc%2I;20|
              |ISTRING;suffix?;2%B;21| |ISTRING;elt;%IC;30| (|List| $$)
              (62 . |empty|) (66 . |concat|) (72 . |reverse!|) (|List| %)
              |ISTRING;split;%CL;22| |ISTRING;split;%CcL;23|
              |ISTRING;leftTrim;%Cc%;24| |ISTRING;rightTrim;%Cc%;25|
              |ISTRING;copyInto!;2%I%;27| |ISTRING;concat;L%;26|
              (77 . |empty?|) (82 . |rest|) (87 . |#|) (92 . |first|)
              |ISTRING;join;%L%;28| |ISTRING;qelt;%IC;29| (|HashState|)
              |ISTRING;hashUpdate!;Hs%Hs;32| (97 . ~=) (103 . |prefix?|)
              |ISTRING;match?;2%CB;33| (|List| 8) (|List| 18)
              (|Union| 8 '"failed") (|Mapping| 11 8) (|Mapping| 8 8 8)
              (|Mapping| 11 8 8) (|SingleInteger|) (|List| 81) (|Equation| 8)
              (|Void|) (|InputForm|))
           '#(~= 109 |upperCase!| 115 |upperCase| 120 |trim| 125 |swap!| 137
              |suffix?| 144 |substring?| 150 |split| 157 |sorted?| 169 |sort!|
              180 |sort| 191 |smaller?| 202 |size?| 208 |sign| 214 |setelt!|
              219 |select| 233 |sample| 239 |rightTrim| 243 |reverse!| 255
              |reverse| 260 |replace| 265 |removeDuplicates| 272 |remove| 277
              |reduce| 289 |qsetelt!| 310 |qelt| 317 |prefix?| 323 |positive?|
              329 |position| 334 |parts| 367 |new| 372 |negative?| 378 |more?|
              383 |minIndex| 389 |min| 394 |merge_unique| 405 |merge| 412
              |members| 425 |member?| 430 |maxIndex| 436 |max| 441 |match?| 458
              |map!| 465 |map| 471 |lowerCase!| 484 |lowerCase| 489 |less?| 494
              |leftTrim| 500 |latex| 512 |join| 517 |insert| 523 |indices| 537
              |index?| 542 |hashUpdate!| 548 |hash| 554 |first| 559 |find| 570
              |fill!| 576 |every?| 582 |eval| 588 |eq?| 614 |entry?| 620
              |entries| 626 |empty?| 631 |empty| 636 |elt| 640 |delete| 665
              |count| 677 |copyInto!| 689 |copy| 696 |convert| 701 |construct|
              706 |concat| 711 |coerce| 734 |any?| 744 >= 750 > 756 = 762 <=
              768 < 774 |#| 780)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 1 7 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0
                                  0 0 0 0))
            (CONS
             '#(|StringAggregate&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |OrderedSet&| NIL |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |Hashable&|
                |SetCategory&| |Evalable&| |EltableAggregate&| |Aggregate&| NIL
                |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|StringAggregate|) (|OneDimensionalArrayAggregate| 8)
                 (|FiniteLinearAggregate| 8) (|LinearAggregate| 8)
                 (|OrderedSet|) (|Comparable|) (|Collection| 8)
                 (|IndexedAggregate| 18 8) (|ComparableRepresentation|)
                 (|HomogeneousAggregate| 8) (|Hashable|) (|SetCategory|)
                 (|Evalable| 8) (|EltableAggregate| 18 8) (|Aggregate|)
                 (|ConvertibleTo| 83) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 25) (|InnerEvalable| 8 8) (|Eltable| 18 8)
                 (|Type|) (|Eltable| 19 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 83
                                  '(2 19 0 18 18 20 1 19 0 18 22 1 25 0 24 26 1
                                    8 0 0 29 2 0 0 30 0 31 1 8 0 0 33 1 19 18 0
                                    35 1 19 11 0 36 1 19 18 0 37 1 0 18 0 38 0
                                    8 0 39 2 46 11 8 0 47 0 51 0 52 2 51 0 2 0
                                    53 1 51 0 0 54 1 51 11 0 62 1 51 0 0 63 1
                                    51 7 0 64 1 51 2 0 65 2 18 11 0 0 70 2 0 11
                                    0 0 71 2 25 11 0 0 1 1 0 0 0 32 1 0 0 0 1 2
                                    0 0 0 46 1 2 16 0 0 8 1 3 14 82 0 18 18 1 2
                                    0 11 0 0 49 3 0 11 0 0 18 43 2 0 55 0 46 57
                                    2 0 55 0 8 56 1 20 11 0 1 2 15 11 78 0 1 2
                                    17 0 78 0 1 1 18 0 0 1 1 20 0 0 1 2 15 0 78
                                    0 1 2 21 11 0 0 1 2 0 11 0 7 1 1 19 18 0 1
                                    3 14 8 0 18 8 42 3 14 8 0 19 8 1 2 15 0 76
                                    0 1 0 0 0 1 2 0 0 0 46 59 2 16 0 0 8 1 1 17
                                    0 0 1 1 15 0 0 1 3 0 0 0 19 0 40 1 16 0 0 1
                                    2 16 0 8 0 1 2 15 0 76 0 1 4 16 8 77 0 8 8
                                    1 3 15 8 77 0 8 1 2 15 8 77 0 1 3 14 8 0 18
                                    8 41 2 0 8 0 18 67 2 0 11 0 0 71 1 19 11 0
                                    1 3 0 18 46 0 18 48 3 0 18 0 0 18 44 2 16
                                    18 8 0 1 3 16 18 8 0 18 45 2 15 18 76 0 1 1
                                    15 73 0 1 2 0 0 7 8 9 1 19 11 0 1 2 0 11 0
                                    7 1 1 4 18 0 28 1 20 8 0 1 2 20 0 0 0 1 3
                                    16 0 78 0 0 1 2 20 0 0 0 1 3 15 0 78 0 0 1
                                    1 15 73 0 1 2 16 11 8 0 1 1 4 18 0 38 1 20
                                    8 0 1 2 20 0 0 0 1 2 15 8 78 0 1 3 0 11 0 0
                                    8 72 2 14 0 30 0 31 2 0 0 30 0 1 3 0 0 77 0
                                    0 1 1 0 0 0 34 1 0 0 0 1 2 0 11 0 7 1 2 0 0
                                    0 46 58 2 16 0 0 8 1 1 22 24 0 1 2 0 0 0 55
                                    66 3 0 0 8 0 18 1 3 0 0 0 0 18 23 1 0 74 0
                                    1 2 0 11 18 0 1 2 24 68 68 0 69 1 24 79 0 1
                                    2 0 0 0 7 1 1 4 8 0 1 2 0 75 76 0 1 2 14 0
                                    0 8 1 2 15 11 76 0 1 2 9 0 0 80 1 3 9 0 0 8
                                    8 1 2 9 0 0 81 1 3 9 0 0 73 73 1 2 0 11 0 0
                                    1 2 16 11 8 0 1 1 0 73 0 1 1 0 11 0 12 0 0
                                    0 10 3 0 8 0 18 8 1 2 0 8 0 18 50 2 0 0 0
                                    19 21 2 0 0 0 0 1 2 0 0 0 18 1 2 0 0 0 19 1
                                    2 16 7 8 0 1 2 15 7 76 0 1 3 17 0 0 0 18 60
                                    1 0 0 0 17 1 3 83 0 1 1 0 0 73 1 2 0 0 8 0
                                    1 2 0 0 0 8 1 1 0 0 55 61 2 0 0 0 0 16 1 0
                                    0 8 1 1 23 25 0 27 2 15 11 76 0 1 2 20 11 0
                                    0 1 2 20 11 0 0 1 2 25 11 0 0 14 2 20 11 0
                                    0 1 2 20 11 0 0 15 1 15 7 0 13)))))
           '|lookupComplete|)) 
