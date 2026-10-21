
(MAKEPROP '|LIST;#;%Nni;1| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|))) (LENGTH |x|)) 

(MAKEPROP '|LIST;cons;S2%;2| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2%;2| ((|s| (S)) (|x| (%)) (% (%))) (CONS |s| |x|)) 

(MAKEPROP '|LIST;concat;S2%;3| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;concat;S2%;3| ((|s| (S)) (|x| (%)) (% (%))) (CONS |s| |x|)) 

(MAKEPROP '|LIST;eq?;2%B;4| '|SPADreplace| 'EQ) 

(SDEFUN |LIST;eq?;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQ |x| |y|)) 

(MAKEPROP '|LIST;first;%S;5| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |LIST;first;%S;5| ((|x| (%)) (% (S))) (|SPADfirst| |x|)) 

(MAKEPROP '|LIST;elt;%firstS;6| '|SPADreplace|
          '(XLAM (|x| "first") (|SPADfirst| |x|))) 

(SDEFUN |LIST;elt;%firstS;6| ((|x| (%)) (T7 ("first")) (% (S)))
        (|SPADfirst| |x|)) 

(MAKEPROP '|LIST;empty;%;7| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LIST;empty;%;7| ((% (%))) NIL) 

(MAKEPROP '|LIST;empty?;%B;8| '|SPADreplace| 'NULL) 

(SDEFUN |LIST;empty?;%B;8| ((|x| (%)) (% (|Boolean|))) (NULL |x|)) 

(MAKEPROP '|LIST;rest;2%;9| '|SPADreplace| 'CDR) 

(SDEFUN |LIST;rest;2%;9| ((|x| (%)) (% (%))) (CDR |x|)) 

(MAKEPROP '|LIST;elt;%rest%;10| '|SPADreplace| '(XLAM (|x| "rest") (CDR |x|))) 

(SDEFUN |LIST;elt;%rest%;10| ((|x| (%)) (T8 ("rest")) (% (%))) (CDR |x|)) 

(MAKEPROP '|LIST;qsetfirst!;%2S;11| '|SPADreplace| '|qset_first|) 

(SDEFUN |LIST;qsetfirst!;%2S;11| ((|x| (%)) (|s| (S)) (% (S)))
        (|qset_first| |x| |s|)) 

(SDEFUN |LIST;setfirst!;%2S;12| ((|x| (%)) (|s| (S)) (% (S)))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(SDEFUN |LIST;setelt!;%first2S;13| ((|x| (%)) (T9 ("first")) (|s| (S)) (% (S)))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(MAKEPROP '|LIST;qsetrest!;3%;14| '|SPADreplace| '|qset_rest|) 

(SDEFUN |LIST;qsetrest!;3%;14| ((|x| (%)) (|y| (%)) (% (%)))
        (|qset_rest| |x| |y|)) 

(SDEFUN |LIST;setrest!;3%;15| ((|x| (%)) (|y| (%)) (% (%)))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(SDEFUN |LIST;setelt!;%rest2%;16| ((|x| (%)) (T10 ("rest")) (|y| (%)) (% (%)))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(MAKEPROP '|LIST;construct;2%;17| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LIST;construct;2%;17| ((|l| (|List| S)) (% (%))) |l|) 

(MAKEPROP '|LIST;parts;2%;18| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |LIST;parts;2%;18| ((|s| (%)) (% (|List| S))) |s|) 

(MAKEPROP '|LIST;reverse!;2%;19| '|SPADreplace| 'NREVERSE) 

(SDEFUN |LIST;reverse!;2%;19| ((|x| (%)) (% (%))) (NREVERSE |x|)) 

(MAKEPROP '|LIST;reverse;2%;20| '|SPADreplace| 'REVERSE) 

(SDEFUN |LIST;reverse;2%;20| ((|x| (%)) (% (%))) (REVERSE |x|)) 

(MAKEPROP '|LIST;minIndex;%I;21| '|SPADreplace| '(XLAM (|x|) 1)) 

(SDEFUN |LIST;minIndex;%I;21| ((|x| (%)) (% (|Integer|))) 1) 

(MAKEPROP '|LIST;maxIndex;%I;22| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;maxIndex;%I;22| ((|x| (%)) (% (|Integer|))) (LENGTH |x|)) 

(SDEFUN |LIST;first;%Nni%;23| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G94 NIL) (|l| (%)))
               (SEQ (LETT |l| NIL)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND ((NULL |x|) (|error| "Index out of range"))
                                 ('T
                                  (SEQ
                                   (LETT |l|
                                         (SPADCALL (|SPADfirst| |x|) |l|
                                                   (QREFELT % 10)))
                                   (EXIT (LETT |x| (CDR |x|))))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |l|))))) 

(SDEFUN |LIST;rest;%Nni%;24| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G101 NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (COND ((NULL |x|) (|error| "index out of range")))
                          (EXIT (LETT |x| (QCDR |x|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |LIST;copy;2%;25| ((|x| (%)) (% (%)))
        (SPROG ((|i| NIL) (|y| (%)))
               (SEQ (LETT |y| NIL)
                    (SEQ (LETT |i| 0) G190
                         (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (COND
                           ((EQL |i| 1000)
                            (COND
                             ((SPADCALL |x| (QREFELT % 37))
                              (|error| "cyclic list")))))
                          (LETT |y| (CONS (QCAR |x|) |y|))
                          (EXIT (LETT |x| (QCDR |x|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |y|))))) 

(SDEFUN |LIST;leaves;2%;26| ((|x| (%)) (% (|List| S)))
        (SPROG ((|i| NIL) (#1=#:G116 NIL))
               (SEQ
                (EXIT
                 (COND ((NULL |x|) NIL)
                       ('T
                        (SEQ (LETT |i| 0) G190
                             (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                             (SEQ
                              (COND
                               ((EQL |i| 1000)
                                (COND
                                 ((SPADCALL |x| (QREFELT % 37))
                                  (EXIT (|error| "cyclic list"))))))
                              (EXIT
                               (COND
                                ((SPADCALL |x| (QREFELT % 39))
                                 (PROGN
                                  (LETT #1#
                                        (LIST (SPADCALL |x| (QREFELT % 40))))
                                  (GO #2=#:G115)))
                                ('T (LETT |x| (QCDR |x|))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;coerce;%Of;27| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|s| (%)) (|y| (|List| (|OutputForm|)))
          (|z| (|List| (|OutputForm|))))
         (SEQ (LETT |y| NIL) (LETT |s| (SPADCALL |x| (QREFELT % 42)))
              (SEQ G190 (COND ((NULL (NULL (EQ |x| |s|))) (GO G191)))
                   (SEQ
                    (LETT |y|
                          (SPADCALL (SPADCALL (|SPADfirst| |x|) (QREFELT % 44))
                                    |y| (QREFELT % 46)))
                    (EXIT (LETT |x| (CDR |x|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |y| (NREVERSE |y|))
              (EXIT
               (COND ((NULL |s|) (SPADCALL |y| (QREFELT % 48)))
                     ('T
                      (SEQ
                       (LETT |z|
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |x|) (QREFELT % 44))
                              (QREFELT % 49)))
                       (SEQ G190
                            (COND ((NULL (NULL (EQ |s| (CDR |x|)))) (GO G191)))
                            (SEQ (LETT |x| (CDR |x|))
                                 (EXIT
                                  (LETT |z|
                                        (SPADCALL
                                         (SPADCALL (|SPADfirst| |x|)
                                                   (QREFELT % 44))
                                         |z| (QREFELT % 46)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (NREVERSE |z|) (QREFELT % 50))
                                    (QREFELT % 51))
                                   (QREFELT % 52))
                         (QREFELT % 48)))))))))) 

(SDEFUN |LIST;=;2%B;28| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G137 NIL))
               (SEQ
                (EXIT
                 (COND ((EQ |x| |y|) 'T)
                       (#2='T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND ((NULL |x|) NIL)
                                       ('T (NULL (NULL |y|)))))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (QCAR |x|) (QCAR |y|)
                                            (QREFELT % 54))
                                  (PROGN (LETT #1# NIL) (GO #3=#:G136)))
                                 ('T
                                  (SEQ (LETT |x| (QCDR |x|))
                                       (EXIT (LETT |y| (QCDR |y|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (COND ((NULL |x|) (NULL |y|)) (#2# NIL)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |LIST;member?;S%B;29| ((|s| (S)) (|x| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G144 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |s| (QCAR |x|) (QREFELT % 56))
                           (PROGN (LETT #1# 'T) (GO #2=#:G143)))
                          ('T (LETT |x| (QCDR |x|))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;merge_unique;M3%;30|
        ((|f| (|Mapping| (|Boolean|) S S)) (|p| (%)) (|q| (%)) (% (%)))
        (SPROG ((|p1| (S)) (|q1| (S)) (|r| (%)))
               (SEQ
                (COND ((NULL |p|) |q|) ((OR (NULL |q|) (EQ |p| |q|)) |p|)
                      ('T
                       (SEQ (LETT |r| NIL)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |p|) NIL)
                                          ('T (NULL (NULL |q|)))))
                                   (GO G191)))
                                 (SEQ (LETT |p1| (QCAR |p|))
                                      (LETT |q1| (QCAR |q|))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |p1| |q1| (QREFELT % 56))
                                         (SEQ (LETT |r| (CONS |p1| |r|))
                                              (LETT |p| (QCDR |p|))
                                              (EXIT (LETT |q| (QCDR |q|)))))
                                        ((SPADCALL |p1| |q1| |f|)
                                         (SEQ (LETT |r| (CONS |p1| |r|))
                                              (EXIT (LETT |p| (QCDR |p|)))))
                                        ('T
                                         (SEQ (LETT |r| (CONS |q1| |r|))
                                              (EXIT (LETT |q| (QCDR |q|))))))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND ((NULL |p|) (LETT |p| |q|)))
                            (EXIT
                             (COND ((NULL |p|) (NREVERSE |r|))
                                   ('T
                                    (SPADCALL (NREVERSE |r|) |p|
                                              (QREFELT % 58))))))))))) 

(SDEFUN |LIST;merge_unique!;M3%;31|
        ((|f| (|Mapping| (|Boolean|) S S)) (|p| (%)) (|q| (%)) (% (%)))
        (SPROG ((|r| (%)) (|p1| (S)) (|q1| (S)) (|t| (%)))
               (SEQ
                (COND ((NULL |p|) |q|) ((OR (NULL |q|) (EQ |p| |q|)) |p|)
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |p|) (QCAR |q|) (QREFELT % 55))
                          (SEQ (LETT |r| (LETT |t| |p|)) (LETT |p| (QCDR |p|))
                               (EXIT (LETT |q| (QCDR |q|)))))
                         ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                          (SEQ (LETT |r| (LETT |t| |p|))
                               (EXIT (LETT |p| (QCDR |p|)))))
                         (#1='T
                          (SEQ (LETT |r| (LETT |t| |q|))
                               (EXIT (LETT |q| (QCDR |q|))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p|) NIL) ('T (NULL (NULL |q|)))))
                               (GO G191)))
                             (SEQ (LETT |p1| (QCAR |p|)) (LETT |q1| (QCAR |q|))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |p1| |q1| (QREFELT % 56))
                                     (SEQ (LETT |t| (QCDR |t|))
                                          (LETT |p| (QCDR |p|))
                                          (EXIT (LETT |q| (QCDR |q|)))))
                                    ((SPADCALL |p1| |q1| |f|)
                                     (SEQ (|qset_rest| |t| |p|) (LETT |t| |p|)
                                          (EXIT (LETT |p| (QCDR |p|)))))
                                    ('T
                                     (SEQ (|qset_rest| |t| |q|) (LETT |t| |q|)
                                          (EXIT (LETT |q| (QCDR |q|))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (|qset_rest| |t| (COND ((NULL |p|) |q|) (#1# |p|)))
                        (EXIT |r|))))))) 

(SDEFUN |LIST;hashUpdate!;Hs%Hs;32|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SEQ
         (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
              (SEQ (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT % 63)))
                   (EXIT (LETT |x| (QCDR |x|))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |s|))) 

(SDEFUN |LIST;concat!;3%;33| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|z| (%)))
               (SEQ
                (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
                      ('T
                       (SEQ (LETT |z| |x|)
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (NULL (QCDR |z|)))) (GO G191)))
                                 (SEQ (EXIT (LETT |z| (QCDR |z|)))) NIL
                                 (GO G190) G191 (EXIT NIL))
                            (|qset_rest| |z| |y|) (EXIT |x|))))))) 

(SDEFUN |LIST;removeDuplicates!;2%;34| ((|l| (%)) (% (%)))
        (SPROG ((|f| (S)) (|p| (%)) (|pr| (%)) (|pp| (%)))
               (SEQ (LETT |p| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |p|))) (GO G191)))
                         (SEQ (LETT |pp| |p|) (LETT |f| (QCAR |p|))
                              (LETT |p| (QCDR |p|))
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (NULL (NULL (LETT |pr| (QCDR |pp|)))))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCAR |pr|) |f|
                                                  (QREFELT % 56))
                                        (|qset_rest| |pp| (QCDR |pr|)))
                                       ('T (LETT |pp| |pr|)))))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |LIST;sort!;M2%;35|
        ((|f| (|Mapping| (|Boolean|) S S)) (|l| (%)) (% (%)))
        (|LIST;mergeSort| |f| |l| (LENGTH |l|) %)) 

(SDEFUN |LIST;merge!;M3%;36|
        ((|f| (|Mapping| (|Boolean|) S S)) (|p| (%)) (|q| (%)) (% (%)))
        (SPROG ((|r| (%)) (|t| (%)))
               (SEQ
                (COND ((NULL |p|) |q|) ((NULL |q|) |p|)
                      ((EQ |p| |q|)
                       (|error| "cannot merge a list into itself"))
                      (#1='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                          (SEQ (LETT |r| (LETT |t| |p|))
                               (EXIT (LETT |p| (QCDR |p|)))))
                         (#1#
                          (SEQ (LETT |r| (LETT |t| |q|))
                               (EXIT (LETT |q| (QCDR |q|))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p|) NIL) ('T (NULL (NULL |q|)))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                                 (SEQ (|qset_rest| |t| |p|) (LETT |t| |p|)
                                      (EXIT (LETT |p| (QCDR |p|)))))
                                ('T
                                 (SEQ (|qset_rest| |t| |q|) (LETT |t| |q|)
                                      (EXIT (LETT |q| (QCDR |q|))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (|qset_rest| |t| (COND ((NULL |p|) |q|) (#1# |p|)))
                        (EXIT |r|))))))) 

(SDEFUN |LIST;split!;%Nni%;37| ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G223 NIL) (|q| (%)))
               (SEQ
                (COND ((< |n| 1) (|error| "index out of range"))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL |p|
                                        (PROG1 (LETT #1# (- |n| 1))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT % 36)))
                        (LETT |q| (QCDR |p|)) (|qset_rest| |p| NIL)
                        (EXIT |q|))))))) 

(SDEFUN |LIST;mergeSort|
        ((|f| (|Mapping| (|Boolean|) S S)) (|p| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((#1=#:G227 NIL) (|l| (|NonNegativeInteger|)) (|q| (%)))
               (SEQ
                (COND
                 ((EQL |n| 2)
                  (COND
                   ((SPADCALL (|SPADfirst| (CDR |p|)) (|SPADfirst| |p|) |f|)
                    (LETT |p| (NREVERSE |p|))))))
                (EXIT
                 (COND ((< |n| 3) |p|)
                       ('T
                        (SEQ
                         (LETT |l|
                               (PROG1 (LETT #1# (|quotient_INT| |n| 2))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#)))
                         (LETT |q| (SPADCALL |p| |l| (QREFELT % 68)))
                         (LETT |p| (|LIST;mergeSort| |f| |p| |l| %))
                         (LETT |q| (|LIST;mergeSort| |f| |q| (- |n| |l|) %))
                         (EXIT (SPADCALL |f| |p| |q| (QREFELT % 67)))))))))) 

(SDEFUN |LIST;append;3%;39| ((|l| (%)) (|t| (%)) (% (%)))
        (SPADCALL |l| |t| (QREFELT % 69))) 

(SDEFUN |LIST;tails;%L;40| ((|x| (%)) (% (|List| %)))
        (SPROG ((#1=#:G241 NIL) (|i| NIL) (#2=#:G242 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 0) (LETT #2# (- (LENGTH |x|) 1)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |x| |i| (QREFELT % 36)) #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |LIST;writeOMList| ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ (SPADCALL |dev| (QREFELT % 74))
             (SPADCALL |dev| "list1" "list" (QREFELT % 76))
             (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) NIL (QREFELT % 77))
                       (EXIT (LETT |x| (CDR |x|))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT % 78))))) 

(SDEFUN |LIST;OMwrite;Omd%BV;42|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 79))))
             (|LIST;writeOMList| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 80))))))) 

(SDEFUN |LIST;setUnion;3%;43| ((|l1| (%)) (|l2| (%)) (% (%)))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT % 69)) (QREFELT % 82))) 

(SDEFUN |LIST;setIntersection;3%;44| ((|l1| (%)) (|l2| (%)) (% (%)))
        (SPROG ((|u| (%)))
               (SEQ (LETT |u| NIL) (LETT |l1| (SPADCALL |l1| (QREFELT % 82)))
                    (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT % 57))
                            (LETT |u| (CONS (|SPADfirst| |l1|) |u|))))
                          (EXIT (LETT |l1| (CDR |l1|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3%;45| ((|l1| (%)) (|l2| (%)) (% (%)))
        (SPROG ((|l11| (S)) (|lu| (%)))
               (SEQ (LETT |l1| (SPADCALL |l1| (QREFELT % 82)))
                    (EXIT
                     (COND ((NULL |l2|) |l1|)
                           ('T
                            (SEQ (LETT |lu| NIL)
                                 (SEQ G190
                                      (COND
                                       ((NULL (NULL (NULL |l1|))) (GO G191)))
                                      (SEQ
                                       (LETT |l11|
                                             (SPADCALL |l1| 1 (QREFELT % 85)))
                                       (COND
                                        ((NULL
                                          (SPADCALL |l11| |l2| (QREFELT % 57)))
                                         (LETT |lu|
                                               (SPADCALL |l11| |lu|
                                                         (QREFELT % 10)))))
                                       (EXIT (LETT |l1| (CDR |l1|))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT |lu|)))))))) 

(SDEFUN |LIST;map!;M2%;46| ((|f| (|Mapping| S S)) (|l| (%)) (% (%)))
        (SPROG ((|y| (%)))
               (SEQ (LETT |y| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                         (SEQ
                          (SPADCALL |l| (SPADCALL (|SPADfirst| |l|) |f|)
                                    (QREFELT % 22))
                          (EXIT (LETT |l| (CDR |l|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |y|)))) 

(SDEFUN |LIST;convert;%If;47| ((|x| (%)) (% (|InputForm|)))
        (SPROG ((#1=#:G277 NIL) (|a| NIL) (#2=#:G278 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL '|construct| (QREFELT % 91))
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |a| NIL) (LETT #2# |x|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |a| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #1#
                                         (CONS (SPADCALL |a| (QREFELT % 92))
                                               #1#))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT (NREVERSE #1#))))
                           (QREFELT % 94))
                 (QREFELT % 95))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G286 NIL) (#2=#:G285 NIL)
    (#3=#:G284 NIL) (|pv$| NIL) (#4=#:G288 NIL) (#5=#:G289 NIL)
    (#6=#:G287 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|List| DV$1))
    (LETT % (GETREFV 107))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #1#
                                         (|HasCategory| |#1| '(|OrderedSet|))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #3# #1#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|List| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (LETT #4# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 16384))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|SetWithZero|)) #4# (|augmentPredVector| % 32768))
    (AND
     (LETT #5#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 65536))
    (AND
     (OR (|HasCategory| |#1| '(|CoercibleTo| (|OutputForm|))) (AND #1# #4#)
         #5#)
     (|augmentPredVector| % 131072))
    (AND (OR (AND #1# #4#) #5# #2#) (|augmentPredVector| % 262144))
    (AND (OR (AND #1# #4#) #5#) (|augmentPredVector| % 524288))
    (AND #3# #4# (|augmentPredVector| % 1048576))
    (AND (LETT #6# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #6#
         (|augmentPredVector| % 4194304))
    (AND #4# #6# (|augmentPredVector| % 8388608))
    (AND
     (OR (AND #3# #4#) (AND #1# #4#) (|HasCategory| |#1| '(|Hashable|)) #5#
         #2#)
     (|augmentPredVector| % 16777216))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 5)
      (QSETREFV % 53 (CONS (|dispatchFunction| |LIST;coerce;%Of;27|) %))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV % 55 (CONS (|dispatchFunction| |LIST;=;2%B;28|) %))
       (QSETREFV % 57 (CONS (|dispatchFunction| |LIST;member?;S%B;29|) %))
       (QSETREFV % 60 (CONS (|dispatchFunction| |LIST;merge_unique;M3%;30|) %))
       (QSETREFV % 61
                 (CONS (|dispatchFunction| |LIST;merge_unique!;M3%;31|) %)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 64
                (CONS (|dispatchFunction| |LIST;hashUpdate!;Hs%Hs;32|) %))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV % 65
                (CONS (|dispatchFunction| |LIST;removeDuplicates!;2%;34|) %))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 81
                 (CONS (|dispatchFunction| |LIST;OMwrite;Omd%BV;42|) %)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV % 83 (CONS (|dispatchFunction| |LIST;setUnion;3%;43|) %))
       (QSETREFV % 84
                 (CONS (|dispatchFunction| |LIST;setIntersection;3%;44|) %))
       (QSETREFV % 86
                 (CONS (|dispatchFunction| |LIST;setDifference;3%;45|) %)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 96 (CONS (|dispatchFunction| |LIST;convert;%If;47|) %))))
    %))) 

(DEFUN |List| (#1=#:G290)
  (SPROG NIL
         (PROG (#2=#:G291)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|List|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|List;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|List|)))))))))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |LIST;#;%Nni;1| |LIST;cons;S2%;2| |LIST;concat;S2%;3| (|Boolean|)
              |LIST;eq?;2%B;4| |LIST;first;%S;5| '"first" |LIST;elt;%firstS;6|
              |LIST;empty;%;7| |LIST;empty?;%B;8| |LIST;rest;2%;9| '"rest"
              |LIST;elt;%rest%;10| |LIST;qsetfirst!;%2S;11|
              |LIST;setfirst!;%2S;12| |LIST;setelt!;%first2S;13|
              |LIST;qsetrest!;3%;14| |LIST;setrest!;3%;15|
              |LIST;setelt!;%rest2%;16| (|List| 6) |LIST;construct;2%;17|
              |LIST;parts;2%;18| |LIST;reverse!;2%;19| |LIST;reverse;2%;20|
              (|Integer|) |LIST;minIndex;%I;21| |LIST;maxIndex;%I;22|
              |LIST;first;%Nni%;23| |LIST;rest;%Nni%;24| (0 . |cyclic?|)
              |LIST;copy;2%;25| (5 . |leaf?|) (10 . |value|)
              |LIST;leaves;2%;26| (15 . |cycleEntry|) (|OutputForm|)
              (20 . |coerce|) (|List| 43) (25 . |concat|) (|List| %)
              (31 . |bracket|) (36 . |list|) (41 . |commaSeparate|)
              (46 . |overbar|) (51 . |concat!|) (57 . |coerce|) (62 . ~=)
              (68 . =) (74 . =) (80 . |member?|) |LIST;concat!;3%;33|
              (|Mapping| 11 6 6) (86 . |merge_unique|) (93 . |merge_unique!|)
              (|HashState|) (100 . |hashUpdate!|) (106 . |hashUpdate!|)
              (112 . |removeDuplicates!|) |LIST;sort!;M2%;35|
              |LIST;merge!;M3%;36| |LIST;split!;%Nni%;37| (117 . |concat|)
              |LIST;append;3%;39| |LIST;tails;%L;40| (|Void|)
              (|OpenMathDevice|) (123 . |OMputApp|) (|String|)
              (128 . |OMputSymbol|) (135 . |OMwrite|) (142 . |OMputEndApp|)
              (147 . |OMputObject|) (152 . |OMputEndObject|) (157 . |OMwrite|)
              (164 . |removeDuplicates|) (169 . |setUnion|)
              (175 . |setIntersection|) (181 . |elt|) (187 . |setDifference|)
              (|Mapping| 6 6) |LIST;map!;M2%;46| (|Symbol|) (|InputForm|)
              (193 . |convert|) (198 . |convert|) (|List| 90) (203 . |concat|)
              (209 . |convert|) (214 . |convert|) '"value" '"last"
              (|UniversalSegment| 32) (|Mapping| 6 6 6) (|Union| 6 '"failed")
              (|Mapping| 11 6) (|List| 32) (|List| 105) (|Equation| 6)
              (|SingleInteger|))
           '#(~= 219 |value| 225 |trim| 230 |third| 236 |tails| 241 |tail| 246
              |swap!| 251 |split!| 258 |sorted?| 264 |sort!| 275 |sort| 286
              |smaller?| 297 |size?| 303 |sign| 309 |setvalue!| 314 |setrest!|
              320 |setlast!| 326 |setfirst!| 332 |setelt!| 338 |setchildren!|
              380 |setUnion| 386 |setIntersection| 392 |setDifference| 398
              |select!| 404 |select| 410 |second| 416 |sample| 421 |rightTrim|
              425 |reverse!| 431 |reverse| 436 |rest| 441 |removeDuplicates!|
              452 |removeDuplicates| 457 |remove!| 462 |remove| 474 |reduce|
              486 |qsetrest!| 507 |qsetfirst!| 513 |qsetelt!| 519 |qelt| 526
              |possiblyInfinite?| 532 |positive?| 537 |position| 542 |parts|
              561 |nodes| 566 |node?| 571 |new| 577 |negative?| 583 |more?| 588
              |minIndex| 594 |min| 599 |merge_unique!| 610 |merge_unique| 617
              |merge!| 624 |merge| 637 |members| 650 |member?| 655 |maxIndex|
              661 |max| 666 |map!| 683 |map| 689 |list| 702 |less?| 707
              |leftTrim| 713 |leaves| 719 |leaf?| 724 |latex| 729 |last| 734
              |insert!| 745 |insert| 759 |indices| 773 |index?| 778
              |hashUpdate!| 784 |hash| 790 |first| 795 |find| 806 |fill!| 812
              |explicitlyFinite?| 818 |every?| 823 |eval| 829 |eq?| 855
              |entry?| 861 |entries| 867 |empty?| 872 |empty| 877 |elt| 881
              |distance| 924 |delete!| 930 |delete| 942 |cyclic?| 954
              |cycleTail| 959 |cycleSplit!| 964 |cycleLength| 969 |cycleEntry|
              974 |count| 979 |copyInto!| 991 |copy| 998 |convert| 1003
              |construct| 1008 |cons| 1013 |concat!| 1019 |concat| 1036
              |coerce| 1059 |children| 1064 |child?| 1069 |append| 1075 |any?|
              1081 |OMwrite| 1087 >= 1111 > 1117 = 1123 <= 1129 < 1135 |#|
              1141)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 1 0 7 0 0 0 7 0 3 10 9 0 0 4 14 2 1
                                  11 9 0 0 0 0 0))
            (CONS
             '#(|ListAggregate&| NIL |ExtensibleLinearAggregate&|
                |StreamAggregate&| |LinearAggregate&| |OrderedSet&|
                |UnaryRecursiveAggregate&| NIL |Collection&|
                |IndexedAggregate&| |RecursiveAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| |OpenMath&| |BasicType&| NIL
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|ListAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|StreamAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|)
                 (|UnaryRecursiveAggregate| 6) (|Comparable|) (|Collection| 6)
                 (|IndexedAggregate| 32 6) (|RecursiveAggregate| 6)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 6)
                 (|Hashable|) (|SetCategory|) (|Evalable| 6)
                 (|EltableAggregate| 32 6) (|Aggregate|) (|OpenMath|)
                 (|BasicType|) (|ConvertibleTo| 90) (|PartialOrder|)
                 (|CoercibleTo| 43) (|InnerEvalable| 6 6) (|Eltable| 32 6)
                 (|Type|) (|Eltable| 99 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 106
                                  '(1 0 11 0 37 1 0 11 0 39 1 0 6 0 40 1 0 0 0
                                    42 1 6 43 0 44 2 45 0 43 0 46 1 43 0 47 48
                                    1 45 0 43 49 1 43 0 47 50 1 43 0 0 51 2 45
                                    0 0 43 52 1 0 43 0 53 2 6 11 0 0 54 2 0 11
                                    0 0 55 2 6 11 0 0 56 2 0 11 6 0 57 3 0 0 59
                                    0 0 60 3 0 0 59 0 0 61 2 6 62 62 0 63 2 0
                                    62 62 0 64 1 0 0 0 65 2 0 0 0 0 69 1 73 72
                                    0 74 3 73 72 0 75 75 76 3 6 72 73 0 11 77 1
                                    73 72 0 78 1 73 72 0 79 1 73 72 0 80 3 0 72
                                    73 0 11 81 1 0 0 0 82 2 0 0 0 0 83 2 0 0 0
                                    0 84 2 0 6 0 32 85 2 0 0 0 0 86 1 90 0 89
                                    91 1 6 90 0 92 2 93 0 90 0 94 1 90 0 47 95
                                    1 0 90 0 96 2 25 11 0 0 1 1 0 6 0 40 2 21 0
                                    0 6 1 1 0 6 0 1 1 0 47 0 71 1 0 0 0 1 3 22
                                    72 0 32 32 1 2 22 0 0 7 68 1 17 11 0 1 2 15
                                    11 59 0 1 2 24 0 59 0 66 1 23 0 0 1 1 17 0
                                    0 1 2 15 0 59 0 1 2 20 11 0 0 1 2 0 11 0 7
                                    1 1 16 32 0 1 2 22 6 0 6 1 2 22 0 0 0 25 2
                                    22 6 0 6 1 2 22 6 0 6 22 3 22 6 0 97 6 1 3
                                    22 6 0 14 6 23 3 22 0 0 19 0 26 3 22 6 0 98
                                    6 1 3 22 6 0 99 6 1 3 22 6 0 32 6 1 2 22 0
                                    0 47 1 2 13 0 0 0 83 2 13 0 0 0 84 2 13 0 0
                                    0 86 2 0 0 102 0 1 2 15 0 102 0 1 1 0 6 0 1
                                    0 0 0 1 2 21 0 0 6 1 1 24 0 0 30 1 15 0 0
                                    31 1 0 0 0 18 2 0 0 0 7 36 1 13 0 0 65 1 21
                                    0 0 82 2 0 0 102 0 1 2 13 0 6 0 1 2 21 0 6
                                    0 1 2 15 0 102 0 1 4 21 6 100 0 6 6 1 3 15
                                    6 100 0 6 1 2 15 6 100 0 1 2 22 0 0 0 24 2
                                    22 6 0 6 21 3 22 6 0 32 6 1 2 0 6 0 32 1 1
                                    0 11 0 1 1 16 11 0 1 3 21 32 6 0 32 1 2 21
                                    32 6 0 1 2 15 32 102 0 1 1 15 27 0 29 1 0
                                    47 0 1 2 13 11 0 0 1 2 0 0 7 6 1 1 16 11 0
                                    1 2 0 11 0 7 1 1 12 32 0 33 1 17 6 0 1 2 17
                                    0 0 0 1 3 13 0 59 0 0 61 3 21 0 59 0 0 60 3
                                    0 0 59 0 0 67 2 1 0 0 0 1 2 17 0 0 0 1 3 15
                                    0 59 0 0 1 1 15 27 0 1 2 21 11 6 0 57 1 12
                                    32 0 34 1 17 6 0 1 2 17 0 0 0 1 2 15 6 59 0
                                    1 2 22 0 87 0 88 2 0 0 87 0 1 3 0 0 100 0 0
                                    1 1 0 0 6 1 2 0 11 0 7 1 2 21 0 0 6 1 1 0
                                    27 0 41 1 0 11 0 39 1 19 75 0 1 1 0 6 0 1 2
                                    0 0 0 7 1 3 0 0 0 0 32 1 3 0 0 6 0 32 1 3 0
                                    0 0 0 32 1 3 0 0 6 0 32 1 1 0 103 0 1 2 0
                                    11 32 0 1 2 3 62 62 0 64 1 3 106 0 1 1 0 6
                                    0 13 2 0 0 0 7 35 2 0 101 102 0 1 2 22 0 0
                                    6 1 1 0 11 0 1 2 15 11 102 0 1 2 9 0 0 104
                                    1 2 9 0 0 105 1 3 9 0 0 27 27 1 3 9 0 0 6 6
                                    1 2 0 11 0 0 12 2 21 11 6 0 1 1 0 27 0 1 1
                                    0 11 0 17 0 0 0 16 2 0 6 0 97 1 2 0 6 0 14
                                    15 2 0 0 0 19 20 2 0 6 0 98 1 2 0 0 0 99 1
                                    2 0 6 0 32 85 3 0 6 0 32 6 1 2 0 32 0 0 1 2
                                    0 0 0 32 1 2 0 0 0 99 1 2 0 0 0 99 1 2 0 0
                                    0 32 1 1 0 11 0 37 1 0 0 0 1 1 22 0 0 1 1 0
                                    7 0 1 1 0 0 0 42 2 21 7 6 0 1 2 15 7 102 0
                                    1 3 24 0 0 0 32 1 1 0 0 0 38 1 2 90 0 96 1
                                    0 0 27 28 2 0 0 6 0 9 2 0 0 0 0 58 2 0 0 0
                                    6 1 1 22 0 47 1 2 0 0 6 0 10 2 0 0 0 0 69 1
                                    0 0 47 1 2 0 0 0 6 1 1 18 43 0 53 1 0 47 0
                                    1 2 13 11 0 0 1 2 0 0 0 0 70 2 15 11 102 0
                                    1 2 4 72 73 0 1 3 4 72 73 0 11 81 2 4 75 0
                                    11 1 1 4 75 0 1 2 17 11 0 0 1 2 17 11 0 0 1
                                    2 25 11 0 0 55 2 17 11 0 0 1 2 17 11 0 0 1
                                    1 15 7 0 8)))))
           '|lookupComplete|)) 
