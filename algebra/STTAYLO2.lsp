
(SDEFUN |STTAYLO2;zro| ((% (|Stream| M))) (SPADCALL (QREFELT % 9))) 

(SDEFUN |STTAYLO2;+;3S;2|
        ((|x| (|Stream| M)) (|y| (|Stream| M)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;+;3S;2!2| (VECTOR |x| % |y|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;+;3S;2!2| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND ((SPADCALL |y| (QREFELT % 11)) |x|)
                         ((SPADCALL |x| (QREFELT % 11)) |y|)
                         ((SPADCALL |x| (SPADCALL |x| (QREFELT % 12))
                                    (QREFELT % 13))
                          (SPADCALL (CONS #'|STTAYLO2;+;3S;2!0| (VECTOR % |x|))
                                    |y| (QREFELT % 17)))
                         ((SPADCALL |y| (SPADCALL |y| (QREFELT % 12))
                                    (QREFELT % 13))
                          (SPADCALL (CONS #'|STTAYLO2;+;3S;2!1| (VECTOR % |y|))
                                    |x| (QREFELT % 17)))
                         ('T
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 14))
                                     (SPADCALL |y| (QREFELT % 14))
                                     (QREFELT % 15))
                           (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                     (SPADCALL |y| (QREFELT % 12))
                                     (QREFELT % 18))
                           (QREFELT % 19))))))))) 

(SDEFUN |STTAYLO2;+;3S;2!1| ((|z| NIL) ($$ NIL))
        (PROG (|y| %)
          (LETT |y| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT % 14)) |z| (QREFELT % 15)))))) 

(SDEFUN |STTAYLO2;+;3S;2!0| ((|z| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 14)) |z| (QREFELT % 15)))))) 

(SDEFUN |STTAYLO2;-;3S;3|
        ((|x| (|Stream| M)) (|y| (|Stream| M)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;-;3S;3!2| (VECTOR |x| % |y|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;-;3S;3!2| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND ((SPADCALL |y| (QREFELT % 11)) |x|)
                         ((SPADCALL |x| (QREFELT % 11))
                          (SPADCALL |y| (QREFELT % 22)))
                         ((SPADCALL |x| (SPADCALL |x| (QREFELT % 12))
                                    (QREFELT % 13))
                          (SPADCALL (CONS #'|STTAYLO2;-;3S;3!0| (VECTOR % |x|))
                                    |y| (QREFELT % 17)))
                         ((SPADCALL |y| (SPADCALL |y| (QREFELT % 12))
                                    (QREFELT % 13))
                          (SPADCALL (CONS #'|STTAYLO2;-;3S;3!1| (VECTOR % |y|))
                                    |x| (QREFELT % 17)))
                         ('T
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 14))
                                     (SPADCALL |y| (QREFELT % 14))
                                     (QREFELT % 23))
                           (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                     (SPADCALL |y| (QREFELT % 12))
                                     (QREFELT % 24))
                           (QREFELT % 19))))))))) 

(SDEFUN |STTAYLO2;-;3S;3!1| ((|z| NIL) ($$ NIL))
        (PROG (|y| %)
          (LETT |y| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z| (SPADCALL |y| (QREFELT % 14)) (QREFELT % 23)))))) 

(SDEFUN |STTAYLO2;-;3S;3!0| ((|z| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 14)) |z| (QREFELT % 23)))))) 

(SDEFUN |STTAYLO2;-;2S;4| ((|y| (|Stream| M)) (% (|Stream| M)))
        (SPADCALL (ELT % 25) |y| (QREFELT % 17))) 

(SDEFUN |STTAYLO2;*;R2S;5| ((|s| (R)) (|x| (|Stream| M)) (% (|Stream| M)))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT % 26)) (|STTAYLO2;zro| %))
                     ('T
                      (SPADCALL (CONS #'|STTAYLO2;*;R2S;5!0| (VECTOR % |s|))
                                |x| (QREFELT % 17)))))) 

(SDEFUN |STTAYLO2;*;R2S;5!0| ((|z| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |z| (QREFELT % 27)))))) 

