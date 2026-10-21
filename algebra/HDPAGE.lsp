
(SDEFUN |HDPAGE;name;%S;1| ((|page| (%)) (% (|Symbol|)))
        (SPROG ((|pr| (|Rep|))) (SEQ (LETT |pr| |page|) (EXIT (QVELT |pr| 0))))) 

(SDEFUN |HDPAGE;new;Hal%;2| ((|props| (|HyperdocAssociationList|)) (% (%)))
        (SPROG ((|name| (|Symbol|)) (|res| (%)) (|lst| (|List| (|Symbol|))))
               (SEQ (LETT |name| (GENTEMP))
                    (LETT |res|
                          (VECTOR |name| NIL (SPADCALL (QREFELT % 10)) NIL
                                  (SPADCALL (QREFELT % 10))
                                  (SPADCALL (QREFELT % 10)) |props| NIL NIL))
                    (SET |name| |res|)
                    (LETT |lst| (CONS |name| |$activePageList|))
                    (SETF |$activePageList| |lst|) (EXIT |res|)))) 

(SDEFUN |HDPAGE;destroy;SV;3| ((|name| (|Symbol|)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL |name| |$activePageList| (QREFELT % 14))
           (SEQ (SET |name| NIL)
                (EXIT (SPADCALL |name| |$activePageList| (QREFELT % 15)))))))) 

(SDEFUN |HDPAGE;get_property_list;%Hal;4|
        ((|page| (%)) (% (|HyperdocAssociationList|)))
        (SPROG ((|pr| (|Rep|))) (SEQ (LETT |pr| |page|) (EXIT (QVELT |pr| 6))))) 

(SDEFUN |HDPAGE;add_to_description;%SV;5|
        ((|page| (%)) (|s| (|String|)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (QSETVELT |pr| 7
                               (CONS (SPADCALL |s| (QREFELT % 21))
                                     (QVELT |pr| 7))))))) 

(SDEFUN |HDPAGE;add_to_description;%LV;6|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)) (|el| NIL) (#1=#:G85 NIL))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (QSETVELT |pr| 7 (CONS |el| (QVELT |pr| 7)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;setup_default|
        ((|page| (%)) (|name| (|Symbol|)) (|props| (|List| (|SExpression|)))
         (% (|Void|)))
        (SPROG ((|pr| (|Rep|)) (|pp| (|List| (|SExpression|))))
               (SEQ (LETT |pr| |page|)
                    (LETT |pp|
                          (LIST (SPADCALL NIL (QREFELT % 26))
                                (SPADCALL NIL (QREFELT % 26))
                                (SPADCALL NIL (QREFELT % 26))))
                    (LETT |pp| (SPADCALL |pp| |props| (QREFELT % 27)))
                    (EXIT
                     (QSETVELT |pr| 5
                               (SPADCALL
                                (CONS |name| (SPADCALL |pp| (QREFELT % 26)))
                                (QVELT |pr| 5) (QREFELT % 29))))))) 

