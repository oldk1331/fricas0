
(SDEFUN |SCNP;namedPoints;LL%;1|
        ((|ptin| (|List| PT)) (|nmin| (|List| (|String|))) (% (%)))
        (CONS 0 (CONS |ptin| |nmin|))) 

(SDEFUN |SCNP;namedPoints;LL%;2|
        ((|scin| (|List| (|Scene| PT))) (|nmin| (|List| (|String|))) (% (%)))
        (CONS 1 (CONS |scin| |nmin|))) 

(SDEFUN |SCNP;namedBranch;LL%;3|
        ((|chin| (|List| %)) (|nmin| (|List| (|String|))) (% (%)))
        (CONS 2 (CONS |chin| |nmin|))) 

(MAKEPROP '|SCNP;isPointLeaf?;%B;4| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 0))) 

(SDEFUN |SCNP;isPointLeaf?;%B;4| ((|n| (%)) (% (|Boolean|))) (QEQCAR |n| 0)) 

(MAKEPROP '|SCNP;isNodeLeaf?;%B;5| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 1))) 

(SDEFUN |SCNP;isNodeLeaf?;%B;5| ((|n| (%)) (% (|Boolean|))) (QEQCAR |n| 1)) 

(MAKEPROP '|SCNP;isNodeBranch?;%B;6| '|SPADreplace|
          '(XLAM (|n|) (QEQCAR |n| 2))) 

(SDEFUN |SCNP;isNodeBranch?;%B;6| ((|n| (%)) (% (|Boolean|))) (QEQCAR |n| 2)) 

(SDEFUN |SCNP;getNames;%L;7| ((|n| (%)) (% (|List| (|String|))))
        (SPROG ((#1=#:G43 NIL) (#2=#:G23 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 0)
                    (PROGN (LETT #1# (QCDR (CDR |n|))) (GO #3=#:G42))))
                  (EXIT
                   (QCDR
                    (PROG2 (LETT #2# |n|)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 2)
                                      (|Record| (|:| |ch| (|List| %))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT % 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT % 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| %))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #2#))))))
                #3# (EXIT #1#)))) 

(SDEFUN |SCNP;findPoint;%SPT;8| ((|n| (%)) (|ptName| (|String|)) (% (PT)))
        (SPROG
         ((#1=#:G23 NIL) (|c| (|List| %)) (|fst| (%)) (|sNum| NIL)
          (#2=#:G55 NIL) (|s| (|String|)) (#3=#:G21 NIL) (#4=#:G54 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |n| (QREFELT % 18))
              (SEQ
               (LETT |c|
                     (QCAR
                      (PROG2 (LETT #1# |n|)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 2)
                                        (|Record| (|:| |ch| (|List| %))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))
                                        (|Union|
                                         (|:| |pt|
                                              (|Record|
                                               (|:| |listPT|
                                                    (|List| (QREFELT % 6)))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |nd|
                                              (|Record|
                                               (|:| |listND|
                                                    (|List|
                                                     (|Scene| (QREFELT % 6))))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |br|
                                              (|Record| (|:| |ch| (|List| %))
                                                        (|:| |listHNM|
                                                             (|List|
                                                              (|String|))))))
                                        #1#))))
               (COND
                ((SPADCALL |c| NIL (QREFELT % 21))
                 (PROGN
                  (LETT #4# (SPADCALL 0 0 (QREFELT % 23)))
                  (GO #5=#:G53))))
               (LETT |fst| (SPADCALL |c| (QREFELT % 24)))
               (COND
                ((SPADCALL |fst| (QREFELT % 17))
                 (PROGN (LETT #4# (SPADCALL 0 0 (QREFELT % 23))) (GO #5#))))
               (EXIT
                (PROGN
                 (LETT #4# (SPADCALL |fst| |ptName| (QREFELT % 26)))
                 (GO #5#))))))
            (SEQ (LETT |sNum| 1)
                 (LETT #2#
                       (LENGTH
                        (QCDR
                         (PROG2 (LETT #3# |n|)
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 0)
                                           (|Record|
                                            (|:| |listPT|
                                                 (|List| (QREFELT % 6)))
                                            (|:| |listNM| (|List| (|String|))))
                                           (|Union|
                                            (|:| |pt|
                                                 (|Record|
                                                  (|:| |listPT|
                                                       (|List| (QREFELT % 6)))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |nd|
                                                 (|Record|
                                                  (|:| |listND|
                                                       (|List|
                                                        (|Scene|
                                                         (QREFELT % 6))))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |br|
                                                 (|Record|
                                                  (|:| |ch| (|List| %))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                           #3#)))))
                 G190 (COND ((|greater_SI| |sNum| #2#) (GO G191)))
                 (SEQ
                  (LETT |s|
                        (SPADCALL
                         (QCDR
                          (PROG2 (LETT #3# |n|)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0)
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT % 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|))))
                                            (|Union|
                                             (|:| |pt|
                                                  (|Record|
                                                   (|:| |listPT|
                                                        (|List| (QREFELT % 6)))
                                                   (|:| |listNM|
                                                        (|List| (|String|)))))
                                             (|:| |nd|
                                                  (|Record|
                                                   (|:| |listND|
                                                        (|List|
                                                         (|Scene|
                                                          (QREFELT % 6))))
                                                   (|:| |listNM|
                                                        (|List| (|String|)))))
                                             (|:| |br|
                                                  (|Record|
                                                   (|:| |ch| (|List| %))
                                                   (|:| |listHNM|
                                                        (|List| (|String|))))))
                                            #3#)))
                         |sNum| (QREFELT % 27)))
                  (EXIT
                   (COND
                    ((EQUAL |s| |ptName|)
                     (PROGN
                      (LETT #4#
                            (SPADCALL
                             (QCAR
                              (PROG2 (LETT #3# |n|)
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0)
                                                (|Record|
                                                 (|:| |listPT|
                                                      (|List| (QREFELT % 6)))
                                                 (|:| |listNM|
                                                      (|List| (|String|))))
                                                (|Union|
                                                 (|:| |pt|
                                                      (|Record|
                                                       (|:| |listPT|
                                                            (|List|
                                                             (QREFELT % 6)))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |nd|
                                                      (|Record|
                                                       (|:| |listND|
                                                            (|List|
                                                             (|Scene|
                                                              (QREFELT % 6))))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |br|
                                                      (|Record|
                                                       (|:| |ch| (|List| %))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                                #3#)))
                             |sNum| (QREFELT % 28)))
                      (GO #5#))))))
                 (LETT |sNum| (|inc_SI| |sNum|)) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL 0 0 (QREFELT % 23)))))
          #5# (EXIT #4#)))) 

(SDEFUN |SCNP;addPoints!;%S2%;9|
        ((|n| (%)) (|ptName| (|String|)) (|pts| (%)) (% (%)))
        (SPROG ((#1=#:G23 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |n| (QREFELT % 18)))
                  (|error| "can only add points to branch")))
                (PROGN
                 (RPLACA
                  #2=(PROG2 (LETT #1# |n|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 2)
                                       (|Record| (|:| |ch| (|List| %))
                                                 (|:| |listHNM|
                                                      (|List| (|String|))))
                                       (|Union|
                                        (|:| |pt|
                                             (|Record|
                                              (|:| |listPT|
                                                   (|List| (QREFELT % 6)))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |nd|
                                             (|Record|
                                              (|:| |listND|
                                                   (|List|
                                                    (|Scene| (QREFELT % 6))))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |br|
                                             (|Record| (|:| |ch| (|List| %))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                       #1#))
                  (SPADCALL
                   (QCAR
                    (PROG2 (LETT #1# |n|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 2)
                                      (|Record| (|:| |ch| (|List| %))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT % 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT % 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| %))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #1#)))
                   |pts| (QREFELT % 29)))
                 (QCAR #2#))
                (PROGN
                 (RPLACD
                  #3=(PROG2 (LETT #1# |n|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 2)
                                       (|Record| (|:| |ch| (|List| %))
                                                 (|:| |listHNM|
                                                      (|List| (|String|))))
                                       (|Union|
                                        (|:| |pt|
                                             (|Record|
                                              (|:| |listPT|
                                                   (|List| (QREFELT % 6)))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |nd|
                                             (|Record|
                                              (|:| |listND|
                                                   (|List|
                                                    (|Scene| (QREFELT % 6))))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |br|
                                             (|Record| (|:| |ch| (|List| %))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                       #1#))
                  (SPADCALL
                   (QCDR
                    (PROG2 (LETT #1# |n|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 2)
                                      (|Record| (|:| |ch| (|List| %))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT % 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT % 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| %))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #1#)))
                   |ptName| (QREFELT % 30)))
                 (QCDR #3#))
                (EXIT |pts|)))) 

(SDEFUN |SCNP;addNode!;%SS%;10|
        ((|n| (%)) (|ptName| (|String|)) (|sc| (|Scene| PT)) (% (%)))
        (SPROG
         ((|scnd| (%)) (|c| (|List| %)) (|fst| (%)) (#1=#:G23 NIL)
          (#2=#:G66 NIL) (#3=#:G22 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (SPADCALL |n| (QREFELT % 17)))
              (SEQ
               (COND
                ((SPADCALL |n| (QREFELT % 16))
                 (|error| "cannot mix def and named points")))
               (LETT |scnd|
                     (SPADCALL (LIST |sc|) (LIST |ptName|) (QREFELT % 12)))
               (LETT |c|
                     (QCAR
                      (PROG2 (LETT #1# |n|)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 2)
                                        (|Record| (|:| |ch| (|List| %))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))
                                        (|Union|
                                         (|:| |pt|
                                              (|Record|
                                               (|:| |listPT|
                                                    (|List| (QREFELT % 6)))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |nd|
                                              (|Record|
                                               (|:| |listND|
                                                    (|List|
                                                     (|Scene| (QREFELT % 6))))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |br|
                                              (|Record| (|:| |ch| (|List| %))
                                                        (|:| |listHNM|
                                                             (|List|
                                                              (|String|))))))
                                        #1#))))
               (COND
                ((SPADCALL |c| NIL (QREFELT % 21))
                 (SEQ
                  (PROGN
                   (RPLACA
                    #4=(PROG2 (LETT #1# |n|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 2)
                                         (|Record| (|:| |ch| (|List| %))
                                                   (|:| |listHNM|
                                                        (|List| (|String|))))
                                         (|Union|
                                          (|:| |pt|
                                               (|Record|
                                                (|:| |listPT|
                                                     (|List| (QREFELT % 6)))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |nd|
                                               (|Record|
                                                (|:| |listND|
                                                     (|List|
                                                      (|Scene| (QREFELT % 6))))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |br|
                                               (|Record| (|:| |ch| (|List| %))
                                                         (|:| |listHNM|
                                                              (|List|
                                                               (|String|))))))
                                         #1#))
                    (LIST |scnd|))
                   (QCAR #4#))
                  (PROGN
                   (RPLACD
                    #5=(PROG2 (LETT #1# |n|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 2)
                                         (|Record| (|:| |ch| (|List| %))
                                                   (|:| |listHNM|
                                                        (|List| (|String|))))
                                         (|Union|
                                          (|:| |pt|
                                               (|Record|
                                                (|:| |listPT|
                                                     (|List| (QREFELT % 6)))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |nd|
                                               (|Record|
                                                (|:| |listND|
                                                     (|List|
                                                      (|Scene| (QREFELT % 6))))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |br|
                                               (|Record| (|:| |ch| (|List| %))
                                                         (|:| |listHNM|
                                                              (|List|
                                                               (|String|))))))
                                         #1#))
                    (LIST "useNames"))
                   (QCDR #5#))
                  (EXIT (PROGN (LETT #2# |scnd|) (GO #6=#:G65))))))
               (LETT |fst| (SPADCALL |c| (QREFELT % 24)))
               (COND
                ((SPADCALL |fst| (QREFELT % 17))
                 (PROGN
                  (LETT #2# (SPADCALL |fst| |ptName| |sc| (QREFELT % 33)))
                  (GO #6#))))
               (PROGN
                (RPLACA
                 #7=(PROG2 (LETT #1# |n|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 2)
                                      (|Record| (|:| |ch| (|List| %))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT % 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT % 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| %))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #1#))
                 (SPADCALL |c| |scnd| (QREFELT % 29)))
                (QCAR #7#))
               (PROGN
                (RPLACD
                 #8=(PROG2 (LETT #1# |n|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 2)
                                      (|Record| (|:| |ch| (|List| %))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT % 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT % 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| %))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #1#))
                 (SPADCALL
                  (QCDR
                   (PROG2 (LETT #1# |n|)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 2)
                                     (|Record| (|:| |ch| (|List| %))
                                               (|:| |listHNM|
                                                    (|List| (|String|))))
                                     (|Union|
                                      (|:| |pt|
                                           (|Record|
                                            (|:| |listPT|
                                                 (|List| (QREFELT % 6)))
                                            (|:| |listNM|
                                                 (|List| (|String|)))))
                                      (|:| |nd|
                                           (|Record|
                                            (|:| |listND|
                                                 (|List|
                                                  (|Scene| (QREFELT % 6))))
                                            (|:| |listNM|
                                                 (|List| (|String|)))))
                                      (|:| |br|
                                           (|Record| (|:| |ch| (|List| %))
                                                     (|:| |listHNM|
                                                          (|List|
                                                           (|String|))))))
                                     #1#)))
                  "useNames" (QREFELT % 30)))
                (QCDR #8#))
               (EXIT (PROGN (LETT #2# |scnd|) (GO #6#))))))
            (PROGN
             (RPLACA
              #9=(PROG2 (LETT #3# |n|)
                     (QCDR #3#)
                   (|check_union2| (QEQCAR #3# 1)
                                   (|Record|
                                    (|:| |listND|
                                         (|List| (|Scene| (QREFELT % 6))))
                                    (|:| |listNM| (|List| (|String|))))
                                   (|Union|
                                    (|:| |pt|
                                         (|Record|
                                          (|:| |listPT| (|List| (QREFELT % 6)))
                                          (|:| |listNM| (|List| (|String|)))))
                                    (|:| |nd|
                                         (|Record|
                                          (|:| |listND|
                                               (|List|
                                                (|Scene| (QREFELT % 6))))
                                          (|:| |listNM| (|List| (|String|)))))
                                    (|:| |br|
                                         (|Record| (|:| |ch| (|List| %))
                                                   (|:| |listHNM|
                                                        (|List| (|String|))))))
                                   #3#))
              (SPADCALL
               (QCAR
                (PROG2 (LETT #3# |n|)
                    (QCDR #3#)
                  (|check_union2| (QEQCAR #3# 1)
                                  (|Record|
                                   (|:| |listND|
                                        (|List| (|Scene| (QREFELT % 6))))
                                   (|:| |listNM| (|List| (|String|))))
                                  (|Union|
                                   (|:| |pt|
                                        (|Record|
                                         (|:| |listPT| (|List| (QREFELT % 6)))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |nd|
                                        (|Record|
                                         (|:| |listND|
                                              (|List| (|Scene| (QREFELT % 6))))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |br|
                                        (|Record| (|:| |ch| (|List| %))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                  #3#)))
               |sc| (QREFELT % 34)))
             (QCAR #9#))
            (PROGN
             (RPLACD
              #10=(PROG2 (LETT #3# |n|)
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 1)
                                    (|Record|
                                     (|:| |listND|
                                          (|List| (|Scene| (QREFELT % 6))))
                                     (|:| |listNM| (|List| (|String|))))
                                    (|Union|
                                     (|:| |pt|
                                          (|Record|
                                           (|:| |listPT|
                                                (|List| (QREFELT % 6)))
                                           (|:| |listNM| (|List| (|String|)))))
                                     (|:| |nd|
                                          (|Record|
                                           (|:| |listND|
                                                (|List|
                                                 (|Scene| (QREFELT % 6))))
                                           (|:| |listNM| (|List| (|String|)))))
                                     (|:| |br|
                                          (|Record| (|:| |ch| (|List| %))
                                                    (|:| |listHNM|
                                                         (|List|
                                                          (|String|))))))
                                    #3#))
              (SPADCALL
               (QCDR
                (PROG2 (LETT #3# |n|)
                    (QCDR #3#)
                  (|check_union2| (QEQCAR #3# 1)
                                  (|Record|
                                   (|:| |listND|
                                        (|List| (|Scene| (QREFELT % 6))))
                                   (|:| |listNM| (|List| (|String|))))
                                  (|Union|
                                   (|:| |pt|
                                        (|Record|
                                         (|:| |listPT| (|List| (QREFELT % 6)))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |nd|
                                        (|Record|
                                         (|:| |listND|
                                              (|List| (|Scene| (QREFELT % 6))))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |br|
                                        (|Record| (|:| |ch| (|List| %))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                  #3#)))
               |ptName| (QREFELT % 30)))
             (QCDR #10#))
            (EXIT |n|)))
          #6# (EXIT #2#)))) 

(SDEFUN |SCNP;findNode;%SS;11|
        ((|n| (%)) (|ptName| (|String|)) (% (|Scene| PT)))
        (SPROG
         ((#1=#:G23 NIL) (|c| (|List| %)) (|fst| (%)) (|namei| NIL)
          (#2=#:G76 NIL) (|name| NIL) (#3=#:G75 NIL) (#4=#:G22 NIL)
          (#5=#:G74 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (SPADCALL |n| (QREFELT % 17)))
              (SEQ
               (COND
                ((SPADCALL |n| (QREFELT % 16))
                 (|error| "cannot mix def and named points")))
               (LETT |c|
                     (QCAR
                      (PROG2 (LETT #1# |n|)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 2)
                                        (|Record| (|:| |ch| (|List| %))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))
                                        (|Union|
                                         (|:| |pt|
                                              (|Record|
                                               (|:| |listPT|
                                                    (|List| (QREFELT % 6)))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |nd|
                                              (|Record|
                                               (|:| |listND|
                                                    (|List|
                                                     (|Scene| (QREFELT % 6))))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |br|
                                              (|Record| (|:| |ch| (|List| %))
                                                        (|:| |listHNM|
                                                             (|List|
                                                              (|String|))))))
                                        #1#))))
               (COND
                ((SPADCALL |c| NIL (QREFELT % 21))
                 (|error| "findNode - cant find")))
               (LETT |fst| (SPADCALL |c| (QREFELT % 24)))
               (EXIT
                (COND
                 ((SPADCALL |fst| (QREFELT % 17))
                  (PROGN
                   (LETT #5# (SPADCALL |fst| |ptName| (QREFELT % 35)))
                   (GO #6=#:G73))))))))
            (SEQ (LETT |namei| 1)
                 (LETT #2#
                       (LENGTH
                        (QCDR
                         (PROG2 (LETT #4# |n|)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 1)
                                           (|Record|
                                            (|:| |listND|
                                                 (|List|
                                                  (|Scene| (QREFELT % 6))))
                                            (|:| |listNM| (|List| (|String|))))
                                           (|Union|
                                            (|:| |pt|
                                                 (|Record|
                                                  (|:| |listPT|
                                                       (|List| (QREFELT % 6)))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |nd|
                                                 (|Record|
                                                  (|:| |listND|
                                                       (|List|
                                                        (|Scene|
                                                         (QREFELT % 6))))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |br|
                                                 (|Record|
                                                  (|:| |ch| (|List| %))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                           #4#)))))
                 (LETT |name| NIL)
                 (LETT #3#
                       (QCDR
                        (PROG2 (LETT #4# |n|)
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 1)
                                          (|Record|
                                           (|:| |listND|
                                                (|List|
                                                 (|Scene| (QREFELT % 6))))
                                           (|:| |listNM| (|List| (|String|))))
                                          (|Union|
                                           (|:| |pt|
                                                (|Record|
                                                 (|:| |listPT|
                                                      (|List| (QREFELT % 6)))
                                                 (|:| |listNM|
                                                      (|List| (|String|)))))
                                           (|:| |nd|
                                                (|Record|
                                                 (|:| |listND|
                                                      (|List|
                                                       (|Scene|
                                                        (QREFELT % 6))))
                                                 (|:| |listNM|
                                                      (|List| (|String|)))))
                                           (|:| |br|
                                                (|Record| (|:| |ch| (|List| %))
                                                          (|:| |listHNM|
                                                               (|List|
                                                                (|String|))))))
                                          #4#))))
                 G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |name| (CAR #3#)) NIL)
                       (|greater_SI| |namei| #2#))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |name| |ptName|)
                     (PROGN
                      (LETT #5#
                            (SPADCALL
                             (QCAR
                              (PROG2 (LETT #4# |n|)
                                  (QCDR #4#)
                                (|check_union2| (QEQCAR #4# 1)
                                                (|Record|
                                                 (|:| |listND|
                                                      (|List|
                                                       (|Scene|
                                                        (QREFELT % 6))))
                                                 (|:| |listNM|
                                                      (|List| (|String|))))
                                                (|Union|
                                                 (|:| |pt|
                                                      (|Record|
                                                       (|:| |listPT|
                                                            (|List|
                                                             (QREFELT % 6)))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |nd|
                                                      (|Record|
                                                       (|:| |listND|
                                                            (|List|
                                                             (|Scene|
                                                              (QREFELT % 6))))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |br|
                                                      (|Record|
                                                       (|:| |ch| (|List| %))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                                #4#)))
                             |namei| (QREFELT % 36)))
                      (GO #6#))))))
                 (LETT #3# (PROG1 (CDR #3#) (LETT |namei| (|inc_SI| |namei|))))
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "findNode - cant find"))))
          #6# (EXIT #5#)))) 

(SDEFUN |SCNP;toString;%S;12| ((|n| (%)) (% (|String|)))
        (SPROG
         ((#1=#:G96 NIL) (#2=#:G95 NIL) (|lenNM| (|NonNegativeInteger|))
          (|lenPT| (|NonNegativeInteger|)) (#3=#:G94 NIL) (#4=#:G98 NIL)
          (|lst| NIL) (#5=#:G97 NIL) (|ptr| NIL) (#6=#:G100 NIL) (|l1| NIL)
          (#7=#:G99 NIL) (|s| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "")
                (COND
                 ((QEQCAR |n| 0)
                  (SEQ (LETT |s| "pt:")
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))))
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))))
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT % 38))
                         (PROGN
                          (LETT #3#
                                (SPADCALL
                                 (LIST "string number:" (STRINGIMAGE |lenNM|)
                                       " ~= point number:"
                                       (STRINGIMAGE |lenPT|))
                                 (QREFELT % 39)))
                          (GO #8=#:G93))))
                       (EXIT
                        (SEQ (LETT |ptr| 1)
                             (LETT #1# (LENGTH (QCDR (CDR |n|))))
                             (LETT |lst| NIL) (LETT #2# (QCDR (CDR |n|))) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |lst| (CAR #2#)) NIL)
                                   (|greater_SI| |ptr| #1#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s| |lst| ":"
                                              (|mathObject2String|
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 28))))
                                        (QREFELT % 39)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| "," |lst| ":"
                                              (|mathObject2String|
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 28))))
                                        (QREFELT % 39)))))))
                             (LETT #2#
                                   (PROG1 (CDR #2#)
                                     (LETT |ptr| (|inc_SI| |ptr|))))
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 1)
                  (SEQ (LETT |s| "nd:")
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))))
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))))
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT % 38))
                         (PROGN
                          (LETT #3#
                                (SPADCALL
                                 (LIST "string number:" (STRINGIMAGE |lenNM|)
                                       " ~= point number:"
                                       (STRINGIMAGE |lenPT|))
                                 (QREFELT % 39)))
                          (GO #8#))))
                       (EXIT
                        (SEQ (LETT |ptr| 1)
                             (LETT #4# (LENGTH (QCDR (CDR |n|))))
                             (LETT |lst| NIL) (LETT #5# (QCDR (CDR |n|))) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |lst| (CAR #5#)) NIL)
                                   (|greater_SI| |ptr| #4#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL (LIST |s| |lst|)
                                                 (QREFELT % 39)))
                                      ('T
                                       (SPADCALL (LIST |s| "," |lst|)
                                                 (QREFELT % 39)))))))
                             (LETT #5#
                                   (PROG1 (CDR #5#)
                                     (LETT |ptr| (|inc_SI| |ptr|))))
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 2)
                  (SEQ (LETT |s| "br:")
                       (EXIT
                        (SEQ (LETT |ptr| 1)
                             (LETT #6# (LENGTH (QCDR (CDR |n|))))
                             (LETT |l1| NIL) (LETT #7# (QCDR (CDR |n|))) G190
                             (COND
                              ((OR (ATOM #7#) (PROGN (LETT |l1| (CAR #7#)) NIL)
                                   (|greater_SI| |ptr| #6#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s| |l1| "("
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 40))
                                               (QREFELT % 41))
                                              ")")
                                        (QREFELT % 39)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| "," |l1| "("
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 40))
                                               (QREFELT % 41))
                                              ")")
                                        (QREFELT % 39)))))))
                             (LETT #7#
                                   (PROG1 (CDR #7#)
                                     (LETT |ptr| (|inc_SI| |ptr|))))
                             (GO G190) G191 (EXIT NIL))))))
                (EXIT |s|)))
          #8# (EXIT #3#)))) 

(MAKEPROP '|SCNP;hash| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SCNP;hash| ((|s| (%)) (% (|SingleInteger|))) 0) 

(SDEFUN |SCNP;=;2%B;14| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G113 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |x| 0)
                    (COND
                     ((QEQCAR |y| 0)
                      (COND
                       ((SPADCALL (QCAR (CDR |x|)) (QCAR (CDR |y|))
                                  (QREFELT % 42))
                        (COND
                         ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|))
                                    (QREFELT % 43))
                          (PROGN (LETT #1# 'T) (GO #2=#:G112))))))))))
                  (COND
                   ((QEQCAR |x| 1)
                    (COND
                     ((QEQCAR |y| 1)
                      (COND
                       ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|))
                                  (QREFELT % 43))
                        (PROGN (LETT #1# 'T) (GO #2#))))))))
                  (COND
                   ((QEQCAR |x| 2)
                    (COND
                     ((QEQCAR |y| 2)
                      (COND
                       ((SPADCALL (QCAR (CDR |x|)) (QCAR (CDR |y|))
                                  (QREFELT % 21))
                        (COND
                         ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|))
                                    (QREFELT % 43))
                          (PROGN (LETT #1# 'T) (GO #2#))))))))))
                  (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |SCNP;~=;2%B;15| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (NULL (SPADCALL |x| |y| (QREFELT % 44)))) 

(SDEFUN |SCNP;coerce;%Of;16| ((|n| (%)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G134 NIL) (#2=#:G133 NIL) (|lenNM| (|NonNegativeInteger|))
          (|lenPT| (|NonNegativeInteger|)) (#3=#:G132 NIL) (#4=#:G136 NIL)
          (|lst| NIL) (#5=#:G135 NIL) (|ptr| NIL) (#6=#:G138 NIL) (|l1| NIL)
          (#7=#:G137 NIL) (|s| (|OutputForm|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| (SPADCALL "" (QREFELT % 47)))
                (COND
                 ((QEQCAR |n| 0)
                  (SEQ (LETT |s| (SPADCALL "pt:" (QREFELT % 47)))
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))))
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))))
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT % 38))
                         (PROGN
                          (LETT #3#
                                (SPADCALL
                                 (LIST
                                  (SPADCALL "string number:" (QREFELT % 47))
                                  (SPADCALL |lenNM| (QREFELT % 48))
                                  (SPADCALL " ~= point number:" (QREFELT % 47))
                                  (SPADCALL |lenPT| (QREFELT % 48)))
                                 (QREFELT % 49)))
                          (GO #8=#:G131))))
                       (EXIT
                        (SEQ (LETT |ptr| 1)
                             (LETT #1# (LENGTH (QCDR (CDR |n|))))
                             (LETT |lst| NIL) (LETT #2# (QCDR (CDR |n|))) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |lst| (CAR #2#)) NIL)
                                   (|greater_SI| |ptr| #1#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s|
                                              (SPADCALL |lst| (QREFELT % 50))
                                              (SPADCALL ":" (QREFELT % 47))
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 28))
                                               (QREFELT % 51)))
                                        (QREFELT % 49)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| (SPADCALL "," (QREFELT % 47))
                                              (SPADCALL |lst| (QREFELT % 50))
                                              (SPADCALL ":" (QREFELT % 47))
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 28))
                                               (QREFELT % 51)))
                                        (QREFELT % 49)))))))
                             (LETT #2#
                                   (PROG1 (CDR #2#)
                                     (LETT |ptr| (|inc_SI| |ptr|))))
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 1)
                  (SEQ (LETT |s| (SPADCALL "nd:" (QREFELT % 47)))
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))))
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))))
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT % 38))
                         (PROGN
                          (LETT #3#
                                (SPADCALL
                                 (LIST
                                  (SPADCALL "string number:" (QREFELT % 47))
                                  (SPADCALL |lenNM| (QREFELT % 48))
                                  (SPADCALL " ~= point number:" (QREFELT % 47))
                                  (SPADCALL |lenPT| (QREFELT % 48)))
                                 (QREFELT % 49)))
                          (GO #8#))))
                       (EXIT
                        (SEQ (LETT |ptr| 1)
                             (LETT #4# (LENGTH (QCDR (CDR |n|))))
                             (LETT |lst| NIL) (LETT #5# (QCDR (CDR |n|))) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |lst| (CAR #5#)) NIL)
                                   (|greater_SI| |ptr| #4#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s|
                                              (SPADCALL |lst| (QREFELT % 50)))
                                        (QREFELT % 49)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| (SPADCALL "," (QREFELT % 47))
                                              (SPADCALL |lst| (QREFELT % 50)))
                                        (QREFELT % 49)))))))
                             (LETT #5#
                                   (PROG1 (CDR #5#)
                                     (LETT |ptr| (|inc_SI| |ptr|))))
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 2)
                  (SEQ (LETT |s| (SPADCALL "br:" (QREFELT % 47)))
                       (EXIT
                        (SEQ (LETT |ptr| 1)
                             (LETT #6# (LENGTH (QCDR (CDR |n|))))
                             (LETT |l1| NIL) (LETT #7# (QCDR (CDR |n|))) G190
                             (COND
                              ((OR (ATOM #7#) (PROGN (LETT |l1| (CAR #7#)) NIL)
                                   (|greater_SI| |ptr| #6#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s|
                                              (SPADCALL |l1| (QREFELT % 50))
                                              (SPADCALL "(" (QREFELT % 47))
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 40))
                                               (QREFELT % 52))
                                              (SPADCALL ")" (QREFELT % 47)))
                                        (QREFELT % 49)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| (SPADCALL "," (QREFELT % 47))
                                              (SPADCALL |l1| (QREFELT % 50))
                                              (SPADCALL "(" (QREFELT % 47))
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT % 40))
                                               (QREFELT % 52))
                                              (SPADCALL ")" (QREFELT % 47)))
                                        (QREFELT % 49)))))))
                             (LETT #7#
                                   (PROG1 (CDR #7#)
                                     (LETT |ptr| (|inc_SI| |ptr|))))
                             (GO G190) G191 (EXIT NIL))))))
                (EXIT |s|)))
          #8# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |SceneNamedPoints;|)) 

(DEFUN |SceneNamedPoints;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SceneNamedPoints| DV$1))
          (LETT % (GETREFV 53))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SceneNamedPoints| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Union|
                     (|:| |pt|
                          (|Record| (|:| |listPT| (|List| |#1|))
                                    (|:| |listNM| (|List| (|String|)))))
                     (|:| |nd|
                          (|Record| (|:| |listND| (|List| (|Scene| |#1|)))
                                    (|:| |listNM| (|List| (|String|)))))
                     (|:| |br|
                          (|Record| (|:| |ch| (|List| %))
                                    (|:| |listHNM| (|List| (|String|)))))))
          %))) 

(DEFUN |SceneNamedPoints| (#1=#:G139)
  (SPROG NIL
         (PROG (#2=#:G140)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SceneNamedPoints|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SceneNamedPoints;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SceneNamedPoints|)))))))))) 

(MAKEPROP '|SceneNamedPoints| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| 25) |SCNP;namedPoints;LL%;1| (|List| 32)
              |SCNP;namedPoints;LL%;2| (|List| %) |SCNP;namedBranch;LL%;3|
              (|Boolean|) |SCNP;isPointLeaf?;%B;4| |SCNP;isNodeLeaf?;%B;5|
              |SCNP;isNodeBranch?;%B;6| |SCNP;getNames;%L;7| (|List| $$)
              (0 . =) (|Integer|) (6 . |sipnt|) (12 . |first|) (|String|)
              |SCNP;findPoint;%SPT;8| (17 . |elt|) (23 . |elt|) (29 . |concat|)
              (35 . |concat|) |SCNP;addPoints!;%S2%;9| (|Scene| 6)
              |SCNP;addNode!;%SS%;10| (41 . |concat|) |SCNP;findNode;%SS;11|
              (47 . |elt|) (|NonNegativeInteger|) (53 . ~=) (59 . |concat|)
              (64 . |elt|) |SCNP;toString;%S;12| (70 . =) (76 . =)
              |SCNP;=;2%B;14| |SCNP;~=;2%B;15| (|OutputForm|) (82 . |message|)
              (87 . |coerce|) (92 . |hconcat|) (97 . |coerce|) (102 . |coerce|)
              |SCNP;coerce;%Of;16|)
           '#(~= 107 |toString| 113 |namedPoints| 118 |namedBranch| 130 |latex|
              136 |isPointLeaf?| 141 |isNodeLeaf?| 146 |isNodeBranch?| 151
              |getNames| 156 |findPoint| 161 |findNode| 167 |coerce| 173
              |addPoints!| 178 |addNode!| 185 = 192)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 46) (|BasicType|))
                        (|makeByteWordVec2| 52
                                            '(2 20 15 0 0 21 2 6 0 22 22 23 1
                                              20 2 0 24 2 9 25 0 22 27 2 8 6 0
                                              22 28 2 20 0 0 2 29 2 9 0 0 25 30
                                              2 11 0 0 32 34 2 11 32 0 22 36 2
                                              37 15 0 0 38 1 25 0 13 39 2 20 2
                                              0 22 40 2 8 15 0 0 42 2 9 15 0 0
                                              43 1 46 0 25 47 1 37 46 0 48 1 46
                                              0 13 49 1 25 46 0 50 1 6 46 0 51
                                              2 0 15 0 0 45 1 0 25 0 41 2 0 0
                                              11 9 12 2 0 0 8 9 10 2 0 0 13 9
                                              14 1 0 25 0 1 1 0 15 0 16 1 0 15
                                              0 17 1 0 15 0 18 1 0 9 0 19 2 0 6
                                              0 25 26 2 0 32 0 25 35 1 0 46 0
                                              52 3 0 0 0 25 0 31 3 0 0 0 25 32
                                              33 2 0 15 0 0 44)))))
           '|lookupComplete|)) 