(SDEFUN |STTAYLO2;pow_y| ((|y| (|Stream| R)) (% (|Stream| (|Stream| R))))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;pow_y!0| (VECTOR % |y|)) |y|
                         (QREFELT % 34)))) 

(SDEFUN |STTAYLO2;pow_y!0| ((|t| NIL) ($$ NIL))
        (PROG (|y| %)
          (LETT |y| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |y| |t| (QREFELT % 31)))))) 

(SDEFUN |STTAYLO2;*;SRS;7| ((|x| (|Stream| M)) (|s| (R)) (% (|Stream| M)))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT % 26)) (|STTAYLO2;zro| %))
                     ('T
                      (SPADCALL (CONS #'|STTAYLO2;*;SRS;7!0| (VECTOR % |s|))
                                |x| (QREFELT % 17)))))) 

(SDEFUN |STTAYLO2;*;SRS;7!0| ((|z| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z| |s| (QREFELT % 35)))))) 

(SDEFUN |STTAYLO2;*;MSS;8| ((|m| (M)) (|x| (|Stream| R)) (% (|Stream| M)))
        (SPROG NIL
               (COND ((SPADCALL |m| (QREFELT % 37)) (|STTAYLO2;zro| %))
                     ('T
                      (SPADCALL (CONS #'|STTAYLO2;*;MSS;8!0| (VECTOR % |m|))
                                |x| (QREFELT % 40)))))) 

(SDEFUN |STTAYLO2;*;MSS;8!0| ((|z| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |m| |z| (QREFELT % 35)))))) 

(SDEFUN |STTAYLO2;mul_and_trim|
        ((|x| (|Stream| M)) (|n| (|NonNegativeInteger|))
         (|ys| (|Stream| (|Stream| R))) (% (|Stream| (|Stream| M))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLO2;mul_and_trim!0| (VECTOR |n| |ys| % |x|))
                 (QREFELT % 55))))) 

(SDEFUN |STTAYLO2;mul_and_trim!0| (($$ NIL))
        (PROG (|x| % |ys| |n|)
          (LETT |x| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |ys| (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|y1| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |x| (QREFELT % 11))
                          (SPADCALL |ys| (QREFELT % 42)))
                      (SPADCALL (QREFELT % 53)))
                     ('T
                      (SEQ
                       (LETT |y1|
                             (SPADCALL (SPADCALL |ys| (QREFELT % 43)) |n|
                                       (QREFELT % 45)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT % 14)) |y1|
                                   (QREFELT % 41))
                         (|STTAYLO2;mul_and_trim| (SPADCALL |x| (QREFELT % 12))
                          (SPADCALL |n| (|spadConstant| % 51) (QREFELT % 48))
                          (SPADCALL |ys| (QREFELT % 49)) %)
                         (QREFELT % 54)))))))))))) 

(SDEFUN |STTAYLO2;compose;SSS;10|
        ((|x| (|Stream| M)) (|y| (|Stream| R)) (% (|Stream| M)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLO2;compose;SSS;10!0| (VECTOR |y| % |x|))
                 (QREFELT % 21))))) 

(SDEFUN |STTAYLO2;compose;SSS;10!0| (($$ NIL))
        (PROG (|x| % |y|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|ys| NIL))
                   (SEQ
                    (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLO2;zro| %))
                          ((SPADCALL |y| (QREFELT % 56))
                           (SPADCALL (SPADCALL |x| (QREFELT % 14))
                                     (|STTAYLO2;zro| %) (QREFELT % 19)))
                          ((NULL
                            (SPADCALL (SPADCALL |y| (QREFELT % 57))
                                      (QREFELT % 26)))
                           (|error|
                            "compose: 2nd argument should have 0 constant coefficient"))
                          ('T
                           (SEQ (LETT |ys| (|STTAYLO2;pow_y| |y| %))
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT % 14))
                                             (QREFELT % 58))
                                   (|STTAYLO2;mul_and_trim|
                                    (SPADCALL |x| (QREFELT % 12))
                                    (|spadConstant| % 47) |ys| %)
                                   (QREFELT % 54))
                                  (QREFELT % 59)))))))))))) 