(SDEFUN |HDPAGE;get_property;%SSe;8|
        ((|page| (%)) (|name| (|Symbol|)) (% (|SExpression|)))
        (SPROG
         ((|pr| (|Rep|)) (|props| (|HyperdocAssociationList|))
          (|u1|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|ar|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))))
         (SEQ (LETT |pr| |page|) (LETT |props| (QVELT |pr| 6))
              (LETT |u1| (|HDPAGE;hd_assoc| |name| |props| %))
              (EXIT
               (COND ((QEQCAR |u1| 1) (SPADCALL NIL (QREFELT % 26)))
                     ('T (SEQ (LETT |ar| (QCDR |u1|)) (EXIT (QCDR |ar|))))))))) 

(SDEFUN |HDPAGE;set_property;%SSeV;9|
        ((|page| (%)) (|name| (|Symbol|)) (|val| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|props| (|HyperdocAssociationList|))
          (|u1|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|ar|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))))
         (SEQ (LETT |pr| |page|) (LETT |props| (QVELT |pr| 6))
              (LETT |u1| (|HDPAGE;hd_assoc| |name| |props| %))
              (EXIT
               (COND
                ((QEQCAR |u1| 1)
                 (QSETVELT |pr| 6
                           (SPADCALL (CONS |name| |val|) |props|
                                     (QREFELT % 29))))
                ('T
                 (SEQ (LETT |ar| (QCDR |u1|))
                      (EXIT (PROGN (RPLACD |ar| |val|) (QCDR |ar|)))))))))) 

(SDEFUN |HDPAGE;input_string;%SU;10|
        ((|page| (%)) (|name| (|Symbol|)) (% (|Union| (|String|) "failed")))
        (SPROG
         ((|pr| (|Rep|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| #1=(|SExpression|)))
            "failed"))
          (|ae| #1#) (|sv| (|SExpression|)))
         (SEQ (LETT |pr| |page|)
              (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
              (EXIT
               (COND
                ((OR (QEQCAR |alr| 1)
                     (SPADCALL (LETT |ae| (QCDR (QCDR |alr|))) (QREFELT % 32)))
                 (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |sv| (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 33)))
                      (EXIT
                       (COND
                        ((SPADCALL |sv| (QREFELT % 34))
                         (CONS 0 (SPADCALL |sv| (QREFELT % 35))))
                        ('T (CONS 1 "failed"))))))))))) 

(SDEFUN |HDPAGE;set_input_string;%SSV;11|
        ((|page| (%)) (|name| (|Symbol|)) (|s| (|String|)) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|ae| (|List| (|SExpression|))))
         (SEQ (LETT |pr| |page|)
              (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
              (EXIT
               (COND ((QEQCAR |alr| 1) (SPADCALL (QREFELT % 38)))
                     ('T
                      (SEQ
                       (LETT |ae|
                             (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 39)))
                       (EXIT
                        (SPADCALL |ae| 1 (SPADCALL |s| (QREFELT % 21))
                                  (QREFELT % 41)))))))))) 

(SDEFUN |HDPAGE;button_on?;%SB;12|
        ((|page| (%)) (|name| (|Symbol|)) (% (|Boolean|)))
        (SPROG
         ((|pr| (|Rep|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| #1=(|SExpression|)))
            "failed"))
          (|ae| #1#) (|bv| (|SExpression|)))
         (SEQ (LETT |pr| |page|)
              (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
              (EXIT
               (COND
                ((OR (QEQCAR |alr| 1)
                     (SPADCALL (LETT |ae| (QCDR (QCDR |alr|))) (QREFELT % 32)))
                 NIL)
                ('T
                 (SEQ (LETT |bv| (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 33)))
                      (EXIT
                       (COND
                        ((SPADCALL |bv| (QREFELT % 34))
                         (EQUAL (SPADCALL |bv| (QREFELT % 35)) " t"))
                        ('T NIL)))))))))) 

(SDEFUN |HDPAGE;button_value;%2S;13|
        ((|page| (%)) (|name| (|Symbol|)) (% (|Symbol|)))
        (SPROG
         ((|pr| (|Rep|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| #1=(|SExpression|)))
            "failed"))
          (|ae| #1#) (|sl| (|List| (|Symbol|))) (|s| NIL) (#2=#:G149 NIL)
          (#3=#:G148 NIL) (#4=#:G147 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |pr| |page|)
                (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 4) %))
                (EXIT
                 (COND
                  ((QEQCAR |alr| 1)
                   (|error| "button_value: button group does not exist"))
                  ((OR
                    (SPADCALL (LETT |ae| (QCDR (QCDR |alr|))) (QREFELT % 32))
                    (NULL (SPADCALL |ae| (QREFELT % 44))))
                   (|error| "button_value: button group should be a list"))
                  ('T
                   (SEQ (LETT |sl| (SPADCALL |ae| (QREFELT % 39)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |s| NIL) (LETT #2# |sl|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |s| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL |page| |s| (QREFELT % 43))
                                   (PROGN
                                    (LETT #4#
                                          (PROGN
                                           (LETT #3# |s|)
                                           (GO #5=#:G146)))
                                    (GO #6=#:G143))))))
                               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #4#))
                        (EXIT (|error| "button_value: no button on!"))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |HDPAGE;process_add1|
        ((|page| (%)) (|item| (|SExpression|)) (% (|Void|)))
        (COND
         ((SPADCALL |item| (QREFELT % 44))
          (|HDPAGE;process_add| |page| (SPADCALL |item| (QREFELT % 39)) %)))) 

(SDEFUN |HDPAGE;is_symbol|
        ((|se| (|SExpression|)) (|sym| (|Symbol|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |se| (QREFELT % 46))
          (EQUAL (SPADCALL |se| (QREFELT % 47)) |sym|))
         ('T NIL))) 

(SDEFUN |HDPAGE;pattern_substitution_list|
        ((|cl| (|List| (|SExpression|)))
         (%
          (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|))))))
        (SPROG
         ((|c| NIL) (#1=#:G173 NIL) (|cl1| (|List| (|SExpression|)))
          (#2=#:G172 NIL) (|op| #3=(|SExpression|)) (|pv| #3#)
          (|res|
           (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|)))))
          (|pat_vars| (|List| (|Symbol|))))
         (SEQ (LETT |res| NIL) (LETT |pat_vars| |$PatternVariableList|)
              (SEQ (LETT |c| NIL) (LETT #1# |cl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |c| (QREFELT % 44)))
                       (PROGN (LETT #2# |$NoValue|) (GO #4=#:G156)))
                      ('T
                       (SEQ (LETT |cl1| (SPADCALL |c| (QREFELT % 39)))
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |cl1|) 3 (QREFELT % 49))
                               (PROGN (LETT #2# |$NoValue|) (GO #4#)))
                              ('T
                               (SEQ (LETT |op| (|SPADfirst| |cl1|))
                                    (LETT |pv| (|SPADfirst| (CDR |cl1|)))
                                    (EXIT
                                     (COND
                                      ((OR
                                        (|HDPAGE;is_symbol| |op| '|isDomain| %)
                                        (OR
                                         (|HDPAGE;is_symbol| |op| '|ofCategory|
                                          %)
                                         (|HDPAGE;is_symbol| |op| '|Satisfies|
                                          %)))
                                       (SEQ
                                        (COND
                                         ((NULL
                                           (SPADCALL |pv| |$EmptyMode|
                                                     (QREFELT % 50)))
                                          (LETT |res|
                                                (CONS
                                                 (CONS
                                                  (SPADCALL |pv|
                                                            (QREFELT % 47))
                                                  (|SPADfirst| |pat_vars|))
                                                 |res|))))
                                        (EXIT
                                         (LETT |pat_vars|
                                               (CDR |pat_vars|)))))))))))))))
                    #4# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |HDPAGE;substitute_pvars|
        ((|cl| (|List| (|SExpression|)))
         (|pat_sl|
          (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|)))))
         (% (|List| (|SExpression|))))
        (SPROG ((|sr| NIL) (#1=#:G178 NIL))
               (SEQ
                (SEQ (LETT |sr| NIL) (LETT #1# |pat_sl|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |cl|
                             (|substitute| (QCDR |sr|) (QCAR |sr|) |cl|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |cl|)))) 

(SDEFUN |HDPAGE;get_vars| ((|pat| (|SExpression|)) (% (|List| (|Symbol|))))
        (SPROG
         ((|p1| NIL) (#1=#:G186 NIL) (|s1| (|Symbol|))
          (|res| (|List| (|Symbol|))))
         (SEQ (LETT |res| NIL)
              (COND ((NULL (SPADCALL |pat| (QREFELT % 44))) (EXIT |res|)))
              (SEQ (LETT |p1| NIL)
                   (LETT #1# (CDR (SPADCALL |pat| (QREFELT % 39)))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |p1| (QREFELT % 46))
                       (COND
                        ((SPADCALL (LETT |s1| (SPADCALL |p1| (QREFELT % 47)))
                                   |$PatternVariableList| (QREFELT % 14))
                         (LETT |res| (CONS |s1| |res|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |HDPAGE;compute_conds|
        ((|page| (%)) (|v1| #1=(|Symbol|)) (% (|SExpression|)))
        (SPROG
         ((|c1| NIL) (#2=#:G197 NIL) (#3=#:G196 NIL)
          (|cl1| (|List| (|SExpression|))) (|pv| #4=(|SExpression|))
          (|res| (|List| (|SExpression|))) (|pat| #4#) (|pvars| (|List| #1#)))
         (SEQ (LETT |res| NIL) (LETT |pvars| (LIST |v1|))
              (SEQ (LETT |c1| NIL) (LETT #2# (QVELT |page| 1)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |c1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |c1| (QREFELT % 44)))
                       (PROGN (LETT #3# |$NoValue|) (GO #5=#:G187)))
                      ('T
                       (SEQ (LETT |cl1| (SPADCALL |c1| (QREFELT % 39)))
                            (COND
                             ((NULL (EQL (LENGTH |cl1|) 3))
                              (EXIT (PROGN (LETT #3# |$NoValue|) (GO #5#)))))
                            (LETT |cl1| (CDR |cl1|))
                            (LETT |pv| (|SPADfirst| |cl1|))
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |pv| (QREFELT % 47)) |pvars|
                                         (QREFELT % 14))
                               (SEQ (LETT |res| (CONS |c1| |res|))
                                    (LETT |pat| (|SPADfirst| (CDR |cl1|)))
                                    (EXIT
                                     (LETT |pvars|
                                           (SPADCALL |pvars|
                                                     (|HDPAGE;get_vars| |pat|
                                                      %)
                                                     (QREFELT % 51))))))))))))
                    #5# (EXIT #3#))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (NREVERSE |res|) (QREFELT % 26)))))) 

(SDEFUN |HDPAGE;compute_variable_alist|
        ((|page| (%))
         (|pat_sl|
          (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|)))))
         (% (|HyperdocAssociationList|)))
        (SPROG
         ((|sr| NIL) (#1=#:G204 NIL) (|v1| (|Symbol|))
          (|res| (|HyperdocAssociationList|)))
         (SEQ (LETT |res| (SPADCALL (QREFELT % 10)))
              (SEQ (LETT |sr| NIL) (LETT #1# |pat_sl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |v1| (QCDR |sr|))
                        (EXIT
                         (LETT |res|
                               (SPADCALL
                                (CONS |v1|
                                      (|HDPAGE;compute_conds| |page| |v1| %))
                                |res| (QREFELT % 29)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 52)))))) 

(SDEFUN |HDPAGE;process_domain_conditions|
        ((|page| (%)) (|cl| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|pat_sl|
           (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|))))))
         (SEQ (LETT |pat_sl| (|HDPAGE;pattern_substitution_list| |cl| %))
              (QSETVELT |page| 3 |pat_sl|)
              (QSETVELT |page| 1 (|HDPAGE;substitute_pvars| |cl| |pat_sl| %))
              (EXIT
               (QSETVELT |page| 2
                         (|HDPAGE;compute_variable_alist| |page| |pat_sl|
                          %)))))) 

(SDEFUN |HDPAGE;button_names|
        ((|l| (|List| (|SExpression|))) (% (|List| (|SExpression|))))
        (SPROG ((#1=#:G210 NIL) (|el| NIL) (#2=#:G211 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |el| NIL) (LETT #2# |l|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |el| (QREFELT % 39)) 3
                                         (QREFELT % 53))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |HDPAGE;process_radio_buttons|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|group_name| #1=(|Symbol|))
          (|buttons| (|List| (|SExpression|))) (|el| NIL) (#2=#:G223 NIL)
          (|#G53| #3=(|List| (|SExpression|))) (|message| NIL) (|info| NIL)
          (|#G54| #3#) (|buttonName| NIL) (|button_name| #1#)
          (|default| (|String|)))
         (SEQ (LETT |pr| |page|)
              (LETT |group_name| (SPADCALL (|SPADfirst| |l|) (QREFELT % 47)))
              (LETT |buttons| (CDR |l|))
              (QSETVELT |pr| 4
                        (SPADCALL
                         (CONS |group_name|
                               (SPADCALL (|HDPAGE;button_names| |buttons| %)
                                         (QREFELT % 26)))
                         (QVELT |pr| 4) (QREFELT % 29)))
              (LETT |default| "1")
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #2# |buttons|) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ
                     (PROGN
                      (LETT |#G53| (SPADCALL |el| (QREFELT % 39)))
                      (LETT |#G54| |#G53|)
                      (LETT |message| (|SPADfirst| |#G54|))
                      (LETT |#G54| (CDR |#G54|))
                      (LETT |info| (|SPADfirst| |#G54|))
                      (LETT |#G54| (CDR |#G54|))
                      (LETT |buttonName| (|SPADfirst| |#G54|))
                      |#G53|)
                     (LETT |button_name|
                           (SPADCALL |buttonName| (QREFELT % 47)))
                     (COND
                      ((QEQCAR
                        (|HDPAGE;hd_assoc| |button_name| (QVELT |pr| 5) %) 1)
                       (SEQ
                        (|HDPAGE;setup_default| |page| |button_name|
                         (LIST (SPADCALL '|button| (QREFELT % 54))
                               (SPADCALL |default| (QREFELT % 21)))
                         %)
                        (EXIT (LETT |default| "0")))))
                     (|HDPAGE;process_add1| |page| |message| %)
                     (EXIT (|HDPAGE;process_add1| |page| |info| %)))
                    (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_input_string1|
        ((|page| (%)) (|l1| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|#G60| #1=(|List| (|SExpression|))) (|n_char| NIL)
          (|default| NIL) (|name_e| NIL) (|#G61| #1#) (|type| NIL)
          (|name| (|Symbol|)) (|filter| (|SExpression|)))
         (SEQ (LETT |pr| |page|)
              (PROGN
               (LETT |#G60| (SPADCALL |l1| 4 (QREFELT % 55)))
               (LETT |#G61| |#G60|)
               (LETT |n_char| (|SPADfirst| |#G61|))
               (LETT |#G61| (CDR |#G61|))
               (LETT |default| (|SPADfirst| |#G61|))
               (LETT |#G61| (CDR |#G61|))
               (LETT |name_e| (|SPADfirst| |#G61|))
               (LETT |#G61| (CDR |#G61|))
               (LETT |type| (|SPADfirst| |#G61|))
               |#G60|)
              (LETT |name| (SPADCALL |name_e| (QREFELT % 47)))
              (LETT |filter|
                    (SPADCALL (SPADCALL |l1| 4 (QREFELT % 56)) (QREFELT % 26)))
              (COND
               ((QEQCAR (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %) 1)
                (|HDPAGE;setup_default| |page| |name|
                 (LIST (SPADCALL '|string| (QREFELT % 54)) |default| |type|
                       |filter|)
                 %)))
              (EXIT
               (COND
                ((QEQCAR (|HDPAGE;label_error_msg| |page| |name| %) 0)
                 (|error| "htpLabelErrorMsg unimplemented"))))))) 

(SDEFUN |HDPAGE;process_input_strings|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|ia| (|HyperdocAssociationList|)) (|el| NIL)
          (#1=#:G239 NIL) (|l1| (|List| (|SExpression|)))
          (|#G69| #2=(|List| (|SExpression|))) (|mess1| NIL) (|#G70| #2#)
          (|mess2| NIL))
         (SEQ (LETT |pr| |page|) (LETT |ia| (QVELT |pr| 5))
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 39)))
                         (PROGN
                          (LETT |#G69| (SPADCALL |l1| 2 (QREFELT % 55)))
                          (LETT |#G70| |#G69|)
                          (LETT |mess1| (|SPADfirst| |#G70|))
                          (LETT |#G70| (CDR |#G70|))
                          (LETT |mess2| (|SPADfirst| |#G70|))
                          |#G69|)
                         (|HDPAGE;process_input_string1| |page|
                          (SPADCALL |l1| 2 (QREFELT % 56)) %)
                         (|HDPAGE;process_add1| |page| |mess1| %)
                         (EXIT (|HDPAGE;process_add1| |page| |mess2| %)))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_bc_buttons|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|ia| (|HyperdocAssociationList|)) (|el| NIL)
          (#1=#:G249 NIL) (|l1| (|List| (|SExpression|)))
          (|default_val| (|SExpression|)) (|name| (|Symbol|))
          (|s_res|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed")))
         (SEQ (LETT |pr| |page|) (LETT |ia| (QVELT |pr| 5))
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 39)))
                         (LETT |default_val| (|SPADfirst| |l1|))
                         (LETT |name|
                               (SPADCALL (SPADCALL |l1| (QREFELT % 57))
                                         (QREFELT % 47)))
                         (LETT |s_res| (|HDPAGE;hd_assoc| |name| |ia| %))
                         (EXIT
                          (COND
                           ((QEQCAR |s_res| 1)
                            (|HDPAGE;setup_default| |page| |name|
                             (LIST (SPADCALL '|button| (QREFELT % 54))
                                   |default_val|)
                             %)))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_bc_strings|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|el| NIL) (#1=#:G255 NIL)
          (|l1| (|List| (|SExpression|))))
         (SEQ (LETT |pr| |page|)
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 39)))
                         (EXIT (|HDPAGE;process_input_string1| |page| |l1| %)))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_add|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|el| NIL) (#1=#:G268 NIL) (#2=#:G267 NIL)
          (|l1| (|List| (|SExpression|))) (|op| (|Symbol|))
          (|args| (|List| (|SExpression|))) (#3=#:G266 NIL))
         (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL)) (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |el| (QREFELT % 58))
                  (PROGN (LETT #2# |$NoValue|) (GO #4=#:G256)))
                 ('T
                  (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 39)))
                       (LETT |op| (SPADCALL (|SPADfirst| |l1|) (QREFELT % 47)))
                       (LETT |args| (CDR |l1|))
                       (COND
                        ((OR (EQUAL |op| '|radioButtons|)
                             (EQUAL |op| '|bcRadioButtons|))
                         (EXIT
                          (|HDPAGE;process_radio_buttons| |page| |args| %))))
                       (EXIT
                        (COND
                         ((EQUAL |op| '|inputStrings|)
                          (|HDPAGE;process_input_strings| |page| |args| %))
                         ((EQUAL |op| '|domainConditions|)
                          (|HDPAGE;process_domain_conditions| |page| |args| %))
                         ((EQUAL |op| '|bcButtons|)
                          (|HDPAGE;process_bc_buttons| |page| |args| %))
                         ('T
                          (SEQ
                           (EXIT
                            (COND
                             ((EQUAL |op| '|bcStrings|)
                              (PROGN
                               (LETT #3#
                                     (|HDPAGE;process_bc_strings| |page| |args|
                                      %))
                               (GO #5=#:G259)))))
                           #5# (EXIT #3#)))))))))
               #4# (EXIT #2#))
              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |HDPAGE;add_to;%LV;29|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SEQ (SPADCALL |page| |l| (QREFELT % 24))
             (EXIT (|HDPAGE;process_add| |page| |l| %)))) 

(SDEFUN |HDPAGE;label_error_msg|
        ((|page| (%)) (|name| (|Symbol|))
         (% (|Union| (|SExpression|) "failed")))
        (SPROG
         ((|pr| (|Rep|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|res| (|SExpression|)))
         (SEQ (LETT |pr| |page|)
              (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
              (EXIT
               (COND ((QEQCAR |alr| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |res|
                             (SPADCALL
                              (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 39)) 3
                              (QREFELT % 53)))
                       (EXIT
                        (COND
                         ((SPADCALL |res| (QREFELT % 32)) (CONS 1 "failed"))
                         (#1# (CONS 0 |res|))))))))))) 

(SDEFUN |HDPAGE;label_input_string|
        ((|page| (%)) (|name| (|Symbol|)) (% (|Union| (|String|) "failed")))
        (SPROG
         ((|pr| (|Rep|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|s| (|SExpression|)))
         (SEQ (LETT |pr| |page|)
              (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
              (EXIT
               (COND ((QEQCAR |alr| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |s|
                             (SPADCALL
                              (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 39)) 1
                              (QREFELT % 53)))
                       (EXIT
                        (COND
                         ((SPADCALL |s| (QREFELT % 34))
                          (CONS 0 (SPADCALL |s| (QREFELT % 35))))
                         (#1# (CONS 1 "failed"))))))))))) 

(SDEFUN |HDPAGE;label_default|
        ((|page| (%)) (|name| (|Symbol|)) (% (|SExpression|)))
        (SPROG
         ((|pr| (|Rep|)) (|mu| (|Union| (|String|) "failed")) (|ms| (|String|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed")))
         (SEQ (LETT |pr| |page|)
              (LETT |mu| (|HDPAGE;label_input_string| |page| |name| %))
              (EXIT
               (COND
                ((QEQCAR |mu| 0)
                 (SEQ (LETT |ms| (QCDR |mu|))
                      (EXIT
                       (COND ((EQUAL |ms| "t") (SPADCALL 1.0 (QREFELT % 61)))
                             ((EQUAL |ms| "nil") (SPADCALL 0.0 (QREFELT % 61)))
                             (#1='T (SPADCALL |ms| (QREFELT % 21)))))))
                (#1#
                 (SEQ (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
                      (EXIT
                       (COND ((QEQCAR |alr| 1) (SPADCALL NIL (QREFELT % 26)))
                             (#1#
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 39)) 5
                               (QREFELT % 53)))))))))))) 

(SDEFUN |HDPAGE;render_as_string| ((|se| (|SExpression|)) (% (|String|)))
        (SPROG ((|sy| (|Symbol|)))
               (SEQ
                (COND
                 ((SPADCALL |se| (QREFELT % 34))
                  (SPADCALL |se| (QREFELT % 35)))
                 ((SPADCALL |se| (QREFELT % 46))
                  (SEQ (LETT |sy| (SPADCALL |se| (QREFELT % 47)))
                       (EXIT
                        (COND ((EQUAL |sy| '%) "\\%")
                              (#1='T (SPADCALL |sy| (QREFELT % 62)))))))
                 ((SPADCALL |se| (QREFELT % 63))
                  (STRINGIMAGE (SPADCALL |se| (QREFELT % 64))))
                 (#1#
                  (SEQ (PRETTYPRINT |se|)
                       (EXIT (|error| "render_as_string: unhandled item")))))))) 

(SDEFUN |HDPAGE;render_ls|
        ((|page| (%)) (|ls| (|List| (|String|))) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)) (|s| NIL) (#1=#:G312 NIL))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (SEQ (LETT |s| NIL) (LETT #1# |ls|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (QSETVELT |pr| 8 (CONS |s| (QVELT |pr| 8)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render1s| ((|page| (%)) (|s| (|String|)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT (QSETVELT |pr| 8 (CONS |s| (QVELT |pr| 8))))))) 

(SDEFUN |HDPAGE;render_l1|
        ((|page| (%)) (|l1| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)) (|el| NIL) (#1=#:G319 NIL))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (SEQ (LETT |el| NIL) (LETT #1# |l1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETVELT |pr| 8
                                      (CONS (|HDPAGE;render_as_string| |el| %)
                                            (QVELT |pr| 8)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render1| ((|page| (%)) (|s| (|SExpression|)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (COND
                      ((SPADCALL |s| (QREFELT % 44))
                       (|HDPAGE;render_l1| |page| (SPADCALL |s| (QREFELT % 39))
                        %))
                      ('T
                       (QSETVELT |pr| 8
                                 (CONS (|HDPAGE;render_as_string| |s| %)
                                       (QVELT |pr| 8))))))))) 

(SDEFUN |HDPAGE;render_item|
        ((|page| (%)) (|item| (|SExpression|)) (% (|Void|)))
        (COND
         ((SPADCALL |item| (QREFELT % 58)) (|HDPAGE;render1| |page| |item| %))
         ('T (|HDPAGE;render_page| |page| (SPADCALL |item| (QREFELT % 39)) %)))) 

(SDEFUN |HDPAGE;split_options|
        ((|links| (|SExpression|))
         (%
          (|Record| (|:| |links| (|List| (|SExpression|)))
                    (|:| |options| (|List| (|SExpression|))))))
        (SPROG
         ((|l1| (|List| (|SExpression|))) (|el| NIL) (#1=#:G333 NIL)
          (|lo| (|List| (|SExpression|))) (|was_options| (|Boolean|))
          (|ll| (|List| (|SExpression|))))
         (SEQ (LETT |l1| (SPADCALL |links| (QREFELT % 39))) (LETT |ll| NIL)
              (LETT |lo| NIL) (LETT |was_options| NIL)
              (SEQ (LETT |el| NIL) (LETT #1# |l1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND (|was_options| (LETT |lo| (CONS |el| |lo|)))
                           ('T
                            (SEQ
                             (COND
                              ((SPADCALL |el| (QREFELT % 46))
                               (COND
                                ((EQUAL (SPADCALL |el| (QREFELT % 47))
                                        '|options|)
                                 (EXIT (LETT |was_options| 'T))))))
                             (EXIT (LETT |ll| (CONS |el| |ll|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |ll|) (NREVERSE |lo|)))))) 

(SDEFUN |HDPAGE;trim_options|
        ((|links| (|SExpression|)) (% (|List| (|SExpression|))))
        (SPROG
         ((|l1| (|List| (|SExpression|))) (|el| NIL) (#1=#:G343 NIL)
          (#2=#:G342 NIL) (|ll| (|List| (|SExpression|))))
         (SEQ (LETT |l1| (SPADCALL |links| (QREFELT % 39))) (LETT |ll| NIL)
              (SEQ
               (EXIT
                (SEQ (LETT |el| NIL) (LETT #1# |l1|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL |el| (QREFELT % 46))
                        (COND
                         ((EQUAL (SPADCALL |el| (QREFELT % 47)) '|options|)
                          (EXIT (PROGN (LETT #2# 1) (GO #3=#:G339)))))))
                      (EXIT (LETT |ll| (CONS |el| |ll|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #2#))
              (EXIT (NREVERSE |ll|))))) 

(SDEFUN |HDPAGE;render_button|
        ((|page| (%)) (|link| (|String|)) (|message| (|SExpression|))
         (|fn| (|String|)) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|name| #1=(|String|)) (|en| NIL) (#2=#:G352 NIL)
          (|el| (|List| (|SExpression|))) (|id| #1#) (|type| (|Symbol|)))
         (SEQ (|HDPAGE;render_ls| |page| (LIST |link| "{") %)
              (|HDPAGE;render1| |page| |message| %)
              (|HDPAGE;render_ls| |page|
               (LIST "}{(|htDoneButton| '|" |fn| "| (PROGN ") %)
              (LETT |pr| |page|)
              (LETT |name| (SPADCALL (QVELT |pr| 0) (QREFELT % 62)))
              (SEQ (LETT |en| NIL)
                   (LETT #2# (SPADCALL (QVELT |pr| 5) (QREFELT % 66))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |en| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |el| (SPADCALL (QCDR |en|) (QREFELT % 39)))
                        (LETT |id| (SPADCALL (QCAR |en|) (QREFELT % 62)))
                        (LETT |type|
                              (SPADCALL (SPADCALL |el| 4 (QREFELT % 53))
                                        (QREFELT % 47)))
                        (|HDPAGE;render_ls| |page|
                         (LIST "(|htpSetLabelInputString| " |name| " '|" |id|
                               "| ")
                         %)
                        (COND
                         ((EQUAL |type| '|string|)
                          (|HDPAGE;render1s| |page| "\"\\stringvalue{" %))
                         ('T (|HDPAGE;render1s| |page| "\"\\boxvalue{" %)))
                        (EXIT
                         (|HDPAGE;render_ls| |page| (LIST |id| "}\")") %)))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|HDPAGE;render_ls| |page| (LIST " " |name| "))}") %))))) 

(SDEFUN |HDPAGE;render_link_button|
        ((|page| (%)) (|link| (|String|)) (|ld| (|SExpression|))
         (|items?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|l1| (|List| (|SExpression|))) (|#G116| #1=(|List| (|SExpression|)))
          (|message| NIL) (|info| NIL) (|#G117| #1#) (|func| NIL)
          (|val| (|List| (|SExpression|))) (|fn| (|SExpression|)))
         (SEQ (LETT |l1| (SPADCALL |ld| (QREFELT % 39)))
              (PROGN
               (LETT |#G116| (SPADCALL |l1| 3 (QREFELT % 55)))
               (LETT |#G117| |#G116|)
               (LETT |message| (|SPADfirst| |#G117|))
               (LETT |#G117| (CDR |#G117|))
               (LETT |info| (|SPADfirst| |#G117|))
               (LETT |#G117| (CDR |#G117|))
               (LETT |func| (|SPADfirst| |#G117|))
               |#G116|)
              (LETT |val| (SPADCALL |l1| 3 (QREFELT % 56)))
              (LETT |fn| (|mkCurryFun| |func| |val|))
              (COND (|items?| (|HDPAGE;render1s| |page| "\\item[" %)))
              (|HDPAGE;render_button| |page| |link| |message|
               (SPADCALL (SPADCALL |fn| (QREFELT % 47)) (QREFELT % 62)) %)
              (COND (|items?| (|HDPAGE;render1s| |page| "]\\space{}" %)))
              (EXIT
               (COND
                ((SPADCALL |info| (QREFELT % 44))
                 (|HDPAGE;render_page| |page| (SPADCALL |info| (QREFELT % 39))
                  %))
                ('T (|HDPAGE;render1| |page| |info| %))))))) 

(SDEFUN |HDPAGE;render_lisp_links|
        ((|page| (%)) (|arg| (|SExpression|)) (|memo?| (|Boolean|))
         (% (|Void|)))
        (SPROG
         ((|links| (|List| (|SExpression|))) (|ind_s| (|String|))
          (|link| (|String|)) (|ld| NIL) (#1=#:G359 NIL))
         (SEQ (LETT |links| (|HDPAGE;trim_options| |arg| %)) (LETT |ind_s| "5")
              (|HDPAGE;render_ls| |page|
               (LIST "\\newline\\indent{" |ind_s| "}\\beginitems") %)
              (LETT |link|
                    (COND (|memo?| "\\lispmemolink") ('T "\\lispdownlink")))
              (SEQ (LETT |ld| NIL) (LETT #1# |links|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ld| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (|HDPAGE;render_link_button| |page| |link| |ld| 'T %)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|HDPAGE;render1s| |page| "\\enditems\\indent{0} " %))))) 

(SDEFUN |HDPAGE;render_bc_links0|
        ((|page| (%)) (|arg| (|SExpression|)) (|link| (|String|)) (% (|Void|)))
        (SPROG ((|links| (|List| (|SExpression|))) (|ld| NIL) (#1=#:G364 NIL))
               (SEQ (LETT |links| (|HDPAGE;trim_options| |arg| %))
                    (EXIT
                     (SEQ (LETT |ld| NIL) (LETT #1# |links|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |ld| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (|HDPAGE;render_link_button| |page| |link| |ld| NIL
                             %)))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render_bc_links|
        ((|page| (%)) (|links| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_bc_links0| |page| |links| "\\lispdownlink" %)) 

(SDEFUN |HDPAGE;render_bc_lisp_links|
        ((|page| (%)) (|links| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_bc_links0| |page| |links| "\\lisplink" %)) 

(SDEFUN |HDPAGE;hd_assoc|
        ((|name| (|Symbol|)) (|al| (|HyperdocAssociationList|))
         (%
          (|Union|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
           "failed")))
        (SPROG
         ((|r| (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|))))
          (#1=#:G377 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL (NULL (SPADCALL |al| (QREFELT % 67)))) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |al| (QREFELT % 68)))
                      (EXIT
                       (COND
                        ((EQUAL |name| (QCAR |r|))
                         (PROGN (LETT #1# (CONS 0 |r|)) (GO #2=#:G376)))
                        ('T (LETT |al| (SPADCALL |al| (QREFELT % 69)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #2# (EXIT #1#)))) 

(SDEFUN |HDPAGE;render_input_string1|
        ((|page| (%)) (|mess1| (|String|)) (|mess2| (|String|))
         (|l1| (|List| (|SExpression|))) (|items?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|#G140| #1=(|List| (|SExpression|))) (|n_char| NIL)
          (|default| NIL) (|name_e| NIL) (|#G141| #1#) (|type| NIL)
          (|name| (|Symbol|)) (|filter| (|SExpression|)))
         (SEQ (LETT |pr| |page|)
              (PROGN
               (LETT |#G140| (SPADCALL |l1| 4 (QREFELT % 55)))
               (LETT |#G141| |#G140|)
               (LETT |n_char| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |default| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |name_e| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |type| (|SPADfirst| |#G141|))
               |#G140|)
              (LETT |name| (SPADCALL |name_e| (QREFELT % 47)))
              (LETT |filter|
                    (SPADCALL (SPADCALL |l1| 4 (QREFELT % 56)) (QREFELT % 26)))
              (COND
               ((QEQCAR (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %) 1)
                (|HDPAGE;setup_default| |page| |name|
                 (LIST (SPADCALL '|string| (QREFELT % 54)) |default| |type|
                       |filter|)
                 %)))
              (COND
               ((QEQCAR (|HDPAGE;label_error_msg| |page| |name| %) 0)
                (|error| "htpLabelErrorMsg unimplemented")))
              (COND
               (|items?|
                (SEQ (|HDPAGE;render1s| |page| "\\item " %)
                     (EXIT (|HDPAGE;render1s| |page| |mess1| %)))))
              (EXIT
               (|HDPAGE;render_ls| |page|
                (LIST "\\inputstring{" (SPADCALL |name| (QREFELT % 62)) "}{"
                      (STRINGIMAGE (SPADCALL |n_char| (QREFELT % 64))) "}{"
                      (|HDPAGE;render_as_string|
                       (|HDPAGE;label_default| |page| |name| %) %)
                      "} " |mess2|)
                %))))) 

(SDEFUN |HDPAGE;render_bc_strings|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|strings| (|List| (|SExpression|))) (|el| NIL)
          (#1=#:G387 NIL))
         (SEQ (LETT |pr| |page|)
              (LETT |strings| (SPADCALL |arg| (QREFELT % 39)))
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #1# |strings|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (|HDPAGE;render_input_string1| |page| "" ""
                       (SPADCALL |el| (QREFELT % 39)) NIL %)))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render_input_strings|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|strings| #1=(|List| (|SExpression|))) (|el| NIL) (#2=#:G393 NIL)
          (|l1| #1#) (|#G152| #3=(|List| (|SExpression|))) (|mess1| NIL)
          (|#G153| #3#) (|mess2| NIL))
         (SEQ (|HDPAGE;render1s| |page| "\\newline\\indent{5}\\beginitems " %)
              (LETT |strings| (SPADCALL |arg| (QREFELT % 39)))
              (SEQ (LETT |el| NIL) (LETT #2# |strings|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 39)))
                        (PROGN
                         (LETT |#G152| (SPADCALL |l1| 2 (QREFELT % 55)))
                         (LETT |#G153| |#G152|)
                         (LETT |mess1| (|SPADfirst| |#G153|))
                         (LETT |#G153| (CDR |#G153|))
                         (LETT |mess2| (|SPADfirst| |#G153|))
                         |#G152|)
                        (EXIT
                         (|HDPAGE;render_input_string1| |page|
                          (SPADCALL |mess1| (QREFELT % 35))
                          (SPADCALL |mess2| (QREFELT % 35))
                          (SPADCALL |l1| 2 (QREFELT % 56)) 'T %)))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (|HDPAGE;render1s| |page| "\\enditems\\indent{0}\\newline "
                %))))) 

(SDEFUN |HDPAGE;render_radio_buttons0|
        ((|page| (%)) (|arg| (|SExpression|)) (|items?| (|Boolean|))
         (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|args| #1=(|List| (|SExpression|)))
          (|group_name| (|SExpression|)) (|buttons| (|List| (|SExpression|)))
          (|boxes_name| #2=(|String|)) (|hd_line| (|List| #2#)) (|el| NIL)
          (#3=#:G399 NIL) (|#G161| #1#) (|message| NIL) (|info| NIL)
          (|#G162| #1#) (|buttonName| NIL) (|button_name| (|Symbol|)))
         (SEQ (LETT |pr| |page|) (LETT |args| (SPADCALL |arg| (QREFELT % 39)))
              (LETT |group_name| (|SPADfirst| |args|))
              (LETT |buttons| (CDR |args|))
              (LETT |boxes_name| (SPADCALL (GENTEMP) (QREFELT % 62)))
              (LETT |hd_line|
                    (LIST "\\radioboxes{" |boxes_name|
                          "}{\\htbmfile{pick}}{\\htbmfile{unpick}}"))
              (COND
               (|items?|
                (LETT |hd_line|
                      (CONS "\\newline\\indent{5}"
                            (SPADCALL |hd_line| "\\beginitems "
                                      (QREFELT % 71))))))
              (|HDPAGE;render_ls| |page| |hd_line| %)
              (SEQ (LETT |el| NIL) (LETT #3# |buttons|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |el| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G161| (SPADCALL |el| (QREFELT % 39)))
                     (LETT |#G162| |#G161|)
                     (LETT |message| (|SPADfirst| |#G162|))
                     (LETT |#G162| (CDR |#G162|))
                     (LETT |info| (|SPADfirst| |#G162|))
                     (LETT |#G162| (CDR |#G162|))
                     (LETT |buttonName| (|SPADfirst| |#G162|))
                     |#G161|)
                    (LETT |button_name| (SPADCALL |buttonName| (QREFELT % 47)))
                    (COND (|items?| (|HDPAGE;render1s| |page| "\\item" %)))
                    (|HDPAGE;render_ls| |page|
                     (LIST "{\\em\\radiobox["
                           (|HDPAGE;render_as_string|
                            (|HDPAGE;label_default| |page| |button_name| %) %)
                           "]{" (SPADCALL |button_name| (QREFELT % 62)) "}{"
                           |boxes_name| "}")
                     %)
                    (COND (|items?| (|HDPAGE;render1s| |page| "\\space{}" %)))
                    (|HDPAGE;render_item| |page| |message| %)
                    (|HDPAGE;render1s| |page| "\\space{}}" %)
                    (EXIT (|HDPAGE;render_item| |page| |info| %)))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                (|items?|
                 (|HDPAGE;render1s| |page| "\\enditems\\indent{0} " %))))))) 

(SDEFUN |HDPAGE;render_radio_buttons|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_radio_buttons0| |page| |arg| 'T %)) 

(SDEFUN |HDPAGE;render_bc_radio_buttons|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_radio_buttons0| |page| |arg| NIL %)) 

(SDEFUN |HDPAGE;render_bc_buttons|
        ((|page| (%)) (|args| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|arg| NIL) (#1=#:G409 NIL)
          (|#G173| #2=(|List| (|SExpression|))) (|default| NIL) (|#G174| #2#)
          (|name_e| NIL) (|name| (|Symbol|)) (|k| (|SExpression|)))
         (SEQ (LETT |pr| |page|)
              (EXIT
               (SEQ (LETT |arg| NIL)
                    (LETT #1# (SPADCALL |args| (QREFELT % 39))) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |arg| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (PROGN
                      (LETT |#G173| (SPADCALL |arg| (QREFELT % 39)))
                      (LETT |#G174| |#G173|)
                      (LETT |default| (|SPADfirst| |#G174|))
                      (LETT |#G174| (CDR |#G174|))
                      (LETT |name_e| (|SPADfirst| |#G174|))
                      |#G173|)
                     (LETT |name| (SPADCALL |name_e| (QREFELT % 47)))
                     (COND
                      ((QEQCAR (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %) 1)
                       (|HDPAGE;setup_default| |page| |name|
                        (LIST (SPADCALL '|button| (QREFELT % 54)) |default|)
                        %)))
                     (LETT |k| (|HDPAGE;label_default| |page| |name| %))
                     (EXIT
                      (COND
                       ((EQUAL |k| 0.0)
                        (|HDPAGE;render_ls| |page|
                         (LIST "\\off{" (SPADCALL |name| (QREFELT % 62)) "}")
                         %))
                       ((EQUAL |k| 1.0)
                        (|HDPAGE;render_ls| |page|
                         (LIST "\\on{" (SPADCALL |name| (QREFELT % 62)) "}")
                         %))
                       ('T
                        (|HDPAGE;render_ls| |page|
                         (LIST "\\inputbox[" (|HDPAGE;render_as_string| |k| %)
                               "]{" (SPADCALL |name| (QREFELT % 62))
                               "}{\\htbmfile{pick}}{\\htbmfile{unpick}}")
                         %)))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render_done_button|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|#G179| #1=(|List| (|SExpression|))) (|lab_e| NIL) (|#G180| #1#)
          (|fun_e| NIL) (|label| (|String|)) (|fn| (|String|))
          (|message| (|String|)))
         (SEQ
          (PROGN
           (LETT |#G179| (SPADCALL |arg| (QREFELT % 39)))
           (LETT |#G180| |#G179|)
           (LETT |lab_e| (|SPADfirst| |#G180|))
           (LETT |#G180| (CDR |#G180|))
           (LETT |fun_e| (|SPADfirst| |#G180|))
           |#G179|)
          (LETT |label| (SPADCALL |lab_e| (QREFELT % 35)))
          (LETT |fn|
                (SPADCALL (SPADCALL |fun_e| (QREFELT % 47)) (QREFELT % 62)))
          (LETT |message|
                (COND ((EQUAL |label| "Continue") "\\ContinueBitmap")
                      ((OR
                        (OR (EQUAL |label| "Push to enter names")
                            (EQUAL |label| "Select to Set Value"))
                        (EQUAL |label| "Select to Set Values"))
                       "\\ControlBitmap{ClickToSet}")
                      ('T
                       (|error| "render_done_button: unimplemented label"))))
          (EXIT
           (|HDPAGE;render_button| |page| "\\lispdownlink"
            (SPADCALL |message| (QREFELT % 21)) |fn| %))))) 

(SDEFUN |HDPAGE;render_doit_button|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|pr| (|Rep|)) (|#G185| #1=(|List| (|SExpression|))) (|lab_e| NIL)
          (|#G186| #1#) (|fun_e| NIL) (|label| #2=(|String|)) (|fn| #2#)
          (|message| (|String|)))
         (SEQ (LETT |pr| |page|)
              (PROGN
               (LETT |#G185| (SPADCALL |arg| (QREFELT % 39)))
               (LETT |#G186| |#G185|)
               (LETT |lab_e| (|SPADfirst| |#G186|))
               (LETT |#G186| (CDR |#G186|))
               (LETT |fun_e| (|SPADfirst| |#G186|))
               |#G185|)
              (LETT |label| (SPADCALL |lab_e| (QREFELT % 35)))
              (LETT |fn| (SPADCALL |fun_e| (QREFELT % 35)))
              (LETT |message|
                    (COND ((EQUAL |label| "Do It") "\\DoItBitmap")
                          ('T (|error| "unimplemented"))))
              (EXIT
               (|HDPAGE;render_ls| |page|
                (LIST "\\newline\\vspace{1}\\centerline{\\lispcommand{"
                      |message| "}{(|doDoitButton| "
                      (SPADCALL (QVELT |pr| 0) (QREFELT % 62)) " \""
                      (|htEscapeString| |fn|) "\")}}")
                %))))) 

(SDEFUN |HDPAGE;render_page_element|
        ((|page| (%)) (|op| (|Symbol|)) (|args| (|SExpression|)) (% (|Void|)))
        (COND ((EQUAL |op| '|text|) (|HDPAGE;render1| |page| |args| %))
              ((EQUAL |op| '|bcLinks|)
               (|HDPAGE;render_bc_links| |page| |args| %))
              ((EQUAL |op| '|bcLispLinks|)
               (|HDPAGE;render_bc_lisp_links| |page| |args| %))
              ((EQUAL |op| '|domainConditions|) (SPADCALL (QREFELT % 38)))
              ((EQUAL |op| '|bcStrings|)
               (|HDPAGE;render_bc_strings| |page| |args| %))
              ((EQUAL |op| '|bcRadioButtons|)
               (|HDPAGE;render_bc_radio_buttons| |page| |args| %))
              ((EQUAL |op| '|bcButtons|)
               (|HDPAGE;render_bc_buttons| |page| |args| %))
              ((EQUAL |op| '|radioButtons|)
               (|HDPAGE;render_radio_buttons| |page| |args| %))
              ((EQUAL |op| '|lispLinks|)
               (|HDPAGE;render_lisp_links| |page| |args| NIL %))
              ((EQUAL |op| '|doneButton|)
               (|HDPAGE;render_done_button| |page| |args| %))
              ((EQUAL |op| '|doitButton|)
               (|HDPAGE;render_doit_button| |page| |args| %))
              ((EQUAL |op| '|inputStrings|)
               (|HDPAGE;render_input_strings| |page| |args| %))
              ('T (|error| "unexpected page item")))) 

(SDEFUN |HDPAGE;render_page|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|el| NIL) (#1=#:G438 NIL) (|l1| (|List| (|SExpression|)))
          (|op| (|Symbol|)) (|args| (|SExpression|)))
         (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL)) (GO G191)))
              (SEQ (LETT |op| '|text|)
                   (LETT |args|
                         (COND ((SPADCALL |el| (QREFELT % 34)) |el|)
                               ((SPADCALL |el| (QREFELT % 46))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |el| (QREFELT % 47))
                                           (QREFELT % 62))
                                 (QREFELT % 21)))
                               ((SPADCALL |el| (QREFELT % 58))
                                (|error| "unexpected atom"))
                               ('T
                                (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 39)))
                                     (LETT |op|
                                           (SPADCALL (|SPADfirst| |l1|)
                                                     (QREFELT % 47)))
                                     (EXIT
                                      (SPADCALL (CDR |l1|) (QREFELT % 26)))))))
                   (EXIT (|HDPAGE;render_page_element| |page| |op| |args| %)))
              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |HDPAGE;render_page0| ((|page| (%)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)) (|l| (|String|)))
               (SEQ (LETT |pr| |page|) (QSETVELT |pr| 8 NIL)
                    (|HDPAGE;render_page| |page| (QVELT |pr| 7) %)
                    (QSETVELT |pr| 8 (NREVERSE (QVELT |pr| 8)))
                    (LETT |l| (SPADCALL (QVELT |pr| 8) (QREFELT % 72)))
                    (SPADCALL |l| (QREFELT % 74))
                    (EXIT (SPADCALL (QREFELT % 75)))))) 

(SDEFUN |HDPAGE;show;%V;60| ((|page| (%)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (QSETVELT |pr| 7 (NREVERSE (QVELT |pr| 7)))
                    (EXIT (|HDPAGE;render_page0| |page| %))))) 

(DECLAIM (NOTINLINE |HyperdocPage;|)) 

(DEFUN |HyperdocPage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HyperdocPage|))
          (LETT % (GETREFV 77))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|HyperdocPage| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |name| (|Symbol|))
                              (|:| |domain_conditions|
                                   (|List| (|SExpression|)))
                              (|:| |variable_alist|
                                   (|HyperdocAssociationList|))
                              (|:| |pattern_vars|
                                   (|List|
                                    (|Record| (|:| |var| (|Symbol|))
                                              (|:| |pvar| (|Symbol|)))))
                              (|:| |radio_buttons| (|HyperdocAssociationList|))
                              (|:| |input_areas| (|HyperdocAssociationList|))
                              (|:| |property_list| (|HyperdocAssociationList|))
                              (|:| |page_description| (|List| (|SExpression|)))
                              (|:| |work_area| (|List| (|String|)))))
          %))) 

(DEFUN |HyperdocPage| ()
  (SPROG NIL
         (PROG (#1=#:G444)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HyperdocPage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HyperdocPage|
                             (LIST (CONS NIL (CONS 1 (|HyperdocPage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|HyperdocPage|)))))))))) 

(MAKEPROP '|HyperdocPage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Symbol|) |HDPAGE;name;%S;1|
              (|HyperdocAssociationList|) (0 . |empty|) |HDPAGE;new;Hal%;2|
              (|Boolean|) (|List| 7) (4 . |member?|) (10 . |remove!|) (|Void|)
              |HDPAGE;destroy;SV;3| |HDPAGE;get_property_list;%Hal;4|
              (|String|) (|SExpression|) (16 . |convert|)
              |HDPAGE;add_to_description;%SV;5| (|List| 20)
              |HDPAGE;add_to_description;%LV;6| (|List| %) (21 . |convert|)
              (26 . |concat|) (|Record| (|:| |key| 7) (|:| |entry| 20))
              (32 . |cons|) |HDPAGE;get_property;%SSe;8|
              |HDPAGE;set_property;%SSeV;9| (38 . |null?|) (43 . |car|)
              (48 . |string?|) (53 . |string|) (|Union| 19 '"failed")
              |HDPAGE;input_string;%SU;10| (58 . |void|) (62 . |destruct|)
              (|Integer|) (67 . |setelt!|) |HDPAGE;set_input_string;%SSV;11|
              |HDPAGE;button_on?;%SB;12| (74 . |list?|)
              |HDPAGE;button_value;%2S;13| (79 . |symbol?|) (84 . |symbol|)
              (|NonNegativeInteger|) (89 . ~=) (95 . =) (101 . |concat!|)
              (107 . |reverse!|) (112 . |elt|) (118 . |convert|)
              (123 . |first|) (129 . |rest|) (135 . |second|) (140 . |atom?|)
              |HDPAGE;add_to;%LV;29| (|DoubleFloat|) (145 . |convert|)
              (150 . |string|) (155 . |integer?|) (160 . |integer|) (|List| 28)
              (165 . |entries|) (170 . |empty?|) (175 . |first|) (180 . |rest|)
              (|List| 19) (185 . |concat|) (191 . |concat|)
              (|HyperdocConnection|) (196 . |send_line|) (201 . |end_page|)
              |HDPAGE;show;%V;60|)
           '#(|show| 205 |set_property| 210 |set_input_string| 217 |new| 224
              |name| 229 |input_string| 234 |get_property_list| 240
              |get_property| 245 |destroy| 251 |button_value| 256 |button_on?|
              262 |add_to_description| 268 |add_to| 280)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|new| ($$ (|HyperdocAssociationList|))) T)
                              '((|destroy| ((|Void|) (|Symbol|))) T)
                              '((|name| ((|Symbol|) $$)) T)
                              '((|add_to|
                                 ((|Void|) $$ (|List| (|SExpression|))))
                                T)
                              '((|add_to_description| ((|Void|) $$ (|String|)))
                                T)
                              '((|add_to_description|
                                 ((|Void|) $$ (|List| (|SExpression|))))
                                T)
                              '((|get_property_list|
                                 ((|HyperdocAssociationList|) $$))
                                T)
                              '((|get_property|
                                 ((|SExpression|) $$ (|Symbol|)))
                                T)
                              '((|set_property|
                                 ((|Void|) $$ (|Symbol|) (|SExpression|)))
                                T)
                              '((|show| ((|Void|) $$)) T)
                              '((|button_on?| ((|Boolean|) $$ (|Symbol|))) T)
                              '((|button_value| ((|Symbol|) $$ (|Symbol|))) T)
                              '((|input_string|
                                 ((|Union| (|String|) "failed") $$ (|Symbol|)))
                                T)
                              '((|set_input_string|
                                 ((|Void|) $$ (|Symbol|) (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 76
                                            '(0 9 0 10 2 13 12 7 0 14 2 13 0 7
                                              0 15 1 20 0 19 21 1 20 0 25 26 2
                                              23 0 0 0 27 2 9 0 28 0 29 1 20 12
                                              0 32 1 20 0 0 33 1 20 12 0 34 1
                                              20 19 0 35 0 16 0 38 1 20 25 0 39
                                              3 23 20 0 40 20 41 1 20 12 0 44 1
                                              20 12 0 46 1 20 7 0 47 2 48 12 0
                                              0 49 2 20 12 0 0 50 2 13 0 0 0 51
                                              1 9 0 0 52 2 23 20 0 40 53 1 20 0
                                              7 54 2 23 0 0 48 55 2 23 0 0 48
                                              56 1 23 20 0 57 1 20 12 0 58 1 20
                                              0 60 61 1 7 19 0 62 1 20 12 0 63
                                              1 20 40 0 64 1 9 65 0 66 1 9 12 0
                                              67 1 9 28 0 68 1 9 0 0 69 2 70 0
                                              0 19 71 1 19 0 25 72 1 73 16 19
                                              74 0 73 16 75 1 0 16 0 76 3 0 16
                                              0 7 20 31 3 0 16 0 7 19 42 1 0 0
                                              9 11 1 0 7 0 8 2 0 36 0 7 37 1 0
                                              9 0 18 2 0 20 0 7 30 1 0 16 7 17
                                              2 0 7 0 7 45 2 0 12 0 7 43 2 0 16
                                              0 23 24 2 0 16 0 19 22 2 0 16 0
                                              23 59)))))
           '|lookupComplete|)) 
