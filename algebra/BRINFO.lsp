
(MAKEPROP '|BRINFO;sublis_formal;L2Se;1| '|SPADreplace| '|sublisFormal|) 

(SDEFUN |BRINFO;sublis_formal;L2Se;1|
        ((|args| (|List| (|SExpression|))) (|expr| (|SExpression|))
         (% (|SExpression|)))
        (|sublisFormal| |args| |expr|)) 

(SDEFUN |BRINFO;is_symbol?|
        ((|se| (|SExpression|)) (|sym| (|Symbol|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |se| (QREFELT % 10))
          (EQUAL (SPADCALL |se| (QREFELT % 12)) |sym|))
         ('T NIL))) 

(SDEFUN |BRINFO;try_eval|
        ((|pred| (|SExpression|))
         (|ancestors|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (% #1=(|SExpression|)))
        (SPROG
         ((|op| (|SExpression|)) (|args| (|List| (|SExpression|)))
          (#2=#:G132 NIL) (#3=#:G133 NIL) (#4=#:G134 NIL) (|arg| NIL)
          (#5=#:G135 NIL) (|v| #1#) (|nargs| (|List| #1#))
          (|av| (|SExpression|)))
         (SEQ
          (COND ((NULL (SPADCALL |pred| (QREFELT % 13))) |pred|)
                ('T
                 (SEQ (LETT |op| (SPADCALL |pred| (QREFELT % 14)))
                      (LETT |args|
                            (SPADCALL (SPADCALL |pred| (QREFELT % 15))
                                      (QREFELT % 17)))
                      (EXIT
                       (COND
                        ((|BRINFO;is_symbol?| |op| 'OR %)
                         (SEQ
                          (LETT |nargs|
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |arg| NIL) (LETT #3# |args|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN (LETT |arg| (CAR #3#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL
                                            (LETT |v|
                                                  (|BRINFO;try_eval| |arg|
                                                   |ancestors| %))
                                            (QREFELT % 18)))
                                          (LETT #2# (CONS |v| #2#))))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (EXIT
                           (COND ((NULL |nargs|) NIL)
                                 ((SPADCALL 'T |nargs| (QREFELT % 19)) 'T)
                                 ((EQL (LENGTH |nargs|) 1)
                                  (|SPADfirst| |nargs|))
                                 (#6='T
                                  (SPADCALL (CONS |op| |nargs|)
                                            (QREFELT % 20)))))))
                        ((|BRINFO;is_symbol?| |op| 'AND %)
                         (SEQ
                          (LETT |nargs|
                                (PROGN
                                 (LETT #4# NIL)
                                 (SEQ (LETT |arg| NIL) (LETT #5# |args|) G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN (LETT |arg| (CAR #5#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL
                                            (LETT |v|
                                                  (|BRINFO;try_eval| |arg|
                                                   |ancestors| %))
                                            'T (QREFELT % 21)))
                                          (LETT #4# (CONS |v| #4#))))))
                                      (LETT #5# (CDR #5#)) (GO G190) G191
                                      (EXIT (NREVERSE #4#)))))
                          (EXIT
                           (COND ((NULL |nargs|) 'T)
                                 ((SPADCALL NIL |nargs| (QREFELT % 19)) NIL)
                                 ((EQL (LENGTH |nargs|) 1)
                                  (|SPADfirst| |nargs|))
                                 (#6#
                                  (SPADCALL (CONS |op| |nargs|)
                                            (QREFELT % 20)))))))
                        (#6#
                         (SEQ
                          (COND
                           ((|BRINFO;is_symbol?| |op| '|has| %)
                            (COND
                             ((EQL (LENGTH |args|) 2)
                              (COND
                               ((|BRINFO;is_symbol?|
                                 (SPADCALL |args| 1 (QREFELT % 23)) '% %)
                                (EXIT
                                 (SEQ
                                  (LETT |av|
                                        (|assoc|
                                         (SPADCALL |args| 2 (QREFELT % 23))
                                         |ancestors|))
                                  (EXIT
                                   (COND ((SPADCALL |av| (QREFELT % 18)) NIL)
                                         ((SPADCALL
                                           (SPADCALL |av| (QREFELT % 15)) 'T
                                           (QREFELT % 21))
                                          'T)
                                         (#6# |pred|)))))))))))
                          (EXIT |pred|))))))))))) 

(SDEFUN |BRINFO;simp_pred|
        ((|pred| (|SExpression|))
         (|ancestors|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (% (|SExpression|)))
        (SPROG ((|npred| (|SExpression|)))
               (SEQ (LETT |npred| (|simpHasPred| |pred|))
                    (EXIT
                     (COND
                      ((OR (NULL |ancestors|)
                           (OR (SPADCALL |npred| (QREFELT % 18))
                               (SPADCALL |npred| 'T (QREFELT % 21))))
                       |npred|)
                      ('T (|BRINFO;try_eval| |npred| |ancestors| %))))))) 

(MAKEPROP '|BRINFO;constructor_signature;SSe;5| '|SPADreplace|
          '|getConstructorSignature|) 

(SDEFUN |BRINFO;constructor_signature;SSe;5|
        ((|conname| (|Symbol|)) (% (|SExpression|)))
        (|getConstructorSignature| |conname|)) 

(SDEFUN |BRINFO;constructor_signature;SLSe;6|
        ((|conname| (|Symbol|)) (|args| (|List| (|SExpression|)))
         (% (|SExpression|)))
        (SPROG ((|sig| (|SExpression|)))
               (SEQ (LETT |sig| (SPADCALL |conname| (QREFELT % 24)))
                    (EXIT
                     (COND
                      ((EQUAL (|get_database| |conname| 'CONSTRUCTORKIND)
                              '|category|)
                       (SUBLISLIS |args| |$TriangleVariableList| |sig|))
                      ('T (SPADCALL |args| |sig| (QREFELT % 8)))))))) 

(SDEFUN |BRINFO;downcase;2S;7| ((|s| (|String|)) (% (|String|)))
        (SPROG
         ((|res| (|String|)) (|shift| (|Integer|)) (|i| NIL) (#1=#:G150 NIL)
          (|c| (|Character|)))
         (SEQ
          (LETT |res|
                (|make_string_code| (QCSIZE |s|) (SPADCALL (QREFELT % 33))))
          (LETT |shift| (- (QREFELT % 26) (QREFELT % 27)))
          (SEQ (LETT |i| 1) (LETT #1# (QCSIZE |s|)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |c| (SPADCALL |s| |i| (QREFELT % 35)))
                    (EXIT
                     (SPADCALL |res| |i|
                               (SEQ
                                (COND
                                 ((SPADCALL |c| (QREFELT % 27) (QREFELT % 36))
                                  (COND
                                   ((SPADCALL |c| (QREFELT % 28)
                                              (QREFELT % 37))
                                    (EXIT
                                     (SPADCALL (+ |c| |shift|)
                                               (QREFELT % 38)))))))
                                (EXIT |c|))
                               (QREFELT % 39))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |BRINFO;is_error?| ((|se| (|SExpression|)) (% (|Boolean|)))
        (SPROG ((|l| (|List| (|SExpression|))) (|e1| (|SExpression|)))
               (SEQ
                (COND
                 ((SPADCALL |se| (QREFELT % 41))
                  (SEQ (LETT |l| (SPADCALL |se| (QREFELT % 17)))
                       (EXIT
                        (COND ((NULL |l|) NIL)
                              (#1='T
                               (SEQ (LETT |e1| (|SPADfirst| |l|))
                                    (EXIT
                                     (SPADCALL |e1|
                                               (SPADCALL '|error|
                                                         (QREFELT % 42))
                                               (QREFELT % 21)))))))))
                 (#1# NIL))))) 

(SDEFUN |BRINFO;convert_pattern;SU;9|
        ((|pat| (|String|))
         (% (|Union| (|LogicalMatchingAutomaton|) (|ErrorIndicator|))))
        (SPROG ((|pu| (|Union| (|LogicalMatchingAutomaton|) "failed")))
               (SEQ (LETT |pu| (SPADCALL |pat| 'T (QREFELT % 45)))
                    (EXIT
                     (COND
                      ((QEQCAR |pu| 1)
                       (CONS 1
                             (SPADCALL (LIST "Invalid pattern")
                                       (QREFELT % 48))))
                      ('T (CONS 0 (QCDR |pu|)))))))) 

(SDEFUN |BRINFO;do_match;LmaSB;10|
        ((|pat| (|LogicalMatchingAutomaton|)) (|s| (|String|)) (% (|Boolean|)))
        (SPADCALL |pat| (SPADCALL |s| (QREFELT % 40)) (QREFELT % 52))) 

(SDEFUN |BRINFO;filter_ops;Lma2L;11|
        ((|pat| (|LogicalMatchingAutomaton|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|opr| NIL) (#1=#:G181 NIL)
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |opr| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |pat| (SPADCALL (QCAR |opr|) (QREFELT % 54))
                                 (QREFELT % 53))
                       (LETT |res| (CONS |opr| |res|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;search_opl;SLU;12|
        ((|pat| (|String|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|Union|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))
           (|ErrorIndicator|))))
        (SPROG
         ((|pc| (|Union| (|LogicalMatchingAutomaton|) (|ErrorIndicator|))))
         (SEQ (LETT |pc| (SPADCALL |pat| (QREFELT % 50)))
              (EXIT
               (COND ((QEQCAR |pc| 1) (CONS 1 (QCDR |pc|)))
                     ('T
                      (CONS 0 (SPADCALL (QCDR |pc|) |opl| (QREFELT % 58))))))))) 

(SDEFUN |BRINFO;constructor_name?;SB;13| ((|name| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ (LETT |res1| (|constructor?| |name|))
                    (EXIT (NULL (SPADCALL |res1| (QREFELT % 18))))))) 

(SDEFUN |BRINFO;exposed_constructor?;SB;14|
        ((|name| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ (LETT |res1| (|isExposedConstructor| |name|))
                    (EXIT (NULL (SPADCALL |res1| (QREFELT % 18))))))) 

(SDEFUN |BRINFO;simp_ops_conditions;L2SeL;15|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|con_form| (|SExpression|)) (|dom_form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|cl| #1=(|List| (|SExpression|))) (|dl| #1#) (|opr| NIL)
          (#2=#:G215 NIL) (|sd| NIL) (#3=#:G216 NIL) (|np| (|SExpression|))
          (#4=#:G214 NIL)
          (|r1|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|res1|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |res| NIL)
              (LETT |cl|
                    (CONS |con_form|
                          (CDR (SPADCALL |con_form| (QREFELT % 17)))))
              (LETT |dl|
                    (CONS |dom_form|
                          (CDR (SPADCALL |dom_form| (QREFELT % 17)))))
              (SEQ (LETT |opr| NIL) (LETT #2# |opl|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |opr| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |res1| NIL)
                        (SEQ (LETT |sd| NIL) (LETT #3# (QCDR |opr|)) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |sd| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |r1|
                                      (COND
                                       ((SPADCALL (QVELT |sd| 1) 'T
                                                  (QREFELT % 21))
                                        |sd|)
                                       ('T
                                        (SEQ
                                         (LETT |np|
                                               (SUBLISLIS |dl| |cl|
                                                          (QVELT |sd| 1)))
                                         (LETT |np| (|simpHasPred| |np|))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |np| (QREFELT % 18))
                                            (PROGN
                                             (LETT #4# |$NoValue|)
                                             (GO #5=#:G201)))
                                           ('T
                                            (VECTOR (QVELT |sd| 0) |np|
                                                    (QVELT |sd| 2)
                                                    (QVELT |sd| 3)))))))))
                                (EXIT (LETT |res1| (CONS |r1| |res1|)))))
                              #5# (EXIT #4#))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (NULL |res1|))
                           (LETT |res|
                                 (CONS (CONS (QCAR |opr|) (NREVERSE |res1|))
                                       |res|))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;fill_op_tab|
        ((|dom_form| (|SExpression|))
         (|op_tab|
          (|XHashTable| (|SExpression|)
                        (|Record| (|:| |signature| (|SExpression|))
                                  (|:| |condition| (|SExpression|))
                                  (|:| |origin| (|SExpression|))
                                  (|:| |documentation| (|String|)))))
         (% (|Void|)))
        (SPROG
         ((|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|fl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           #1=(|Record| (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation| (|String|)))))))
          (|f1| NIL) (#2=#:G234 NIL) (|n_sd| #1#) (|n_sig| (|SExpression|))
          (#3=#:G233 NIL)
          (|cl|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|c1| NIL) (#4=#:G235 NIL))
         (SEQ (LETT |opl| (QCDR (SPADCALL |dom_form| (QREFELT % 66))))
              (LETT |fl| (|BRINFO;flatten_opll| (LIST |opl|) %))
              (SEQ (LETT |f1| NIL) (LETT #2# |fl|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |n_sd| (QCDR |f1|))
                          (LETT |n_sig|
                                (SPADCALL
                                 (CONS (SPADCALL (QCAR |f1|) (QREFELT % 42))
                                       (SPADCALL (QVELT |n_sd| 0)
                                                 (QREFELT % 17)))
                                 (QREFELT % 20)))
                          (EXIT
                           (COND
                            ((SPADCALL |n_sig| |op_tab| (QREFELT % 70))
                             (PROGN (LETT #3# |$NoValue|) (GO #5=#:G222)))
                            ('T
                             (SPADCALL |op_tab| |n_sig|
                                       (VECTOR (QVELT |n_sd| 0) 'T
                                               (QVELT |n_sd| 2)
                                               (QVELT |n_sd| 3))
                                       (QREFELT % 71)))))))
                    #5# (EXIT #3#))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |cl| (SPADCALL |dom_form| (QREFELT % 73)))
              (EXIT
               (SEQ (LETT |c1| NIL) (LETT #4# |cl|) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |c1| (CAR #4#)) NIL))
                      (GO G191)))
                    (SEQ (EXIT (|BRINFO;fill_op_tab| (QCAR |c1|) |op_tab| %)))
                    (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |BRINFO;fix_ops|
        ((|ops| (|List| (|SExpression|)))
         (|anc_lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))))
        (SPROG
         ((|opr| NIL) (#1=#:G250 NIL) (|name| (|Symbol|)) (|sig_cond| NIL)
          (#2=#:G251 NIL) (|scl| (|List| (|SExpression|)))
          (|n_sig| (|SExpression|)) (|n_cond| (|SExpression|)) (#3=#:G249 NIL)
          (|sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |opr| NIL) (LETT #1# |ops|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |name|
                          (SPADCALL (SPADCALL |opr| (QREFELT % 14))
                                    (QREFELT % 12)))
                    (EXIT
                     (SEQ (LETT |sig_cond| NIL)
                          (LETT #2#
                                (SPADCALL (SPADCALL |opr| (QREFELT % 15))
                                          (QREFELT % 17)))
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |sig_cond| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ
                             (LETT |scl| (SPADCALL |sig_cond| (QREFELT % 17)))
                             (LETT |n_sig| (|SPADfirst| |scl|))
                             (LETT |n_cond|
                                   (COND ((< (LENGTH |scl|) 3) 'T)
                                         ('T
                                          (SPADCALL |scl| 3 (QREFELT % 23)))))
                             (LETT |n_cond|
                                   (|BRINFO;simp_pred| |n_cond| |anc_lst| %))
                             (EXIT
                              (COND
                               ((SPADCALL |n_cond| (QREFELT % 18))
                                (PROGN (LETT #3# |$NoValue|) (GO #4=#:G239)))
                               ('T
                                (SEQ
                                 (LETT |sd|
                                       (VECTOR |n_sig| |n_cond|
                                               (SPADCALL NIL (QREFELT % 20))
                                               ""))
                                 (EXIT
                                  (LETT |res|
                                        (CONS (CONS |name| |sd|) |res|)))))))))
                           #4# (EXIT #3#))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |BRINFO;operations;2SeL;18|
        ((|form| (|SExpression|)) (|dom_form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|op_tab|
           (|XHashTable| (|SExpression|)
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|)))))
          (|op| (|SExpression|)) (|args| (|List| (|SExpression|)))
          (|ople| (|SExpression|))
          (|anc_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|fl1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (|opr| NIL) (#1=#:G268 NIL) (|name| (|Symbol|))
          (|o_sd|
           #2=(|Record| (|:| |signature| #3=(|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|sig| #3#) (|n_sig| (|SExpression|))
          (|n_sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (#4=#:G267 NIL) (|sd2| #2#)
          (|fl2|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ (LETT |op_tab| (SPADCALL (QREFELT % 74)))
              (|BRINFO;fill_op_tab| |dom_form| |op_tab| %)
              (LETT |op| (SPADCALL |form| (QREFELT % 14)))
              (LETT |args| (CDR (SPADCALL |dom_form| (QREFELT % 17))))
              (LETT |ople|
                    (SPADCALL |args| (|get_database| |op| 'OPERATIONALIST)
                              (QREFELT % 8)))
              (LETT |anc_lst| (SPADCALL |form| |dom_form| (QREFELT % 75)))
              (LETT |fl1|
                    (|BRINFO;fix_ops| (SPADCALL |ople| (QREFELT % 17))
                     |anc_lst| %))
              (LETT |fl2| NIL)
              (SEQ (LETT |opr| NIL) (LETT #1# |fl1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |name| (QCAR |opr|)) (LETT |o_sd| (QCDR |opr|))
                          (LETT |sig| (QVELT |o_sd| 0))
                          (LETT |n_sig|
                                (SPADCALL
                                 (CONS (SPADCALL |name| (QREFELT % 42))
                                       (SPADCALL |sig| (QREFELT % 17)))
                                 (QREFELT % 20)))
                          (LETT |n_sd|
                                (SPADCALL |op_tab| |n_sig| (QREFELT % 76)))
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |n_sd| 1) (QREFELT % 18))
                             (PROGN (LETT #4# |$NoValue|) (GO #5=#:G254)))
                            ('T
                             (SEQ (QSETVELT |n_sd| 1 NIL)
                                  (LETT |sd2|
                                        (VECTOR |sig| (QVELT |o_sd| 1)
                                                (QVELT |n_sd| 2)
                                                (QVELT |n_sd| 3)))
                                  (EXIT
                                   (LETT |fl2|
                                         (CONS (CONS |name| |sd2|)
                                               |fl2|)))))))))
                    #5# (EXIT #4#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |fl2|
                    (SPADCALL (CONS (|function| |BRINFO;fun_cmp|) %) |fl2|
                              (QREFELT % 80)))
              (EXIT (|BRINFO;group_funs| |fl2| %))))) 

(SDEFUN |BRINFO;sex_order|
        ((|s1| (|SExpression|)) (|s2| (|SExpression|)) (% (|Boolean|)))
        (SPROG
         ((|e1| #1=(|SExpression|)) (|e2| #1#)
          (|sl1| #2=(|List| (|SExpression|))) (|sl2| #2#) (#3=#:G289 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |s2| (QREFELT % 41))
             (COND ((NULL (SPADCALL |s1| (QREFELT % 41))) 'T)
                   (#4='T
                    (SEQ (LETT |sl1| (SPADCALL |s1| (QREFELT % 17)))
                         (LETT |sl2| (SPADCALL |s2| (QREFELT % 17)))
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL |sl1|)
                                   (PROGN
                                    (LETT #3# (NULL (NULL |sl2|)))
                                    (GO #5=#:G288)))
                                  ((NULL |sl2|)
                                   (PROGN (LETT #3# NIL) (GO #5#)))
                                  ('T
                                   (SEQ (LETT |e1| (|SPADfirst| |sl1|))
                                        (LETT |e2| (|SPADfirst| |sl2|))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |e1| |e2| (QREFELT % 21))
                                           (SEQ (LETT |sl1| (CDR |sl1|))
                                                (EXIT
                                                 (LETT |sl2| (CDR |sl2|)))))
                                          ('T
                                           (PROGN
                                            (LETT #3#
                                                  (|BRINFO;sex_order| |e1| |e2|
                                                   %))
                                            (GO #5#))))))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))
            ((SPADCALL |s1| (QREFELT % 41)) NIL)
            ((SPADCALL |s1| (QREFELT % 82))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 82))) 'T)
                   (#4#
                    (CGREATERP (SPADCALL |s2| (QREFELT % 83))
                               (SPADCALL |s1| (QREFELT % 83))))))
            ((SPADCALL |s2| (QREFELT % 82)) NIL)
            ((SPADCALL |s1| (QREFELT % 84))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 84))) 'T)
                   (#4#
                    (< (SPADCALL |s1| (QREFELT % 85))
                       (SPADCALL |s2| (QREFELT % 85))))))
            ((SPADCALL |s2| (QREFELT % 84)) NIL)
            ('T
             (CGREATERP
              (SPADCALL (SPADCALL |s2| (QREFELT % 12)) (QREFELT % 54))
              (SPADCALL (SPADCALL |s1| (QREFELT % 12)) (QREFELT % 54))))))
          #5# (EXIT #3#)))) 

(SDEFUN |BRINFO;gr1_ord|
        ((|g1|
          (|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                    (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (|g2|
          (|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                    (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (% (|Boolean|)))
        (|BRINFO;sex_order| (QVELT |g1| 0) (QVELT |g2| 0) %)) 

(SDEFUN |BRINFO;gr2_ord|
        ((|a1|
          (|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (|a2|
          (|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (% (|Boolean|)))
        (< (QVELT |a1| 0) (QVELT |a2| 0))) 

(SDEFUN |BRINFO;group_data1|
        ((|lst|
          (|List|
           (|Record| (|:| |i| (|Integer|)) (|:| |name| #1=(|Symbol|))
                     (|:| |sd|
                          #2=(|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|a0|
           (|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))
          (|a1| NIL) (#3=#:G313 NIL) (|on| #1#) (|res1| (|List| #2#))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (LETT |lst|
                (SPADCALL (CONS (|function| |BRINFO;gr2_ord|) %) |lst|
                          (QREFELT % 89)))
          (LETT |a0| (|SPADfirst| |lst|)) (LETT |lst| (CDR |lst|))
          (LETT |on| (QVELT |a0| 1)) (LETT |res1| (LIST (QVELT |a0| 2)))
          (LETT |res| NIL)
          (SEQ (LETT |a1| NIL) (LETT #3# |lst|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQUAL |on| (QVELT |a1| 1))
                   (LETT |res1| (CONS (QVELT |a1| 2) |res1|)))
                  ('T
                   (SEQ (LETT |res| (CONS (CONS |on| (NREVERSE |res1|)) |res|))
                        (LETT |on| (QVELT |a1| 1))
                        (EXIT (LETT |res1| (LIST (QVELT |a1| 2)))))))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |res| (CONS (CONS |on| |res1|) |res|))
          (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;group_data|
        ((|grd|
          (|List|
           (|Record| (|:| |grp_tag| #1=(|SExpression|)) (|:| |i| (|Integer|))
                     (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (SPROG
         ((|e1|
           (|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                     (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))
          (|gr| NIL) (#2=#:G333 NIL) (|t| #1#)
          (|r1|
           #3=(|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                        (|:| |sd|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
          (|res|
           (|List|
            (|Record| (|:| |grp_tag| (|SExpression|))
                      (|:| |ops|
                           (|List|
                            (|Record| (|:| |name| (|Symbol|))
                                      (|:| |sdl|
                                           (|List|
                                            (|Record|
                                             (|:| |signature| (|SExpression|))
                                             (|:| |condition| (|SExpression|))
                                             (|:| |origin| (|SExpression|))
                                             (|:| |documentation|
                                                  (|String|)))))))))))
          (|ot| #1#) (|res1| (|List| #3#))
          (|opl1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (COND ((NULL |grd|) NIL)
                ('T
                 (SEQ
                  (LETT |grd|
                        (SPADCALL (CONS (|function| |BRINFO;gr1_ord|) %) |grd|
                                  (QREFELT % 93)))
                  (LETT |e1| (|SPADfirst| |grd|)) (LETT |ot| (QVELT |e1| 0))
                  (LETT |res1|
                        (LIST
                         (VECTOR (QVELT |e1| 1) (QVELT |e1| 2)
                                 (QVELT |e1| 3))))
                  (LETT |res| NIL)
                  (SEQ (LETT |gr| NIL) (LETT #2# (CDR |grd|)) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |gr| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |t| (QVELT |gr| 0))
                            (LETT |r1|
                                  (VECTOR (QVELT |gr| 1) (QVELT |gr| 2)
                                          (QVELT |gr| 3)))
                            (EXIT
                             (COND
                              ((SPADCALL |t| |ot| (QREFELT % 21))
                               (LETT |res1| (CONS |r1| |res1|)))
                              ('T
                               (SEQ
                                (LETT |opl1| (|BRINFO;group_data1| |res1| %))
                                (LETT |res| (CONS (CONS |ot| |opl1|) |res|))
                                (LETT |ot| |t|)
                                (EXIT (LETT |res1| (LIST |r1|))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (LETT |opl1| (|BRINFO;group_data1| |res1| %))
                  (EXIT (NREVERSE (CONS (CONS |ot| |opl1|) |res|))))))))) 

(SDEFUN |BRINFO;group_by_field|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|field|
          (|Mapping| (|SExpression|)
                     (|Record| (|:| |signature| (|SExpression|))
                               (|:| |condition| (|SExpression|))
                               (|:| |origin| (|SExpression|))
                               (|:| |documentation| (|String|)))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (SPROG
         ((|opr| NIL) (#1=#:G344 NIL) (|name| (|Symbol|)) (|sd| NIL)
          (#2=#:G345 NIL)
          (|r1|
           #3=(|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                        (|:| |name| (|Symbol|))
                        (|:| |sd|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
          (|i| (|Integer|)) (|grd| (|List| #3#)))
         (SEQ (LETT |grd| NIL) (LETT |i| 1)
              (SEQ (LETT |opr| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |name| (QCAR |opr|))
                        (EXIT
                         (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |opr|)) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |sd| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |r1|
                                     (VECTOR (SPADCALL |sd| |field|) |i| |name|
                                             |sd|))
                               (LETT |i| (+ |i| 1))
                               (EXIT (LETT |grd| (CONS |r1| |grd|))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|BRINFO;group_data| |grd| %))))) 

(SDEFUN |BRINFO;group_by_condition;LL;25|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (|BRINFO;group_by_field| |opl|
         (LIST #'|BRINFO;group_by_condition;LL;25!0|) %)) 

(SDEFUN |BRINFO;group_by_condition;LL;25!0| ((|sd| NIL) ($$ NIL))
        (QVELT |sd| 1)) 

(SDEFUN |BRINFO;group_by_origin;LL;26|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (|BRINFO;group_by_field| |opl|
         (LIST #'|BRINFO;group_by_origin;LL;26!0|) %)) 

(SDEFUN |BRINFO;group_by_origin;LL;26!0| ((|sd| NIL) ($$ NIL)) (QVELT |sd| 2)) 

(SDEFUN |BRINFO;group_by_implementation;LSeLL;27|
        ((|args| (|List| (|SExpression|))) (|dom_form| (|SExpression|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (SPROG
         ((|con_name| (|Symbol|)) (|dom| (|None|)) (|dom_name| (|SExpression|))
          (|pred_lst| (|List| (|SExpression|))) (|opr| NIL) (#1=#:G364 NIL)
          (|op| (|Symbol|)) (|sd| NIL) (#2=#:G365 NIL) (|sig1| (|SExpression|))
          (|sig_imp| (|SExpression|))
          (|r1|
           #3=(|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                        (|:| |name| (|Symbol|))
                        (|:| |sd|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
          (|i| (|Integer|)) (|grd| (|List| #3#)))
         (SEQ
          (LETT |con_name|
                (SPADCALL (SPADCALL |dom_form| (QREFELT % 14)) (QREFELT % 12)))
          (LETT |dom| (EVAL |dom_form|)) (LETT |dom_name| (ELT |dom| 0))
          (LETT |pred_lst| (|get_database| |con_name| 'PREDICATES))
          (LETT |grd| NIL) (LETT |i| 1)
          (SEQ (LETT |opr| NIL) (LETT #1# |opl|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |op| (QCAR |opr|))
                    (EXIT
                     (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |opr|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |sd| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |sig1|
                                 (|sublisFormal|
                                  (SPADCALL |dom_name| (QREFELT % 15))
                                  (QVELT |sd| 0) |args|))
                           (LETT |sig_imp|
                                 (|get_op_implementation| |op| |sig1|
                                                          (QVELT |sd| 1)
                                                          |pred_lst| |dom|
                                                          |dom_name|))
                           (LETT |r1| (VECTOR |sig_imp| |i| |op| |sd|))
                           (LETT |i| (+ |i| 1))
                           (EXIT (LETT |grd| (CONS |r1| |grd|))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (|BRINFO;group_data| |grd| %))))) 

(MAKEPROP '|BRINFO;find_symbol| '|SPADreplace| '|find_symbol|) 

(SDEFUN |BRINFO;find_symbol|
        ((|name| (|String|)) (% (|Union| (|Symbol|) "failed")))
        (|find_symbol| |name|)) 

(SDEFUN |BRINFO;get_ops_doc| ((|name| (|Symbol|)) (% (|List| (|SExpression|))))
        (SPROG
         ((|doc| (|List| (|SExpression|))) (|con_doc| (|List| (|SExpression|)))
          (|e1| (|SExpression|)))
         (SEQ (LETT |doc| (|get_database| |name| 'DOCUMENTATION))
              (EXIT
               (COND ((NULL |doc|) |doc|)
                     ('T
                      (SEQ
                       (LETT |con_doc|
                             (SPADCALL (|SPADfirst| |doc|) (QREFELT % 17)))
                       (LETT |e1| (|SPADfirst| |con_doc|))
                       (COND
                        ((NULL
                          (EQUAL (SPADCALL |e1| (QREFELT % 12))
                                 '|constructor|))
                         (EXIT |doc|)))
                       (LETT |con_doc|
                             (SPADCALL (SPADCALL |con_doc| 2 (QREFELT % 23))
                                       (QREFELT % 17)))
                       (LETT |e1| (|SPADfirst| |con_doc|))
                       (COND
                        ((NULL (SPADCALL |e1| (QREFELT % 18))) (EXIT |doc|)))
                       (EXIT (CDR |doc|))))))))) 

(SDEFUN |BRINFO;unpack_sig_cond|
        ((|r1| (|SExpression|))
         (%
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|)))))
        (CONS (SPADCALL |r1| (QREFELT % 14)) (SPADCALL |r1| (QREFELT % 15)))) 

(SDEFUN |BRINFO;sd_cmp|
        ((|sd1|
          (|Record| (|:| |signature| #1=(|SExpression|))
                    (|:| |condition| (|SExpression|))
                    (|:| |origin| #2=(|SExpression|))
                    (|:| |documentation| (|String|))))
         (|sd2|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))
                    (|:| |origin| (|SExpression|))
                    (|:| |documentation| (|String|))))
         (% (|Boolean|)))
        (SPROG ((|sig1| #1#) (|sig2| #1#) (|orig1| #2#) (|orig2| #2#))
               (SEQ (LETT |sig1| (QVELT |sd1| 0)) (LETT |sig2| (QVELT |sd2| 0))
                    (EXIT
                     (COND
                      ((SPADCALL |sig1| |sig2| (QREFELT % 21))
                       (SEQ (LETT |orig1| (QVELT |sd1| 2))
                            (LETT |orig2| (QVELT |sd2| 2))
                            (EXIT
                             (COND
                              ((SPADCALL |orig1| |orig2| (QREFELT % 21))
                               (|BRINFO;sex_order| (QVELT |sd1| 1)
                                (QVELT |sd2| 1) %))
                              (#3='T
                               (|BRINFO;sex_order| |orig1| |orig2| %))))))
                      (#3# (|BRINFO;sex_order| |sig1| |sig2| %))))))) 

(SDEFUN |BRINFO;sdl_cmp|
        ((|sdl1|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|)))))
         (|sdl2|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|)))))
         (% (|Boolean|)))
        (SPROG
         ((|sd1|
           #1=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|sd2| #1#) (#2=#:G390 NIL))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND ((NULL |sdl1|) (NULL (NULL |sdl2|)))
                        ((NULL |sdl2|) (PROGN (LETT #2# NIL) (GO #3=#:G389)))
                        ('T
                         (SEQ (LETT |sd1| (|SPADfirst| |sdl1|))
                              (LETT |sd2| (|SPADfirst| |sdl2|))
                              (EXIT
                               (COND
                                ((SPADCALL |sd1| |sd2| (QREFELT % 99))
                                 (SEQ (LETT |sdl1| (CDR |sdl1|))
                                      (EXIT (LETT |sdl2| (CDR |sdl2|)))))
                                ('T
                                 (PROGN
                                  (LETT #2# (|BRINFO;sd_cmp| |sd1| |sd2| %))
                                  (GO #3#))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #2#)))) 

(SDEFUN |BRINFO;opr_cmp|
        ((|r1|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sdl|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (|r2|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sdl|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (% (|Boolean|)))
        (SPROG ((|n1| #1=(|Symbol|)) (|n2| #1#))
               (SEQ (LETT |n1| (QCAR |r1|)) (LETT |n2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((EQUAL |n1| |n2|)
                       (|BRINFO;sdl_cmp| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (SPADCALL |n1| |n2| (QREFELT % 100)))))))) 

(SDEFUN |BRINFO;sig_cmp|
        ((|r1|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))))
         (|r2|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))))
         (% (|Boolean|)))
        (SPROG ((|sig1| #1=(|SExpression|)) (|sig2| #1#))
               (SEQ (LETT |sig1| (QCAR |r1|)) (LETT |sig2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((SPADCALL |sig1| |sig2| (QREFELT % 21))
                       (|BRINFO;sex_order| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (|BRINFO;sex_order| |sig1| |sig2| %))))))) 

(SDEFUN |BRINFO;sigs_cmp|
        ((|l1|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|l2|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (% (|Boolean|)))
        (SPROG
         ((|r1|
           #1=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))))
          (|r2| #1#) (#2=#:G405 NIL))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND ((NULL |l1|) (NULL (NULL |l2|)))
                        ((NULL |l2|) (PROGN (LETT #2# NIL) (GO #3=#:G404)))
                        ('T
                         (SEQ (LETT |r1| (|SPADfirst| |l1|))
                              (LETT |r2| (|SPADfirst| |l2|))
                              (EXIT
                               (COND
                                ((SPADCALL |r1| |r2| (QREFELT % 102))
                                 (SEQ (LETT |l1| (CDR |l1|))
                                      (EXIT (LETT |l2| (CDR |l2|)))))
                                ('T
                                 (PROGN
                                  (LETT #2# (|BRINFO;sig_cmp| |r1| |r2| %))
                                  (GO #3#))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #2#)))) 

(SDEFUN |BRINFO;opr2_cmp|
        ((|r1|
          (|Record| (|:| |name| #1=(|Symbol|))
                    (|:| |sigs|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|)))))))
         (|r2|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sigs|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|)))))))
         (% (|Boolean|)))
        (SPROG ((|n1| #1#) (|n2| #1#))
               (SEQ (LETT |n1| (QCAR |r1|)) (LETT |n2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((EQUAL |n1| |n2|)
                       (|BRINFO;sigs_cmp| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (SPADCALL |n1| |n2| (QREFELT % 100)))))))) 

(SDEFUN |BRINFO;op_name| ((|ne| (|SExpression|)) (% (|Symbol|)))
        (SPROG ((|ni| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |ne| (QREFELT % 10))
                  (SPADCALL |ne| (QREFELT % 12)))
                 ((SPADCALL |ne| (QREFELT % 84))
                  (SEQ (LETT |ni| (SPADCALL |ne| (QREFELT % 85)))
                       (EXIT
                        (COND ((EQL |ni| 0) '|0|) ((EQL |ni| 1) '|1|)
                              (#1='T
                               (|error|
                                "Unexpected integer as operation name"))))))
                 (#1# (|error| "Unexpected operation name")))))) 

(SDEFUN |BRINFO;convert_opl|
        ((|opl1| (|List| (|SExpression|)))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sigs|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|)))))))))
        (SPROG
         ((|r1| (|SExpression|)) (#1=#:G431 NIL) (|name| #2=(|Symbol|))
          (|r2|
           #3=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))))
          (|oname| #2#) (|res1| (|List| #3#))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sigs|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|)))))))))
         (SEQ
          (COND ((NULL |opl1|) NIL)
                ('T
                 (SEQ (LETT |r1| (|SPADfirst| |opl1|))
                      (LETT |opl1| (CDR |opl1|))
                      (LETT |oname|
                            (|BRINFO;op_name| (SPADCALL |r1| (QREFELT % 14))
                             %))
                      (LETT |res1|
                            (LIST
                             (|BRINFO;unpack_sig_cond|
                              (SPADCALL |r1| (QREFELT % 15)) %)))
                      (LETT |opl| NIL)
                      (SEQ (LETT #1# |opl1|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |r1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |name|
                                  (|BRINFO;op_name|
                                   (SPADCALL |r1| (QREFELT % 14)) %))
                            (LETT |r2|
                                  (|BRINFO;unpack_sig_cond|
                                   (SPADCALL |r1| (QREFELT % 15)) %))
                            (EXIT
                             (COND
                              ((EQUAL |name| |oname|)
                               (LETT |res1| (CONS |r2| |res1|)))
                              ('T
                               (SEQ
                                (LETT |opl|
                                      (CONS (CONS |oname| (NREVERSE |res1|))
                                            |opl|))
                                (LETT |oname| |name|)
                                (EXIT (LETT |res1| (LIST |r2|))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |opl|
                            (CONS (CONS |oname| (NREVERSE |res1|)) |opl|))
                      (EXIT
                       (SPADCALL (CONS (|function| |BRINFO;opr2_cmp|) %) |opl|
                                 (QREFELT % 106))))))))) 

(SDEFUN |BRINFO;convert_doc1| ((|d1| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|name| (|SExpression|)) (|ns| (|Symbol|))
          (|new_name| (|SExpression|)) (|dl| (|List| (|SExpression|))))
         (SEQ
          (COND
           ((SPADCALL (LETT |name| (SPADCALL |d1| (QREFELT % 14)))
                      (QREFELT % 10))
            |d1|)
           (#1='T
            (SEQ
             (LETT |new_name|
                   (SEQ
                    (COND
                     ((SPADCALL |name| (QREFELT % 41))
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |name| (QREFELT % 15))
                                   (QREFELT % 18)))
                        (EXIT
                         (|error| #2="convert_doc1: unexpected name form")))))
                     (#1# (EXIT (|error| #2#))))
                    (LETT |ns|
                          (SPADCALL (SPADCALL |name| (QREFELT % 14))
                                    (QREFELT % 12)))
                    (COND
                     ((OR (EQUAL |ns| '|0|) (EQUAL |ns| '|1|))
                      (EXIT (SPADCALL |ns| (QREFELT % 42)))))
                    (EXIT (|error| "convert_doc1: unexpected name form"))))
             (LETT |dl| (CDR (SPADCALL |d1| (QREFELT % 17))))
             (EXIT (SPADCALL (CONS |new_name| |dl|) (QREFELT % 20))))))))) 

(SDEFUN |BRINFO;convert_doc|
        ((|doc| (|List| (|SExpression|))) (% (|List| (|SExpression|))))
        (SPROG
         ((#1=#:G447 NIL) (|good?| (|Boolean|)) (#2=#:G448 NIL) (|d1| NIL)
          (#3=#:G449 NIL))
         (SEQ (LETT |good?| 'T)
              (SEQ (LETT |d1| NIL) (LETT #1# |doc|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |d1| (CAR #1#)) NIL)
                         (NULL |good?|))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |good?|
                           (SPADCALL (SPADCALL |d1| (QREFELT % 14))
                                     (QREFELT % 10)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |good?|)
                (LETT |doc|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |d1| NIL) (LETT #3# |doc|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |d1| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (|BRINFO;convert_doc1| |d1| %)
                                          #2#))))
                            (LETT #3# (CDR #3#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))
              (EXIT
               (SPADCALL (CONS (|function| |BRINFO;sex_order|) %) |doc|
                         (QREFELT % 108)))))) 

(SDEFUN |BRINFO;add_origin|
        ((|sigs|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))))
        (SPROG ((#1=#:G454 NIL) (|sig| NIL) (#2=#:G455 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |sig| NIL) (LETT #2# |sigs|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |sig| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (VECTOR (QCAR |sig|) (QCDR |sig|) |form| "")
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |BRINFO;merge_doc1|
        ((|sigs|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|doc1| (|List| (|SExpression|))) (|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))))
        (SPROG
         ((|sig| NIL) (#1=#:G467 NIL)
          (|r1|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|d1| NIL) (#2=#:G468 NIL) (|found| (|Boolean|))
          (|res|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|))))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |sig| NIL) (LETT #1# |sigs|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sig| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |found| NIL)
                        (LETT |r1|
                              (VECTOR (QCAR |sig|) (QCDR |sig|) |form| ""))
                        (SEQ (LETT |d1| NIL) (LETT #2# |doc1|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |d1| (CAR #2#)) NIL)
                                   (NULL (NULL |found|)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |d1| (QREFELT % 14))
                                           (QCAR |sig|) (QREFELT % 21))
                                 (SEQ
                                  (QSETVELT |r1| 3
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |d1| (QREFELT % 15))
                                              (QREFELT % 14))
                                             (QREFELT % 83)))
                                  (EXIT (LETT |found| 'T)))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |res| (CONS |r1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;is_attribute_doc?| ((|d1| (|SExpression|)) (% (|Boolean|)))
        (SPROG ((|sdl| (|List| (|SExpression|))) (|sig| (|SExpression|)))
               (SEQ
                (LETT |sdl|
                      (SPADCALL (SPADCALL |d1| (QREFELT % 15)) (QREFELT % 17)))
                (EXIT
                 (COND
                  ((EQL (LENGTH |sdl|) 1)
                   (SEQ
                    (LETT |sig| (SPADCALL (|SPADfirst| |sdl|) (QREFELT % 14)))
                    (EXIT
                     (SPADCALL |sig|
                               (SPADCALL
                                (LIST (SPADCALL '|attribute| (QREFELT % 42)))
                                (QREFELT % 20))
                               (QREFELT % 21)))))
                  ('T NIL)))))) 

(SDEFUN |BRINFO;merge_doc|
        ((|opl1| (|List| (|SExpression|))) (|doc| (|List| (|SExpression|)))
         (|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|opl2|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sigs|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))))))))
          (|r1| NIL) (#1=#:G488 NIL) (|name| (|Symbol|)) (#2=#:G487 NIL)
          (|d1| (|SExpression|)) (|dname| (|Symbol|))
          (|sdl|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (COND ((NULL |opl1|) NIL)
                ('T
                 (SEQ (LETT |opl2| (|BRINFO;convert_opl| |opl1| %))
                      (LETT |res| NIL)
                      (SEQ (LETT |r1| NIL) (LETT #1# |opl2|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |r1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |name| (QCAR |r1|))
                                (LETT |sdl|
                                      (COND
                                       ((NULL |doc|)
                                        (LETT |sdl|
                                              (|BRINFO;add_origin| (QCDR |r1|)
                                               |form| %)))
                                       ('T
                                        (SEQ (LETT |d1| (|SPADfirst| |doc|))
                                             (LETT |dname|
                                                   (SPADCALL
                                                    (SPADCALL |d1|
                                                              (QREFELT % 14))
                                                    (QREFELT % 12)))
                                             (SEQ
                                              (EXIT
                                               (SEQ G190
                                                    (COND
                                                     ((NULL
                                                       (SPADCALL |dname| |name|
                                                                 (QREFELT %
                                                                          100)))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |doc| (CDR |doc|))
                                                     (EXIT
                                                      (COND
                                                       ((NULL |doc|)
                                                        (PROGN
                                                         (LETT #2# 1)
                                                         (GO #3=#:G476)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |d1|
                                                               (|SPADfirst|
                                                                |doc|))
                                                         (EXIT
                                                          (LETT |dname|
                                                                (SPADCALL
                                                                 (SPADCALL |d1|
                                                                           (QREFELT
                                                                            %
                                                                            14))
                                                                 (QREFELT %
                                                                          12)))))))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL)))
                                              #3# (EXIT #2#))
                                             (EXIT
                                              (COND
                                               ((EQUAL |name| |dname|)
                                                (SEQ (LETT |doc| (CDR |doc|))
                                                     (EXIT
                                                      (|BRINFO;merge_doc1|
                                                       (QCDR |r1|)
                                                       (SPADCALL
                                                        (SPADCALL |d1|
                                                                  (QREFELT %
                                                                           15))
                                                        (QREFELT % 17))
                                                       |form| %))))
                                               ('T
                                                (|BRINFO;add_origin|
                                                 (QCDR |r1|) |form| %))))))))
                                (EXIT
                                 (LETT |res|
                                       (CONS (CONS |name| |sdl|) |res|))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NREVERSE |res|)))))))) 

(SDEFUN |BRINFO;dependents;SL;45| ((|c| (|Symbol|)) (% (|List| (|Symbol|))))
        (SPROG
         ((|lib| (|BasicKeyedAccessFile|)) (|l| (|List| (|Symbol|)))
          (|res| (|None|)))
         (SEQ
          (LETT |lib|
                (SPADCALL (SPADCALL "DEPENDENTS.DAASE" (QREFELT % 110)) "input"
                          (QREFELT % 112)))
          (LETT |l| NIL)
          (LETT |res|
                (SPADCALL |lib| (SPADCALL |c| (QREFELT % 54)) |l|
                          (QREFELT % 114)))
          (SPADCALL |lib| (QREFELT % 116)) (EXIT |res|)))) 

(SDEFUN |BRINFO;users;SL;46| ((|c| (|Symbol|)) (% (|List| (|Symbol|))))
        (SPROG
         ((|lib| (|BasicKeyedAccessFile|)) (|l| (|List| (|Symbol|)))
          (|res| (|None|)))
         (SEQ
          (LETT |lib|
                (SPADCALL (SPADCALL "USERS.DAASE" (QREFELT % 110)) "input"
                          (QREFELT % 112)))
          (LETT |l| NIL)
          (LETT |res|
                (SPADCALL |lib| (SPADCALL |c| (QREFELT % 54)) |l|
                          (QREFELT % 114)))
          (SPADCALL |lib| (QREFELT % 116)) (EXIT |res|)))) 

(SDEFUN |BRINFO;uses;S2SeL;47|
        ((|c| (|Symbol|)) (|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG
         ((|con_args| (|List| (|Symbol|))) (|c_lst| (|List| (|SExpression|)))
          (#1=#:G500 NIL) (#2=#:G501 NIL))
         (SEQ (LETT |c_lst| (|getImports| |c|))
              (COND
               ((NULL (SPADCALL |dom| (QREFELT % 18)))
                (SEQ (LETT |con_args| (SPADCALL |cf| (QREFELT % 15)))
                     (EXIT
                      (LETT |c_lst|
                            (SUBLISLIS
                             (CONS |dom| (CDR (SPADCALL |dom| (QREFELT % 17))))
                             (CONS '% |con_args|) |c_lst|))))))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT #2# |c_lst|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #1# (CONS (CONS |c| 'T) #1#))))
                     (LETT #2# (CDR #2#)) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))))) 

(MAKEPROP '|BRINFO;search_path;2SeNL;48| '|SPADreplace| '|dbSearchOrder|) 

(SDEFUN |BRINFO;search_path;2SeNL;48|
        ((|cf| (|SExpression|)) (|dom_form| (|SExpression|))
         (|dom_vec| (|None|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (|dbSearchOrder| |cf| |dom_form| |dom_vec|)) 

(SDEFUN |BRINFO;exports;SeR;49|
        ((|c| (|SExpression|))
         (%
          (|Record|
           (|:| |cats|
                (|List|
                 (|Record| (|:| |form| (|SExpression|))
                           (|:| |condition| (|SExpression|)))))
           (|:| |ops|
                (|List|
                 (|Record| (|:| |name| (|Symbol|))
                           (|:| |sdl|
                                (|List|
                                 (|Record| (|:| |signature| (|SExpression|))
                                           (|:| |condition| (|SExpression|))
                                           (|:| |origin| (|SExpression|))
                                           (|:| |documentation|
                                                (|String|)))))))))))
        (SPROG
         ((|con_name| (|Symbol|)) (|args| (|List| (|SExpression|)))
          (|r1| (|SExpression|))
          (|cl|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|opl1| #1=(|List| (|SExpression|))) (|doc| #1#)
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (LETT |con_name|
                (SPADCALL (SPADCALL |c| (QREFELT % 14)) (QREFELT % 12)))
          (LETT |args| (CDR (SPADCALL |c| (QREFELT % 17))))
          (LETT |r1|
                (|getConstructorExports| (SPADCALL |con_name| (QREFELT % 122))
                                         'T))
          (LETT |r1| (SPADCALL |args| |r1| (QREFELT % 8)))
          (LETT |cl| (SPADCALL |r1| (QREFELT % 14)))
          (LETT |opl1|
                (SPADCALL (SPADCALL |r1| (QREFELT % 15)) (QREFELT % 17)))
          (LETT |doc|
                (SPADCALL
                 (SPADCALL |args|
                           (SPADCALL (|BRINFO;get_ops_doc| |con_name| %)
                                     (QREFELT % 20))
                           (QREFELT % 8))
                 (QREFELT % 17)))
          (LETT |doc| (|BRINFO;convert_doc| |doc| %))
          (LETT |opl| (|BRINFO;merge_doc| |opl1| |doc| |c| %))
          (EXIT (CONS |cl| |opl|))))) 

(SDEFUN |BRINFO;con_exports|
        ((|c| (|Symbol|))
         (%
          (|Record|
           (|:| |cats|
                (|List|
                 (|Record| (|:| |form| (|SExpression|))
                           (|:| |condition| (|SExpression|)))))
           (|:| |ops|
                (|List|
                 (|Record| (|:| |name| (|Symbol|))
                           (|:| |sdl|
                                (|List|
                                 (|Record| (|:| |signature| (|SExpression|))
                                           (|:| |condition| (|SExpression|))
                                           (|:| |origin| (|SExpression|))
                                           (|:| |documentation|
                                                (|String|)))))))))))
        (SPROG ((|cf| (|SExpression|)))
               (SEQ (LETT |cf| (SPADCALL |c| (QREFELT % 122)))
                    (EXIT
                     (COND
                      ((SPADCALL |cf| (QREFELT % 18))
                       (SEQ
                        (SPADCALL (SPADCALL |c| (QREFELT % 124))
                                  (QREFELT % 125))
                        (EXIT (|error| "con_exports: not a constructor"))))
                      ('T (SPADCALL |cf| (QREFELT % 66)))))))) 

(SDEFUN |BRINFO;flatten_opll|
        ((|ll|
          (|List|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))))
        (SPROG
         ((|l1| NIL) (#1=#:G522 NIL) (|r1| NIL) (#2=#:G523 NIL)
          (|name| (|Symbol|)) (|sd| NIL) (#3=#:G524 NIL)
          (|res1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ
          (COND ((NULL |ll|) NIL)
                ('T
                 (SEQ (LETT |res1| NIL)
                      (SEQ (LETT |l1| NIL) (LETT #1# |ll|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |l1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r1| NIL) (LETT #2# |l1|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |r1| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |name| (QCAR |r1|))
                                       (EXIT
                                        (SEQ (LETT |sd| NIL)
                                             (LETT #3# (QCDR |r1|)) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |sd| (CAR #3#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |res1|
                                                     (CONS (CONS |name| |sd|)
                                                           |res1|))))
                                             (LETT #3# (CDR #3#)) (GO G190)
                                             G191 (EXIT NIL))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res1|))))))) 

(SDEFUN |BRINFO;fun_cmp|
        ((|f1|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (|f2|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (% (|Boolean|)))
        (SPROG
         ((|n1| #1=(|Symbol|)) (|n2| #1#)
          (|sd1|
           #2=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|sd2| #2#) (|sig1| #3=(|SExpression|)) (|sig2| #3#)
          (|orig1| #4=(|SExpression|)) (|orig2| #4#))
         (SEQ (LETT |n1| (QCAR |f1|)) (LETT |n2| (QCAR |f2|))
              (EXIT
               (COND
                ((EQUAL |n1| |n2|)
                 (SEQ (LETT |sd1| (QCDR |f1|)) (LETT |sd2| (QCDR |f2|))
                      (LETT |sig1| (QVELT |sd1| 0))
                      (LETT |sig2| (QVELT |sd2| 0))
                      (EXIT
                       (COND
                        ((SPADCALL |sig1| |sig2| (QREFELT % 21))
                         (SEQ (LETT |orig1| (QVELT |sd1| 2))
                              (LETT |orig2| (QVELT |sd2| 2))
                              (EXIT
                               (COND
                                ((SPADCALL |orig1| |orig2| (QREFELT % 21))
                                 (|BRINFO;sex_order| (QVELT |sd1| 1)
                                  (QVELT |sd2| 1) %))
                                (#5='T
                                 (|BRINFO;sex_order| |orig1| |orig2| %))))))
                        (#5# (|BRINFO;sex_order| |sig1| |sig2| %))))))
                ((EQUAL |n1| '|0|) 'T) ((EQUAL |n2| '|0|) NIL)
                ((EQUAL |n1| '|1|) 'T) ((EQUAL |n2| '|1|) NIL)
                (#5# (SPADCALL |n1| |n2| (QREFELT % 100)))))))) 

(SDEFUN |BRINFO;group_funs|
        ((|fl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|f1|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))
          (#1=#:G542 NIL) (|name| #2=(|Symbol|)) (|oname| #2#)
          (|sdl|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |res| NIL)
              (EXIT
               (COND ((NULL |fl|) |res|)
                     ('T
                      (SEQ (LETT |f1| (|SPADfirst| |fl|))
                           (LETT |oname| (QCAR |f1|))
                           (LETT |sdl| (LIST (QCDR |f1|)))
                           (SEQ (LETT #1# (CDR |fl|)) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f1| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |name| (QCAR |f1|))
                                     (EXIT
                                      (COND
                                       ((EQUAL |name| |oname|)
                                        (LETT |sdl| (CONS (QCDR |f1|) |sdl|)))
                                       ('T
                                        (SEQ
                                         (LETT |res|
                                               (CONS
                                                (CONS |oname| (NREVERSE |sdl|))
                                                |res|))
                                         (LETT |oname| |name|)
                                         (EXIT
                                          (LETT |sdl| (LIST (QCDR |f1|)))))))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (LETT |res|
                                 (CONS (CONS |oname| (NREVERSE |sdl|)) |res|))
                           (EXIT (NREVERSE |res|))))))))) 

(SDEFUN |BRINFO;convert_opll|
        ((|ll|
          (|List|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ
          (COND ((NULL |ll|) NIL)
                ('T
                 (SEQ (LETT |fl| (|BRINFO;flatten_opll| |ll| %))
                      (LETT |fl|
                            (SPADCALL (CONS (|function| |BRINFO;fun_cmp|) %)
                                      |fl| (QREFELT % 80)))
                      (EXIT (|BRINFO;group_funs| |fl| %)))))))) 

(MAKEPROP '|BRINFO;all_con_names| '|SPADreplace| '|allConstructors|) 

(SDEFUN |BRINFO;all_con_names| ((% (|List| (|Symbol|)))) (|allConstructors|)) 

(SDEFUN |BRINFO;ops_from_exports;L;56|
        ((%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|cl| (|List| (|Symbol|))) (|c| NIL) (#1=#:G559 NIL)
          (|cf| (|SExpression|)) (#2=#:G558 NIL)
          (|cfl| (|List| (|SExpression|))) (#3=#:G560 NIL) (#4=#:G561 NIL)
          (|opll|
           (|List|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))))))
         (SEQ (LETT |cl| (|BRINFO;all_con_names| %)) (LETT |cfl| NIL)
              (SEQ (LETT |c| NIL) (LETT #1# |cl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |c| (QREFELT % 126))
                       (PROGN (LETT #2# |$NoValue|) (GO #5=#:G550)))
                      ('T
                       (SEQ (LETT |cf| (SPADCALL |c| (QREFELT % 122)))
                            (EXIT
                             (COND
                              ((SPADCALL |cf| (QREFELT % 18))
                               (PROGN (LETT #2# |$NoValue|) (GO #5#)))
                              ('T (LETT |cfl| (CONS |cf| |cfl|)))))))))
                    #5# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |opll|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT #4# |cfl|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |cf| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (QCDR (SPADCALL |cf| (QREFELT % 66)))
                                        #3#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (EXIT (|BRINFO;convert_opll| |opll| %))))) 

(SDEFUN |BRINFO;search_operations;SU;57|
        ((|pat| (|String|))
         (%
          (|Union|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))
           (|ErrorIndicator|))))
        (SEQ
         (COND
          ((NULL (QREFELT % 129))
           (SEQ (SETELT % 128 (SPADCALL (QREFELT % 127)))
                (EXIT (SETELT % 129 'T)))))
         (EXIT (SPADCALL |pat| (QREFELT % 128) (QREFELT % 60))))) 

(SDEFUN |BRINFO;search_operations;ML;58|
        ((|f|
          (|Mapping| (|Boolean|) (|String|)
                     (|Record| (|:| |signature| (|SExpression|))
                               (|:| |condition| (|SExpression|))
                               (|:| |origin| (|SExpression|))
                               (|:| |documentation| (|String|)))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|opr| NIL) (#1=#:G582 NIL) (|n1| (|String|)) (|sd| NIL)
          (#2=#:G583 NIL)
          (|res1|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |res| NIL)
              (COND
               ((NULL (QREFELT % 129))
                (SEQ (SETELT % 128 (SPADCALL (QREFELT % 127)))
                     (EXIT (SETELT % 129 'T)))))
              (SEQ (LETT |opr| NIL) (LETT #1# (QREFELT % 128)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |res1| NIL)
                        (LETT |n1| (SPADCALL (QCAR |opr|) (QREFELT % 54)))
                        (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |opr|)) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |sd| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |n1| |sd| |f|)
                                 (LETT |res1| (CONS |sd| |res1|))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (NULL |res1|))
                           (LETT |res|
                                 (CONS (CONS (QCAR |opr|) (NREVERSE |res1|))
                                       |res|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;constructor_kind;2S;59| ((|name| (|Symbol|)) (% (|Symbol|)))
        (|get_database| |name| 'CONSTRUCTORKIND)) 

(MAKEPROP '|BRINFO;ancestors;2SeL;60| '|SPADreplace| '|ancestorsOf|) 

(SDEFUN |BRINFO;ancestors;2SeL;60|
        ((|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (|ancestorsOf| |cf| |dom|)) 

(SDEFUN |BRINFO;children;2SeL;61|
        ((|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG
         ((|c_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |c_lst| (|childrenOf| |cf|))
              (LETT |c_lst| (|augmentHasArgs| |c_lst| |cf|)) (EXIT |c_lst|)))) 

(SDEFUN |BRINFO;descendants;2SeL;62|
        ((|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG
         ((|c_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |c_lst| (|descendantsOf| |cf| |dom|))
              (EXIT (|augmentHasArgs| |c_lst| |cf|))))) 

(MAKEPROP '|BRINFO;domains2| '|SPADreplace| '|domainsOf|) 

(SDEFUN |BRINFO;domains2|
        ((|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (|domainsOf| |cf| |dom|)) 

(SDEFUN |BRINFO;filter_doms|
        ((|ls|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG
         ((|pl| (|List| (|SExpression|))) (|p| NIL) (#1=#:G618 NIL)
          (#2=#:G619 NIL) (|np| (|SExpression|))
          (|ls2|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|r2| NIL) (#3=#:G620 NIL) (|form1| (|SExpression|)) (#4=#:G621 NIL)
          (|nl|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (#5=#:G617 NIL) (|r1| NIL) (#6=#:G622 NIL) (|npred| (|SExpression|))
          (#7=#:G616 NIL))
         (SEQ
          (COND
           ((SPADCALL |cf| (QREFELT % 13))
            (COND
             ((|BRINFO;is_symbol?| (SPADCALL |cf| (QREFELT % 14)) 'CATEGORY %)
              (EXIT
               (SEQ
                (LETT |pl|
                      (SPADCALL
                       (SPADCALL (SPADCALL |cf| (QREFELT % 15)) (QREFELT % 15))
                       (QREFELT % 17)))
                (LETT |nl| NIL)
                (SEQ (LETT |p| NIL) (LETT #1# |pl|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |nl| NIL)
                          (SEQ (LETT |r1| NIL) (LETT #2# |ls|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |r1| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ (LETT |np| (|quickAnd| |p| (QCDR |r1|)))
                                    (EXIT
                                     (LETT |nl|
                                           (CONS (CONS (QCAR |r1|) |np|)
                                                 |nl|))))
                               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                          (EXIT (LETT |ls| |nl|)))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |ls|)))))))
          (LETT |ls2| (|BRINFO;domains2| |cf| |dom| %)) (LETT |nl| NIL)
          (SEQ (LETT |r2| NIL) (LETT #3# |ls2|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |r2| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |form1| (QCAR |r2|))
                    (EXIT
                     (SEQ
                      (EXIT
                       (SEQ (LETT |r1| NIL) (LETT #4# |ls|) G190
                            (COND
                             ((OR (ATOM #4#) (PROGN (LETT |r1| (CAR #4#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |form1| (QCAR |r1|) (QREFELT % 21))
                                (SEQ
                                 (LETT |nl|
                                       (CONS
                                        (CONS |form1|
                                              (|quickAnd| (QCDR |r1|)
                                                          (QCDR |r2|)))
                                        |nl|))
                                 (EXIT
                                  (PROGN (LETT #5# 1) (GO #8=#:G608))))))))
                            (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
                      #8# (EXIT #5#))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |ls| NIL)
          (SEQ (LETT |r1| NIL) (LETT #6# |nl|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |r1| (CAR #6#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |npred| (|simpHasPred| (QCDR |r1|)))
                      (EXIT
                       (COND
                        ((SPADCALL |npred| (QREFELT % 18))
                         (PROGN (LETT #7# |$NoValue|) (GO #9=#:G611)))
                        ('T
                         (LETT |ls|
                               (CONS (CONS (QCAR |r1|) |npred|) |ls|)))))))
                #9# (EXIT #7#))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (EXIT |ls|)))) 

(SDEFUN |BRINFO;domains_of_join|
        ((|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG
         ((|args| (|List| (|SExpression|))) (#1=#:G630 NIL) (#2=#:G631 NIL)
          (|dom_args| (|List| (|SExpression|))) (|dom_arg| NIL) (#3=#:G633 NIL)
          (|arg| NIL) (#4=#:G632 NIL)
          (|res|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |args| (CDR (SPADCALL |cf| (QREFELT % 17))))
              (LETT |dom_args|
                    (COND
                     ((SPADCALL |dom| (QREFELT % 18))
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |arg| NIL) (LETT #2# |args|) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |arg| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1#
                                    (CONS (SPADCALL NIL (QREFELT % 20)) #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#)))))
                     ('T (CDR (SPADCALL |dom| (QREFELT % 17))))))
              (LETT |res|
                    (|BRINFO;domains2| (|SPADfirst| |args|)
                     (|SPADfirst| |dom_args|) %))
              (SEQ (LETT |dom_arg| NIL) (LETT #3# (CDR |dom_args|))
                   (LETT |arg| NIL) (LETT #4# (CDR |args|)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |arg| (CAR #4#)) NIL)
                         (ATOM #3#) (PROGN (LETT |dom_arg| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (|BRINFO;filter_doms| |res| |arg| |dom_arg| %))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |BRINFO;domains1|
        ((|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG ((|op| (|SExpression|)))
               (SEQ
                (COND
                 ((NULL (SPADCALL |cf| (QREFELT % 13)))
                  (|BRINFO;domains2| |cf| |dom| %))
                 ('T
                  (SEQ (LETT |op| (SPADCALL |cf| (QREFELT % 14)))
                       (EXIT
                        (COND ((|BRINFO;is_symbol?| |op| 'CATEGORY %) NIL)
                              ((|BRINFO;is_symbol?| |op| '|Join| %)
                               (|BRINFO;domains_of_join| |cf| |dom| %))
                              ('T (|BRINFO;domains2| |cf| |dom| %)))))))))) 

(SDEFUN |BRINFO;domains;2SeL;67|
        ((|cf| (|SExpression|)) (|dom| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG
         ((|c_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |c_lst| (|BRINFO;domains1| |cf| |dom| %))
              (EXIT (|augmentHasArgs| |c_lst| |cf|))))) 

(SDEFUN |BRINFO;parents;SeL;68|
        ((|cf| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (COND ((SPADCALL |cf| (QREFELT % 10)) (|parentsOf| |cf|))
              ('T (|parentsOfForm| |cf|)))) 

(SDEFUN |BRINFO;default_name?;SB;69| ((|n| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|ns| (|String|)))
               (SEQ (LETT |ns| (SPADCALL |n| (QREFELT % 54)))
                    (EXIT
                     (|eql_SI| (SPADCALL |ns| (QCSIZE |ns|) (QREFELT % 35))
                               (|STR_to_CHAR| "&")))))) 

(SDEFUN |BRINFO;split_constructors|
        ((|lst| (|List| (|Symbol|)))
         (%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((|n| NIL) (#1=#:G655 NIL) (#2=#:G654 NIL) (|kind| (|Symbol|))
          (|cats| #3=(|List| (|Symbol|))) (|doms| #3#) (|packs| #3#))
         (SEQ (LETT |cats| (LETT |doms| (LETT |packs| NIL)))
              (SEQ (LETT |n| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |n| (QREFELT % 126))
                           (EQUAL |n| '|Category|))
                       (PROGN (LETT #2# |$NoValue|) (GO #4=#:G645)))
                      ('T
                       (SEQ (LETT |kind| (SPADCALL |n| (QREFELT % 133)))
                            (EXIT
                             (COND
                              ((EQUAL |kind| '|category|)
                               (LETT |cats| (CONS |n| |cats|)))
                              ((EQUAL |kind| '|domain|)
                               (LETT |doms| (CONS |n| |doms|)))
                              ((EQUAL |kind| '|package|)
                               (LETT |packs| (CONS |n| |packs|)))
                              ('T
                               (|error|
                                "split_constructors: Unknown constructor kind"))))))))
                    #4# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |cats| (NREVERSE |cats|)) (LETT |doms| (NREVERSE |doms|))
              (LETT |packs| (NREVERSE |packs|))
              (EXIT (VECTOR |cats| |doms| |packs|))))) 

(SDEFUN |BRINFO;all_constructors;R;71|
        ((%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((#1=#:G662 NIL) (|cn| NIL) (#2=#:G663 NIL)
          (|cnl| (|List| (|Symbol|))))
         (SEQ
          (LETT |cnl|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |cn| NIL) (LETT #2# (|BRINFO;all_con_names| %))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |cn| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |cn| (QREFELT % 126)))
                          (LETT #1# (CONS |cn| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT
           (|BRINFO;split_constructors| (SPADCALL |cnl| (QREFELT % 137)) %))))) 

(SDEFUN |BRINFO;split_ops|
        ((|lst| (|List| (|String|)))
         (%
          (|Record| (|:| |con| (|List| (|Symbol|)))
                    (|:| |opl| (|List| (|String|))))))
        (SPROG
         ((|str| NIL) (#1=#:G671 NIL) (|k| (|Integer|)) (|sym| (|Symbol|))
          (|cnl| (|List| (|Symbol|))) (|opl| (|List| (|String|))))
         (SEQ (LETT |opl| NIL) (LETT |cnl| NIL) (LETT |opl| NIL)
              (SEQ (LETT |str| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |str| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|eql_SI| (SPADCALL |str| 1 (QREFELT % 35))
                                 (|STR_to_CHAR| "o"))
                       (LETT |opl| (CONS |str| |opl|)))
                      ('T
                       (SEQ
                        (LETT |k|
                              (SPADCALL (QREFELT % 31) |str| (QREFELT % 140)))
                        (LETT |sym|
                              (SPADCALL
                               (SPADCALL |str|
                                         (SPADCALL 2 (- |k| 1) (QREFELT % 142))
                                         (QREFELT % 143))
                               (QREFELT % 144)))
                        (EXIT (LETT |cnl| (CONS |sym| |cnl|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |cnl| (NREVERSE |cnl|)) (LETT |opl| (NREVERSE |opl|))
              (EXIT (CONS |cnl| |opl|))))) 

(SDEFUN |BRINFO;filter_symbols;Lma2L;73|
        ((|pc| (|LogicalMatchingAutomaton|)) (|sl| (|List| (|Symbol|)))
         (% (|List| (|Symbol|))))
        (SPROG ((|sy| NIL) (#1=#:G677 NIL) (|res| (|List| (|Symbol|))))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |sy| NIL) (LETT #1# |sl|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |sy| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |pc| (SPADCALL |sy| (QREFELT % 54))
                                       (QREFELT % 53))
                             (LETT |res| (CONS |sy| |res|))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;search_constructors;SSU;74|
        ((|pat| (|String|)) (|tag| (|Symbol|))
         (%
          (|Union|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))
           (|ErrorIndicator|))))
        (SPROG
         ((|pc| (|Union| (|LogicalMatchingAutomaton|) (|ErrorIndicator|)))
          (#1=#:G696 NIL) (|cn| NIL) (#2=#:G697 NIL)
          (|cnl| (|List| (|Symbol|))) (|cnl2| (|List| (|Symbol|)))
          (|res1|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))))
         (SEQ (LETT |pc| (SPADCALL |pat| (QREFELT % 50)))
              (EXIT
               (COND ((QEQCAR |pc| 1) (CONS 1 (QCDR |pc|)))
                     (#3='T
                      (SEQ
                       (LETT |cnl|
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |cn| NIL)
                                   (LETT #2# (|BRINFO;all_con_names| %)) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |cn| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |cn| (QREFELT % 126)))
                                       (LETT #1# (CONS |cn| #1#))))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#)))))
                       (LETT |cnl2|
                             (SPADCALL (QCDR |pc|) |cnl| (QREFELT % 145)))
                       (LETT |res1|
                             (|BRINFO;split_constructors|
                              (SPADCALL |cnl2| (QREFELT % 137)) %))
                       (EXIT
                        (COND ((EQUAL |tag| '|k|) (CONS 0 |res1|))
                              ((EQUAL |tag| '|c|)
                               (CONS 0 (VECTOR (QVELT |res1| 0) NIL NIL)))
                              ((EQUAL |tag| '|d|)
                               (CONS 0 (VECTOR NIL (QVELT |res1| 1) NIL)))
                              ((EQUAL |tag| '|p|)
                               (CONS 0 (VECTOR NIL NIL (QVELT |res1| 2))))
                              (#3# (|error| "unimplemented"))))))))))) 

(SDEFUN |BRINFO;get_conname| ((|form| (|String|)) (% (|String|)))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (SPADCALL (QREFELT % 29) |form| (QREFELT % 140)))
                    (EXIT
                     (COND
                      ((< |k| 1)
                       (SPADCALL |form|
                                 (SPADCALL 2 (QCSIZE |form|) (QREFELT % 142))
                                 (QREFELT % 143)))
                      ('T
                       (SPADCALL |form| (SPADCALL 2 (- |k| 1) (QREFELT % 142))
                                 (QREFELT % 143)))))))) 

(MAKEPROP '|BRINFO;constructor_form;SSe;76| '|SPADreplace|
          '|getConstructorForm|) 

(SDEFUN |BRINFO;constructor_form;SSe;76|
        ((|name| (|Symbol|)) (% (|SExpression|))) (|getConstructorForm| |name|)) 

(SDEFUN |BRINFO;get_constructor_args|
        ((|name| (|Symbol|)) (% (|List| (|SExpression|))))
        (SPROG ((|form| (|List| (|SExpression|))))
               (SEQ
                (LETT |form|
                      (SPADCALL (SPADCALL |name| (QREFELT % 122))
                                (QREFELT % 17)))
                (EXIT (CDR |form|))))) 

(SDEFUN |BRINFO;constructor_documentation;SS;78|
        ((|name| (|Symbol|)) (% (|String|)))
        (SPROG ((|e1| (|SExpression|)) (|doc| (|List| (|SExpression|))))
               (SEQ (LETT |doc| (|get_database| |name| 'DOCUMENTATION))
                    (EXIT
                     (COND ((NULL |doc|) "")
                           ('T
                            (SEQ
                             (LETT |doc|
                                   (SPADCALL (|SPADfirst| |doc|)
                                             (QREFELT % 17)))
                             (LETT |e1| (|SPADfirst| |doc|))
                             (COND
                              ((NULL
                                (EQUAL (SPADCALL |e1| (QREFELT % 12))
                                       '|constructor|))
                               (EXIT "")))
                             (LETT |doc|
                                   (SPADCALL (SPADCALL |doc| 2 (QREFELT % 23))
                                             (QREFELT % 17)))
                             (EXIT
                              (SPADCALL (SPADCALL |doc| 2 (QREFELT % 23))
                                        (QREFELT % 83)))))))))) 

(SDEFUN |BRINFO;add_stars| ((|pat1| (|String|)) (% (|String|)))
        (SPROG ((|pre| (|String|)) (|post| (|String|)))
               (SEQ
                (LETT |pre|
                      (COND
                       ((|eql_SI| (SPADCALL |pat1| 1 (QREFELT % 35))
                                  (QREFELT % 30))
                        "")
                       (#1='T "*")))
                (LETT |post|
                      (COND
                       ((|eql_SI|
                         (SPADCALL |pat1| (QCSIZE |pat1|) (QREFELT % 35))
                         (QREFELT % 30))
                        "")
                       (#1# "*")))
                (EXIT (SPADCALL (LIST |pre| |pat1| |post|) (QREFELT % 149)))))) 

(SDEFUN |BRINFO;search_ops_doc|
        ((|pc| (|LogicalMatchingAutomaton|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|opr| NIL) (#1=#:G722 NIL) (|name| (|Symbol|)) (|sd| NIL)
          (#2=#:G723 NIL)
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ
          (COND
           ((NULL (QREFELT % 129))
            (SEQ (SETELT % 128 (SPADCALL (QREFELT % 127)))
                 (EXIT (SETELT % 129 'T)))))
          (LETT |res| NIL)
          (SEQ (LETT |opr| NIL) (LETT #1# (QREFELT % 128)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |name| (QCAR |opr|))
                    (EXIT
                     (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |opr|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |sd| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |pc| (QVELT |sd| 3) (QREFELT % 53))
                              (LETT |res| (CONS (CONS |name| |sd|) |res|))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (|BRINFO;group_funs| (NREVERSE |res|) %))))) 

(SDEFUN |BRINFO;search_con_doc|
        ((|pc| (|LogicalMatchingAutomaton|))
         (%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((#1=#:G732 NIL) (#2=#:G733 NIL) (|cnl| (|List| (|Symbol|)))
          (|cn| NIL) (#3=#:G734 NIL) (|doc| (|String|))
          (|res1| (|List| (|Symbol|))))
         (SEQ
          (LETT |cnl|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |cn| NIL) (LETT #2# (|BRINFO;all_con_names| %))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |cn| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |cn| (QREFELT % 126)))
                          (LETT #1# (CONS |cn| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |res1| NIL)
          (SEQ (LETT |cn| NIL) (LETT #3# |cnl|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |cn| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |doc| (SPADCALL |cn| (QREFELT % 148)))
                    (EXIT
                     (COND
                      ((SPADCALL |pc| (SPADCALL |cn| (QREFELT % 148))
                                 (QREFELT % 53))
                       (LETT |res1| (CONS |cn| |res1|))))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|BRINFO;split_constructors| (SPADCALL |res1| (QREFELT % 137)) %))))) 

(SDEFUN |BRINFO;search_documentation;SU;82|
        ((|pat| (|String|))
         (%
          (|Union|
           (|Record|
            (|:| |con_info|
                 (|Record| (|:| |categories| (|List| (|Symbol|)))
                           (|:| |domains| (|List| (|Symbol|)))
                           (|:| |packages| (|List| (|Symbol|)))))
            (|:| |op_info|
                 (|List|
                  (|Record| (|:| |name| (|Symbol|))
                            (|:| |sdl|
                                 (|List|
                                  (|Record| (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|)))))))))
           (|ErrorIndicator|))))
        (SPROG
         ((|pcu| (|Union| (|LogicalMatchingAutomaton|) (|ErrorIndicator|)))
          (|pc| (|LogicalMatchingAutomaton|))
          (|cl|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (COND
           ((EQUAL |pat| "")
            (CONS 1 (SPADCALL (LIST "Invalid pattern") (QREFELT % 48))))
           (#1='T
            (SEQ (LETT |pat| (|BRINFO;add_stars| |pat| %))
                 (LETT |pcu| (SPADCALL |pat| (QREFELT % 50)))
                 (EXIT
                  (COND ((QEQCAR |pcu| 1) (CONS 1 (QCDR |pcu|)))
                        (#1#
                         (SEQ (LETT |pc| (QCDR |pcu|))
                              (LETT |cl| (|BRINFO;search_con_doc| |pc| %))
                              (LETT |opl| (|BRINFO;search_ops_doc| |pc| %))
                              (EXIT (CONS 0 (CONS |cl| |opl|))))))))))))) 

(SDEFUN |BRINFO;search_general;SU;83|
        ((|pat| (|String|))
         (%
          (|Union|
           (|Record|
            (|:| |con_info|
                 (|Record| (|:| |categories| (|List| (|Symbol|)))
                           (|:| |domains| (|List| (|Symbol|)))
                           (|:| |packages| (|List| (|Symbol|)))))
            (|:| |op_info|
                 (|List|
                  (|Record| (|:| |name| (|Symbol|))
                            (|:| |sdl|
                                 (|List|
                                  (|Record| (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|)))))))))
           (|ErrorIndicator|))))
        (SPROG
         ((|cu|
           (|Union|
            (|Record| (|:| |categories| (|List| (|Symbol|)))
                      (|:| |domains| (|List| (|Symbol|)))
                      (|:| |packages| (|List| (|Symbol|))))
            (|ErrorIndicator|)))
          (|ou|
           (|Union|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
            (|ErrorIndicator|))))
         (SEQ (LETT |cu| (SPADCALL |pat| '|k| (QREFELT % 147)))
              (EXIT
               (COND ((QEQCAR |cu| 1) (CONS 1 (QCDR |cu|)))
                     (#1='T
                      (SEQ (LETT |ou| (SPADCALL |pat| (QREFELT % 130)))
                           (EXIT
                            (COND ((QEQCAR |ou| 1) (CONS 1 (QCDR |ou|)))
                                  (#1#
                                   (CONS 0
                                         (CONS (QCDR |cu|)
                                               (QCDR |ou|))))))))))))) 

(DECLAIM (NOTINLINE |BrowserInformation;|)) 

(DEFUN |BrowserInformation;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BrowserInformation|))
          (LETT % (GETREFV 156))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BrowserInformation| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 26 (|STR_to_CHAR| "a"))
          (QSETREFV % 27 (|STR_to_CHAR| "A"))
          (QSETREFV % 28 (|STR_to_CHAR| "Z"))
          (QSETREFV % 29 (|STR_to_CHAR| "("))
          (QSETREFV % 30 (|STR_to_CHAR| "*"))
          (QSETREFV % 31 (|STR_to_CHAR| "`"))
          (QSETREFV % 128 NIL)
          (QSETREFV % 129 NIL)
          %))) 

(DEFUN |BrowserInformation| ()
  (SPROG NIL
         (PROG (#1=#:G765)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BrowserInformation|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BrowserInformation|
                             (LIST
                              (CONS NIL (CONS 1 (|BrowserInformation;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|BrowserInformation|)))))))))) 

(MAKEPROP '|BrowserInformation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SExpression|) (|List| 6)
              |BRINFO;sublis_formal;L2Se;1| (|Boolean|) (0 . |symbol?|)
              (|Symbol|) (5 . |symbol|) (10 . |pair?|) (15 . |car|)
              (20 . |cdr|) (|List| %) (25 . |destruct|) (30 . |null?|)
              (35 . |member?|) (41 . |convert|) (46 . =) (|Integer|)
              (52 . |elt|) |BRINFO;constructor_signature;SSe;5|
              |BRINFO;constructor_signature;SLSe;6| '|char_a| '|char_A|
              '|char_Z| '|char_lpar| '|char_star| '|char_tick| (|Character|)
              (58 . |space|) (|String|) (62 . |elt|) (68 . >=) (74 . <=)
              (80 . |char|) (85 . |setelt!|) |BRINFO;downcase;2S;7|
              (92 . |list?|) (97 . |convert|) (|Union| 51 '"failed")
              (|LogicalRegularExpressionMatch|) (102 . |parse_pattern|)
              (|List| 34) (|ErrorIndicator|) (108 . |coerce|) (|Union| 51 47)
              |BRINFO;convert_pattern;SU;9| (|LogicalMatchingAutomaton|)
              (113 . |do_match|) |BRINFO;do_match;LmaSB;10| (119 . |string|)
              (|Record| (|:| |signature| 6) (|:| |condition| 6)
                        (|:| |origin| 6) (|:| |documentation| 34))
              (|Record| (|:| |name| 11) (|:| |sdl| (|List| 55))) (|List| 56)
              |BRINFO;filter_ops;Lma2L;11| (|Union| 57 47)
              |BRINFO;search_opl;SLU;12| |BRINFO;constructor_name?;SB;13|
              |BRINFO;exposed_constructor?;SB;14|
              |BRINFO;simp_ops_conditions;L2SeL;15|
              (|Record| (|:| |form| 6) (|:| |condition| 6))
              (|Record| (|:| |cats| 72) (|:| |ops| 57)) |BRINFO;exports;SeR;49|
              (|Pattern| (|Float|)) (124 . |convert|) (|XHashTable| 6 55)
              (129 . |key?|) (135 . |setelt!|) (|List| 64)
              |BRINFO;parents;SeL;68| (142 . |empty|)
              |BRINFO;ancestors;2SeL;60| (146 . |elt|)
              (|Record| (|:| |name| 11) (|:| |sd| 55)) (|Mapping| 9 77 77)
              (|List| 77) (152 . |sort|) |BRINFO;operations;2SeL;18|
              (158 . |string?|) (163 . |string|) (168 . |integer?|)
              (173 . |integer|)
              (|Record| (|:| |i| 22) (|:| |name| 11) (|:| |sd| 55))
              (|Mapping| 9 86 86) (|List| 86) (178 . |sort|)
              (|Record| (|:| |grp_tag| 6) (|:| |i| 22) (|:| |name| 11)
                        (|:| |sd| 55))
              (|Mapping| 9 90 90) (|List| 90) (184 . |sort|)
              (|Record| (|:| |grp_tag| 6) (|:| |ops| 57)) (|List| 94)
              |BRINFO;group_by_condition;LL;25| |BRINFO;group_by_origin;LL;26|
              |BRINFO;group_by_implementation;LSeLL;27| (190 . =) (196 . <)
              (|Record| (|:| |signature| 6) (|:| |condition| 6)) (202 . =)
              (|Record| (|:| |name| 11) (|:| |sigs| (|List| 101)))
              (|Mapping| 9 103 103) (|List| 103) (208 . |sort|)
              (|Mapping| 9 6 6) (214 . |sort|) (|FileName|) (220 . |coerce|)
              (|BasicKeyedAccessFile|) (225 . |open|) (|None|) (231 . |read|)
              (|Void|) (238 . |close!|) (|List| 11) |BRINFO;dependents;SL;45|
              |BRINFO;users;SL;46| |BRINFO;uses;S2SeL;47|
              |BRINFO;search_path;2SeNL;48| |BRINFO;constructor_form;SSe;76|
              (|OutputForm|) (243 . |coerce|) (248 . |print|)
              |BRINFO;default_name?;SB;69| |BRINFO;ops_from_exports;L;56|
              '|all_ops| '|all_ops_initialized|
              |BRINFO;search_operations;SU;57| (|Mapping| 9 34 55)
              |BRINFO;search_operations;ML;58| |BRINFO;constructor_kind;2S;59|
              |BRINFO;children;2SeL;61| |BRINFO;descendants;2SeL;62|
              |BRINFO;domains;2SeL;67| (253 . |sort|)
              (|Record| (|:| |categories| 117) (|:| |domains| 117)
                        (|:| |packages| 117))
              |BRINFO;all_constructors;R;71| (258 . |position|)
              (|UniversalSegment| 22) (264 . SEGMENT) (270 . |elt|)
              (276 . |coerce|) |BRINFO;filter_symbols;Lma2L;73|
              (|Union| 138 47) |BRINFO;search_constructors;SSU;74|
              |BRINFO;constructor_documentation;SS;78| (281 . |concat|)
              (|Record| (|:| |con_info| 138) (|:| |op_info| 57))
              (|Union| 150 47) |BRINFO;search_documentation;SU;82|
              |BRINFO;search_general;SU;83|
              (|Record| (|:| |grp_tag| 6) (|:| |constrs| 72)) (|List| 154))
           '#(|uses| 286 |users| 293 |sublis_formal| 298 |simp_ops_conditions|
              304 |search_path| 311 |search_opl| 318 |search_operations| 324
              |search_general| 334 |search_documentation| 339
              |search_constructors| 344 |parents| 350 |ops_from_exports| 355
              |operations| 359 |group_by_origin| 365 |group_by_implementation|
              370 |group_by_condition| 377 |filter_symbols| 387 |filter_ops|
              393 |exposed_constructor?| 399 |exports| 404 |downcase| 409
              |domains| 414 |do_match| 420 |descendants| 426 |dependents| 432
              |default_name?| 437 |convert_pattern| 442 |constructor_signature|
              447 |constructor_name?| 458 |constructor_kind| 463
              |constructor_form| 468 |constructor_documentation| 473 |children|
              478 |ancestors| 484 |all_constructors| 490)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|constructor_documentation|
                                 ((|String|) (|Symbol|)))
                                T)
                              '((|constructor_form|
                                 ((|SExpression|) (|Symbol|)))
                                T)
                              '((|constructor_kind| ((|Symbol|) (|Symbol|))) T)
                              '((|constructor_name?| ((|Boolean|) (|Symbol|)))
                                T)
                              '((|constructor_signature|
                                 ((|SExpression|) (|Symbol|)))
                                T)
                              '((|constructor_signature|
                                 ((|SExpression|) (|Symbol|)
                                  (|List| (|SExpression|))))
                                T)
                              '((|default_name?| ((|Boolean|) (|Symbol|))) T)
                              '((|exposed_constructor?|
                                 ((|Boolean|) (|Symbol|)))
                                T)
                              '((|exports|
                                 ((|Record|
                                   (|:| |cats|
                                        (|List|
                                         (|Record| (|:| |form| (|SExpression|))
                                                   (|:| |condition|
                                                        (|SExpression|)))))
                                   (|:| |ops|
                                        (|List|
                                         (|Record| (|:| |name| (|Symbol|))
                                                   (|:| |sdl|
                                                        (|List|
                                                         (|Record|
                                                          (|:| |signature|
                                                               (|SExpression|))
                                                          (|:| |condition|
                                                               (|SExpression|))
                                                          (|:| |origin|
                                                               (|SExpression|))
                                                          (|:| |documentation|
                                                               (|String|)))))))))
                                  (|SExpression|)))
                                T)
                              '((|ancestors|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|) (|SExpression|)))
                                T)
                              '((|children|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|) (|SExpression|)))
                                T)
                              '((|descendants|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|) (|SExpression|)))
                                T)
                              '((|domains|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|) (|SExpression|)))
                                T)
                              '((|parents|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|)))
                                T)
                              '((|dependents| ((|List| (|Symbol|)) (|Symbol|)))
                                T)
                              '((|users| ((|List| (|Symbol|)) (|Symbol|))) T)
                              '((|uses|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|Symbol|) (|SExpression|) (|SExpression|)))
                                T)
                              '((|search_path|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|) (|SExpression|) (|None|)))
                                T)
                              '((|operations|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|SExpression|) (|SExpression|)))
                                T)
                              '((|simp_ops_conditions|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|SExpression|) (|SExpression|)))
                                T)
                              '((|all_constructors|
                                 ((|Record|
                                   (|:| |categories| (|List| (|Symbol|)))
                                   (|:| |domains| (|List| (|Symbol|)))
                                   (|:| |packages| (|List| (|Symbol|))))))
                                T)
                              '((|search_constructors|
                                 ((|Union|
                                   (|Record|
                                    (|:| |categories| (|List| (|Symbol|)))
                                    (|:| |domains| (|List| (|Symbol|)))
                                    (|:| |packages| (|List| (|Symbol|))))
                                   (|ErrorIndicator|))
                                  (|String|) (|Symbol|)))
                                T)
                              '((|search_operations|
                                 ((|Union|
                                   (|List|
                                    (|Record| (|:| |name| (|Symbol|))
                                              (|:| |sdl|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |signature|
                                                          (|SExpression|))
                                                     (|:| |condition|
                                                          (|SExpression|))
                                                     (|:| |origin|
                                                          (|SExpression|))
                                                     (|:| |documentation|
                                                          (|String|)))))))
                                   (|ErrorIndicator|))
                                  (|String|)))
                                T)
                              '((|search_operations|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|Mapping| (|Boolean|) (|String|)
                                             (|Record|
                                              (|:| |signature| (|SExpression|))
                                              (|:| |condition| (|SExpression|))
                                              (|:| |origin| (|SExpression|))
                                              (|:| |documentation|
                                                   (|String|))))))
                                T)
                              '((|search_documentation|
                                 ((|Union|
                                   (|Record|
                                    (|:| |con_info|
                                         (|Record|
                                          (|:| |categories|
                                               (|List| (|Symbol|)))
                                          (|:| |domains| (|List| (|Symbol|)))
                                          (|:| |packages|
                                               (|List| (|Symbol|)))))
                                    (|:| |op_info|
                                         (|List|
                                          (|Record| (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|)))))))))
                                   (|ErrorIndicator|))
                                  (|String|)))
                                T)
                              '((|search_general|
                                 ((|Union|
                                   (|Record|
                                    (|:| |con_info|
                                         (|Record|
                                          (|:| |categories|
                                               (|List| (|Symbol|)))
                                          (|:| |domains| (|List| (|Symbol|)))
                                          (|:| |packages|
                                               (|List| (|Symbol|)))))
                                    (|:| |op_info|
                                         (|List|
                                          (|Record| (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|)))))))))
                                   (|ErrorIndicator|))
                                  (|String|)))
                                T)
                              '((|group_by_condition|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |constrs|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |form|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|)))))))
                                  (|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))))
                                T)
                              '((|group_by_origin|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |ops|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|))))))))))
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|group_by_condition|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |ops|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|))))))))))
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|group_by_implementation|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |ops|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|))))))))))
                                  (|List| (|SExpression|)) (|SExpression|)
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|search_opl|
                                 ((|Union|
                                   (|List|
                                    (|Record| (|:| |name| (|Symbol|))
                                              (|:| |sdl|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |signature|
                                                          (|SExpression|))
                                                     (|:| |condition|
                                                          (|SExpression|))
                                                     (|:| |origin|
                                                          (|SExpression|))
                                                     (|:| |documentation|
                                                          (|String|)))))))
                                   (|ErrorIndicator|))
                                  (|String|)
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|convert_pattern|
                                 ((|Union| (|LogicalMatchingAutomaton|)
                                           (|ErrorIndicator|))
                                  (|String|)))
                                T)
                              '((|do_match|
                                 ((|Boolean|) (|LogicalMatchingAutomaton|)
                                  (|String|)))
                                T)
                              '((|filter_ops|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|LogicalMatchingAutomaton|)
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|filter_symbols|
                                 ((|List| (|Symbol|))
                                  (|LogicalMatchingAutomaton|)
                                  (|List| (|Symbol|))))
                                T)
                              '((|ops_from_exports|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|downcase| ((|String|) (|String|))) T)
                              '((|sublis_formal|
                                 ((|SExpression|) (|List| (|SExpression|))
                                  (|SExpression|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 155
                                            '(1 6 9 0 10 1 6 11 0 12 1 6 9 0 13
                                              1 6 0 0 14 1 6 0 0 15 1 6 16 0 17
                                              1 6 9 0 18 2 7 9 6 0 19 1 6 0 16
                                              20 2 6 9 0 0 21 2 7 6 0 22 23 0
                                              32 0 33 2 34 32 0 22 35 2 32 9 0
                                              0 36 2 32 9 0 0 37 1 32 0 22 38 3
                                              34 32 0 22 32 39 1 6 9 0 41 1 6 0
                                              11 42 2 44 43 34 9 45 1 47 0 46
                                              48 2 51 9 0 34 52 1 11 34 0 54 1
                                              11 67 0 68 2 69 9 6 0 70 3 69 55
                                              0 6 55 71 0 69 0 74 2 69 55 0 6
                                              76 2 79 0 78 0 80 1 6 9 0 82 1 6
                                              34 0 83 1 6 9 0 84 1 6 22 0 85 2
                                              88 0 87 0 89 2 92 0 91 0 93 2 55
                                              9 0 0 99 2 11 9 0 0 100 2 101 9 0
                                              0 102 2 105 0 104 0 106 2 7 0 107
                                              0 108 1 109 0 34 110 2 111 0 109
                                              34 112 3 111 113 0 34 113 114 1
                                              111 115 0 116 1 11 123 0 124 1
                                              123 115 0 125 1 117 0 0 137 2 34
                                              22 32 0 140 2 141 0 22 22 142 2
                                              34 0 0 141 143 1 11 0 34 144 1 34
                                              0 16 149 3 0 72 11 6 6 120 1 0
                                              117 11 119 2 0 6 7 6 8 3 0 57 57
                                              6 6 63 3 0 72 6 6 113 121 2 0 59
                                              34 57 60 1 0 57 131 132 1 0 59 34
                                              130 1 0 151 34 153 1 0 151 34 152
                                              2 0 146 34 11 147 1 0 72 6 73 0 0
                                              57 127 2 0 57 6 6 81 1 0 95 57 97
                                              3 0 95 7 6 57 98 1 0 95 57 96 1 0
                                              155 72 1 2 0 117 51 117 145 2 0
                                              57 51 57 58 1 0 9 11 62 1 0 65 6
                                              66 1 0 34 34 40 2 0 72 6 6 136 2
                                              0 9 51 34 53 2 0 72 6 6 135 1 0
                                              117 11 118 1 0 9 11 126 1 0 49 34
                                              50 1 0 6 11 24 2 0 6 11 7 25 1 0
                                              9 11 61 1 0 11 11 133 1 0 6 11
                                              122 1 0 34 11 148 2 0 72 6 6 134
                                              2 0 72 6 6 75 0 0 138 139)))))
           '|lookupComplete|)) 