(SDEFUN |STTAYLO2;mapmult;SSS;11|
        ((|x| (|Stream| M)) (|y| (|Stream| R)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|STTAYLO2;mapmult;SSS;11!0| (VECTOR |x| % |y|))
                (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;mapmult;SSS;11!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |y| (QREFELT % 56)) (SPADCALL |x| (QREFELT % 11)))
              (|STTAYLO2;zro| %))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT % 14))
                         (SPADCALL |y| (QREFELT % 57)) (QREFELT % 35))
               (SPADCALL (SPADCALL |x| (QREFELT % 12))
                         (SPADCALL |y| (QREFELT % 61)) (QREFELT % 62))
               (QREFELT % 19)))))))) 

(SDEFUN |STTAYLO2;eval;SRS;12| ((|x| (|Stream| M)) (|at| (R)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (|spadConstant| % 64) (ELT % 15)
                         (SPADCALL |x|
                                   (SPADCALL
                                    (CONS #'|STTAYLO2;eval;SRS;12!0|
                                          (VECTOR % |at|))
                                    (|spadConstant| % 46) (QREFELT % 67))
                                   (QREFELT % 62))
                         (QREFELT % 70)))) 

(SDEFUN |STTAYLO2;eval;SRS;12!0| ((|y| NIL) ($$ NIL))
        (PROG (|at| %)
          (LETT |at| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |at| |y| (QREFELT % 65)))))) 

(SDEFUN |STTAYLO2;stmult|
        ((|n0| (|Integer|)) (|x0| (|Stream| R)) (|y0| (|Stream| M))
         (|ll0| (|List| M)) (% (|Stream| M)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLO2;stmult!0| (VECTOR % |ll0| |n0| |y0| |x0|))
                 (QREFELT % 21))))) 

(SDEFUN |STTAYLO2;stmult!0| (($$ NIL))
        (PROG (|x0| |y0| |n0| |ll0| %)
          (LETT |x0| (QREFELT $$ 4))
          (LETT |y0| (QREFELT $$ 3))
          (LETT |n0| (QREFELT $$ 2))
          (LETT |ll0| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|x| NIL) (|c| NIL) (|y| NIL) (|ll| NIL) (|n| NIL) (|i| NIL)
              (#1=#:G159 NIL) (#2=#:G158 NIL) (#3=#:G157 NIL) (|res| NIL)
              (|llp| NIL) (|xp| NIL))
             (SEQ
              (EXIT
               (SEQ (LETT |x| |x0|) (LETT |y| |y0|) (LETT |n| |n0|)
                    (LETT |ll| |ll0|)
                    (COND
                     ((SPADCALL |y| (QREFELT % 11))
                      (COND
                       ((OR (SPADCALL |n| (|spadConstant| % 81) (QREFELT % 74))
                            (SPADCALL |x| (QREFELT % 56)))
                        (PROGN
                         (LETT #2# (SPADCALL (QREFELT % 9)))
                         (GO #4=#:G156)))
                       ('T (LETT |x| (SPADCALL |x| (QREFELT % 61))))))
                     ('T
                      (SEQ (LETT |c| (SPADCALL |y| (QREFELT % 14)))
                           (LETT |y| (SPADCALL |y| (QREFELT % 12)))
                           (EXIT
                            (COND
                             ((SPADCALL |n| (|spadConstant| % 81)
                                        (QREFELT % 74))
                              (COND
                               ((SPADCALL |c| (|spadConstant| % 64)
                                          (QREFELT % 75))
                                (PROGN
                                 (LETT #2#
                                       (SPADCALL (|spadConstant| % 64)
                                                 (|STTAYLO2;stmult| |n| |x| |y|
                                                  |ll| %)
                                                 (QREFELT % 19)))
                                 (GO #4#)))
                               ('T
                                (SEQ
                                 (LETT |ll| (SPADCALL |c| |ll| (QREFELT % 77)))
                                 (EXIT
                                  (LETT |n|
                                        (SPADCALL |n| (|spadConstant| % 88)
                                                  (QREFELT % 79))))))))
                             ('T
                              (SEQ
                               (LETT |ll| (SPADCALL |c| |ll| (QREFELT % 77)))
                               (EXIT
                                (LETT |n|
                                      (SPADCALL |n| (|spadConstant| % 88)
                                                (QREFELT % 79)))))))))))
                    (LETT |res| (|spadConstant| % 64)) (LETT |xp| |x|)
                    (LETT |llp| |ll|)
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| (|spadConstant| % 81)) (LETT #1# |n|) G190
                           (COND ((> |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |xp| (QREFELT % 56))
                               (COND
                                ((SPADCALL |i| (|spadConstant| % 82)
                                           (QREFELT % 83))
                                 (PROGN
                                  (LETT #2# (SPADCALL (QREFELT % 9)))
                                  (GO #4#)))
                                ('T (PROGN (LETT #3# 1) (GO #5=#:G152)))))
                              ('T
                               (SEQ
                                (LETT |res|
                                      (SPADCALL |res|
                                                (SPADCALL
                                                 (SPADCALL |xp| (QREFELT % 57))
                                                 (SPADCALL |llp|
                                                           (QREFELT % 84))
                                                 (QREFELT % 27))
                                                (QREFELT % 15)))
                                (LETT |llp| (SPADCALL |llp| (QREFELT % 85)))
                                (EXIT
                                 (LETT |xp|
                                       (SPADCALL |xp| (QREFELT % 61)))))))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #3#))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT % 61)) (QREFELT % 86))
                      (COND
                       ((SPADCALL |y| (QREFELT % 87))
                        (EXIT
                         (SPADCALL |res| (SPADCALL (QREFELT % 9))
                                   (QREFELT % 19)))))))
                    (EXIT
                     (SPADCALL |res| (|STTAYLO2;stmult| |n| |x| |y| |ll| %)
                               (QREFELT % 19)))))
              #4# (EXIT #2#))))))) 

(SDEFUN |STTAYLO2;*;S2S;14|
        ((|x| (|Stream| R)) (|y| (|Stream| M)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;*;S2S;14!0| (VECTOR |x| % |y|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;*;S2S;14!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |y| (QREFELT % 11)) (SPADCALL |x| (QREFELT % 56)))
              (|STTAYLO2;zro| %))
             ('T
              (|STTAYLO2;stmult|
               (SPADCALL (|spadConstant| % 78) (QREFELT % 89)) |x| |y| NIL
               %))))))) 

(SDEFUN |STTAYLO2;integers;IS;15| ((|z| #1=(|Integer|)) (% (|Stream| #1#)))
        (SPADCALL (CONS #'|STTAYLO2;integers;IS;15!0| %) |z| (QREFELT % 93))) 

(SDEFUN |STTAYLO2;integers;IS;15!0| ((|y| NIL) (% NIL))
        (SPADCALL |y| (|spadConstant| % 78) (QREFELT % 79))) 

(SDEFUN |STTAYLO2;oddintegers;IS;16| ((|z| #1=(|Integer|)) (% (|Stream| #1#)))
        (SPADCALL (CONS #'|STTAYLO2;oddintegers;IS;16!0| %) |z| (QREFELT % 93))) 

(SDEFUN |STTAYLO2;oddintegers;IS;16!0| ((|y| NIL) (% NIL))
        (SPADCALL |y| 2 (QREFELT % 79))) 

(SDEFUN |STTAYLO2;int;RS;17| ((|s| (R)) (% (|Stream| R)))
        (SPADCALL (CONS #'|STTAYLO2;int;RS;17!0| %) |s| (QREFELT % 67))) 

(SDEFUN |STTAYLO2;int;RS;17!0| ((|y| NIL) (% NIL))
        (SPADCALL |y| (|spadConstant| % 46) (QREFELT % 96))) 

(SDEFUN |STTAYLO2;mapmult;S2S;18|
        ((|x| (|Stream| R)) (|y| (|Stream| M)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|STTAYLO2;mapmult;S2S;18!0| (VECTOR |x| % |y|))
                (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;mapmult;S2S;18!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |y| (QREFELT % 11)) (SPADCALL |x| (QREFELT % 56)))
              (|STTAYLO2;zro| %))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT % 57))
                         (SPADCALL |y| (QREFELT % 14)) (QREFELT % 27))
               (SPADCALL (SPADCALL |x| (QREFELT % 61))
                         (SPADCALL |y| (QREFELT % 12)) (QREFELT % 98))
               (QREFELT % 19)))))))) 

(SDEFUN |STTAYLO2;deriv;2S;19| ((|x| (|Stream| M)) (% (|Stream| M)))
        (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLO2;zro| %))
              ('T
               (SPADCALL (SPADCALL (|spadConstant| % 46) (QREFELT % 97))
                         (SPADCALL |x| (QREFELT % 99)) (QREFELT % 98))))) 

(SDEFUN |STTAYLO2;gderiv;M2S;20|
        ((|f| (|Mapping| R (|Integer|))) (|x| (|Stream| M)) (% (|Stream| M)))
        (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLO2;zro| %))
              ('T
               (SPADCALL
                (SPADCALL |f| (SPADCALL 0 (QREFELT % 94)) (QREFELT % 103)) |x|
                (QREFELT % 98))))) 

(SDEFUN |STTAYLO2;coerce;MS;21| ((|s| (M)) (% (|Stream| M)))
        (COND ((SPADCALL |s| (QREFELT % 37)) (|STTAYLO2;zro| %))
              ('T (SPADCALL |s| (|STTAYLO2;zro| %) (QREFELT % 19))))) 

(SDEFUN |STTAYLO2;addiag;SS;22|
        ((|ststa| (|Stream| (|Stream| M))) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;addiag;SS;22!0| (VECTOR % |ststa|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;addiag;SS;22!0| (($$ NIL))
        (PROG (|ststa| %)
          (LETT |ststa| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |ststa| (QREFELT % 105)) (|STTAYLO2;zro| %))
                  ((SPADCALL (SPADCALL |ststa| (QREFELT % 106)) (QREFELT % 11))
                   (SPADCALL (|spadConstant| % 64)
                             (SPADCALL (SPADCALL |ststa| (QREFELT % 107))
                                       (QREFELT % 59))
                             (QREFELT % 19)))
                  ('T
                   (SPADCALL
                    (SPADCALL (SPADCALL |ststa| (QREFELT % 106))
                              (QREFELT % 14))
                    (SPADCALL
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 106))
                               (QREFELT % 12))
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 107))
                               (QREFELT % 59))
                     (QREFELT % 18))
                    (QREFELT % 19)))))))) 

(SDEFUN |STTAYLO2;ms|
        ((|m| (|Integer|)) (|n| (|Integer|)) (|s| (|Stream| M))
         (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;ms!0| (VECTOR |m| |n| % |s|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;ms!0| (($$ NIL))
        (PROG (|s| % |n| |m|)
          (LETT |s| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT |m| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |s| (QREFELT % 11)) (|STTAYLO2;zro| %))
                  ((SPADCALL |n| (QREFELT % 108))
                   (SPADCALL (SPADCALL |s| (QREFELT % 14))
                             (|STTAYLO2;ms| |m|
                              (SPADCALL |m| (|spadConstant| % 78)
                                        (QREFELT % 109))
                              (SPADCALL |s| (QREFELT % 12)) %)
                             (QREFELT % 19)))
                  ('T
                   (|STTAYLO2;ms| |m|
                    (SPADCALL |n| (|spadConstant| % 78) (QREFELT % 109))
                    (SPADCALL |s| (QREFELT % 12)) %))))))) 

(SDEFUN |STTAYLO2;multisect;2I2S;24|
        ((|b| #1=(|Integer|)) (|a| #1#) (|x| (|Stream| M)) (% (|Stream| M)))
        (SPROG ((#2=#:G207 NIL))
               (|STTAYLO2;ms| (+ |a| |b|) 0
                (SPADCALL |x|
                          (PROG1 (LETT #2# |a|)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#))
                          (QREFELT % 110))
                %))) 

(SDEFUN |STTAYLO2;rpSt| ((|z| (|Integer|)) (|s| (M)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;rpSt!0| (VECTOR |s| % |z|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;rpSt!0| (($$ NIL))
        (PROG (|z| % |s|)
          (LETT |z| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |s| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |z| (|spadConstant| % 73) (QREFELT % 112))
              (SPADCALL (QREFELT % 9)))
             ('T
              (SPADCALL |s|
                        (|STTAYLO2;rpSt|
                         (SPADCALL |z| (|spadConstant| % 78) (QREFELT % 109))
                         |s| %)
                        (QREFELT % 19)))))))) 

(SDEFUN |STTAYLO2;monom;MIS;26| ((|s| (M)) (|z| (|Integer|)) (% (|Stream| M)))
        (COND
         ((< |z| 0)
          (|error| "monom: cannot create monomial of negative degree"))
         ('T
          (SPADCALL (|STTAYLO2;rpSt| |z| (|spadConstant| % 64) %)
                    (SPADCALL |s| (|STTAYLO2;zro| %) (QREFELT % 19))
                    (QREFELT % 113))))) 

(SDEFUN |STTAYLO2;altn|
        ((|zs| (|Stream| M)) (|s| (|Stream| M)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;altn!0| (VECTOR |zs| % |s|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;altn!0| (($$ NIL))
        (PROG (|s| % |zs|)
          (LETT |s| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |zs| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |s| (QREFELT % 11)) (|STTAYLO2;zro| %))
                  ('T
                   (SPADCALL (SPADCALL |s| (QREFELT % 14))
                             (SPADCALL |zs|
                                       (|STTAYLO2;altn| |zs|
                                        (SPADCALL |s| (QREFELT % 12)) %)
                                       (QREFELT % 113))
                             (QREFELT % 19)))))))) 

(SDEFUN |STTAYLO2;invmultisect;2I2S;28|
        ((|a| #1=(|Integer|)) (|b| #1#) (|x| (|Stream| M)) (% (|Stream| M)))
        (SPADCALL (|STTAYLO2;rpSt| |b| (|spadConstant| % 64) %)
                  (|STTAYLO2;altn|
                   (|STTAYLO2;rpSt| (- (+ |a| |b|) 1) (|spadConstant| % 64) %)
                   |x| %)
                  (QREFELT % 113))) 

(SDEFUN |STTAYLO2;integre|
        ((|x| (|Stream| M)) (|n| (|Integer|)) (% (|Stream| M)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLO2;integre!0| (VECTOR |n| % |x|))
                         (QREFELT % 21)))) 

(SDEFUN |STTAYLO2;integre!0| (($$ NIL))
        (PROG (|x| % |n|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLO2;zro| %))
                  ('T
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 78) |n| (QREFELT % 117))
                      (QREFELT % 118))
                     (SPADCALL |x| (QREFELT % 14)) (QREFELT % 27))
                    (|STTAYLO2;integre| (SPADCALL |x| (QREFELT % 12))
                     (SPADCALL |n| (|spadConstant| % 51) (QREFELT % 79)) %)
                    (QREFELT % 19)))))))) 

(SDEFUN |STTAYLO2;integ| ((|x| (|Stream| M)) (% (|Stream| M)))
        (|STTAYLO2;integre| |x| 1 %)) 

(SDEFUN |STTAYLO2;integrate;M2S;31|
        ((|a| (M)) (|x| (|Stream| M)) (% (|Stream| M)))
        (SPADCALL |a| (|STTAYLO2;integ| |x| %) (QREFELT % 19))) 

(SDEFUN |STTAYLO2;lazyIntegrate;MMS;32|
        ((|s| (M)) (|xf| (|Mapping| (|Stream| M))) (% (|Stream| M)))
        (SPADCALL |s| (|STTAYLO2;integ| (SPADCALL |xf| (QREFELT % 21)) %)
                  (QREFELT % 19))) 

(DECLAIM (NOTINLINE |StreamTaylorSeriesOperations2;|)) 

(DEFUN |StreamTaylorSeriesOperations2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|StreamTaylorSeriesOperations2| DV$1 DV$2))
          (LETT % (GETREFV 122))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|RightModule|
                                                              (|devaluate|
                                                               |#1|)))))))
          (|haddProp| |$ConstructorCache| '|StreamTaylorSeriesOperations2|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 36 (CONS (|dispatchFunction| |STTAYLO2;*;SRS;7|) %))
             (QSETREFV % 41 (CONS (|dispatchFunction| |STTAYLO2;*;MSS;8|) %))
             (QSETREFV % 60
                       (CONS (|dispatchFunction| |STTAYLO2;compose;SSS;10|) %))
             (QSETREFV % 62
                       (CONS (|dispatchFunction| |STTAYLO2;mapmult;SSS;11|) %))
             (QSETREFV % 71
                       (CONS (|dispatchFunction| |STTAYLO2;eval;SRS;12|) %)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 119
                       (CONS (|dispatchFunction| |STTAYLO2;integrate;M2S;31|)
                             %))
             (QSETREFV % 121
                       (CONS
                        (|dispatchFunction| |STTAYLO2;lazyIntegrate;MMS;32|)
                        %)))))
          %))) 

(DEFUN |StreamTaylorSeriesOperations2| (&REST #1=#:G227)
  (SPROG NIL
         (PROG (#2=#:G228)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|StreamTaylorSeriesOperations2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |StreamTaylorSeriesOperations2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|StreamTaylorSeriesOperations2|)))))))))) 

(MAKEPROP '|StreamTaylorSeriesOperations2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Stream| 7) (0 . |empty|) (|Boolean|) (4 . |empty?|) (9 . |rst|)
              (14 . |eq?|) (20 . |frst|) (25 . +) (|Mapping| 7 7) (31 . |map|)
              |STTAYLO2;+;3S;2| (37 . |concat|) (|Mapping| %) (43 . |delay|)
              |STTAYLO2;-;2S;4| (48 . -) |STTAYLO2;-;3S;3| (54 . -)
              (59 . |zero?|) (64 . *) |STTAYLO2;*;R2S;5| (|Stream| 6)
              (|StreamTaylorSeriesOperations2| 6 6) (70 . *) (|Mapping| 29 29)
              (|Stream| 29) (76 . |stream|) (82 . *) (88 . *) (94 . |zero?|)
              (|Mapping| 7 6) (|StreamFunctions2| 6 7) (99 . |map|) (105 . *)
              (111 . |empty?|) (116 . |frst|) (|NonNegativeInteger|)
              (121 . |rest|) (127 . |One|) (131 . |One|) (135 . +)
              (141 . |rst|) (|PositiveInteger|) (146 . |One|) (|Stream| 8)
              (150 . |empty|) (154 . |concat|) (160 . |delay|) (165 . |empty?|)
              (170 . |frst|) |STTAYLO2;coerce;MS;21| |STTAYLO2;addiag;SS;22|
              (175 . |compose|) (181 . |rst|) (186 . |mapmult|) (192 . |Zero|)
              (196 . |Zero|) (200 . *) (|Mapping| 6 6) (206 . |stream|)
              (|Mapping| 7 7 7) (|StreamFunctions2| 7 7) (212 . |scan|)
              (219 . |eval|) (|Integer|) (225 . |Zero|) (229 . <) (235 . =)
              (|List| 7) (241 . |cons|) (247 . |One|) (251 . +)
              (|SingleInteger|) (257 . |Zero|) (261 . |Zero|) (265 . =)
              (271 . |first|) (276 . |rest|) (281 . |explicitlyEmpty?|)
              (286 . |explicitlyEmpty?|) (291 . |One|) (295 . -)
              |STTAYLO2;*;S2S;14| (|Mapping| 72 72) (|Stream| 72)
              (300 . |stream|) |STTAYLO2;integers;IS;15|
              |STTAYLO2;oddintegers;IS;16| (306 . +) |STTAYLO2;int;RS;17|
              |STTAYLO2;mapmult;S2S;18| (312 . |rest|) |STTAYLO2;deriv;2S;19|
              (|Mapping| 6 72) (|StreamFunctions2| 72 6) (317 . |map|)
              |STTAYLO2;gderiv;M2S;20| (323 . |empty?|) (328 . |frst|)
              (333 . |rst|) (338 . |zero?|) (343 . -) (349 . |rest|)
              |STTAYLO2;multisect;2I2S;24| (355 . <=) (361 . |concat|)
              |STTAYLO2;monom;MIS;26| |STTAYLO2;invmultisect;2I2S;28|
              (|Fraction| 72) (367 . /) (373 . |coerce|) (378 . |integrate|)
              (|Mapping| 8) (384 . |lazyIntegrate|))
           '#(|oddintegers| 390 |multisect| 395 |monom| 402 |mapmult| 408
              |lazyIntegrate| 420 |invmultisect| 426 |integrate| 433 |integers|
              439 |int| 444 |gderiv| 449 |eval| 455 |deriv| 461 |compose| 466
              |coerce| 472 |addiag| 477 - 482 + 493 * 499)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|StreamTaylorSeriesOperationsCategory| 6 7))
                             (|makeByteWordVec2| 121
                                                 '(0 8 0 9 1 8 10 0 11 1 8 0 0
                                                   12 2 8 10 0 0 13 1 8 7 0 14
                                                   2 7 0 0 0 15 2 8 0 16 0 17 2
                                                   8 0 7 0 19 1 8 0 20 21 2 7 0
                                                   0 0 23 1 7 0 0 25 1 6 10 0
                                                   26 2 7 0 6 0 27 2 30 29 29
                                                   29 31 2 33 0 32 29 34 2 7 0
                                                   0 6 35 2 0 8 8 6 36 1 7 10 0
                                                   37 2 39 8 38 29 40 2 0 8 7
                                                   29 41 1 33 10 0 42 1 33 29 0
                                                   43 2 29 0 0 44 45 0 6 0 46 0
                                                   44 0 47 2 44 0 0 0 48 1 33 0
                                                   0 49 0 50 0 51 0 52 0 53 2
                                                   52 0 8 0 54 1 52 0 20 55 1
                                                   29 10 0 56 1 29 6 0 57 2 0 8
                                                   8 29 60 1 29 0 0 61 2 0 8 8
                                                   29 62 0 6 0 63 0 7 0 64 2 6
                                                   0 0 0 65 2 29 0 66 6 67 3 69
                                                   8 7 68 8 70 2 0 8 8 6 71 0
                                                   72 0 73 2 72 10 0 0 74 2 7
                                                   10 0 0 75 2 76 0 7 0 77 0 72
                                                   0 78 2 72 0 0 0 79 0 80 0 81
                                                   0 44 0 82 2 44 10 0 0 83 1
                                                   76 7 0 84 1 76 0 0 85 1 29
                                                   10 0 86 1 8 10 0 87 0 80 0
                                                   88 1 72 0 0 89 2 92 0 91 72
                                                   93 2 6 0 0 0 96 1 8 0 0 99 2
                                                   102 29 101 92 103 1 52 10 0
                                                   105 1 52 8 0 106 1 52 0 0
                                                   107 1 72 10 0 108 2 72 0 0 0
                                                   109 2 8 0 0 44 110 2 72 10 0
                                                   0 112 2 8 0 0 0 113 2 116 0
                                                   72 72 117 1 6 0 116 118 2 0
                                                   8 7 8 119 2 0 8 7 120 121 1
                                                   0 92 72 95 3 0 8 72 72 8 111
                                                   2 0 8 7 72 114 2 0 8 29 8 98
                                                   2 2 8 8 29 62 2 1 8 7 120
                                                   121 3 0 8 72 72 8 115 2 1 8
                                                   7 8 119 1 0 92 72 94 1 0 29
                                                   6 97 2 0 8 101 8 104 2 2 8 8
                                                   6 71 1 0 8 8 100 2 2 8 8 29
                                                   60 1 0 8 7 58 1 0 8 52 59 1
                                                   0 8 8 22 2 0 8 8 8 24 2 0 8
                                                   8 8 18 2 0 8 29 8 90 2 0 8 6
                                                   8 28 2 2 8 7 29 41 2 2 8 8 6
                                                   36)))))
           '|lookupComplete|)) 
