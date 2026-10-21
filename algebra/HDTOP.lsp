
(SDEFUN |HDTOP;get_doc_list|
        ((|page| (|HyperdocPage|))
         (%
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|)))))))))))))
        (SPADCALL |page| '|docSearchAlist| (QREFELT % 19))) 

(SDEFUN |HDTOP;set_doc_list|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))))
         (% (|Void|)))
        (SPADCALL |page| '|docSearchAlist| |lst| (QREFELT % 21))) 

(SDEFUN |HDTOP;get_reg_list|
        ((|page| (|HyperdocPage|))
         (%
          (|Union|
           (|Record|
            (|:| |cur|
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
                                        (|Record|
                                         (|:| |signature| (|SExpression|))
                                         (|:| |condition| (|SExpression|))
                                         (|:| |origin| (|SExpression|))
                                         (|:| |documentation|
                                              (|String|))))))))))
            (|:| |save|
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
                                        (|Record|
                                         (|:| |signature| (|SExpression|))
                                         (|:| |condition| (|SExpression|))
                                         (|:| |origin| (|SExpression|))
                                         (|:| |documentation|
                                              (|String|)))))))))))
           "failed")))
        (SPADCALL |page| '|regSearchAlist| (QREFELT % 19))) 

(SDEFUN |HDTOP;set_reg_list|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|Union|
           (|Record|
            (|:| |cur|
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
                                        (|Record|
                                         (|:| |signature| (|SExpression|))
                                         (|:| |condition| (|SExpression|))
                                         (|:| |origin| (|SExpression|))
                                         (|:| |documentation|
                                              (|String|))))))))))
            (|:| |save|
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
                                        (|Record|
                                         (|:| |signature| (|SExpression|))
                                         (|:| |condition| (|SExpression|))
                                         (|:| |origin| (|SExpression|))
                                         (|:| |documentation|
                                              (|String|)))))))))))
           "failed"))
         (% (|Void|)))
        (SPADCALL |page| '|regSearchAlist| |lst| (QREFELT % 21))) 

(SDEFUN |HDTOP;get_con_lst|
        ((|page| (|HyperdocPage|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPADCALL |page| '|cAlist| (QREFELT % 19))) 

(SDEFUN |HDTOP;set_con_lst|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (% (|Void|)))
        (SPADCALL |page| '|cAlist| |lst| (QREFELT % 21))) 

(SDEFUN |HDTOP;get_op_lst|
        ((|page| (|HyperdocPage|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPADCALL |page| '|opAlist| (QREFELT % 19))) 

(SDEFUN |HDTOP;set_op_lst|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (% (|Void|)))
        (SPADCALL |page| '|opAlist| |lst| (QREFELT % 21))) 

(SDEFUN |HDTOP;get_ops_grd|
        ((|page| (|HyperdocPage|))
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
        (SPADCALL |page| '|ops_grd| (QREFELT % 19))) 

(SDEFUN |HDTOP;set_ops_grd|
        ((|page| (|HyperdocPage|))
         (|lst|
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
         (% (|Void|)))
        (SPADCALL |page| '|ops_grd| |lst| (QREFELT % 21))) 

(SDEFUN |HDTOP;copy_property_list|
        ((|l| (|HyperdocAssociationList|)) (% (|HyperdocAssociationList|)))
        (SPROG
         ((|r1|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|))))
          (|res| (|HyperdocAssociationList|)))
         (SEQ (LETT |res| (SPADCALL (QREFELT % 23)))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |l| (QREFELT % 25)))) (GO G191)))
                   (SEQ
                    (LETT |r1|
                          (CONS (CAR (SPADCALL |l| (QREFELT % 27)))
                                (CDR (SPADCALL |l| (QREFELT % 27)))))
                    (LETT |l| (SPADCALL |l| (QREFELT % 28)))
                    (EXIT (LETT |res| (SPADCALL |r1| |res| (QREFELT % 29)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 30)))))) 

(SDEFUN |HDTOP;add_list_to|
        ((|page| (|HyperdocPage|)) (|ls| (|List| (|String|))) (% (|Void|)))
        (SPROG ((|s| NIL) (#1=#:G322 NIL))
               (SEQ (LETT |s| NIL) (LETT #1# |ls|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (EXIT (SPADCALL |page| |s| (QREFELT % 32))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |HDTOP;do_change_indent|
        ((|page| (|HyperdocPage|)) (|n| (|Integer|)) (|plus2?| (|Boolean|))
         (% (|Void|)))
        (SPROG ((|sl| (|List| (|String|))))
               (SEQ
                (LETT |sl|
                      (COND
                       ((> |n| 0)
                        (COND
                         (|plus2?|
                          (LIST "\\indent{" (STRINGIMAGE (+ |n| 2))
                                "}\\tab{-2}"))
                         (#1='T
                          (LIST "\\indent{" (STRINGIMAGE |n|) "}\\tab{0}"))))
                       (#1# (LIST "\\indent{0}\\newline{}"))))
                (EXIT (|HDTOP;add_list_to| |page| |sl| %))))) 

(SDEFUN |HDTOP;change_indent_plus2|
        ((|page| (|HyperdocPage|)) (|n| (|Integer|)) (% (|Void|)))
        (|HDTOP;do_change_indent| |page| |n| 'T %)) 

(SDEFUN |HDTOP;change_indent|
        ((|page| (|HyperdocPage|)) (|n| (|Integer|)) (% (|Void|)))
        (|HDTOP;do_change_indent| |page| |n| NIL %)) 

(SDEFUN |HDTOP;add_title|
        ((|page| (|HyperdocPage|)) (|title| (|List| (|String|))) (% (|Void|)))
        (SPROG ((|te| (|List| (|SExpression|))))
               (SEQ
                (LETT |te|
                      (LIST (SPADCALL "\\begin{page}{" (QREFELT % 33))
                            (SPADCALL (SPADCALL |page| (QREFELT % 34))
                                      (QREFELT % 35))
                            (SPADCALL "}{" (QREFELT % 33))))
                (SPADCALL |page| |te| (QREFELT % 37))
                (|HDTOP;add_list_to| |page| |title| %)
                (EXIT (SPADCALL |page| "} " (QREFELT % 32)))))) 

(SDEFUN |HDTOP;downlink| ((|s| (|String|)) (% (|Void|)))
        (SPROG ((|page| (|HyperdocPage|)))
               (SEQ
                (LETT |page|
                      (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
                (|HDTOP;add_title| |page| (LIST "Downlink page") %)
                (|HDTOP;add_list_to| |page| (LIST "\\replacepage{" |s| "}") %)
                (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;error_page2|
        ((|title| (|String|)) (|d3| (|List| (|String|))) (% (|Void|)))
        (SPROG ((|page| (|HyperdocPage|)) (|de| NIL) (#1=#:G335 NIL))
               (SEQ
                (LETT |page|
                      (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
                (|HDTOP;add_title| |page| (LIST |title|) %)
                (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
                (SPADCALL |page| "\\vspace{1}\\newline " (QREFELT % 32))
                (SEQ (LETT |de| NIL) (LETT #1# |d3|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |de| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |page| |de| (QREFELT % 32))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (SPADCALL |page| "\\endscroll" (QREFELT % 32))
                (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;error_page| ((|data| (|ErrorIndicator|)) (% (|Void|)))
        (SPROG ((|ds| (|List| (|String|))))
               (SEQ (LETT |ds| (SPADCALL |data| (QREFELT % 42)))
                    (EXIT
                     (|HDTOP;error_page2| (|SPADfirst| |ds|) (CDR |ds|) %))))) 

(SDEFUN |HDTOP;star_error| ((% (|Void|)))
        (SPROG ((|sd| (|List| (|String|))))
               (SEQ
                (LETT |sd|
                      (LIST
                       (SPADCALL
                        "\\vspace{3}\\centerline{{\\em *} is not a valid"
                        (SPADCALL " search string for a general search}"
                                  "\\centerline{\\em {it would match everything!}}"
                                  (QREFELT % 43))
                        (QREFELT % 43))))
                (EXIT (|HDTOP;error_page2| "Error" |sd| %))))) 

(SDEFUN |HDTOP;is_builtin?|
        ((|pat| (|String|)) (% (|Union| (|String|) "failed")))
        (SEQ (LETT |pat| (SPADCALL |pat| (QREFELT % 45)))
             (EXIT
              (COND ((EQUAL |pat| "enumeration") (CONS 0 "DomainEnumeration"))
                    ((EQUAL |pat| "mapping") (CONS 0 "DomainMapping"))
                    ((EQUAL |pat| "record") (CONS 0 "DomainRecord"))
                    ((EQUAL |pat| "union") (CONS 0 "DomainUnion"))
                    ('T (CONS 1 "failed")))))) 

(SDEFUN |HDTOP;emit_query|
        ((|page| (|HyperdocPage|)) (|text| (|List| (|String|)))
         (|fun| (|Symbol|)) (% (|Void|)))
        (SPROG ((|t1| NIL) (#1=#:G350 NIL))
               (SEQ (SPADCALL |page| "\\vspace{1}\\centerline{" (QREFELT % 32))
                    (SEQ (LETT |t1| NIL) (LETT #1# |text|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |t1| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (EXIT (SPADCALL |page| |t1| (QREFELT % 32))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL |page| "}\\centerline{" (QREFELT % 32))
                    (|HDTOP;add_op_link0| |page| '|bcLispLinks| "\\fbox{Yes}"
                     |fun| (SPADCALL '|yes| (QREFELT % 35)) %)
                    (SPADCALL |page| "\\space{4}\\downlink{\\fbox{No}}{UpPage}"
                              (QREFELT % 32))
                    (EXIT (SPADCALL |page| "}" (QREFELT % 32)))))) 

(SDEFUN |HDTOP;empty_result|
        ((|kind| #1=(|String|)) (|pat| (|String|)) (|expose| (|String|))
         (% (|Void|)))
        (SPROG
         ((|page| (|HyperdocPage|)) (|title| (|List| #1#)) (|l| (|List| #1#))
          (|s| NIL) (#2=#:G355 NIL))
         (SEQ (LETT |page| (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
              (LETT |title| (LIST "No " |kind| " found"))
              (|HDTOP;add_title| |page| |title| %)
              (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
              (LETT |l|
                    (LIST "\\vspace{1}\\newline\\centerline{There is no "
                          |expose| |kind|
                          " matching pattern}\\newline\\centerline{{\\em "))
              (SEQ (LETT |s| NIL) (LETT #2# |l|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |page| |s| (QREFELT % 32))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL |page| (|HDTOP;escape_if_needed| |pat| %)
                        (QREFELT % 32))
              (SPADCALL |page| "}}" (QREFELT % 32))
              (SPADCALL |page| "\\endscroll " (QREFELT % 32))
              (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;trim_pattern| ((|pat| (|String|)) (% (|String|)))
        (SEQ (LETT |pat| (SPADCALL |pat| (QREFELT % 8) (QREFELT % 47)))
             (EXIT (COND ((EQUAL |pat| "") "*") ('T |pat|))))) 

(SDEFUN |HDTOP;start_table| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPADCALL |page| "\\table{" (QREFELT % 32))) 

(SDEFUN |HDTOP;end_table| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPADCALL |page| "}" (QREFELT % 32))) 

(SDEFUN |HDTOP;get_count_str| ((|cnt| (|Integer|)) (% (|String|)))
        (COND ((EQL |cnt| 0) "No ") ('T (STRCONC (STRINGIMAGE |cnt|) " ")))) 

(SDEFUN |HDTOP;plural_form| ((|s| (|String|)) (% (|String|)))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (QCSIZE |s|))
                    (EXIT
                     (COND
                      ((|eql_SI| (SPADCALL |s| |n| (QREFELT % 49))
                                 (QREFELT % 12))
                       (STRCONC
                        (SPADCALL |s| (SPADCALL 1 (- |n| 1) (QREFELT % 51))
                                  (QREFELT % 52))
                        "ies"))
                      ((|eql_SI| (SPADCALL |s| |n| (QREFELT % 49))
                                 (QREFELT % 11))
                       (STRCONC
                        (SPADCALL |s| (SPADCALL 1 (- |n| 1) (QREFELT % 51))
                                  (QREFELT % 52))
                        "es"))
                      ('T (STRCONC |s| "s"))))))) 

(SDEFUN |HDTOP;add_op_link0|
        ((|page| (|HyperdocPage|)) (|link| (|Symbol|)) (|label| (|String|))
         (|fun| (|Symbol|)) (|arg| #1=(|SExpression|)) (% (|Void|)))
        (SPROG ((|l0| (|List| #1#)) (|l| (|List| (|SExpression|))))
               (SEQ
                (LETT |l0|
                      (LIST (SPADCALL |label| (QREFELT % 33))
                            (SPADCALL "" (QREFELT % 33))
                            (SPADCALL |fun| (QREFELT % 35)) |arg|))
                (LETT |l|
                      (LIST (SPADCALL |link| (QREFELT % 35))
                            (SPADCALL |l0| (QREFELT % 55))))
                (EXIT
                 (SPADCALL |page| (LIST (SPADCALL |l| (QREFELT % 55)))
                           (QREFELT % 37)))))) 

(SDEFUN |HDTOP;add_con_link1|
        ((|page| (|HyperdocPage|)) (|link| (|Symbol|)) (|label| (|String|))
         (|op| (|Symbol|)) (% (|Void|)))
        (|HDTOP;add_op_link0| |page| |link| |label| '|dbShowCons|
         (SPADCALL |op| (QREFELT % 35)) %)) 

(SDEFUN |HDTOP;add_op_link1|
        ((|page| (|HyperdocPage|)) (|link| (|Symbol|)) (|label| (|String|))
         (|op| (|Symbol|)) (% (|Void|)))
        (|HDTOP;add_op_link0| |page| |link| |label| '|dbShowOps|
         (SPADCALL |op| (QREFELT % 35)) %)) 

(SDEFUN |HDTOP;add_con_link|
        ((|page| (|HyperdocPage|)) (|label| (|String|)) (|op| (|Symbol|))
         (% (|Void|)))
        (|HDTOP;add_con_link1| |page| '|bcLispLinks| |label| |op| %)) 

(SDEFUN |HDTOP;add_op_link|
        ((|page| (|HyperdocPage|)) (|label| (|String|)) (|op| (|Symbol|))
         (% (|Void|)))
        (|HDTOP;add_op_link1| |page| '|bcLispLinks| |label| |op| %)) 

(SDEFUN |HDTOP;add_to_op_menu|
        ((|page| (|HyperdocPage|)) (|inactive?| (|Boolean|))
         (|last| (|Boolean|)) (|label| (|String|)) (|op| (|Symbol|))
         (% (|Void|)))
        (SEQ
         (COND
          (|inactive?|
           (|HDTOP;add_list_to| |page| (LIST "{\\em " |label| "}") %))
          ('T (|HDTOP;add_op_link| |page| |label| |op| %)))
         (EXIT (COND ((NULL |last|) (SPADCALL |page| "}{" (QREFELT % 32))))))) 

(SDEFUN |HDTOP;operations_menu|
        ((|page| (|HyperdocPage|)) (|branch| (|Symbol|))
         (|exposedOnlyIfTrue| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|con_form| (|List| (|SExpression|)))
          (|op_lst|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|empty?| (|Boolean|)) (|one?| (|Boolean|))
          (|implementation?| (|Boolean|)) (|star?| (|Boolean|))
          (|f_arg| (|List| (|SExpression|))))
         (SEQ
          (SPADCALL |page| '|exclusion| (SPADCALL |branch| (QREFELT % 35))
                    (QREFELT % 21))
          (LETT |con_form|
                (SPADCALL (SPADCALL |page| '|conform| (QREFELT % 19))
                          (QREFELT % 56)))
          (LETT |op_lst| (|HDTOP;get_op_lst| |page| %))
          (LETT |empty?| (NULL |op_lst|))
          (LETT |one?|
                (COND (|empty?| 'T)
                      ((EQL (LENGTH |op_lst|) 1)
                       (EQL (LENGTH (QCDR (|SPADfirst| |op_lst|))) 1))
                      (#1='T NIL)))
          (LETT |implementation?|
                (NULL
                 (SPADCALL (SPADCALL |page| '|domname| (QREFELT % 19))
                           (QREFELT % 57))))
          (LETT |star?| (NULL |con_form|)) (|HDTOP;start_table| |page| %)
          (SPADCALL |page| "{" (QREFELT % 32))
          (|HDTOP;add_to_op_menu| |page|
           (COND (|one?| 'T) (#1# (EQUAL |branch| '|conditions|))) NIL
           "Conditions" '|conditions| %)
          (|HDTOP;add_to_op_menu| |page|
           (COND (|empty?| 'T) (#1# (EQUAL |branch| '|documentation|))) NIL
           "Descriptions" '|documentation| %)
          (COND (|one?| (SPADCALL |page| "{\\em Filter}" (QREFELT % 32)))
                (#1#
                 (SEQ
                  (LETT |f_arg|
                        (LIST (SPADCALL '|dbShowOps| (QREFELT % 35))
                              (SPADCALL '|filter| (QREFELT % 35))))
                  (EXIT
                   (|HDTOP;add_op_link0| |page| '|bcLinks| "Filter"
                    '|htFilterPage| (SPADCALL |f_arg| (QREFELT % 55)) %)))))
          (SPADCALL |page| "}{" (QREFELT % 32))
          (|HDTOP;add_to_op_menu| |page|
           (COND (|one?| 'T) (#1# (EQUAL |branch| '|names|))) NIL "Names"
           '|names| %)
          (|HDTOP;add_to_op_menu| |page|
           (COND (|implementation?| (EQUAL |branch| '|implementation|))
                 (#1# 'T))
           NIL "Implementations" '|implementation| %)
          (|HDTOP;add_to_op_menu| |page|
           (COND (|one?| 'T) (#1# (EQUAL |branch| '|origins|))) NIL "Origins"
           '|origins| %)
          (|HDTOP;add_to_op_menu| |page|
           (COND (|one?| 'T) (#1# (EQUAL |branch| '|parameters|))) NIL
           "Parameters" '|parameters| %)
          (|HDTOP;add_to_op_menu| |page|
           (COND (|one?| 'T) (#1# (EQUAL |branch| '|signatures|))) 'T
           "Signatures" '|signatures| %)
          (SPADCALL |page| "}" (QREFELT % 32))
          (COND
           (|star?|
            (SEQ (SPADCALL |page| #2="{" (QREFELT % 32))
                 (COND
                  (|exposedOnlyIfTrue|
                   (|HDTOP;add_op_link1| |page| '|bcLinks| #3="Unexposed Also"
                    '|exposureOff| %))
                  (#1#
                   (|HDTOP;add_op_link1| |page| '|bcLinks| #4="Exposed Only"
                    '|exposureOn| %)))
                 (EXIT (SPADCALL |page| #5="}" (QREFELT % 32)))))
           (|empty?|
            (COND
             (|exposedOnlyIfTrue|
              (SEQ (SPADCALL |page| #2# (QREFELT % 32))
                   (COND
                    (|exposedOnlyIfTrue|
                     (|HDTOP;add_op_link1| |page| '|bcLinks| #3# '|exposureOff|
                      %))
                    (#1#
                     (|HDTOP;add_op_link1| |page| '|bcLinks| #4# '|exposureOn|
                      %)))
                   (EXIT (SPADCALL |page| #5# (QREFELT % 32))))))))
          (EXIT (|HDTOP;end_table| |page| %))))) 

(SDEFUN |HDTOP;add_to_con_menu|
        ((|page| (|HyperdocPage|)) (|inactive?| (|Boolean|))
         (|last| (|Boolean|)) (|label| (|String|)) (|op| (|Symbol|))
         (% (|Void|)))
        (SEQ
         (COND
          (|inactive?|
           (|HDTOP;add_list_to| |page| (LIST "{\\em " |label| "}") %))
          ('T (|HDTOP;add_con_link| |page| |label| |op| %)))
         (EXIT (COND ((NULL |last|) (SPADCALL |page| "}{" (QREFELT % 32))))))) 

(SDEFUN |HDTOP;constructors_menu|
        ((|page| (|HyperdocPage|)) (|kind| (|Symbol|)) (|branch| (|Symbol|))
         (% (|Void|)))
        (SPROG
         ((|con_lst| (|List| (|SExpression|))) (|empty?| #1=(|Boolean|))
          (|one?| #1#) (|f_arg| (|List| (|SExpression|))))
         (SEQ
          (SPADCALL |page| '|exclusion| (SPADCALL |branch| (QREFELT % 35))
                    (QREFELT % 21))
          (LETT |con_lst|
                (SPADCALL (SPADCALL |page| '|cAlist| (QREFELT % 19))
                          (QREFELT % 56)))
          (LETT |empty?| (NULL |con_lst|))
          (LETT |one?| (COND (|empty?| 'T) (#2='T (NULL (CDR |con_lst|)))))
          (|HDTOP;start_table| |page| %) (SPADCALL |page| "{" (QREFELT % 32))
          (|HDTOP;add_to_con_menu| |page|
           (COND (|one?| 'T) (#2# (EQUAL |branch| '|abbrs|))) NIL
           "Abbreviations" '|abbrs| %)
          (|HDTOP;add_to_con_menu| |page|
           (COND ((OR |one?| (EQUAL |branch| '|conditions|)) 'T)
                 ('T
                  (SPADCALL (SPADCALL |page| '|conform| (QREFELT % 19))
                            (QREFELT % 57))))
           NIL "Conditions" '|conditions| %)
          (|HDTOP;add_to_con_menu| |page|
           (COND (|empty?| 'T) (#2# (EQUAL |branch| '|documentation|))) NIL
           "Descriptions" '|documentation| %)
          (COND (|one?| (SPADCALL |page| "{\\em Filter}" (QREFELT % 32)))
                (#2#
                 (SEQ
                  (LETT |f_arg|
                        (LIST (SPADCALL '|dbShowCons| (QREFELT % 35))
                              (SPADCALL '|filter| (QREFELT % 35))))
                  (EXIT
                   (|HDTOP;add_op_link0| |page| '|bcLinks| "Filter"
                    '|htFilterPage| (SPADCALL |f_arg| (QREFELT % 55)) %)))))
          (SPADCALL |page| "}{" (QREFELT % 32))
          (|HDTOP;add_to_con_menu| |page|
           (COND ((OR |one?| (EQUAL |branch| '|kinds|)) 'T)
                 ('T (SPADCALL |kind| '|constructor| (QREFELT % 58))))
           NIL "Kinds" '|kinds| %)
          (|HDTOP;add_to_con_menu| |page|
           (COND (|one?| 'T) (#2# (EQUAL |branch| '|names|))) NIL "Names"
           '|names| %)
          (|HDTOP;add_to_con_menu| |page|
           (COND (|one?| 'T) (#2# (EQUAL |branch| '|parameters|))) NIL
           "Parameters" '|parameters| %)
          (COND
           ((QREFELT % 13)
            (|HDTOP;add_con_link1| |page| '|bcLinks| "Unexposed Also"
             '|exposureOff| %))
           (#2#
            (|HDTOP;add_con_link1| |page| '|bcLinks| "Exposed Only"
             '|exposureOn| %)))
          (SPADCALL |page| "}" (QREFELT % 32))
          (EXIT (|HDTOP;end_table| |page| %))))) 

(SDEFUN |HDTOP;exp_con?| ((|c| (|SExpression|)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL (|SPADfirst| (SPADCALL |c| (QREFELT % 56))) (QREFELT % 59))
         (QREFELT % 60))) 

(SDEFUN |HDTOP;mk_fake_sig| ((|s| (|Symbol|)) (% (|SExpression|)))
        (SPROG ((|sl| (|List| #1=(|SExpression|))) (|cl| (|List| #1#)))
               (SEQ (LETT |sl| (LIST (SPADCALL |s| (QREFELT % 35))))
                    (LETT |cl|
                          (LIST (SPADCALL 'CATEGORY (QREFELT % 35))
                                (SPADCALL '|domain| (QREFELT % 35))))
                    (EXIT
                     (SPADCALL
                      (LIST (SPADCALL |cl| (QREFELT % 55))
                            (SPADCALL |sl| (QREFELT % 55))
                            (SPADCALL |sl| (QREFELT % 55)))
                      (QREFELT % 55)))))) 

(SDEFUN |HDTOP;escape_if_needed| ((|s| (|String|)) (% (|String|)))
        (COND ((EQUAL |s| "#") "\\#") ((EQUAL |s| "/\\") "/\\\\")
              ((EQUAL |s| "\\/") "\\\\/") ('T |s|))) 

(SDEFUN |HDTOP;parser_op?|
        ((|op| (|SExpression|)) (|kind| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|res| (|SExpression|)))
               (SEQ
                (COND ((NULL (SPADCALL |op| (QREFELT % 61))) NIL)
                      ('T
                       (SEQ (LETT |res| (GET |op| |kind|))
                            (EXIT (NULL (SPADCALL |res| (QREFELT % 57)))))))))) 

(SDEFUN |HDTOP;is_niladic?| ((|op| (|SExpression|)) (% (|Boolean|)))
        (SPROG ((|s1| (|Symbol|)) (|res| (|SExpression|)))
               (SEQ
                (COND ((NULL (SPADCALL |op| (QREFELT % 61))) NIL)
                      ('T
                       (SEQ (LETT |s1| (SPADCALL |op| (QREFELT % 59)))
                            (COND
                             ((OR (EQUAL |s1| '|0|) (EQUAL |s1| '|1|))
                              (EXIT 'T)))
                            (LETT |res| (|get_database| |s1| 'NILADIC))
                            (EXIT (NULL (SPADCALL |res| (QREFELT % 57)))))))))) 

(SDEFUN |HDTOP;arg_to_string| ((|x| (|SExpression|)) (% (|String|)))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT % 61))
           (SPADCALL (SPADCALL |x| (QREFELT % 59)) (QREFELT % 62)))
          ('T
           (SEQ (PRETTYPRINT |x|)
                (EXIT
                 (|error| "arg_to_string: unexpected form of argument"))))))) 

(SDEFUN |HDTOP;add_op_link2|
        ((|page| (|HyperdocPage|)) (|label| (|String|)) (|arg| (|SExpression|))
         (% (|Void|)))
        (COND
         ((SPADCALL |arg| (QREFELT % 57))
          (SPADCALL |page| |label| (QREFELT % 32)))
         ('T
          (|HDTOP;add_op_link0| |page| '|bcLinks| |label| '|dbShowOps| |arg|
           %)))) 

(SDEFUN |HDTOP;display_op_sig|
        ((|page| (|HyperdocPage|)) (|op| (|SExpression|))
         (|args| (|List| (|SExpression|))) (|n| (|Integer|))
         (|pred| (|SExpression|)) (|lnk| (|SExpression|))
         (|unexposed?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|arg1| (|String|)) (|ops| (|String|)) (|arg| NIL) (#1=#:G415 NIL)
          (|first_time| (|Boolean|)))
         (SEQ
          (LETT |arg1|
                (COND
                 ((> |n| 1) (|HDTOP;arg_to_string| (|SPADfirst| |args|) %))
                 ('T "")))
          (LETT |ops| (SPADCALL (SPADCALL |op| (QREFELT % 59)) (QREFELT % 62)))
          (LETT |ops| (|HDTOP;escape_if_needed| |ops| %))
          (COND
           ((EQL |n| 2)
            (COND
             ((|HDTOP;parser_op?| |op| '|Nud| %)
              (EXIT
               (SEQ (|HDTOP;add_op_link2| |page| |ops| |lnk| %)
                    (EXIT
                     (|HDTOP;add_list_to| |page| (LIST " {\\em " |arg1| "}")
                      %))))))))
          (COND
           ((EQL |n| 3)
            (COND
             ((|HDTOP;parser_op?| |op| '|Led| %)
              (EXIT
               (SEQ (|HDTOP;add_list_to| |page| (LIST " {\\em " |arg1| "}") %)
                    (|HDTOP;add_op_link2| |page| |ops| |lnk| %)
                    (EXIT
                     (|HDTOP;add_list_to| |page|
                      (LIST " {\\em "
                            (|HDTOP;arg_to_string|
                             (SPADCALL |args| 2 (QREFELT % 63)) %)
                            "}")
                      %))))))))
          (COND (|unexposed?| (|HDTOP;emit_star| |page| %)))
          (|HDTOP;add_op_link2| |page| |ops| |lnk| %)
          (COND
           ((OR
             (SPADCALL |pred| (SPADCALL 'ASCONST (QREFELT % 35))
                       (QREFELT % 64))
             (|HDTOP;is_niladic?| |op| %))
            (EXIT (SPADCALL (QREFELT % 65)))))
          (SPADCALL |page| "(" (QREFELT % 32)) (LETT |first_time| 'T)
          (SEQ (LETT |arg| NIL) (LETT #1# |args|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |arg| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (COND
                 ((NULL |first_time|) (SPADCALL |page| "," (QREFELT % 32))))
                (LETT |first_time| NIL)
                (EXIT
                 (|HDTOP;add_list_to| |page|
                  (LIST "{\\em " (|HDTOP;arg_to_string| |arg| %) "}") %)))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |page| ")" (QREFELT % 32)))))) 

(SDEFUN |HDTOP;finish_constructor|
        ((|page| (|HyperdocPage|)) (|conname| (|Symbol|)) (% (|Void|)))
        (SPROG
         ((|abbr| (|SExpression|)) (|abr_s| #1=(|String|))
          (|sf_e| (|SExpression|)) (|sf| (|String|)) (|bsf| (|String|))
          (|sl| (|List| #1#)))
         (SEQ (LETT |abbr| (|get_database| |conname| 'ABBREVIATION))
              (COND
               ((NULL (SPADCALL |abbr| (QREFELT % 57)))
                (SEQ
                 (LETT |abr_s|
                       (SPADCALL (SPADCALL |abbr| (QREFELT % 59))
                                 (QREFELT % 62)))
                 (SPADCALL |page| "\\tab{2}{\\em Abbreviation:}"
                           (QREFELT % 32))
                 (|HDTOP;change_indent| |page| 15 %)
                 (SPADCALL |page| |abr_s| (QREFELT % 32))
                 (|HDTOP;change_indent| |page| -15 %)
                 (EXIT (SPADCALL |page| "\\newline{}" (QREFELT % 32))))))
              (LETT |sf_e| (|get_database| |conname| 'SOURCEFILE))
              (EXIT
               (COND
                ((NULL (SPADCALL |sf_e| (QREFELT % 57)))
                 (SEQ (LETT |sf| (SPADCALL |sf_e| (QREFELT % 66)))
                      (LETT |bsf| (|drop_directory_part| |sf|))
                      (SPADCALL |page| "\\tab{2}{\\em Source File:}"
                                (QREFELT % 32))
                      (|HDTOP;change_indent| |page| 15 %)
                      (LETT |sl|
                            (LIST "\\unixcommand{" |bsf| "}{"
                                  "\\$FRICAS/lib/SPADEDIT " |sf| " "
                                  (SPADCALL |conname| (QREFELT % 62)) "}"))
                      (|HDTOP;add_list_to| |page| |sl| %)
                      (EXIT (|HDTOP;change_indent| |page| -15 %))))))))) 

(SDEFUN |HDTOP;display_doc|
        ((|page| (|HyperdocPage|)) (|doc| (|String|)) (% (|Void|)))
        (SPROG ((|s1| (|String|)))
               (SEQ
                (SPADCALL |page| "\\newline\\tab{2}{\\em Description:}"
                          (QREFELT % 32))
                (|HDTOP;change_indent| |page| 15 %)
                (LETT |s1|
                      (SUBSTITUTE |$charNewline| |$charFauxNewline| |doc|))
                (SPADCALL |page| |s1| (QREFELT % 32))
                (EXIT (|HDTOP;change_indent| |page| -15 %))))) 

(SDEFUN |HDTOP;emit_predicate|
        ((|page| (|HyperdocPage|)) (|p| (|SExpression|))
         (|form| (|SExpression|)) (% (|Void|)))
        (SPROG ((|ls| (|List| (|String|))))
               (SEQ (LETT |ls| (SPADCALL |p| 'T NIL (QREFELT % 68)))
                    (EXIT (|HDTOP;add_list_to| |page| (NREVERSE |ls|) %))))) 

(SDEFUN |HDTOP;emit_category_exports|
        ((|page| (|HyperdocPage|)) (|vals| (|List| (|SExpression|)))
         (% (|Void|)))
        (SPROG
         ((|val| NIL) (#1=#:G435 NIL) (|op| #2=(|Symbol|))
          (|ope| (|SExpression|)) (|k| (|Integer|)) (|op2| #2#)
          (|vl| (|List| (|SExpression|))))
         (SEQ (SPADCALL |page| ":" (QREFELT % 32))
              (EXIT
               (SEQ (LETT |val| NIL) (LETT #1# |vals|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |val| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (SPADCALL |page| "\\newline{}" (QREFELT % 32))
                         (LETT |vl| (SPADCALL |val| (QREFELT % 56)))
                         (LETT |op|
                               (SPADCALL (|SPADfirst| |vl|) (QREFELT % 59)))
                         (LETT |vl| (CDR |vl|))
                         (EXIT
                          (COND
                           ((EQUAL |op| 'SIGNATURE)
                            (SEQ (LETT |ope| (|SPADfirst| |vl|))
                                 (LETT |op2|
                                       (COND
                                        ((SPADCALL |ope| (QREFELT % 61))
                                         (SPADCALL |ope| (QREFELT % 59)))
                                        ((SPADCALL |ope| (QREFELT % 69))
                                         (SEQ
                                          (LETT |k|
                                                (SPADCALL |ope|
                                                          (QREFELT % 70)))
                                          (EXIT
                                           (COND ((EQL |k| 0) '|0|)
                                                 ((EQL |k| 1) '|1|)
                                                 ('T
                                                  (|error|
                                                   "emit_category_exports: unexpected integer"))))))
                                        ('T
                                         (|error|
                                          "emit_category_exports: unexpected operator"))))
                                 (SPADCALL |page|
                                           (|HDTOP;escape_if_needed|
                                            (SPADCALL |op2| (QREFELT % 62)) %)
                                           (QREFELT % 32))
                                 (SPADCALL |page| " : " (QREFELT % 32))
                                 (LETT |vl|
                                       (CONS
                                        (SPADCALL '|Mapping| (QREFELT % 35))
                                        (SPADCALL
                                         (SPADCALL |vl| 2 (QREFELT % 63))
                                         (QREFELT % 56))))
                                 (EXIT
                                  (|HDTOP;emit_constructor| |page|
                                   (SPADCALL |vl| (QREFELT % 55)) %))))
                           ((EQUAL |op| 'IF)
                            (|error| "emit_category_exports: found IF"))
                           ('T
                            (|error|
                             "emit_category_exports: unexpected construct")))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDTOP;emit_value|
        ((|page| (|HyperdocPage|)) (|val| (|SExpression|))
         (|generalSearch?| (|Boolean|)) (|ret?| (|Boolean|))
         (|conargs| (|List| (|SExpression|))) (|conkind| (|SExpression|))
         (|conlength| (|Integer|)) (|signature| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|op| #1=(|Symbol|)) (|r| (|SExpression|))
          (|has_exports?| #2=(|Boolean|)) (|vl| (|List| (|SExpression|)))
          (|cw| (|String|)) (|v| NIL) (#3=#:G469 NIL) (|first| #2#)
          (|kind| (|Symbol|)) (|iw| (|String|)) (|op2| #1#))
         (SEQ
          (COND
           ((SPADCALL |val| (QREFELT % 57)) (|error| "emit_value: null value"))
           ((SPADCALL |val| (SPADCALL '% (QREFELT % 35)) (QREFELT % 71))
            (SPADCALL |page| "an element of domain \\%" (QREFELT % 32)))
           ((SPADCALL |val| (QREFELT % 61))
            (SEQ (LETT |op| (SPADCALL |val| (QREFELT % 59)))
                 (SPADCALL |page| "an element of domain " (QREFELT % 32))
                 (EXIT
                  (COND
                   ((SPADCALL |op| (QREFELT % 72))
                    (|HDTOP;emit_constructor| |page|
                     (SPADCALL (LIST |val|) (QREFELT % 55)) %))
                   (#4='T
                    (SPADCALL |page|
                              (|HDTOP;escape_if_needed|
                               (SPADCALL |op| (QREFELT % 62)) %)
                              (QREFELT % 32)))))))
           ((SPADCALL |val| (QREFELT % 73))
            (SEQ (LETT |vl| (SPADCALL |val| (QREFELT % 56)))
                 (LETT |op| (SPADCALL (|SPADfirst| |vl|) (QREFELT % 59)))
                 (LETT |vl| (CDR |vl|))
                 (EXIT
                  (COND
                   ((EQUAL |op| '|Mapping|)
                    (SEQ
                     (SPADCALL |page| "a function with signature "
                               (QREFELT % 32))
                     (EXIT (|HDTOP;emit_constructor| |page| |val| %))))
                   ((EQUAL |op| '|Category|)
                    (COND
                     ((NULL |vl|)
                      (SPADCALL |page| "a category" (QREFELT % 32)))
                     (#4# (|error| "emit_value: Category with arguments!"))))
                   ((EQUAL |op| '|Join|)
                    (SEQ (LETT |r| (SPADCALL |vl| (QREFELT % 74)))
                         (LETT |has_exports?|
                               (COND
                                ((OR (SPADCALL |r| (QREFELT % 57))
                                     (NULL (SPADCALL |r| (QREFELT % 73))))
                                 NIL)
                                ('T
                                 (|HDTOP;is_symbol?|
                                  (SPADCALL |r| (QREFELT % 75)) 'CATEGORY %))))
                         (COND
                          (|has_exports?|
                           (LETT |vl|
                                 (SPADCALL |vl| (- (LENGTH |vl|) 1)
                                           (QREFELT % 77)))))
                         (SPADCALL |page| "a domain of " (QREFELT % 32))
                         (LETT |cw|
                               (COND ((> (LENGTH |vl|) 1) "categories ")
                                     (#4# "category")))
                         (SPADCALL |page| |cw| (QREFELT % 32))
                         (LETT |first| 'T)
                         (SEQ (LETT |v| NIL) (LETT #3# |vl|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |v| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((NULL |first|)
                                 (SPADCALL |page| ", " (QREFELT % 32))))
                               (LETT |first| NIL)
                               (EXIT (|HDTOP;emit_constructor| |page| |v| %)))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (COND
                           (|has_exports?|
                            (SEQ
                             (SPADCALL |page| " and with explicit exports"
                                       (QREFELT % 32))
                             (EXIT
                              (COND
                               ((NULL |ret?|)
                                (|HDTOP;emit_category_exports| |page|
                                 (SPADCALL (SPADCALL |r| (QREFELT % 56)) 2
                                           (QREFELT % 78))
                                 %))))))))))
                   ((SPADCALL |op| (QREFELT % 72))
                    (SEQ (LETT |kind| (SPADCALL |op| (QREFELT % 79)))
                         (LETT |iw|
                               (COND
                                ((EQUAL |kind| '|category|)
                                 "a domain of category ")
                                (#4# "an element of domain ")))
                         (SPADCALL |page| |iw| (QREFELT % 32))
                         (EXIT (|HDTOP;emit_constructor| |page| |val| %))))
                   ((SPADCALL |op| (LIST '|Enumeration| '|Record| '|Union|)
                              (QREFELT % 81))
                    (SEQ
                     (SPADCALL |page| "an element of domain " (QREFELT % 32))
                     (EXIT (|HDTOP;emit_constructor| |page| |val| %))))
                   ((EQUAL |op| 'CATEGORY)
                    (SEQ
                     (LETT |op2| (SPADCALL (|SPADfirst| |vl|) (QREFELT % 59)))
                     (SPADCALL |page| "a " (QREFELT % 32))
                     (COND
                      ((OR (EQUAL |op2| '|domain|) (EQUAL |op2| '|package|))
                       (SPADCALL |page| (SPADCALL |op2| (QREFELT % 62))
                                 (QREFELT % 32)))
                      ('T (|error| "emit_value: CATEGORY of strange kind")))
                     (SPADCALL |page| " with explicit exports" (QREFELT % 32))
                     (EXIT
                      (COND
                       ((NULL |ret?|)
                        (|HDTOP;emit_category_exports| |page| (CDR |vl|)
                         %))))))
                   (#4#
                    (SEQ
                     (SPADCALL (SPADCALL |val| (QREFELT % 83)) (QREFELT % 84))
                     (EXIT (|error| "emit_value: op not a constructor"))))))))
           ((SPADCALL |val| (QREFELT % 85))
            (SEQ (SPADCALL |page| "an element of domain " (QREFELT % 32))
                 (EXIT (|HDTOP;emit_constructor| |page| |val| %))))
           (#4#
            (SEQ (SPADCALL (SPADCALL |val| (QREFELT % 83)) (QREFELT % 84))
                 (EXIT (|error| "emit_value: not a list")))))))) 

(SDEFUN |HDTOP;skip_blanks|
        ((|k| (|Integer|)) (|s| (|String|)) (% (|Integer|)))
        (SPROG ((|l| (|NonNegativeInteger|)))
               (SEQ (LETT |l| (QCSIZE |s|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((< |k| |l|)
                              (|eql_SI| (SPADCALL |s| (+ |k| 1) (QREFELT % 49))
                                        (QREFELT % 8)))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |k| (+ |k| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT |k|)))) 

(SDEFUN |HDTOP;prefix_match|
        ((|l| (|Integer|)) (|pref| (|String|)) (|s| (|String|))
         (% (|Boolean|)))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G481 NIL)
          (#2=#:G480 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |k| (QCSIZE |pref|))
                (EXIT
                 (COND ((< (QCSIZE |s|) (+ |k| |l|)) NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |s| (+ |i| |l|) (QREFELT % 49))
                                   (SPADCALL |pref| |i| (QREFELT % 49))
                                   (QREFELT % 86))
                                  (PROGN (LETT #2# NIL) (GO #3=#:G479))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT 'T)))))))
          #3# (EXIT #2#)))) 

(SDEFUN |HDTOP;op_args_from_doc|
        ((|op| (|Symbol|)) (|n| (|Integer|)) (|doc| (|String|))
         (% (|Union| (|List| (|Symbol|)) "failed")))
        (SPROG
         ((|pref| (|String|)) (|k| #1=(|NonNegativeInteger|)) (|l| #1#)
          (|m| (|Integer|)) (|pf| (|SExpression|))
          (|pfl| (|List| (|SExpression|))))
         (SEQ
          (COND ((EQL |n| 0) (CONS 0 NIL))
                (#2='T
                 (SEQ (LETT |pref| "\\spad{")
                      (COND
                       ((NULL (|HDTOP;prefix_match| 0 |pref| |doc| %))
                        (EXIT (CONS 1 "failed"))))
                      (LETT |k| (QCSIZE |pref|)) (LETT |l| (QCSIZE |doc|))
                      (LETT |m| (SPADCALL (QREFELT % 7) |doc| (QREFELT % 87)))
                      (EXIT
                       (COND ((< |m| 1) (CONS 1 "failed"))
                             (#2#
                              (SEQ
                               (LETT |pf|
                                     (SPADCALL
                                      (SPADCALL |doc|
                                                (SPADCALL (+ |k| 1) (- |m| 1)
                                                          (QREFELT % 51))
                                                (QREFELT % 52))
                                      (QREFELT % 89)))
                               (COND
                                ((OR (SPADCALL |pf| (QREFELT % 57))
                                     (NULL (SPADCALL |pf| (QREFELT % 73))))
                                 (EXIT (CONS 1 "failed"))))
                               (LETT |pfl| (SPADCALL |pf| (QREFELT % 56)))
                               (COND
                                ((OR
                                  (OR
                                   (SPADCALL (LENGTH |pfl|) (+ |n| 1)
                                             (QREFELT % 90))
                                   (NULL
                                    (SPADCALL (ELT % 61) |pfl|
                                              (QREFELT % 92))))
                                  (SPADCALL
                                   (SPADCALL (|SPADfirst| |pfl|)
                                             (QREFELT % 59))
                                   |op| (QREFELT % 58)))
                                 (EXIT (CONS 1 "failed"))))
                               (EXIT (CONS 0 (CDR |pfl|))))))))))))) 

(SDEFUN |HDTOP;classify_argument| ((|t1| (|SExpression|)) (% (|Symbol|)))
        (SPROG
         ((|tl| (|List| (|SExpression|))) (|op| (|SExpression|))
          (|kind| (|Symbol|)))
         (SEQ
          (COND
           ((SPADCALL |t1| (QREFELT % 73))
            (SEQ (LETT |tl| (SPADCALL |t1| (QREFELT % 56)))
                 (LETT |op| (|SPADfirst| |tl|))
                 (EXIT
                  (COND ((|HDTOP;is_symbol?| |op| '|Integer| %) '|num|)
                        ((|HDTOP;is_symbol?| |op| '|Mapping| %) '|fun|)
                        (#1='T
                         (SEQ
                          (LETT |kind|
                                (COND
                                 ((SPADCALL |op| (QREFELT % 61))
                                  (|get_database| |op| 'CONSTRUCTORKIND))
                                 (#1# '|domain|)))
                          (EXIT
                           (COND ((EQUAL |kind| '|category|) '|dom|)
                                 (#1# '|elem|)))))))))
           (#1# '|elem|))))) 

(SDEFUN |HDTOP;sym_from_string|
        ((|k| (|Integer|)) (|ns| (|String|)) (% (|Symbol|)))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|qr|
           (|Record| (|:| |quotient| #1=(|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|q| #1#) (|s0| #2=(|String|)) (|ss| #2#))
         (SEQ (LETT |n| (QCSIZE |ns|)) (LETT |qr| (|divide_INT| |k| |n|))
              (LETT |q| (QCAR |qr|))
              (LETT |ss|
                    (SEQ
                     (LETT |s0|
                           (SPADCALL
                            (LIST
                             (SPADCALL |ns| (+ (QCDR |qr|) 1) (QREFELT % 49)))
                            (QREFELT % 94)))
                     (EXIT
                      (COND ((> |q| 0) (STRCONC |s0| (STRINGIMAGE |q|)))
                            ('T |s0|)))))
              (EXIT (SPADCALL |ss| (QREFELT % 95)))))) 

(SDEFUN |HDTOP;invent_argument_name|
        ((|t1| (|SExpression|))
         (|state|
          (|Record| (|:| |np| (|Integer|)) (|:| |ep| (|Integer|))
                    (|:| |fp| (|Integer|)) (|:| |dp| (|Integer|))))
         (% (|Symbol|)))
        (SPROG ((|kind| (|Symbol|)) (|res| (|Symbol|)))
               (SEQ (LETT |kind| (|HDTOP;classify_argument| |t1| %))
                    (EXIT
                     (COND
                      ((EQUAL |kind| '|dom|)
                       (SEQ
                        (LETT |res|
                              (|HDTOP;sym_from_string| (QVELT |state| 3)
                               "RSDETABCMNPQUVW" %))
                        (QSETVELT |state| 3 (+ (QVELT |state| 3) 1))
                        (EXIT |res|)))
                      ((EQUAL |kind| '|num|)
                       (SEQ
                        (LETT |res|
                              (|HDTOP;sym_from_string| (QVELT |state| 0)
                               "ijklmn" %))
                        (QSETVELT |state| 0 (+ (QVELT |state| 0) 1))
                        (EXIT |res|)))
                      ((EQUAL |kind| '|fun|)
                       (SEQ
                        (LETT |res|
                              (|HDTOP;sym_from_string| (QVELT |state| 2)
                               "fghdeFGH" %))
                        (QSETVELT |state| 2 (+ (QVELT |state| 2) 1))
                        (EXIT |res|)))
                      ('T
                       (SEQ
                        (LETT |res|
                              (|HDTOP;sym_from_string| (QVELT |state| 1)
                               "xyzuvw" %))
                        (QSETVELT |state| 1 (+ (QVELT |state| 1) 1))
                        (EXIT |res|)))))))) 

(SDEFUN |HDTOP;invent_argument_names|
        ((|sig| (|List| (|SExpression|))) (% (|List| (|Symbol|))))
        (SPROG
         ((|state|
           (|Record| (|:| |np| (|Integer|)) (|:| |ep| (|Integer|))
                     (|:| |fp| (|Integer|)) (|:| |dp| (|Integer|))))
          (#1=#:G527 NIL) (|t1| NIL) (#2=#:G528 NIL))
         (SEQ (LETT |state| (VECTOR 0 0 0 0))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |t1| NIL) (LETT #2# (CDR |sig|)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #1#
                             (CONS
                              (|HDTOP;invent_argument_name| |t1| |state| %)
                              #1#))))
                     (LETT #2# (CDR #2#)) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |HDTOP;operation_arguments|
        ((|op| (|Symbol|)) (|sig| (|SExpression|)) (|doc| (|String|))
         (% (|List| (|Symbol|))))
        (SPROG ((|au| (|Union| (|List| (|Symbol|)) "failed")))
               (SEQ
                (COND ((EQL (SPADCALL |sig| (QREFELT % 96)) 1) NIL)
                      (#1='T
                       (SEQ
                        (LETT |au|
                              (|HDTOP;op_args_from_doc| |op|
                               (- (SPADCALL |sig| (QREFELT % 96)) 1) |doc| %))
                        (EXIT
                         (COND ((QEQCAR |au| 0) (QCDR |au|))
                               (#1#
                                (|HDTOP;invent_argument_names|
                                 (SPADCALL |sig| (QREFELT % 56)) %)))))))))) 

(SDEFUN |HDTOP;fix_T| ((|s| (|SExpression|)) (% (|SExpression|)))
        (COND ((|HDTOP;is_symbol?| |s| 'T$ %) (SPADCALL 'T (QREFELT % 35)))
              ('T |s|))) 

(SDEFUN |HDTOP;show_op_detail|
        ((|page| (|HyperdocPage|)) (|kind| (|String|))
         (|origin| (|SExpression|)) (|op| (|Symbol|)) (|sig| (|SExpression|))
         (|pred| (|SExpression|)) (|doc| (|String|)) (|i| (|Integer|))
         (|only_one| (|Boolean|)) (|sel_fn| (|Symbol|))
         (|unexposed?| (|Boolean|)) (|generalSearch?| (|Boolean|))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|oform| (|SExpression|)) (|op2| (|SExpression|)) (#1=#:G569 NIL)
          (#2=#:G570 NIL) (|args| (|List| (|SExpression|)))
          (|conform| #3=(|SExpression|)) (|form_l| (|List| (|SExpression|)))
          (|conname| (|Symbol|)) (|conargs| (|List| (|SExpression|)))
          (|constring| (|String|)) (|conlength| (|NonNegativeInteger|))
          (|conkind| #3#) (|tvarlist| (|List| (|Symbol|)))
          (|signature| #4=(|SExpression|)) (|n| (|Integer|)) (|t| NIL)
          (#5=#:G572 NIL) (|arg| NIL) (#6=#:G571 NIL) (|arg1| #4#)
          (|co_sig| (|List| (|Boolean|))) (|op3| (|SExpression|))
          (|cnt| (|NonNegativeInteger|)) (|p| (|SExpression|)))
         (SEQ
          (LETT |oform|
                (COND ((EQUAL |kind| "constructor") |origin|)
                      (#7='T
                       (CONS |op|
                             (|HDTOP;operation_arguments| |op| |sig| |doc|
                              %)))))
          (LETT |op2| (SPADCALL |oform| (QREFELT % 75)))
          (LETT |args|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |arg| NIL)
                      (LETT #2# (CDR (SPADCALL |oform| (QREFELT % 56)))) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |arg| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #1# (CONS (|HDTOP;fix_T| |arg| %) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (COND
           ((SPADCALL (SPADCALL |op| (QREFELT % 35)) |op2| (QREFELT % 97))
            (BREAK)))
          (LETT |conform| (SPADCALL |page| '|domname| (QREFELT % 19)))
          (COND
           ((SPADCALL |conform| (QREFELT % 57))
            (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))))
          (COND
           ((SPADCALL |conform| (QREFELT % 57)) (LETT |conform| |origin|)))
          (LETT |form_l| (SPADCALL |conform| (QREFELT % 56)))
          (LETT |conname| (SPADCALL (|SPADfirst| |form_l|) (QREFELT % 59)))
          (LETT |conargs| (CDR |form_l|))
          (LETT |constring| (SPADCALL |conform| (QREFELT % 98)))
          (LETT |conlength| (QCSIZE |constring|))
          (LETT |conkind| (SPADCALL |page| '|kind| (QREFELT % 19)))
          (COND
           ((SPADCALL |conkind| (QREFELT % 57))
            (LETT |conkind|
                  (SPADCALL
                   (SPADCALL (SPADCALL |conname| (QREFELT % 79))
                             (QREFELT % 62))
                   (QREFELT % 33)))))
          (LETT |signature| (SPADCALL NIL (QREFELT % 55)))
          (COND
           ((EQUAL |kind| "operation")
            (SEQ
             (LETT |signature|
                   (COND
                    ((SPADCALL |conname| |$Primitives| (QREFELT % 81))
                     (SPADCALL NIL (QREFELT % 55)))
                    (#7# (SPADCALL |conname| (QREFELT % 99)))))
             (LETT |tvarlist|
                   (TAKE (LENGTH |conargs|) |$TriangleVariableList|))
             (EXIT
              (LETT |signature|
                    (SUBLISLIS |$FormalMapVariableList| |tvarlist|
                               |signature|))))))
          (SPADCALL |page| "\\newline" (QREFELT % 32))
          (COND (|only_one| (SPADCALL |page| (QREFELT % 53) (QREFELT % 32)))
                (#7#
                 (|HDTOP;add_op_link0| |page| '|bcLinks| (QREFELT % 53)
                  |sel_fn| (SPADCALL |i| (QREFELT % 100)) %)))
          (SPADCALL |page| "\\tab{2}" (QREFELT % 32))
          (LETT |n| (SPADCALL |sig| (QREFELT % 96)))
          (|HDTOP;display_op_sig| |page| |op2| |args| |n| |pred|
           (SPADCALL (|filler_spaces| 0) (QREFELT % 33)) |unexposed?| %)
          (COND
           ((NULL (NULL |args|))
            (SEQ (LETT |co_sig| (|get_database| |op2| 'COSIG))
                 (COND
                  ((NULL (SPADCALL |co_sig| (QREFELT % 102)))
                   (LETT |co_sig| (CDR |co_sig|))))
                 (SPADCALL |page| "\\newline\\tab{2}{\\em Arguments:}"
                           (QREFELT % 32))
                 (EXIT
                  (SEQ (LETT |t| NIL)
                       (LETT #5# (CDR (SPADCALL |sig| (QREFELT % 56))))
                       (LETT |arg| NIL) (LETT #6# |args|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |arg| (CAR #6#)) NIL)
                             (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ (|HDTOP;change_indent_plus2| |page| 15 %)
                            (COND
                             ((OR
                               (OR (SPADCALL |co_sig| (QREFELT % 102))
                                   (NULL (|SPADfirst| |co_sig|)))
                               (SPADCALL |t|
                                         (SPADCALL
                                          (LIST
                                           (SPADCALL '|Type| (QREFELT % 35)))
                                          (QREFELT % 55))
                                         (QREFELT % 71)))
                              (|HDTOP;add_list_to| |page|
                               (LIST "{\\em " (|HDTOP;arg_to_string| |arg| %)
                                     "}")
                               %))
                             ('T
                              (SEQ
                               (LETT |arg1|
                                     (COND (|only_one| |arg|)
                                           ('T
                                            (SPADCALL
                                             (LIST |arg|
                                                   (SPADCALL |i|
                                                             (QREFELT % 100)))
                                             (QREFELT % 55)))))
                               (EXIT
                                (|HDTOP;add_op_link0| |page| '|bcLinks|
                                 (SPADCALL (SPADCALL |arg| (QREFELT % 59))
                                           (QREFELT % 62))
                                 '|kArgPage| |arg1| %)))))
                            (SPADCALL |page| ", " (QREFELT % 32))
                            (COND
                             ((NULL (SPADCALL |co_sig| (QREFELT % 102)))
                              (LETT |co_sig| (CDR |co_sig|))))
                            (|HDTOP;emit_value| |page| |t| |generalSearch?| NIL
                             |conargs| |conkind| |conlength| |signature| %)
                            (|HDTOP;change_indent_plus2| |page| -15 %)
                            (EXIT
                             (SPADCALL |page| "\\newline" (QREFELT % 32))))
                       (LETT #6# (PROG1 (CDR #6#) (LETT #5# (CDR #5#))))
                       (GO G190) G191 (EXIT NIL))))))
          (SPADCALL |page| "\\newline\\tab{2}{\\em Returns:}" (QREFELT % 32))
          (|HDTOP;change_indent_plus2| |page| 15 %)
          (|HDTOP;emit_value| |page|
           (|SPADfirst| (SPADCALL |sig| (QREFELT % 56))) |generalSearch?| 'T
           |conargs| |conkind| |conlength| |signature| %)
          (|HDTOP;change_indent_plus2| |page| -15 %)
          (LETT |op3|
                (COND
                 ((SPADCALL |origin| (QREFELT % 103))
                  (SPADCALL |origin| (QREFELT % 75)))
                 (#7# |origin|)))
          (COND
           ((NULL (SPADCALL |origin| (QREFELT % 57)))
            (COND
             ((OR |generalSearch?|
                  (SPADCALL |origin| |conform| (QREFELT % 97)))
              (COND
               ((SPADCALL |op2| |op3| (QREFELT % 97))
                (SEQ
                 (SPADCALL |page| "\\newline\\tab{2}{\\em Origin:}"
                           (QREFELT % 32))
                 (|HDTOP;change_indent| |page| 15 %)
                 (COND
                  ((NULL (|HDTOP;exp_con?| |origin| %))
                   (SEQ (|HDTOP;emit_star| |page| %)
                        (EXIT (SPADCALL |star?| 'T (QREFELT % 105))))))
                 (|HDTOP;emit_constructor| |page| |origin| %)
                 (EXIT (|HDTOP;change_indent| |page| -15 %)))))))))
          (COND
           ((NULL (SPADCALL |pred| 'T (QREFELT % 64)))
            (COND
             ((NULL
               (SPADCALL |pred| (SPADCALL 'ASCONST (QREFELT % 35))
                         (QREFELT % 64)))
              (SEQ
               (LETT |pred| (SPADCALL (CDR |form_l|) |pred| (QREFELT % 106)))
               (LETT |cnt| (LENGTH (SPADCALL |pred| (QREFELT % 56))))
               (SPADCALL |page| "\\newline\\tab{2}{\\em Conditions:}"
                         (QREFELT % 32))
               (LETT |p| (SUBST |conform| '% |pred|))
               (|HDTOP;do_change_indent| |page| 15 (> |cnt| 1) %)
               (|HDTOP;emit_predicate| |page| |p| |conform| %)
               (|HDTOP;do_change_indent| |page| -15 (> |cnt| 1) %)
               (EXIT (SPADCALL |page| "\\newline" (QREFELT % 32))))))))
          (EXIT
           (COND
            ((SPADCALL |doc| "" (QREFELT % 107))
             (|HDTOP;display_doc| |page| |doc| %))))))) 

(SDEFUN |HDTOP;get_cons_form|
        ((|name| (|Symbol|))
         (%
          (|Record| (|:| |form| (|SExpression|))
                    (|:| |condition| (|SExpression|)))))
        (SPROG ((|form1| (|SExpression|)))
               (SEQ (LETT |form1| (SPADCALL |name| (QREFELT % 108)))
                    (EXIT (CONS |form1| 'T))))) 

(SDEFUN |HDTOP;constructor_title|
        ((|page| (|HyperdocPage|)) (|cnt| (|Integer|)) (|key| (|Symbol|))
         (|kind| (|Symbol|)) (|exposedOnlyIfTrue| (|Boolean|))
         (% (|List| (|String|))))
        (SPROG
         ((|thinge| #1=(|SExpression|)) (|orig| #1#) (|rank| #1#)
          (|exposureWord| (|String|)) (|cnt_str| (|String|))
          (|thing| (|String|)) (|modifier| (|List| (|String|)))
          (|prefix| #2=(|List| (|String|))) (|orig_part| (|List| (|String|)))
          (|res| #2#) (|connective| (|String|)) (|view| (|String|)))
         (SEQ
          (LETT |thing|
                (SEQ (LETT |thinge| (SPADCALL |page| '|thing| (QREFELT % 19)))
                     (EXIT
                      (COND ((SPADCALL |thinge| (QREFELT % 57)) "constructor")
                            (#3='T (SPADCALL |thinge| (QREFELT % 66)))))))
          (LETT |orig| (SPADCALL |page| '|domname| (QREFELT % 19)))
          (COND
           ((SPADCALL |orig| (QREFELT % 57))
            (LETT |orig| (SPADCALL |page| '|conform| (QREFELT % 19)))))
          (EXIT
           (COND
            ((EQUAL |thing| "benefactor")
             (LIST (STRINGIMAGE |cnt|) " constructors used by "
                   (SPADCALL |orig| (QREFELT % 98))))
            (#3#
             (SEQ
              (LETT |modifier|
                    (COND
                     ((EQUAL |thing| "argument")
                      (SEQ
                       (LETT |rank| (SPADCALL |page| '|rank| (QREFELT % 19)))
                       (EXIT
                        (COND ((SPADCALL |rank| (QREFELT % 57)) (LIST ""))
                              (#3#
                               (LIST " possible "
                                     (SPADCALL |rank| (QREFELT % 66)) " "))))))
                     ((EQUAL |kind| '|constructor|) (LIST " "))
                     (#3# (LIST " " (SPADCALL |kind| (QREFELT % 62)) " "))))
              (LETT |exposureWord|
                    (COND (|exposedOnlyIfTrue| " exposed ") (#3# "")))
              (LETT |cnt_str| (|HDTOP;get_count_str| |cnt| %))
              (COND
               ((SPADCALL |cnt| 1 (QREFELT % 90))
                (LETT |thing| (|HDTOP;plural_form| |thing| %))))
              (LETT |modifier| (SPADCALL |modifier| |thing| (QREFELT % 109)))
              (LETT |prefix|
                    (COND ((EQL |cnt| 1) (CONS |cnt_str| |modifier|))
                          (#3#
                           (SPADCALL (LIST |cnt_str| |exposureWord|) |modifier|
                                     (QREFELT % 110)))))
              (LETT |orig_part|
                    (COND ((SPADCALL |orig| (QREFELT % 57)) NIL)
                          (#3#
                           (LIST " of {\\em " (SPADCALL |orig| (QREFELT % 98))
                                 "}"))))
              (LETT |res| (SPADCALL |prefix| |orig_part| (QREFELT % 110)))
              (LETT |connective|
                    (COND
                     ((SPADCALL |key| (LIST '|abbrs| '|files| '|kinds|)
                                (QREFELT % 81))
                      " as ")
                     (#3# " with ")))
              (COND
               ((> |cnt| 0)
                (COND
                 ((SPADCALL |key|
                            (LIST '|abbrs| '|files| '|parameters|
                                  '|conditions|)
                            (QREFELT % 81))
                  (EXIT
                   (SEQ
                    (LETT |view|
                          (COND ((EQUAL |key| '|abbrs|) "abbreviations")
                                (#3# (SPADCALL |key| (QREFELT % 62)))))
                    (EXIT
                     (SPADCALL |res|
                               (LIST " viewed" |connective| "{\\em " |view|
                                     "}")
                               (QREFELT % 110)))))))))
              (EXIT |res|)))))))) 

(SDEFUN |HDTOP;display_exported_ops|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (% (|Void|)))
        (SPROG
         ((|cnt| (|NonNegativeInteger|)) (|total| (|Integer|))
          (|star?| (|Reference| (|Boolean|))))
         (SEQ (LETT |cnt| (LENGTH |lst|))
              (EXIT
               (COND ((EQL |cnt| 0) (SPADCALL (QREFELT % 65)))
                     (#1='T
                      (SEQ (LETT |total| (|HDTOP;count_ops| |lst| %))
                           (|HDTOP;set_op_lst| |page| |lst| %)
                           (SPADCALL |page| "\\indent{0}" (QREFELT % 32))
                           (|HDTOP;add_op_link1| |page| '|bcLinks|
                            (QREFELT % 53) '|names| %)
                           (SPADCALL |page| "\\tab{3}" (QREFELT % 32))
                           (COND
                            ((SPADCALL |cnt| |total| (QREFELT % 90))
                             (COND
                              ((EQL |cnt| 1)
                               (SPADCALL |page| "1 name for " (QREFELT % 32)))
                              (#1#
                               (|HDTOP;add_list_to| |page|
                                (LIST (STRINGIMAGE |cnt|) " names for ") %)))))
                           (COND
                            ((> |total| 1)
                             (|HDTOP;add_list_to| |page|
                              (LIST (STRINGIMAGE |total|)
                                    (SPADCALL " operations "
                                              "are explicitly exported:"
                                              (QREFELT % 43)))
                              %))
                            (#1#
                             (SPADCALL |page|
                                       "1 operation is explicitly exported:"
                                       (QREFELT % 32))))
                           (LETT |star?| (SPADCALL NIL (QREFELT % 111)))
                           (EXIT
                            (|HDTOP;show_op_names| |page| |lst| |star?|
                             %))))))))) 

(SDEFUN |HDTOP;get_evalable_constructor_form|
        ((|page| (|HyperdocPage|)) (|name| (|Symbol|))
         (% (|Union| (|SExpression|) (|ErrorIndicator|))))
        (SPROG
         ((|kind| (|Symbol|)) (|form| (|SExpression|)) (|nargs| (|Integer|))
          (|in_args| (|List| (|String|))) (#1=#:G610 NIL) (#2=#:G609 NIL)
          (|n| (|Integer|)) (|arg| NIL) (#3=#:G611 NIL) (|first| (|Boolean|))
          (|arg_l| (|List| (|String|))) (|args| (|String|))
          (|res| (|Union| (|SExpression|) "failed")) (|s1| #4=(|String|))
          (|el| (|List| #4#)))
         (SEQ (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |form| (SPADCALL |name| (QREFELT % 108)))
              (SPADCALL |page| '|domname| (SPADCALL NIL (QREFELT % 55))
                        (QREFELT % 21))
              (LETT |nargs| (- (SPADCALL |form| (QREFELT % 96)) 1))
              (LETT |in_args| (|HDTOP;get_input_area| |page| |nargs| %))
              (SPADCALL |page| '|inputAreaList| |in_args| (QREFELT % 21))
              (LETT |n| 0)
              (SEQ (LETT |arg| NIL) (LETT #1# |in_args|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arg| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQUAL |arg| "")
                       (PROGN (LETT #2# |$NoValue|) (GO #5=#:G596)))
                      ('T (LETT |n| (+ |n| 1)))))
                    #5# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((EQL |n| 0)
                (COND
                 ((< 0 |nargs|)
                  (EXIT (CONS 0 (SPADCALL NIL (QREFELT % 55))))))))
              (COND
               ((< 0 |n|)
                (COND
                 ((< |n| |nargs|)
                  (EXIT
                   (SEQ
                    (LETT |el|
                          (LIST "Error"
                                "\\centerline{You gave values for only {\\em "
                                (STRINGIMAGE |n|) " } of the {\\em "
                                (STRINGIMAGE |nargs|)
                                "}}\\centerline{parameters of {\\sf "
                                (SPADCALL |name| (QREFELT % 62))
                                (SPADCALL
                                 "}}\\vspace{1}\\centerline{Please enter either {\\em all}"
                                 " or {\\em none} of the type parameters}"
                                 (QREFELT % 43))))
                    (EXIT (CONS 1 (SPADCALL |el| (QREFELT % 112))))))))))
              (LETT |args|
                    (SEQ (LETT |arg_l| (LIST "(")) (LETT |first| 'T)
                         (SEQ (LETT |arg| NIL) (LETT #3# |in_args|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |arg| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((NULL |first|)
                                 (LETT |arg_l| (CONS "," |arg_l|))))
                               (LETT |first| NIL)
                               (EXIT (LETT |arg_l| (CONS |arg| |arg_l|))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (LETT |arg_l| (CONS ")" |arg_l|))
                         (EXIT (SPADCALL (NREVERSE |arg_l|) (QREFELT % 113)))))
              (LETT |res|
                    (|make_domain_form| (SPADCALL |kind| (QREFELT % 62))
                                        (SPADCALL |name| (QREFELT % 62))
                                        |args|))
              (EXIT
               (COND
                ((QEQCAR |res| 1)
                 (SEQ
                  (LETT |s1|
                        (SPADCALL
                         "\\centerline{You gave an invalid type:}\\newline"
                         "\\centerline{{\\sf " (QREFELT % 43)))
                  (LETT |el|
                        (LIST "Error" |s1|
                              (STRCONC (SPADCALL |name| (QREFELT % 62)) |args|)
                              "}}"))
                  (EXIT (CONS 1 (SPADCALL |el| (QREFELT % 112))))))
                ('T (CONS 0 (QCDR |res|)))))))) 

(SDEFUN |HDTOP;do_related|
        ((|page| (|HyperdocPage|)) (|what| (|String|))
         (|fun|
          (|Mapping|
           #1=(|List|
               (|Record| (|:| |form| (|SExpression|))
                         (|:| |condition| (|SExpression|))))
           (|SExpression|) (|SExpression|)))
         (|cat_descendants?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|con_form| (|SExpression|)) (|name| (|Symbol|))
          (|domu| (|Union| (|SExpression|) (|ErrorIndicator|)))
          (|domname| (|SExpression|)) (|c_lst| #1#))
         (SEQ (LETT |con_form| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |con_form| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |domu|
                    (|HDTOP;get_evalable_constructor_form| |page| |name| %))
              (EXIT
               (COND ((QEQCAR |domu| 1) (|HDTOP;error_page| (QCDR |domu|) %))
                     ('T
                      (SEQ (LETT |domname| (QCDR |domu|))
                           (COND
                            ((NULL (SPADCALL |domname| (QREFELT % 57)))
                             (COND
                              ((NULL |cat_descendants?|)
                               (SPADCALL |page| '|domname| |domname|
                                         (QREFELT % 21))))))
                           (LETT |c_lst| (SPADCALL |con_form| |domname| |fun|))
                           (LETT |c_lst| (|mySort| |c_lst|))
                           (|HDTOP;set_con_lst| |page| |c_lst| %)
                           (SPADCALL |page| '|thing|
                                     (SPADCALL |what| (QREFELT % 33))
                                     (QREFELT % 21))
                           (EXIT (|HDTOP;show_cons| |page| '|names| %))))))))) 

(SDEFUN |HDTOP;ancestors_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (|HDTOP;do_related| |page| "ancestor" (ELT % 116) NIL %)) 

(SDEFUN |HDTOP;descendents_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (|HDTOP;do_related| |page| "descendant" (ELT % 117) 'T %)) 

(SDEFUN |HDTOP;domains_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (|HDTOP;do_related| |page| "descendant" (ELT % 118) NIL %)) 

(SDEFUN |HDTOP;children_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (|HDTOP;do_related| |page| "children" (ELT % 119) NIL %)) 

(SDEFUN |HDTOP;dependents_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|conform| (|SExpression|)) (|name| (|Symbol|)) (|kind| (|Symbol|))
          (|d_lst| (|List| (|Symbol|))) (#1=#:G634 NIL) (|d| NIL)
          (#2=#:G635 NIL)
          (|c_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |d_lst| (SPADCALL |name| (QREFELT % 120)))
              (LETT |c_lst|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |d| NIL) (LETT #2# |d_lst|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (|HDTOP;get_cons_form| |d| %) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (|HDTOP;set_con_lst| |page| |c_lst| %)
              (SPADCALL |page| '|thing| (SPADCALL "dependent" (QREFELT % 33))
                        (QREFELT % 21))
              (EXIT (|HDTOP;show_cons| |page| '|names| %))))) 

(SDEFUN |HDTOP;uses_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|name| (|Symbol|)) (|kind| (|Symbol|))
          (|domu| (|Union| (|SExpression|) (|ErrorIndicator|)))
          (|domname| (|SExpression|)) (|pakname| (|Symbol|))
          (|conform| (|SExpression|))
          (|c_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |domu|
                    (|HDTOP;get_evalable_constructor_form| |page| |name| %))
              (EXIT
               (COND ((QEQCAR |domu| 1) (|HDTOP;error_page| (QCDR |domu|) %))
                     (#1='T
                      (SEQ (LETT |domname| (QCDR |domu|))
                           (COND
                            ((NULL (SPADCALL |domname| (QREFELT % 57)))
                             (SPADCALL |page| '|domname| |domname|
                                       (QREFELT % 21))))
                           (LETT |pakname|
                                 (COND
                                  ((EQUAL |kind| '|category|)
                                   (SPADCALL
                                    (STRCONC (SPADCALL |name| (QREFELT % 62))
                                             "&")
                                    (QREFELT % 95)))
                                  (#1# |name|)))
                           (COND
                            ((NULL (SPADCALL |domname| (QREFELT % 57)))
                             (LETT |conform|
                                   (SPADCALL |page| '|conform|
                                             (QREFELT % 19)))))
                           (LETT |c_lst|
                                 (SPADCALL |pakname| |conform| |domname|
                                           (QREFELT % 121)))
                           (|HDTOP;set_con_lst| |page| |c_lst| %)
                           (SPADCALL |page| '|thing|
                                     (SPADCALL "benefactor" (QREFELT % 33))
                                     (QREFELT % 21))
                           (EXIT (|HDTOP;show_cons| |page| '|names| %))))))))) 

(SDEFUN |HDTOP;parents_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|conform| (|SExpression|)) (|name| (|Symbol|))
          (|domu| (|Union| (|SExpression|) (|ErrorIndicator|)))
          (|domname| (|SExpression|))
          (|lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|choice| (|Symbol|)))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |domu|
                    (|HDTOP;get_evalable_constructor_form| |page| |name| %))
              (EXIT
               (COND ((QEQCAR |domu| 1) (|HDTOP;error_page| (QCDR |domu|) %))
                     (#1='T
                      (SEQ (LETT |domname| (QCDR |domu|))
                           (COND
                            ((NULL (SPADCALL |domname| (QREFELT % 57)))
                             (SPADCALL |page| '|domname| |domname|
                                       (QREFELT % 21))))
                           (LETT |lst|
                                 (SPADCALL (SPADCALL |name| (QREFELT % 35))
                                           (QREFELT % 122)))
                           (COND
                            ((NULL (SPADCALL |domname| (QREFELT % 57)))
                             (LETT |lst|
                                   (SUBLISLIS
                                    (SPADCALL |domname| (QREFELT % 123))
                                    (SPADCALL |conform| (QREFELT % 123))
                                    |lst|))))
                           (LETT |page|
                                 (SPADCALL
                                  (|HDTOP;copy_property_list|
                                   (SPADCALL |page| (QREFELT % 124)) %)
                                  (QREFELT % 38)))
                           (|HDTOP;set_con_lst| |page| |lst| %)
                           (SPADCALL |page| '|thing|
                                     (SPADCALL "parent" (QREFELT % 33))
                                     (QREFELT % 21))
                           (LETT |choice|
                                 (COND
                                  ((SPADCALL |domname| (QREFELT % 57))
                                   '|names|)
                                  (#1# '|parameters|)))
                           (EXIT
                            (|HDTOP;show_cons| |page|
                             (SPADCALL |choice| (QREFELT % 35)) %))))))))) 

(SDEFUN |HDTOP;users_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|conform| (|SExpression|)) (|name| (|Symbol|)) (|kind| (|Symbol|))
          (|pakname| (|Symbol|)) (|d_lst| (|List| (|Symbol|))) (#1=#:G653 NIL)
          (|d| NIL) (#2=#:G654 NIL)
          (|c_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |pakname|
                    (COND
                     ((EQUAL |kind| '|category|)
                      (SPADCALL (STRCONC (SPADCALL |name| (QREFELT % 62)) "&")
                                (QREFELT % 95)))
                     ('T |name|)))
              (LETT |d_lst| (SPADCALL |pakname| (QREFELT % 125)))
              (LETT |c_lst|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |d| NIL) (LETT #2# |d_lst|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (|HDTOP;get_cons_form| |d| %) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (|HDTOP;set_con_lst| |page| |c_lst| %)
              (SPADCALL |page| '|thing| (SPADCALL "user" (QREFELT % 33))
                        (QREFELT % 21))
              (EXIT (|HDTOP;show_cons| |page| '|names| %))))) 

(SDEFUN |HDTOP;show_cons_doc2|
        ((|page| (|HyperdocPage|)) (|form| (|SExpression|)) (|i| (|Integer|))
         (|only_one| (|Boolean|)) (|star?| (|Reference| (|Boolean|)))
         (% (|Void|)))
        (SPROG
         ((|cfl| (|List| (|SExpression|))) (|conname| (|Symbol|))
          (|args| (|List| (|SExpression|))) (|exp?| (|Boolean|))
          (|doc| (|String|)) (|sig| (|SExpression|)))
         (SEQ (LETT |cfl| (SPADCALL |form| (QREFELT % 56)))
              (LETT |conname| (SPADCALL (|SPADfirst| |cfl|) (QREFELT % 59)))
              (LETT |args| (CDR |cfl|))
              (LETT |exp?| (|HDTOP;exp_con?| |form| %))
              (EXIT
               (COND
                ((SPADCALL |conname| |$Primitives| (QREFELT % 81))
                 (SEQ (LETT |doc| "")
                      (LETT |sig|
                            (COND
                             ((EQUAL |conname| '|Enumeration|)
                              (|HDTOP;mk_fake_sig| '|Symbol| %))
                             (#1='T (|HDTOP;mk_fake_sig| '|SetCategory| %))))
                      (|HDTOP;show_op_detail| |page| "constructor" |form|
                       |conname| |sig| 'T |doc| |i| |only_one| '|dbSelectCon|
                       NIL NIL |star?| %)
                      (EXIT (|HDTOP;finish_constructor| |page| |conname| %))))
                (#1#
                 (SEQ (LETT |doc| (SPADCALL |conname| (QREFELT % 126)))
                      (LETT |sig| (SPADCALL |conname| |args| (QREFELT % 127)))
                      (|HDTOP;show_op_detail| |page| "constructor" |form|
                       |conname| |sig| 'T |doc| |i| |only_one| '|dbSelectCon|
                       NIL NIL |star?| %)
                      (EXIT
                       (|HDTOP;finish_constructor| |page| |conname| %))))))))) 

(SDEFUN |HDTOP;show_cons_doc1|
        ((|page| (|HyperdocPage|)) (|name| (|Symbol|)) (|i| (|Integer|))
         (|only_one| (|Boolean|)) (|star?| (|Reference| (|Boolean|)))
         (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL |name| (QREFELT % 60))
           (SPADCALL |star?| 'T (QREFELT % 105))))
         (EXIT
          (|HDTOP;show_cons_doc2| |page| (SPADCALL |name| (QREFELT % 108)) |i|
           |only_one| |star?| %)))) 

(SDEFUN |HDTOP;show_cons_doc|
        ((|page| (|HyperdocPage|)) (|lst| (|List| (|Symbol|)))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|name| NIL) (#1=#:G673 NIL) (|i| (|Integer|))
          (|c_lst| (|List| (|SExpression|))))
         (SEQ (LETT |lst| (REMOVE-DUPLICATES |lst|))
              (COND
               ((NULL (NULL |lst|))
                (COND
                 ((NULL (CDR |lst|))
                  (EXIT
                   (|HDTOP;show_cons_doc1| |page| (|SPADfirst| |lst|) 0 'T
                    |star?| %))))))
              (LETT |i| 0)
              (LETT |c_lst|
                    (SPADCALL (SPADCALL |page| '|cAlist| (QREFELT % 19))
                              (QREFELT % 56)))
              (EXIT
               (SEQ (LETT |name| NIL) (LETT #1# |lst|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |name| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (SEQ G190
                          (COND
                           ((NULL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|SPADfirst| |c_lst|) (QREFELT % 75))
                                (QREFELT % 75))
                               (QREFELT % 59))
                              |name| (QREFELT % 58)))
                            (GO G191)))
                          (SEQ (LETT |i| (+ |i| 1))
                               (EXIT (LETT |c_lst| (CDR |c_lst|))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (|HDTOP;show_cons_doc1| |page| |name| |i| NIL |star?|
                       %)))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDTOP;begin_menu| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPADCALL |page| "\\beginmenu " (QREFELT % 32))) 

(SDEFUN |HDTOP;end_menu| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPADCALL |page| "\\endmenu " (QREFELT % 32))) 

(SDEFUN |HDTOP;get_constructor_kind| ((|name| (|Symbol|)) (% (|Symbol|)))
        (COND ((SPADCALL |name| (QREFELT % 128)) '|default package|)
              ('T (SPADCALL |name| (QREFELT % 79))))) 

(SDEFUN |HDTOP;is_symbol?|
        ((|se| (|SExpression|)) (|sy| (|Symbol|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |se| (QREFELT % 61))
          (EQUAL (SPADCALL |se| (QREFELT % 59)) |sy|))
         ('T NIL))) 

(SDEFUN |HDTOP;emit_constructor2|
        ((|page| (|HyperdocPage|)) (|label| (|String|))
         (|form| (|SExpression|)) (|do_args| (|Boolean|)) (% (|Void|)))
        (SPROG ((|ls| (|List| (|String|))))
               (SEQ
                (LETT |ls|
                      (SPADCALL |label| |form| (SPADCALL NIL (QREFELT % 55))
                                |do_args| 'T NIL (QREFELT % 129)))
                (EXIT (|HDTOP;add_list_to| |page| (NREVERSE |ls|) %))))) 

(SDEFUN |HDTOP;emit_constructor1|
        ((|page| (|HyperdocPage|)) (|form| (|SExpression|))
         (|do_args| (|Boolean|)) (% (|Void|)))
        (SPROG ((|ls| (|List| (|String|))))
               (SEQ
                (LETT |ls|
                      (SPADCALL |form| (SPADCALL NIL (QREFELT % 55)) |do_args|
                                'T NIL (QREFELT % 130)))
                (EXIT (|HDTOP;add_list_to| |page| (NREVERSE |ls|) %))))) 

(SDEFUN |HDTOP;emit_constructor|
        ((|page| (|HyperdocPage|)) (|form| (|SExpression|)) (% (|Void|)))
        (|HDTOP;emit_constructor1| |page| |form| 'T %)) 

(SDEFUN |HDTOP;emit_starred_constructor|
        ((|page| (|HyperdocPage|)) (|form| (|SExpression|))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG ((|exp?| (|Boolean|)))
               (SEQ
                (LETT |exp?|
                      (COND
                       ((SPADCALL |form| (QREFELT % 61))
                        (SPADCALL (SPADCALL |form| (QREFELT % 59))
                                  (QREFELT % 60)))
                       ((SPADCALL |form| (QREFELT % 73))
                        (|HDTOP;exp_con?| |form| %))
                       ('T 'T)))
                (COND
                 ((NULL |exp?|)
                  (SEQ (|HDTOP;emit_star| |page| %)
                       (EXIT (SPADCALL |star?| 'T (QREFELT % 105))))))
                (EXIT (|HDTOP;emit_constructor| |page| |form| %))))) 

(SDEFUN |HDTOP;name_con_table|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|do_args| (|Boolean|)) (|star?| (|Reference| (|Boolean|)))
         (% (|Void|)))
        (SPROG
         ((|rec| NIL) (#1=#:G696 NIL) (|form| (|SExpression|))
          (|exposed?| (|Boolean|)) (|had_unexposed?| (|Boolean|)))
         (SEQ (LETT |had_unexposed?| NIL) (|HDTOP;start_table| |page| %)
              (SEQ (LETT |rec| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |form| (QCAR |rec|))
                        (LETT |exposed?| (|HDTOP;exp_con?| |form| %))
                        (SPADCALL |page| "{" (QREFELT % 32))
                        (COND
                         (|exposed?|
                          (SPADCALL |page| "\\space{2}" (QREFELT % 32)))
                         ('T
                          (SEQ (|HDTOP;emit_star| |page| %)
                               (EXIT (LETT |had_unexposed?| 'T)))))
                        (|HDTOP;emit_constructor1| |page| |form| |do_args| %)
                        (EXIT (SPADCALL |page| "}" (QREFELT % 32))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (|HDTOP;end_table| |page| %)
              (EXIT
               (COND
                (|had_unexposed?| (SPADCALL |star?| 'T (QREFELT % 105)))))))) 

(SDEFUN |HDTOP;abbr_table|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|la| (|List| (|Symbol|))) (|star?| (|Reference| (|Boolean|)))
         (% (|Void|)))
        (SPROG
         ((|abb| NIL) (#1=#:G704 NIL) (|rec| NIL) (#2=#:G703 NIL)
          (|form| (|SExpression|)) (|exposed?| (|Boolean|))
          (|had_unexposed?| (|Boolean|)))
         (SEQ (LETT |had_unexposed?| NIL) (|HDTOP;start_table| |page| %)
              (SEQ (LETT |abb| NIL) (LETT #1# |la|) (LETT |rec| NIL)
                   (LETT #2# |lst|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |abb| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |form| (QCAR |rec|))
                        (LETT |exposed?| (|HDTOP;exp_con?| |form| %))
                        (SPADCALL |page| "{" (QREFELT % 32))
                        (COND
                         (|exposed?|
                          (SPADCALL |page| "\\space{2}" (QREFELT % 32)))
                         ('T
                          (SEQ (|HDTOP;emit_star| |page| %)
                               (EXIT (LETT |had_unexposed?| 'T)))))
                        (|HDTOP;emit_constructor2| |page|
                         (SPADCALL |abb| (QREFELT % 62)) |form| NIL %)
                        (EXIT (SPADCALL |page| "}" (QREFELT % 32))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (|HDTOP;end_table| |page| %)
              (EXIT
               (COND
                (|had_unexposed?| (SPADCALL |star?| 'T (QREFELT % 105)))))))) 

(SDEFUN |HDTOP;show_cons_kinds|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|l1| NIL) (#1=#:G731 NIL) (|op| (|Symbol|)) (|kind| (|Symbol|))
          (|cats|
           #2=(|List|
               (|Record| (|:| |form| (|SExpression|))
                         (|:| |condition| (|SExpression|)))))
          (|doms| #2#) (|packs| #2#) (|defs| #2#)
          (|ll|
           (|List|
            (|List|
             (|Record| (|:| |form| (|SExpression|))
                       (|:| |condition| (|SExpression|))))))
          (|l_lab| (|List| #3=(|String|))) (#4=#:G732 NIL)
          (#5=#:G721 #6=(|Integer|)) (#7=#:G719 #6#) (#8=#:G720 NIL)
          (|n_cases| #6#) (|lab| NIL) (#9=#:G734 NIL) (|l| NIL)
          (#10=#:G733 NIL) (|cnt| (|NonNegativeInteger|)) (#11=#:G730 NIL)
          (|lnk| (|List| (|SExpression|))) (|lab1| #3#))
         (SEQ (LETT |cats| (LETT |doms| (LETT |packs| (LETT |defs| NIL))))
              (SEQ (LETT |l1| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |l1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |op|
                          (SPADCALL (SPADCALL (QCAR |l1|) (QREFELT % 75))
                                    (QREFELT % 59)))
                    (LETT |kind| (|HDTOP;get_constructor_kind| |op| %))
                    (EXIT
                     (COND
                      ((EQUAL |kind| '|category|)
                       (LETT |cats| (CONS |l1| |cats|)))
                      ((EQUAL |kind| '|domain|)
                       (LETT |doms| (CONS |l1| |doms|)))
                      ((EQUAL |kind| '|package|)
                       (LETT |packs| (CONS |l1| |packs|)))
                      ('T (LETT |defs| (CONS |l1| |defs|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |ll|
                    (LIST (NREVERSE |cats|) (NREVERSE |doms|)
                          (NREVERSE |packs|) (NREVERSE |defs|)))
              (LETT |l_lab|
                    (LIST "category" "domain" "package" "default package"))
              (LETT |n_cases|
                    (PROGN
                     (LETT #8# NIL)
                     (SEQ (LETT |l| NIL) (LETT #4# |ll|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((> (LENGTH |l|) 0)
                              (PROGN
                               (LETT #5# 1)
                               (COND (#8# (LETT #7# (+ #7# #5#)))
                                     ('T
                                      (PROGN
                                       (LETT #7# #5#)
                                       (LETT #8# 'T)))))))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                     (COND (#8# #7#) ('T 0))))
              (|HDTOP;begin_menu| |page| %)
              (SPADCALL |page| "\\indent{1}" (QREFELT % 32))
              (SEQ (LETT |lab| NIL) (LETT #9# |l_lab|) (LETT |l| NIL)
                   (LETT #10# |ll|) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |l| (CAR #10#)) NIL)
                         (ATOM #9#) (PROGN (LETT |lab| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |cnt| (LENGTH |l|))
                          (EXIT
                           (COND
                            ((EQL |cnt| 0)
                             (PROGN (LETT #11# |$NoValue|) (GO #12=#:G722)))
                            ('T
                             (SEQ (SPADCALL |page| "\\item" (QREFELT % 32))
                                  (COND
                                   ((EQL |n_cases| 1)
                                    (SPADCALL |page| (QREFELT % 53)
                                              (QREFELT % 32)))
                                   ('T
                                    (SEQ
                                     (LETT |lnk|
                                           (LIST
                                            (SPADCALL |lab| (QREFELT % 33))
                                            |l|))
                                     (EXIT
                                      (|HDTOP;add_op_link0| |page| '|bcLinks|
                                       (QREFELT % 53) '|dbShowConsKindsFilter|
                                       (SPADCALL |lnk| (QREFELT % 55)) %)))))
                                  (SPADCALL |page| "\\tab{1}" (QREFELT % 32))
                                  (SPADCALL |page| "{\\em " (QREFELT % 32))
                                  (SPADCALL |page| (STRINGIMAGE |cnt|)
                                            (QREFELT % 32))
                                  (SPADCALL |page| " " (QREFELT % 32))
                                  (LETT |lab1|
                                        (COND
                                         ((> |cnt| 1)
                                          (|HDTOP;plural_form| |lab| %))
                                         ('T |lab|)))
                                  (SPADCALL |page| |lab1| (QREFELT % 32))
                                  (SPADCALL |page| ":}" (QREFELT % 32))
                                  (EXIT
                                   (|HDTOP;name_con_table| |page| |l| NIL
                                    |star?| %))))))))
                    #12# (EXIT #11#))
                   (LETT #10# (PROG1 (CDR #10#) (LETT #9# (CDR #9#))))
                   (GO G190) G191 (EXIT NIL))
              (|HDTOP;end_menu| |page| %)
              (EXIT (SPADCALL |page| "\\indent{0}" (QREFELT % 32)))))) 

(SDEFUN |HDTOP;split_unconditional|
        ((|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (%
          (|Record|
           (|:| |uncons|
                (|List|
                 (|Record| (|:| |form| (|SExpression|))
                           (|:| |condition| (|SExpression|)))))
           (|:| |conds|
                (|List|
                 (|Record| (|:| |form| (|SExpression|))
                           (|:| |condition| (|SExpression|))))))))
        (SPROG
         ((|el| NIL) (#1=#:G749 NIL) (|p| (|SExpression|))
          (|uncos|
           #2=(|List|
               (|Record| (|:| |form| (|SExpression|))
                         (|:| |condition| (|SExpression|)))))
          (#3=#:G748 NIL) (|conds| #2#))
         (SEQ (LETT |uncos| (LETT |conds| NIL))
              (SEQ (LETT |el| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| (QCDR |el|))
                          (COND
                           ((SPADCALL |p| (QREFELT % 73))
                            (COND
                             ((SPADCALL (SPADCALL |p| (QREFELT % 75))
                                        (SPADCALL '|hasArgs| (QREFELT % 35))
                                        (QREFELT % 71))
                              (EXIT (LETT |uncos| (CONS |el| |uncos|)))))))
                          (EXIT
                           (COND
                            ((SPADCALL |p| 'T (QREFELT % 71))
                             (LETT |uncos| (CONS |el| |uncos|)))
                            ((SPADCALL |p| (QREFELT % 57))
                             (PROGN (LETT #3# |$NoValue|) (GO #4=#:G736)))
                            ('T (LETT |conds| (CONS |el| |conds|)))))))
                    #4# (EXIT #3#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |uncos|) (NREVERSE |conds|)))))) 

(SDEFUN |HDTOP;show_conditions1|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|conname| (|Symbol|)) (|star?| (|Reference| (|Boolean|)))
         (% (|Void|)))
        (SPROG
         ((|r1| NIL) (#1=#:G762 NIL) (|has_arg1| (|SExpression|))
          (|pred| (|SExpression|)) (|has_args| (|List| (|SExpression|)))
          (|n_con| (|SExpression|)))
         (SEQ (|HDTOP;start_table| |page| %)
              (SEQ (LETT |r1| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pred| (QCDR |r1|)) (LETT |has_args| NIL)
                        (COND
                         ((SPADCALL |pred| 'T (QREFELT % 97))
                          (SEQ (LETT |has_arg1| (|extractHasArgs| |pred|))
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |has_arg1| (QREFELT % 57)))
                                  (SEQ
                                   (LETT |pred|
                                         (SPADCALL |has_arg1| (QREFELT % 123)))
                                   (EXIT
                                    (LETT |has_args|
                                          (SPADCALL
                                           (SPADCALL |has_arg1| (QREFELT % 75))
                                           (QREFELT % 56)))))))))))
                        (SPADCALL |page| "{" (QREFELT % 32))
                        (|HDTOP;emit_starred_constructor| |page| (QCAR |r1|)
                         |star?| %)
                        (COND
                         ((NULL (NULL |has_args|))
                          (SEQ (SPADCALL |page| " {\\em of} " (QREFELT % 32))
                               (LETT |n_con|
                                     (SPADCALL
                                      (CONS (SPADCALL |conname| (QREFELT % 35))
                                            |has_args|)
                                      (QREFELT % 55)))
                               (EXIT
                                (|HDTOP;emit_constructor| |page| |n_con| %)))))
                        (COND
                         ((SPADCALL |pred| 'T (QREFELT % 97))
                          (SEQ (SPADCALL |page| " if " (QREFELT % 32))
                               (EXIT
                                (|HDTOP;emit_predicate| |page| |pred|
                                 (QCAR |r1|) %)))))
                        (EXIT (SPADCALL |page| "}" (QREFELT % 32))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|HDTOP;end_table| |page| %))))) 

(SDEFUN |HDTOP;show_conditions|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|kind| (|Symbol|)) (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|conform| #1=(|SExpression|)) (|conname| (|Symbol|))
          (|whichever| #1#)
          (|#G248|
           (|Record|
            (|:| |uncons|
                 (|List|
                  (|Record| (|:| |form| (|SExpression|))
                            (|:| |condition| (|SExpression|)))))
            (|:| |conds|
                 (|List|
                  (|Record| (|:| |form| (|SExpression|))
                            (|:| |condition| (|SExpression|)))))))
          (|consNoPred|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|consPred|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|kind_s| #2=(|String|)) (|singular| (|List| #2#))
          (|plural| (|List| (|String|))) (|cnt| (|NonNegativeInteger|))
          (|cnt_str| (|String|)) (|l_str| (|List| (|String|))))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |conname|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |whichever| (SPADCALL |page| '|whichever| (QREFELT % 19)))
              (PROGN
               (LETT |#G248| (|HDTOP;split_unconditional| |lst| %))
               (LETT |consNoPred| (QCAR |#G248|))
               (LETT |consPred| (QCDR |#G248|))
               |#G248|)
              (LETT |kind_s| (SPADCALL |kind| (QREFELT % 62)))
              (LETT |singular| (LIST |kind_s| " is"))
              (LETT |plural| (LIST (|HDTOP;plural_form| |kind_s| %) " are"))
              (LETT |cnt| (LENGTH |consNoPred|))
              (LETT |cnt_str| (|HDTOP;get_count_str| |cnt| %))
              (LETT |l_str|
                    (CONS |cnt_str|
                          (COND ((< |cnt| 2) |singular|) (#3='T |plural|))))
              (|HDTOP;add_list_to| |page| |l_str| %)
              (SPADCALL |page| " unconditional:" (QREFELT % 32))
              (|HDTOP;show_conditions1| |page| |consNoPred| |conname| |star?|
               %)
              (SPADCALL |page| "\\horizontalline{}\\newline{}" (QREFELT % 32))
              (LETT |cnt| (LENGTH |consPred|))
              (LETT |cnt_str| (|HDTOP;get_count_str| |cnt| %))
              (LETT |l_str|
                    (CONS |cnt_str|
                          (COND ((< |cnt| 2) |singular|) (#3# |plural|))))
              (|HDTOP;add_list_to| |page| |l_str| %)
              (SPADCALL |page| " conditional:" (QREFELT % 32))
              (EXIT
               (|HDTOP;show_conditions1| |page| |consPred| |conname| |star?|
                %))))) 

(SDEFUN |HDTOP;star_remark| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPADCALL |page|
                  "\\newline{}-------------\\newline{}{\\em *} = unexposed"
                  (QREFELT % 32))) 

(SDEFUN |HDTOP;show_constructors2|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|key| (|Symbol|)) (|exposedOnlyIfTrue| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((#1=#:G794 NIL) (|x| NIL) (#2=#:G795 NIL) (#3=#:G796 NIL)
          (#4=#:G797 NIL) (|conlist| (|List| (|SExpression|)))
          (|c1| (|SExpression|)) (|dp| (|SExpression|))
          (|cl| (|List| (|SExpression|))) (#5=#:G798 NIL) (|e1| NIL)
          (#6=#:G799 NIL) (|name_lst| (|List| (|Symbol|))) (#7=#:G800 NIL)
          (|n| NIL) (#8=#:G801 NIL) (|kinds| (|List| (|Symbol|)))
          (|kind| (|Symbol|)) (|title| (|List| (|String|)))
          (|star?| (|Reference| (|Boolean|))) (#9=#:G802 NIL) (|con| NIL)
          (#10=#:G803 NIL) (|la| (|List| (|Symbol|))) (#11=#:G793 NIL))
         (SEQ
          (COND
           (|exposedOnlyIfTrue|
            (LETT |lst|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |x| NIL) (LETT #2# |lst|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((|HDTOP;exp_con?| (QCAR |x|) %)
                            (LETT #1# (CONS |x| #1#))))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))))
          (LETT |conlist|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |e1| NIL) (LETT #4# |lst|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |e1| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #3# (CONS (QCAR |e1|) #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (COND
           ((NULL (NULL |conlist|))
            (COND
             ((NULL (CDR |conlist|))
              (EXIT
               (SEQ (LETT |c1| (|SPADfirst| |conlist|))
                    (LETT |dp| (SPADCALL |page| '|domname| (QREFELT % 19)))
                    (EXIT
                     (COND
                      ((SPADCALL |dp| (QREFELT % 57))
                       (SEQ (LETT |cl| (SPADCALL |c1| (QREFELT % 56)))
                            (EXIT
                             (|HDTOP;constructor_page|
                              (SPADCALL (|SPADfirst| |cl|) (QREFELT % 59)) |cl|
                              NIL %))))
                      (#12='T (|HDTOP;con_page| |c1| %))))))))))
          (LETT |name_lst|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |e1| NIL) (LETT #6# |conlist|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |e1| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL
                                (|SPADfirst| (SPADCALL |e1| (QREFELT % 56)))
                                (QREFELT % 59))
                               #5#))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (LETT |kinds|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |n| NIL) (LETT #8# |name_lst|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |n| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS (|HDTOP;get_constructor_kind| |n| %)
                                    #7#))))
                      (LETT #8# (CDR #8#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |kinds| (REMOVE-DUPLICATES |kinds|))
          (LETT |kind|
                (COND ((EQL (LENGTH |kinds|) 1) (|SPADfirst| |kinds|))
                      (#12# '|constructor|)))
          (LETT |title|
                (|HDTOP;constructor_title| |page| (LENGTH |name_lst|) |key|
                 |kind| |exposedOnlyIfTrue| %))
          (LETT |page|
                (SPADCALL
                 (|HDTOP;copy_property_list| (SPADCALL |page| (QREFELT % 124))
                  %)
                 (QREFELT % 38)))
          (|HDTOP;add_title| |page| |title| %)
          (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
          (|HDTOP;set_con_lst| |page| |lst| %)
          (LETT |star?| (SPADCALL NIL (QREFELT % 111)))
          (COND
           ((EQUAL |key| '|names|)
            (|HDTOP;name_con_table| |page| |lst| NIL |star?| %))
           ((EQUAL |key| '|abbrs|)
            (SEQ
             (LETT |la|
                   (PROGN
                    (LETT #9# NIL)
                    (SEQ (LETT |con| NIL) (LETT #10# |name_lst|) G190
                         (COND
                          ((OR (ATOM #10#) (PROGN (LETT |con| (CAR #10#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #9#
                                 (CONS (|get_database| |con| 'ABBREVIATION)
                                       #9#))))
                         (LETT #10# (CDR #10#)) (GO G190) G191
                         (EXIT (NREVERSE #9#)))))
             (EXIT (|HDTOP;abbr_table| |page| |lst| |la| |star?| %))))
           ((EQUAL |key| '|documentation|)
            (|HDTOP;show_cons_doc| |page| |name_lst| |star?| %))
           ((EQUAL |key| '|conditions|)
            (|HDTOP;show_conditions| |page| |lst| |kind| |star?| %))
           ((EQUAL |key| '|parameters|)
            (|HDTOP;name_con_table| |page| |lst| 'T |star?| %))
           (#12#
            (SEQ
             (EXIT
              (COND
               ((EQUAL |key| '|kinds|)
                (PROGN
                 (LETT #11# (|HDTOP;show_cons_kinds| |page| |lst| |star?| %))
                 (GO #13=#:G784)))))
             #13# (EXIT #11#))))
          (COND
           ((SPADCALL |star?| (QREFELT % 131)) (|HDTOP;star_remark| |page| %)))
          (SPADCALL |page| "\\endscroll " (QREFELT % 32))
          (|HDTOP;constructors_menu| |page| |kind| |key| %)
          (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;show_search_path| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|conform| (|SExpression|)) (|name| (|Symbol|)) (|kind| (|Symbol|))
          (|domu| (|Union| (|SExpression|) (|ErrorIndicator|)))
          (|domname| (|SExpression|)) (|title| (|List| (|String|)))
          (|domain| (|None|))
          (|lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|))))))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |domu|
                    (|HDTOP;get_evalable_constructor_form| |page| |name| %))
              (EXIT
               (COND ((QEQCAR |domu| 1) (|HDTOP;error_page| (QCDR |domu|) %))
                     (#1='T
                      (SEQ (LETT |domname| (QCDR |domu|))
                           (LETT |title|
                                 (COND
                                  ((SPADCALL |domname| (QREFELT % 57))
                                   (SPADCALL |page| '|heading| (QREFELT % 19)))
                                  (#1#
                                   (LIST "{\\sf "
                                         (SPADCALL |domname| (QREFELT % 98))
                                         "}"))))
                           (COND
                            ((NULL (SPADCALL |domname| (QREFELT % 57)))
                             (SEQ
                              (SPADCALL |page| '|domname| |domname|
                                        (QREFELT % 21))
                              (EXIT
                               (SPADCALL |page| '|heading| |title|
                                         (QREFELT % 21))))))
                           (LETT |page|
                                 (SPADCALL
                                  (|HDTOP;copy_property_list|
                                   (SPADCALL |page| (QREFELT % 124)) %)
                                  (QREFELT % 38)))
                           (LETT |domain|
                                 (COND ((EQUAL |kind| '|category|) NIL)
                                       (#1# (EVAL |domname|))))
                           (LETT |lst|
                                 (SPADCALL |conform| |domname| |domain|
                                           (QREFELT % 133)))
                           (|HDTOP;set_con_lst| |page| |lst| %)
                           (SPADCALL |page| '|thing|
                                     (SPADCALL "constructor" (QREFELT % 33))
                                     (QREFELT % 21))
                           (EXIT (|HDTOP;show_cons| |page| '|names| %))))))))) 

(SDEFUN |HDTOP;show_constructors| ((|lst| (|List| (|Symbol|))) (% (|Void|)))
        (SPROG
         ((#1=#:G815 NIL) (|l1| NIL) (#2=#:G816 NIL)
          (|n_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|page| (|HyperdocPage|)))
         (SEQ
          (LETT |n_lst|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |l1| NIL)
                      (LETT #2# (SPADCALL |lst| (QREFELT % 134))) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |l1| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (|HDTOP;get_cons_form| |l1| %) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |page| (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
          (EXIT
           (|HDTOP;show_constructors2| |page| |n_lst| '|names| (QREFELT % 13)
            %))))) 

(SDEFUN |HDTOP;con_page_choose| ((|name| (|SExpression|)) (% (|Void|)))
        (|HDTOP;con_page| |name| %)) 

(SDEFUN |HDTOP;show_op_documentation|
        ((|page| (|HyperdocPage|))
         (|s1|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| #1=(|SExpression|))
                    (|:| |origin| (|SExpression|))
                    (|:| |documentation| #2=(|String|))))
         (|op| (|Symbol|)) (|j| (|Integer|)) (|exactly_one| (|Boolean|))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG ((|doc| #2#) (|pred| #1#) (|not_exp?| (|Boolean|)))
               (SEQ (LETT |doc| (QVELT |s1| 3)) (LETT |pred| (QVELT |s1| 1))
                    (LETT |not_exp?| (NULL (|HDTOP;exposed_op?| |s1| %)))
                    (|HDTOP;show_op_detail| |page| "operation" (QVELT |s1| 2)
                     |op| (QVELT |s1| 0) |pred| |doc| |j| |exactly_one|
                     '|dbChooseDomainOp| |not_exp?| 'T |star?| %)
                    (EXIT
                     (COND
                      (|not_exp?| (SPADCALL |star?| 'T (QREFELT % 105)))))))) 

(SDEFUN |HDTOP;show_ops_documentation|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|exposedOnlyIfTrue| (|Boolean|)) (|star?| (|Reference| (|Boolean|)))
         (% (|Void|)))
        (SPROG
         ((|domname| #1=(|SExpression|)) (|conform| #1#)
          (|exactly_one| (|Boolean|)) (|base| NIL) (|rec| NIL) (#2=#:G833 NIL)
          (|op| (|Symbol|)) (|j| NIL) (|s1| NIL) (#3=#:G834 NIL))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |domname| (SPADCALL |page| '|domname| (QREFELT % 19)))
              (COND
               ((NULL (SPADCALL |domname| (QREFELT % 57)))
                (LETT |conform| |domname|)))
              (LETT |exactly_one|
                    (COND ((NULL |opl|) NIL) (#4='T (NULL (CDR |opl|)))))
              (LETT |exactly_one|
                    (COND
                     (|exactly_one|
                      (EQL (LENGTH (QCDR (|SPADfirst| |opl|))) 1))
                     (#4# NIL)))
              (EXIT
               (SEQ (LETT |base| 0) (LETT |rec| NIL) (LETT #2# |opl|) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |op| (QCAR |rec|))
                         (EXIT
                          (SEQ (LETT |j| 0) (LETT |s1| NIL)
                               (LETT #3# (QCDR |rec|)) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |s1| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (|HDTOP;show_op_documentation| |page| |s1|
                                  |op| (+ |base| |j|) |exactly_one| |star?|
                                  %)))
                               (LETT #3#
                                     (PROG1 (CDR #3#)
                                       (LETT |j| (|inc_SI| |j|))))
                               (GO G190) G191 (EXIT NIL))))
                    (LETT #2#
                          (PROG1 (CDR #2#)
                            (LETT |base| (|add_SI| |base| 8192))))
                    (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDTOP;choose_domain_op|
        ((|page| (|HyperdocPage|)) (|k| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|#G279|
           (|Record| (|:| |quotient| #1=(|Integer|))
                     (|:| |remainder| #2=(|Integer|))))
          (|opn| #1#) (|n| #2#)
          (|lst|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|el|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (|op| #3=(|Symbol|))
          (|opd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|el2|
           (|Record| (|:| |name| #3#)
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ
          (PROGN
           (LETT |#G279| (|divide_INT| |k| 8192))
           (LETT |opn| (QCAR |#G279|))
           (LETT |n| (QCDR |#G279|))
           |#G279|)
          (LETT |lst| (|HDTOP;get_op_lst| |page| %))
          (LETT |el| (SPADCALL |lst| (+ |opn| 1) (QREFELT % 138)))
          (LETT |op| (QCAR |el|))
          (LETT |opd| (SPADCALL (QCDR |el|) (+ |n| 1) (QREFELT % 140)))
          (LETT |page|
                (SPADCALL
                 (|HDTOP;copy_property_list| (SPADCALL |page| (QREFELT % 124))
                  %)
                 (QREFELT % 38)))
          (LETT |el2| (CONS |op| (LIST |opd|)))
          (|HDTOP;set_op_lst| |page| (LIST |el2|) %)
          (EXIT (|HDTOP;show_ops| |page| '|documentation| %))))) 

(SDEFUN |HDTOP;pack_pair|
        ((|i| (|Integer|)) (|j| (|Integer|)) (% (|SExpression|)))
        (SPROG ((|lse| (|List| (|SExpression|))))
               (SEQ
                (LETT |lse|
                      (LIST (SPADCALL |i| (QREFELT % 100))
                            (SPADCALL |j| (QREFELT % 100))))
                (EXIT (SPADCALL |lse| (QREFELT % 55)))))) 

(SDEFUN |HDTOP;con_kind| ((|c| (|SExpression|)) (% (|String|)))
        (SPADCALL
         (|HDTOP;get_constructor_kind|
          (SPADCALL (SPADCALL |c| (QREFELT % 75)) (QREFELT % 59)) %)
         (QREFELT % 62))) 

(SDEFUN |HDTOP;show_op_data|
        ((|page| (|HyperdocPage|))
         (|data|
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
         (|constructorIfTrue| (|Boolean|)) (|word| (|String|))
         (|fun| (|Symbol|)) (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|single?| (|Boolean|)) (|el1| NIL) (#1=#:G862 NIL)
          (|tag| (|SExpression|))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|st| (|Symbol|)) (|phrase1| (|String|)) (|bin_cnt| (|Integer|)))
         (SEQ (|HDTOP;set_ops_grd| |page| |data| %)
              (LETT |single?| (NULL (CDR |data|)))
              (|HDTOP;begin_menu| |page| %) (LETT |bin_cnt| 1)
              (SEQ (LETT |el1| NIL) (LETT #1# |data|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |tag| (QCAR |el1|)) (LETT |opl| (QCDR |el1|))
                        (SPADCALL |page| "\\item" (QREFELT % 32))
                        (COND
                         (|single?|
                          (SPADCALL |page| (QREFELT % 53) (QREFELT % 32)))
                         ('T
                          (|HDTOP;add_op_link0| |page| '|bcLinks|
                           (QREFELT % 53) '|dbShowOps|
                           (|HDTOP;pack_pair| |bin_cnt| 0 %) %)))
                        (SPADCALL |page| "{\\em " (QREFELT % 32))
                        (LETT |phrase1|
                              (COND
                               ((SPADCALL |tag| (QREFELT % 61))
                                (SEQ
                                 (LETT |st| (SPADCALL |tag| (QREFELT % 59)))
                                 (EXIT
                                  (COND
                                   ((EQUAL |st| '|nowhere|)
                                    "implemented nowhere")
                                   ((EQUAL |st| '|constant|) "constant")
                                   ((EQUAL |st| '|unexported|) "unexported")
                                   ((EQUAL |st| '%) "by the domain")
                                   (|constructorIfTrue|
                                    (SEQ
                                     (SPADCALL |page| |word| (QREFELT % 32))
                                     (EXIT " an unknown constructor")))
                                   ('T "unconditional")))))
                               ((SPADCALL |tag| (QREFELT % 73))
                                (COND
                                 (|constructorIfTrue|
                                  (SEQ (SPADCALL |page| |word| (QREFELT % 32))
                                       (EXIT "")))
                                 ('T "")))
                               ('T (|error| "show_op_data: unexpected tag"))))
                        (SPADCALL |page| |phrase1| (QREFELT % 32))
                        (SPADCALL |page| "}" (QREFELT % 32))
                        (COND
                         ((SPADCALL |tag| (QREFELT % 73))
                          (SEQ
                           (COND
                            (|constructorIfTrue|
                             (|HDTOP;add_list_to| |page|
                              (LIST " {\\em " (|HDTOP;con_kind| |tag| %) "}")
                              %)))
                           (SPADCALL |page| " " (QREFELT % 32))
                           (EXIT
                            (COND
                             ((EQUAL |fun| '|bcStarConform|)
                              (|HDTOP;emit_starred_constructor| |page| |tag|
                               |star?| %))
                             ((EQUAL |fun| '|bcPred|)
                              (|HDTOP;emit_predicate| |page| |tag|
                               (SPADCALL NIL (QREFELT % 55)) %))
                             ('T
                              (|error|
                               "show_op_data: unexpected function symbol")))))))
                        (SPADCALL |page| ":\\newline " (QREFELT % 32))
                        (|HDTOP;show_op_signatures| |page| |opl| |bin_cnt|
                         |star?| %)
                        (EXIT (LETT |bin_cnt| (+ |bin_cnt| 1))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|HDTOP;end_menu| |page| %))))) 

(SDEFUN |HDTOP;show_op_origins|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|data|
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
         (SEQ (LETT |data| (SPADCALL |lst| (QREFELT % 143)))
              (EXIT
               (|HDTOP;show_op_data| |page| |data| 'T "from" '|bcStarConform|
                |star?| %))))) 

(SDEFUN |HDTOP;show_op_implementations|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|domname| (|SExpression|)) (|args| (|List| (|SExpression|)))
          (|data|
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
         (SEQ (LETT |domname| (SPADCALL |page| '|domname| (QREFELT % 19)))
              (EXIT
               (COND
                ((SPADCALL |domname| (QREFELT % 57))
                 (|error| "show_op_implementations: no domname"))
                ('T
                 (SEQ
                  (LETT |args|
                        (CDR
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |domname| (QREFELT % 75))
                                     (QREFELT % 59))
                           (QREFELT % 108))
                          (QREFELT % 56))))
                  (LETT |data|
                        (SPADCALL |args| |domname| |lst| (QREFELT % 144)))
                  (EXIT
                   (|HDTOP;show_op_data| |page| |data| 'T "by" '|bcStarConform|
                    |star?| %))))))))) 

(SDEFUN |HDTOP;show_op_conditions|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|data|
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
         (SEQ (LETT |data| (SPADCALL |lst| (QREFELT % 145)))
              (EXIT
               (|HDTOP;show_op_data| |page| |data| NIL "" '|bcPred| |star?|
                %))))) 

(SDEFUN |HDTOP;ops_title_suffix| ((|branch| (|Symbol|)) (% (|String|)))
        (COND ((EQUAL |branch| '|parameters|) " viewed with parameters")
              ((EQUAL |branch| '|origins|) " organized by origins")
              ((EQUAL |branch| '|conditions|) " organized by conditions")
              ('T ""))) 

(SDEFUN |HDTOP;from_part| ((|page| (|HyperdocPage|)) (% (|List| (|String|))))
        (SPROG ((|res| (|List| (|String|))))
               (SEQ
                (LETT |res| (SPADCALL |page| '|fromHeading| (QREFELT % 19)))
                (EXIT |res|)))) 

(SDEFUN |HDTOP;emit_star| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPADCALL |page| "{\\em *} " (QREFELT % 32))) 

(SDEFUN |HDTOP;show_op_names|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|rec| NIL) (#1=#:G888 NIL) (|i| NIL) (|sd| NIL) (#2=#:G889 NIL)
          (|exposed?| #3=(|Boolean|)) (|had_star?| #3#)
          (|lnk1| (|SExpression|)) (|ns| (|String|)))
         (SEQ (LETT |had_star?| NIL) (|HDTOP;start_table| |page| %)
              (SEQ (LETT |rec| NIL) (LETT #1# |opl|) (LETT |i| 0) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |exposed?| NIL)
                        (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |rec|)) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |sd| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |exposed?|
                                     (COND (|exposed?| 'T)
                                           ('T
                                            (|HDTOP;exposed_op?| |sd| %))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (SPADCALL |page| "{" (QREFELT % 32))
                        (COND
                         (|exposed?|
                          (SPADCALL |page| "\\space{2}" (QREFELT % 32)))
                         ('T
                          (SEQ (LETT |had_star?| 'T)
                               (EXIT (|HDTOP;emit_star| |page| %)))))
                        (LETT |lnk1| (SPADCALL |i| (QREFELT % 100)))
                        (LETT |ns|
                              (|HDTOP;escape_if_needed|
                               (SPADCALL (QCAR |rec|) (QREFELT % 62)) %))
                        (|HDTOP;add_op_link0| |page| '|bcLinks| |ns|
                         '|dbShowOps| |lnk1| %)
                        (EXIT (SPADCALL |page| "}" (QREFELT % 32))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                   (GO G190) G191 (EXIT NIL))
              (|HDTOP;end_table| |page| %)
              (EXIT
               (COND (|had_star?| (SPADCALL |star?| 'T (QREFELT % 105)))))))) 

(SDEFUN |HDTOP;show_op_parameters|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|rec| NIL) (#1=#:G900 NIL) (|op| (|Symbol|)) (|sd| NIL)
          (#2=#:G901 NIL) (|i| (|Integer|)) (|exposed?| (|Boolean|))
          (|had_star?| (|Boolean|)) (|args| (|List| (|Symbol|))))
         (SEQ (LETT |had_star?| NIL) (|HDTOP;start_table| |page| %)
              (LETT |i| 0)
              (SEQ (LETT |rec| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |op| (QCAR |rec|))
                        (EXIT
                         (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |rec|)) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |sd| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |i| (+ |i| 1))
                                   (LETT |exposed?|
                                         (|HDTOP;exposed_op?| |sd| %))
                                   (SPADCALL |page| "{" (QREFELT % 32))
                                   (COND
                                    (|exposed?|
                                     (SPADCALL |page| "\\space{2}"
                                               (QREFELT % 32)))
                                    ('T
                                     (SEQ (LETT |had_star?| 'T)
                                          (EXIT
                                           (|HDTOP;emit_star| |page| %)))))
                                   (LETT |args|
                                         (|HDTOP;operation_arguments| |op|
                                          (QVELT |sd| 0) (QVELT |sd| 3) %))
                                   (|HDTOP;display_op_sig| |page|
                                    (SPADCALL |op| (QREFELT % 35)) |args|
                                    (+ (LENGTH |args|) 1) (QVELT |sd| 1)
                                    (SPADCALL |i| (QREFELT % 100)) NIL %)
                                   (EXIT (SPADCALL |page| "}" (QREFELT % 32))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (|HDTOP;end_table| |page| %)
              (EXIT
               (COND (|had_star?| (SPADCALL |star?| 'T (QREFELT % 105)))))))) 

(SDEFUN |HDTOP;show_op_signatures|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|j| (|Integer|)) (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|rec| NIL) (#1=#:G911 NIL) (|sd| NIL) (#2=#:G912 NIL)
          (|exposed?| (|Boolean|)) (|had_star?| (|Boolean|))
          (|lnk1| (|SExpression|)) (|i| (|Integer|)) (|ns| (|String|))
          (|mt| (|List| (|SExpression|))))
         (SEQ (LETT |had_star?| NIL) (|HDTOP;start_table| |page| %)
              (LETT |i| 1)
              (SEQ (LETT |rec| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |rec|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |sd| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |exposed?| (|HDTOP;exposed_op?| |sd| %))
                               (SPADCALL |page| "{" (QREFELT % 32))
                               (COND
                                (|exposed?|
                                 (SPADCALL |page| "\\space{2}" (QREFELT % 32)))
                                ('T
                                 (SEQ (LETT |had_star?| 'T)
                                      (EXIT (|HDTOP;emit_star| |page| %)))))
                               (LETT |lnk1|
                                     (COND
                                      ((EQL |j| 0)
                                       (SPADCALL |i| (QREFELT % 100)))
                                      ('T (|HDTOP;pack_pair| |j| |i| %))))
                               (LETT |i| (+ |i| 1))
                               (LETT |ns|
                                     (|HDTOP;escape_if_needed|
                                      (SPADCALL (QCAR |rec|) (QREFELT % 62))
                                      %))
                               (|HDTOP;add_op_link0| |page| '|bcLinks| |ns|
                                '|dbShowOps| |lnk1| %)
                               (SPADCALL |page| ": " (QREFELT % 32))
                               (LETT |mt|
                                     (CONS (SPADCALL '|Mapping| (QREFELT % 35))
                                           (SPADCALL (QVELT |sd| 0)
                                                     (QREFELT % 56))))
                               (|HDTOP;emit_constructor| |page|
                                (SPADCALL |mt| (QREFELT % 55)) %)
                               (EXIT (SPADCALL |page| "}" (QREFELT % 32))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (|HDTOP;end_table| |page| %)
              (EXIT
               (COND (|had_star?| (SPADCALL |star?| 'T (QREFELT % 105)))))))) 

(SDEFUN |HDTOP;show_op_lines0|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|key| (|Symbol|)) (|exposedOnlyIfTrue| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|cnt| (|Integer|)) (|branch| (|Symbol|))
          (|cnt2| (|NonNegativeInteger|)) (|op1| (|Symbol|))
          (|namedPart| (|List| (|String|))) (|cnt_str| #1=(|String|))
          (|prefix| (|List| #1#)) (|title| (|List| (|String|)))
          (|star?| (|Reference| (|Boolean|))) (#2=#:G934 NIL))
         (SEQ
          (COND
           (|exposedOnlyIfTrue|
            (LETT |opl| (|HDTOP;drop_unexposed_ops| |opl| %))))
          (LETT |cnt| (|HDTOP;count_ops| |opl| %))
          (LETT |branch|
                (SEQ
                 (COND
                  ((EQUAL |key| '|names|)
                   (COND
                    ((NULL (CDR |opl|))
                     (EXIT
                      (COND ((<= |cnt| (QREFELT % 15)) '|documentation|)
                            (#3='T |key|)))))))
                 (EXIT |key|)))
          (LETT |cnt2| (LENGTH |opl|))
          (LETT |namedPart|
                (SEQ
                 (COND
                  ((NULL (NULL |opl|))
                   (COND
                    ((NULL (CDR |opl|))
                     (EXIT
                      (SEQ (LETT |op1| (QCAR (|SPADfirst| |opl|)))
                           (EXIT
                            (LIST " {\\em "
                                  (|HDTOP;escape_if_needed|
                                   (SPADCALL |op1| (QREFELT % 62)) %)
                                  "}"))))))))
                 (EXIT NIL)))
          (LETT |cnt_str| (|HDTOP;get_count_str| |cnt| %))
          (LETT |prefix|
                (COND (|exposedOnlyIfTrue| (LIST |cnt_str| " exposed "))
                      (#3# (LIST |cnt_str|))))
          (LETT |title|
                (COND
                 ((EQL |cnt| 0)
                  (SPADCALL |prefix| "operations" (QREFELT % 109)))
                 ((OR (EQL |cnt2| 1) (EQL |cnt2| |cnt|))
                  (COND
                   ((EQL |cnt| 1)
                    (COND
                     (|exposedOnlyIfTrue|
                      (SPADCALL (LIST "Exposed " "operation") |namedPart|
                                (QREFELT % 110)))
                     (#3#
                      (SPADCALL (LIST "Operation" " ") |namedPart|
                                (QREFELT % 110)))))
                   (#3#
                    (SPADCALL |prefix| (CONS "operations" |namedPart|)
                              (QREFELT % 110)))))
                 ('T
                  (SPADCALL
                   (LIST (STRINGIMAGE |cnt2|) " names for " |cnt_str|
                         "operations")
                   |namedPart| (QREFELT % 110)))))
          (LETT |page|
                (SPADCALL
                 (|HDTOP;copy_property_list| (SPADCALL |page| (QREFELT % 124))
                  %)
                 (QREFELT % 38)))
          (LETT |title|
                (SPADCALL |title| (|HDTOP;from_part| |page| %)
                          (QREFELT % 110)))
          (LETT |title|
                (SPADCALL |title| (|HDTOP;ops_title_suffix| |branch| %)
                          (QREFELT % 109)))
          (|HDTOP;add_title| |page| |title| %)
          (SPADCALL |page| '|branch| (SPADCALL |branch| (QREFELT % 35))
                    (QREFELT % 21))
          (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
          (LETT |star?| (SPADCALL NIL (QREFELT % 111)))
          (COND
           ((EQUAL |branch| '|names|)
            (|HDTOP;show_op_names| |page| |opl| |star?| %))
           ((EQUAL |branch| '|documentation|)
            (|HDTOP;show_ops_documentation| |page| |opl| |exposedOnlyIfTrue|
             |star?| %))
           ((EQUAL |branch| '|signatures|)
            (|HDTOP;show_op_signatures| |page| |opl| 0 |star?| %))
           ((EQUAL |branch| '|parameters|)
            (|HDTOP;show_op_parameters| |page| |opl| |star?| %))
           ((EQUAL |branch| '|origins|)
            (|HDTOP;show_op_origins| |page| |opl| |star?| %))
           ((EQUAL |branch| '|implementation|)
            (|HDTOP;show_op_implementations| |page| |opl| |star?| %))
           (#3#
            (SEQ
             (EXIT
              (COND
               ((EQUAL |branch| '|conditions|)
                (PROGN
                 (LETT #2# (|HDTOP;show_op_conditions| |page| |opl| |star?| %))
                 (GO #4=#:G924)))))
             #4# (EXIT #2#))))
          (COND
           ((SPADCALL |star?| (QREFELT % 131)) (|HDTOP;star_remark| |page| %)))
          (SPADCALL |page| "\\endscroll " (QREFELT % 32))
          (|HDTOP;operations_menu| |page| |branch| |exposedOnlyIfTrue| %)
          (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;show_op_lines3|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|key| (|Symbol|)) (% (|Void|)))
        (|HDTOP;show_op_lines0| |page| |opl| |key| (QREFELT % 13) %)) 

(SDEFUN |HDTOP;show_op_lines|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (% (|Void|)))
        (SPROG ((|page| (|HyperdocPage|)))
               (SEQ
                (LETT |page|
                      (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
                (|HDTOP;set_op_lst| |page| |opl| %)
                (EXIT (|HDTOP;show_op_lines3| |page| |opl| '|names| %))))) 

(SDEFUN |HDTOP;search_query|
        ((|tag| (|Symbol|)) (|kind| (|String|)) (% (|Void|)))
        (SPROG ((|items| (|List| (|SExpression|))) (|page| (|HyperdocPage|)))
               (SEQ
                (LETT |items|
                      (LIST (SPADCALL |tag| (QREFELT % 35))
                            (SPADCALL |kind| (QREFELT % 33))))
                (LETT |page|
                      (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
                (SPADCALL |page| '|items| (SPADCALL |items| (QREFELT % 55))
                          (QREFELT % 21))
                (|HDTOP;add_title| |page| (LIST "Query Page") %)
                (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
                (|HDTOP;emit_query| |page|
                 (LIST "{\\em Do you want a list of {\\em all} "
                       (|HDTOP;plural_form| |kind| %) "?\\vspace{1}}")
                 '|grepSearchJump| %)
                (SPADCALL |page| "\\endscroll" (QREFELT % 32))
                (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;do_operation_search| ((|pat| (|String|)) (% (|Void|)))
        (SPROG
         ((|opl_u|
           (|Union|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
            (|ErrorIndicator|)))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|cnt| (|NonNegativeInteger|)))
         (SEQ (LETT |opl_u| (SPADCALL |pat| (QREFELT % 147)))
              (EXIT
               (COND ((QEQCAR |opl_u| 1) (|HDTOP;error_page| (QCDR |opl_u|) %))
                     (#1='T
                      (SEQ (LETT |opl| (QCDR |opl_u|))
                           (LETT |cnt| (LENGTH |opl|))
                           (EXIT
                            (COND
                             ((EQL |cnt| 0)
                              (|HDTOP;empty_result| "operation" |pat| "" %))
                             (#1# (|HDTOP;show_op_lines| |opl| %))))))))))) 

(SDEFUN |HDTOP;operation_search| ((|pat| (|String|)) (% (|Void|)))
        (COND ((EQUAL |pat| "*") (|HDTOP;search_query| '|o| "operation" %))
              ('T (|HDTOP;do_operation_search| |pat| %)))) 

(SDEFUN |HDTOP;add_link1|
        ((|page| (|HyperdocPage|)) (|label| (|String|)) (|fun| (|Symbol|))
         (% (|Void|)))
        (|HDTOP;add_op_link0| |page| '|bcLinks| |label| '|cons_opts|
         (SPADCALL |fun| (QREFELT % 35)) %)) 

(SDEFUN |HDTOP;add_link|
        ((|page| (|HyperdocPage|)) (|label| (|String|)) (|fun| (|Symbol|))
         (% (|Void|)))
        (SEQ (SPADCALL |page| "}{" (QREFELT % 32))
             (EXIT (|HDTOP;add_link1| |page| |label| |fun| %)))) 

(SDEFUN |HDTOP;constructor_context_menu|
        ((|page| (|HyperdocPage|)) (|kind| (|String|))
         (|is_asharp?| (|Boolean|)) (% (|Void|)))
        (SEQ (|HDTOP;start_table| |page| %)
             (SPADCALL |page| "{" (QREFELT % 32))
             (|HDTOP;add_link1| |page| "Ancestors" '|ancestors| %)
             (COND
              ((EQUAL |kind| "category")
               (|HDTOP;add_link| |page| "Children" '|children| %)))
             (COND
              ((NULL |is_asharp?|)
               (|HDTOP;add_link| |page| "Dependents" '|dependents| %)))
             (COND
              ((EQUAL |kind| "category")
               (SEQ (|HDTOP;add_link| |page| "Descendents" '|descendents| %)
                    (EXIT
                     (COND
                      (|is_asharp?|
                       (SPADCALL |page| "}{{\\em Domains}" (QREFELT % 32)))
                      (#1='T
                       (|HDTOP;add_link| |page| "Domains" '|domains| %)))))))
             (SPADCALL |page| "}{{\\em Examples}" (QREFELT % 32))
             (|HDTOP;add_link| |page| "Exports" '|exports| %)
             (|HDTOP;add_link| |page| "Operations" '|operations| %)
             (|HDTOP;add_link| |page| "Parents" '|parents| %)
             (COND
              ((SPADCALL |kind| "category" (QREFELT % 107))
               (SEQ
                (COND
                 (|is_asharp?|
                  (SPADCALL |page| "}{{\\em Search Path}" (QREFELT % 32)))
                 (#1#
                  (|HDTOP;add_link| |page| "Search Path" '|search_path| %)))
                (|HDTOP;add_link| |page| "Users" '|users| %)
                (EXIT (|HDTOP;add_link| |page| "Uses" '|uses| %)))))
             (SPADCALL |page| "}" (QREFELT % 32))
             (EXIT (|HDTOP;end_table| |page| %)))) 

(SDEFUN |HDTOP;add_parameter_fields|
        ((|page| (|HyperdocPage|)) (|conform| (|List| (|SExpression|)))
         (|a_strs| (|List| (|String|))) (% (|Void|)))
        (SPROG
         ((#1=#:G983 NIL) (#2=#:G984 NIL) (|parlist| (|List| (|String|)))
          (|s| NIL) (#3=#:G985 NIL) (#4=#:G972 #5=(|Integer|)) (#6=#:G970 #5#)
          (#7=#:G971 NIL) (|need_wide?| (|Boolean|)) (|w| (|Integer|))
          (|val_str| (|String|)) (|pvars| (|List| (|Symbol|))) (|spar| NIL)
          (#8=#:G988 NIL) (#9=#:G987 NIL) (|parname| NIL) (#10=#:G986 NIL)
          (|par| (|SExpression|)) (|even| (|Boolean|)) (|a_str| (|String|))
          (|l1| (|List| (|SExpression|))) (|l2| (|List| (|SExpression|))))
         (SEQ
          (LETT |parlist|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT #2# (CDR |conform|)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |par| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |par| (QREFELT % 59))
                                         (QREFELT % 62))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |need_wide?|
                (>
                 (PROGN
                  (LETT #7# NIL)
                  (SEQ (LETT |s| NIL) (LETT #3# |parlist|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (QCSIZE |s|))
                          (COND (#7# (LETT #6# (MAX #6# #4#)))
                                ('T (PROGN (LETT #6# #4#) (LETT #7# 'T)))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (COND (#7# #6#) (#11='T (|IdentityError| '|max|))))
                 10))
          (LETT |w| (COND (|need_wide?| 55) (#11# 23)))
          (SPADCALL |page| "Optional argument " (QREFELT % 32))
          (LETT |val_str|
                (COND ((NULL (NULL (CDR |parlist|))) "values:") ('T "value:")))
          (SPADCALL |page| |val_str| (QREFELT % 32)) (LETT |even| NIL)
          (LETT |pvars| |$PatternVariableList|)
          (EXIT
           (SEQ (LETT |spar| NIL) (LETT #8# |parlist|)
                (LETT #9# (CDR |conform|)) (LETT |parname| NIL)
                (LETT #10# |pvars|) G190
                (COND
                 ((OR (ATOM #10#) (PROGN (LETT |parname| (CAR #10#)) NIL)
                      (ATOM #9#) (PROGN (LETT |par| (CAR #9#)) NIL) (ATOM #8#)
                      (PROGN (LETT |spar| (CAR #8#)) NIL))
                  (GO G191)))
                (SEQ (LETT |par| (|HDTOP;fix_T| |par| %))
                     (SPADCALL |page|
                               (COND ((OR |even| |need_wide?|) "\\newline")
                                     ('T "\\tab{29}"))
                               (QREFELT % 32))
                     (LETT |even| (NULL |even|)) (LETT |a_str| "")
                     (COND
                      ((NULL (NULL |a_strs|))
                       (SEQ (LETT |a_str| (|SPADfirst| |a_strs|))
                            (EXIT (LETT |a_strs| (CDR |a_strs|))))))
                     (LETT |l1|
                           (LIST (SPADCALL '|text| (QREFELT % 35))
                                 (SPADCALL "{\\em " (QREFELT % 33)) |par|
                                 (SPADCALL "} = " (QREFELT % 33))))
                     (LETT |l2|
                           (LIST
                            (SPADCALL (- |w| (QCSIZE |spar|)) (QREFELT % 100))
                            (SPADCALL |a_str| (QREFELT % 33))
                            (SPADCALL |parname| (QREFELT % 35))
                            (SPADCALL 'EM (QREFELT % 35))))
                     (EXIT
                      (SPADCALL |page|
                                (LIST (SPADCALL |l1| (QREFELT % 55))
                                      (SPADCALL
                                       (LIST
                                        (SPADCALL '|bcStrings| (QREFELT % 35))
                                        (SPADCALL |l2| (QREFELT % 55)))
                                       (QREFELT % 55)))
                                (QREFELT % 37))))
                (LETT #10#
                      (PROG1 (CDR #10#)
                        (LETT #9# (PROG1 (CDR #9#) (LETT #8# (CDR #8#))))))
                (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDTOP;capitalize| ((|s| (|String|)) (% (|String|)))
        (SEQ (LETT |s| (COPY-SEQ |s|))
             (SPADCALL |s| 1
                       (SPADCALL (SPADCALL |s| 1 (QREFELT % 49))
                                 (QREFELT % 148))
                       (QREFELT % 149))
             (EXIT |s|))) 

(SDEFUN |HDTOP;constructor_page|
        ((|name| (|Symbol|)) (|form| (|List| (|SExpression|)))
         (|args| (|List| (|String|))) (% (|Void|)))
        (SPROG
         ((|kind| (|Symbol|)) (|kind_s| #1=(|String|))
          (|conform| (|SExpression|)) (|nargs| (|Integer|))
          (|constrings| (|List| (|String|))) (|heading| #2=(|List| (|String|)))
          (|exp?| (|Boolean|)) (|heading1| (|List| #1#)) (|title| #2#)
          (|page| (|HyperdocPage|)) (|star?| (|Reference| (|Boolean|))))
         (SEQ (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |kind_s| (SPADCALL |kind| (QREFELT % 62)))
              (LETT |conform| (SPADCALL |name| (QREFELT % 108)))
              (LETT |nargs| (- (SPADCALL |conform| (QREFELT % 96)) 1))
              (LETT |constrings|
                    (COND
                     ((> (LENGTH |form|) 1)
                      (SPADCALL |name| |form| (QREFELT % 150)))
                     (#3='T (LIST (SPADCALL |name| (QREFELT % 62))))))
              (LETT |heading|
                    (SPADCALL |constrings| (LIST "}") (QREFELT % 110)))
              (LETT |heading| (CONS "{" |heading|))
              (LETT |exp?| (SPADCALL |name| (QREFELT % 60)))
              (LETT |heading1|
                    (COND (|exp?| (LIST (|HDTOP;capitalize| |kind_s| %) " "))
                          (#3# (LIST "Unexposed " |kind_s| " "))))
              (LETT |title| (SPADCALL |heading1| |heading| (QREFELT % 110)))
              (LETT |page| (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
              (|HDTOP;add_title| |page| |title| %)
              (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
              (SPADCALL |page| '|heading| |heading| (QREFELT % 21))
              (SPADCALL |page| '|kind| (SPADCALL |kind_s| (QREFELT % 33))
                        (QREFELT % 21))
              (SPADCALL |page| '|conform| |conform| (QREFELT % 21))
              (LETT |star?| (SPADCALL |exp?| (QREFELT % 111)))
              (|HDTOP;show_cons_doc2| |page| |conform| 0 'T |star?| %)
              (COND
               ((> |nargs| 0)
                (|HDTOP;add_parameter_fields| |page|
                 (SPADCALL |conform| (QREFELT % 56)) |args| %)))
              (COND
               ((NULL (SPADCALL |star?| (QREFELT % 131)))
                (|HDTOP;star_remark| |page| %)))
              (SPADCALL |page| "\\endscroll " (QREFELT % 32))
              (|HDTOP;constructor_context_menu| |page| |kind_s| NIL %)
              (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;show_constructor_res|
        ((|lst_u|
          (|Union|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))
           (|ErrorIndicator|)))
         (|desc| (|String|)) (|pat| (|String|)) (% (|Void|)))
        (COND ((QEQCAR |lst_u| 1) (|HDTOP;error_page| (QCDR |lst_u|) %))
              ('T
               (|HDTOP;show_split_constructors| (QCDR |lst_u|) |desc| |pat|
                %)))) 

(SDEFUN |HDTOP;do_constructor_search|
        ((|pat| (|String|)) (|tag| (|Symbol|)) (|desc| (|String|))
         (% (|Void|)))
        (SPROG
         ((|lst_u|
           (|Union|
            (|Record| (|:| |categories| (|List| (|Symbol|)))
                      (|:| |domains| (|List| (|Symbol|)))
                      (|:| |packages| (|List| (|Symbol|))))
            (|ErrorIndicator|))))
         (SEQ (LETT |lst_u| (SPADCALL |pat| |tag| (QREFELT % 153)))
              (EXIT (|HDTOP;show_constructor_res| |lst_u| |desc| |pat| %))))) 

(SDEFUN |HDTOP;con_with_params?| ((|pat| (|String|)) (% (|SExpression|)))
        (SPROG ((|pt| (|InputForm|)))
               (SEQ
                (COND ((EQUAL |pat| "Mapping") (SPADCALL NIL (QREFELT % 55)))
                      (#1='T
                       (SEQ (LETT |pt| (SPADCALL |pat| (QREFELT % 89)))
                            (EXIT
                             (COND
                              ((SPADCALL |pt| (QREFELT % 154))
                               (SPADCALL |pt| (QREFELT % 155)))
                              (#1# (|quiet_valid_type?| |pt|)))))))))) 

(SDEFUN |HDTOP;constructor_search|
        ((|pat| (|String|)) (|tag| (|Symbol|)) (|desc| (|String|))
         (% (|Void|)))
        (SPROG
         ((|parse| (|SExpression|)) (|su| (|Union| (|Symbol|) "failed"))
          (|s| (|Symbol|)) (|cn| (|SExpression|))
          (|lu| (|Union| (|String|) "failed")))
         (SEQ (LETT |parse| (|HDTOP;con_with_params?| |pat| %))
              (COND
               ((NULL (SPADCALL |parse| (QREFELT % 57)))
                (EXIT (|HDTOP;con_page| |parse| %))))
              (LETT |su| (|find_symbol| |pat|))
              (COND
               ((QEQCAR |su| 0)
                (SEQ (LETT |s| (QCDR |su|))
                     (LETT |cn| (|get_database| |s| 'CONSTRUCTOR))
                     (EXIT
                      (COND
                       ((SPADCALL |cn| (QREFELT % 61))
                        (LETT |pat|
                              (SPADCALL (SPADCALL |cn| (QREFELT % 59))
                                        (QREFELT % 62)))))))))
              (LETT |lu| (|HDTOP;is_builtin?| |pat| %))
              (EXIT
               (COND ((QEQCAR |lu| 0) (|HDTOP;downlink| (QCDR |lu|) %))
                     ((EQUAL |pat| "*") (|HDTOP;search_query| |tag| |desc| %))
                     ('T
                      (|HDTOP;do_constructor_search| |pat| |tag| |desc| %))))))) 

(SDEFUN |HDTOP;exposed_op?|
        ((|sd|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))
                    (|:| |origin| (|SExpression|))
                    (|:| |documentation| (|String|))))
         (% (|Boolean|)))
        (SPROG ((|orig_name| (|SExpression|)))
               (SEQ (LETT |orig_name| (SPADCALL (QVELT |sd| 2) (QREFELT % 75)))
                    (EXIT
                     (SPADCALL (SPADCALL |orig_name| (QREFELT % 59))
                               (QREFELT % 60)))))) 

(SDEFUN |HDTOP;drop_unexposed_sigs|
        ((|sdl|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|)))))
         (%
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))))
        (SPROG ((#1=#:G1026 NIL) (|sd| NIL) (#2=#:G1027 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |sd| NIL) (LETT #2# |sdl|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |sd| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|HDTOP;exposed_op?| |sd| %)
                          (LETT #1# (CONS |sd| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |HDTOP;drop_unexposed_ops|
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
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|rec| NIL) (#1=#:G1036 NIL)
          (|sdl1|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (#2=#:G1035 NIL)
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
              (SEQ (LETT |rec| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |sdl1|
                            (|HDTOP;drop_unexposed_sigs| (QCDR |rec|) %))
                      (EXIT
                       (COND
                        ((NULL |sdl1|)
                         (PROGN (LETT #2# |$NoValue|) (GO #3=#:G1028)))
                        ('T
                         (LETT |res|
                               (CONS (CONS (QCAR |rec|) |sdl1|) |res|)))))))
                    #3# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |HDTOP;drop_unexposed_constructors|
        ((|lst| (|List| (|Symbol|))) (% (|List| (|Symbol|))))
        (SPROG ((#1=#:G1040 NIL) (|name| NIL) (#2=#:G1041 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |name| NIL) (LETT #2# |lst|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |name| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |name| (QREFELT % 60))
                          (LETT #1# (CONS |name| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |HDTOP;drop_unexposed_lines|
        ((|lst|
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))))
         (%
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|)))))))))))))
        (SPROG
         ((|ci|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|cats| #1=(|List| (|Symbol|))) (|doms| #1#) (|packs| #1#)
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
           ((QREFELT % 13)
            (SEQ (LETT |ci| (QCAR (QCDR |lst|)))
                 (LETT |cats|
                       (|HDTOP;drop_unexposed_constructors| (QVELT |ci| 0) %))
                 (LETT |doms|
                       (|HDTOP;drop_unexposed_constructors| (QVELT |ci| 1) %))
                 (LETT |packs|
                       (|HDTOP;drop_unexposed_constructors| (QVELT |ci| 2) %))
                 (LETT |opl|
                       (|HDTOP;drop_unexposed_ops| (QCDR (QCDR |lst|)) %))
                 (EXIT
                  (CONS (CONS (VECTOR |cats| |doms| |packs|) |opl|)
                        (QCDR |lst|)))))
           ('T |lst|))))) 

(SDEFUN |HDTOP;count_ops|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (% (|Integer|)))
        (SPROG ((|rec| NIL) (#1=#:G1051 NIL) (|res| (|Integer|)))
               (SEQ (LETT |res| 0)
                    (SEQ (LETT |rec| NIL) (LETT #1# |opl|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (LETT |res| (+ |res| (LENGTH (QCDR |rec|))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |HDTOP;count_lsts|
        ((|le|
          (|Record|
           (|:| |con_info|
                #1=(|Record| (|:| |categories| (|List| (|Symbol|)))
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
                                                (|String|))))))))))
         (% (|Integer|)))
        (SPROG ((|cr| #1#))
               (SEQ (LETT |cr| (QCAR |le|))
                    (EXIT
                     (+
                      (+ (+ (LENGTH (QVELT |cr| 0)) (LENGTH (QVELT |cr| 1)))
                         (LENGTH (QVELT |cr| 2)))
                      (|HDTOP;count_ops| (QCDR |le|) %)))))) 

(SDEFUN |HDTOP;show_split_constructors|
        ((|lst|
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|)))))
         (|kind| (|String|)) (|pat| (|String|)) (% (|Void|)))
        (SPROG ((|n_lst| (|List| (|Symbol|))))
               (SEQ
                (LETT |n_lst|
                      (SPADCALL (QVELT |lst| 0)
                                (SPADCALL (QVELT |lst| 1) (QVELT |lst| 2)
                                          (QREFELT % 156))
                                (QREFELT % 156)))
                (EXIT
                 (COND
                  ((NULL |n_lst|) (|HDTOP;empty_result| |kind| |pat| "" %))
                  ('T (|HDTOP;show_constructors| |n_lst| %))))))) 

(SDEFUN |HDTOP;show_single_list|
        ((|rec|
          (|Record|
           (|:| |con_info|
                #1=(|Record| (|:| |categories| (|List| (|Symbol|)))
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
                                                (|String|))))))))))
         (% (|Void|)))
        (SPROG ((|ci| #1#))
               (SEQ
                (COND
                 ((NULL (NULL (QCDR |rec|)))
                  (|HDTOP;show_op_lines| (QCDR |rec|) %))
                 ('T
                  (SEQ (LETT |ci| (QCAR |rec|))
                       (COND
                        ((NULL (NULL (QVELT |ci| 0)))
                         (EXIT (|HDTOP;show_constructors| (QVELT |ci| 0) %))))
                       (COND
                        ((NULL (NULL (QVELT |ci| 1)))
                         (EXIT (|HDTOP;show_constructors| (QVELT |ci| 1) %))))
                       (COND
                        ((NULL (NULL (QVELT |ci| 2)))
                         (EXIT (|HDTOP;show_constructors| (QVELT |ci| 2) %))))
                       (EXIT
                        (|error| "show_single_list: all lists are empty")))))))) 

(SDEFUN |HDTOP;say_item_count|
        ((|page| (|HyperdocPage|)) (|pre| (|String|)) (|cnt| (|Integer|))
         (|singular| (|String|)) (|plural| (|String|))
         (|tail| (|List| (|String|))) (% (|Void|)))
        (SPROG ((|cnt_str| (|String|)) (|el| NIL) (#1=#:G1073 NIL))
               (SEQ (SPADCALL |page| "\\newline " (QREFELT % 32))
                    (COND
                     ((SPADCALL |pre| "" (QREFELT % 107))
                      (SPADCALL |page| |pre| (QREFELT % 32))))
                    (LETT |cnt_str| (|HDTOP;get_count_str| |cnt| %))
                    (SPADCALL |page| |cnt_str| (QREFELT % 32))
                    (SPADCALL |page|
                              (COND ((< |cnt| 2) |singular|) ('T |plural|))
                              (QREFELT % 32))
                    (SEQ (LETT |el| NIL) (LETT #1# |tail|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (EXIT (SPADCALL |page| |el| (QREFELT % 32))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((> |cnt| 0) (SPADCALL |page| ":" (QREFELT % 32)))))))) 

(SDEFUN |HDTOP;emit_gen_ops|
        ((|page| (|HyperdocPage|))
         (|c_opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|s_opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|j| (|Integer|)) (|fn| (|Symbol|))
         (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|cnt| (|Integer|)) (|u_cnt| (|NonNegativeInteger|))
          (|kind| (|String|)) (|cnt_str| (|String|)) (|rec| NIL)
          (#1=#:G1089 NIL) (|id| (|Symbol|)) (|sd| NIL) (#2=#:G1090 NIL)
          (|exposed?| #3=(|Boolean|)) (|had_star?| #3#)
          (|lnk1| (|SExpression|)) (|i| (|Integer|)))
         (SEQ (LETT |cnt| (|HDTOP;count_ops| |c_opl| %))
              (LETT |u_cnt| (LENGTH |c_opl|))
              (EXIT
               (COND ((EQL |cnt| 0) (SPADCALL (QREFELT % 65)))
                     (#4='T
                      (SEQ (SPADCALL |page| "\\newline " (QREFELT % 32))
                           (SPADCALL |page| "\\tab{2}" (QREFELT % 32))
                           (LETT |kind| "operation")
                           (LETT |lnk1|
                                 (LIST |c_opl|
                                       (SPADCALL |kind| (QREFELT % 33))))
                           (|HDTOP;add_op_link0| |page| '|bcLinks|
                            (QREFELT % 53) '|genSearchSayJump|
                            (SPADCALL |lnk1| (QREFELT % 55)) %)
                           (SPADCALL |page| "{\\em " (QREFELT % 32))
                           (LETT |cnt_str| (|HDTOP;get_count_str| |cnt| %))
                           (SPADCALL |page| |cnt_str| (QREFELT % 32))
                           (SPADCALL |page|
                                     (COND ((< |cnt| 2) |kind|)
                                           (#4#
                                            (|HDTOP;plural_form| |kind| %)))
                                     (QREFELT % 32))
                           (SPADCALL |page| "} " (QREFELT % 32))
                           (EXIT
                            (COND
                             ((>= |u_cnt| (QREFELT % 14))
                              (SPADCALL (QREFELT % 65)))
                             (#4#
                              (SEQ
                               (COND
                                ((SPADCALL |u_cnt| 1 (QREFELT % 157))
                                 (SEQ
                                  (SPADCALL |page| "\\indent{4}"
                                            (QREFELT % 32))
                                  (SPADCALL |page| "\\newline " (QREFELT % 32))
                                  (EXIT (|HDTOP;start_table| |page| %)))))
                               (LETT |had_star?| NIL) (LETT |i| 0)
                               (SEQ (LETT |rec| NIL) (LETT #1# |c_opl|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |rec| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ (LETT |id| (QCAR |rec|))
                                         (LETT |exposed?| NIL)
                                         (SEQ (LETT |sd| NIL)
                                              (LETT #2# (QCDR |rec|)) G190
                                              (COND
                                               ((OR (ATOM #2#)
                                                    (PROGN
                                                     (LETT |sd| (CAR #2#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |exposed?|
                                                      (COND (|exposed?| 'T)
                                                            ('T
                                                             (|HDTOP;exposed_op?|
                                                              |sd| %))))))
                                              (LETT #2# (CDR #2#)) (GO G190)
                                              G191 (EXIT NIL))
                                         (SPADCALL |page| "{" (QREFELT % 32))
                                         (COND
                                          (|exposed?|
                                           (SPADCALL |page| "\\space{1}"
                                                     (QREFELT % 32)))
                                          ('T
                                           (SEQ (LETT |had_star?| 'T)
                                                (EXIT
                                                 (|HDTOP;emit_star| |page|
                                                  %)))))
                                         (LETT |lnk1|
                                               (SPADCALL (+ |j| (* 8 |i|))
                                                         (QREFELT % 100)))
                                         (|HDTOP;add_op_link0| |page|
                                          '|bcLinks|
                                          (SPADCALL |id| (QREFELT % 62)) |fn|
                                          |lnk1| %)
                                         (LETT |i| (+ |i| 1))
                                         (EXIT
                                          (SPADCALL |page| "}"
                                                    (QREFELT % 32))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND
                                ((SPADCALL |u_cnt| 1 (QREFELT % 157))
                                 (SEQ (|HDTOP;end_table| |page| %)
                                      (EXIT
                                       (SPADCALL |page| "\\indent{0}"
                                                 (QREFELT % 32))))))
                               (EXIT
                                (COND
                                 (|had_star?|
                                  (SPADCALL |star?| 'T
                                            (QREFELT % 105)))))))))))))))) 

(SDEFUN |HDTOP;emit_gen_item|
        ((|page| (|HyperdocPage|)) (|c_lst| (|List| (|Symbol|)))
         (|s_lst| (|List| (|Symbol|))) (|kind| (|String|)) (|j| (|Integer|))
         (|fn| (|Symbol|)) (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|cnt| (|Integer|)) (|cnt_str| (|String|)) (|id| NIL)
          (#1=#:G1103 NIL) (|exposed?| (|Boolean|)) (|had_star?| (|Boolean|))
          (|lnk1| (|SExpression|)) (|i| (|Integer|)))
         (SEQ (LETT |cnt| (LENGTH |c_lst|))
              (EXIT
               (COND ((EQL |cnt| 0) (SPADCALL (QREFELT % 65)))
                     (#2='T
                      (SEQ (SPADCALL |page| "\\newline " (QREFELT % 32))
                           (SPADCALL |page| "\\tab{2}" (QREFELT % 32))
                           (LETT |lnk1|
                                 (LIST |s_lst|
                                       (SPADCALL |kind| (QREFELT % 33))))
                           (|HDTOP;add_op_link0| |page| '|bcLinks|
                            (QREFELT % 53) '|genSearchSayJump|
                            (SPADCALL |lnk1| (QREFELT % 55)) %)
                           (SPADCALL |page| "{\\em " (QREFELT % 32))
                           (LETT |cnt_str| (|HDTOP;get_count_str| |cnt| %))
                           (SPADCALL |page| |cnt_str| (QREFELT % 32))
                           (SPADCALL |page|
                                     (COND ((< |cnt| 2) |kind|)
                                           (#2#
                                            (|HDTOP;plural_form| |kind| %)))
                                     (QREFELT % 32))
                           (SPADCALL |page| "} " (QREFELT % 32))
                           (EXIT
                            (COND
                             ((>= |cnt| (QREFELT % 14))
                              (SPADCALL (QREFELT % 65)))
                             (#2#
                              (SEQ
                               (COND
                                ((SPADCALL |cnt| 1 (QREFELT % 90))
                                 (SEQ
                                  (SPADCALL |page| "\\indent{4}"
                                            (QREFELT % 32))
                                  (SPADCALL |page| "\\newline " (QREFELT % 32))
                                  (EXIT (|HDTOP;start_table| |page| %)))))
                               (LETT |i| 1) (LETT |had_star?| NIL)
                               (SEQ (LETT |id| NIL) (LETT #1# |c_lst|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |id| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |exposed?|
                                           (SPADCALL |id| (QREFELT % 60)))
                                     (SPADCALL |page| "{" (QREFELT % 32))
                                     (COND
                                      (|exposed?|
                                       (SPADCALL |page| "\\space{1}"
                                                 (QREFELT % 32)))
                                      ('T
                                       (SEQ (LETT |had_star?| 'T)
                                            (EXIT
                                             (|HDTOP;emit_star| |page| %)))))
                                     (LETT |lnk1|
                                           (SPADCALL (+ |j| (* 8 |i|))
                                                     (QREFELT % 100)))
                                     (|HDTOP;add_op_link0| |page| '|bcLinks|
                                      (SPADCALL |id| (QREFELT % 62)) |fn|
                                      |lnk1| %)
                                     (LETT |i| (+ |i| 1))
                                     (EXIT
                                      (SPADCALL |page| "}" (QREFELT % 32))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND
                                ((SPADCALL |cnt| 1 (QREFELT % 90))
                                 (SEQ (|HDTOP;end_table| |page| %)
                                      (EXIT
                                       (SPADCALL |page| "\\indent{0}"
                                                 (QREFELT % 32))))))
                               (EXIT
                                (COND
                                 (|had_star?|
                                  (SPADCALL |star?| 'T
                                            (QREFELT % 105)))))))))))))))) 

(SDEFUN |HDTOP;add_exposure_button| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|cond| (|Boolean|)) (|lnk1| (|List| (|SExpression|)))
          (|lnk| (|List| (|SExpression|))))
         (SEQ (LETT |cond| (NULL (QREFELT % 13)))
              (LETT |lnk1|
                    (LIST
                     (SPADCALL
                      (COND (|cond| "Exposed Only") ('T "Unexposed Also"))
                      (QREFELT % 33))
                     (SPADCALL "" (QREFELT % 33))
                     (SPADCALL '|repeatSearch| (QREFELT % 35)) |cond|))
              (LETT |lnk|
                    (LIST (SPADCALL '|bcLinks| (QREFELT % 35))
                          (SPADCALL |lnk1| (QREFELT % 55))))
              (EXIT
               (SPADCALL |page| (LIST (SPADCALL |lnk| (QREFELT % 55)))
                         (QREFELT % 37)))))) 

(SDEFUN |HDTOP;emit_gen_lst|
        ((|page| (|HyperdocPage|))
         (|rec|
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))))
         (|fn| (|Symbol|)) (|star?| (|Reference| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((|ccur|
           #1=(|Record| (|:| |categories| (|List| (|Symbol|)))
                        (|:| |domains| (|List| (|Symbol|)))
                        (|:| |packages| (|List| (|Symbol|)))))
          (|csave| #1#))
         (SEQ (LETT |ccur| (QCAR (QCAR |rec|)))
              (LETT |csave| (QCAR (QCDR |rec|)))
              (|HDTOP;emit_gen_ops| |page| (QCDR (QCAR |rec|))
               (QCDR (QCDR |rec|)) 0 |fn| |star?| %)
              (|HDTOP;emit_gen_item| |page| (QVELT |ccur| 0) (QVELT |csave| 0)
               "category" 1 |fn| |star?| %)
              (|HDTOP;emit_gen_item| |page| (QVELT |ccur| 1) (QVELT |csave| 1)
               "domain" 2 |fn| |star?| %)
              (EXIT
               (|HDTOP;emit_gen_item| |page| (QVELT |ccur| 2) (QVELT |csave| 2)
                "package" 3 |fn| |star?| %))))) 

(SDEFUN |HDTOP;doc_search1|
        ((|pat| (|String|))
         (|doc_lst|
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))))
         (% (|Void|)))
        (SPROG
         ((|cnt| (|Integer|)) (|page| (|HyperdocPage|))
          (|title| (|List| (|String|))) (|star?| (|Reference| (|Boolean|))))
         (SEQ (LETT |doc_lst| (|HDTOP;drop_unexposed_lines| |doc_lst| %))
              (LETT |cnt| (|HDTOP;count_lsts| (QCAR |doc_lst|) %))
              (EXIT
               (COND ((EQL |cnt| 0) (|HDTOP;empty_result| "entry" |pat| "" %))
                     ((EQL |cnt| 1)
                      (|HDTOP;show_single_list| (QCAR |doc_lst|) %))
                     (#1='T
                      (SEQ
                       (LETT |page|
                             (SPADCALL (SPADCALL (QREFELT % 23))
                                       (QREFELT % 38)))
                       (|HDTOP;set_reg_list| |page| (CONS 1 "failed") %)
                       (|HDTOP;set_doc_list| |page| |doc_lst| %)
                       (SPADCALL |page| '|filter|
                                 (SPADCALL |pat| (QREFELT % 33))
                                 (QREFELT % 21))
                       (LETT |title|
                             (LIST (|HDTOP;get_count_str| |cnt| %)
                                   (COND ((< |cnt| 2) "entry matches")
                                         (#1# "entries match"))
                                   " " "{\\em "
                                   (|HDTOP;escape_if_needed| |pat| %) "}"))
                       (|HDTOP;add_title| |page| |title| %)
                       (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
                       (|HDTOP;say_item_count| |page|
                        "\\newline Documentation Summary: " |cnt| "mention"
                        "mentions" (LIST " of {\\em " |pat| "}") %)
                       (LETT |star?| (SPADCALL NIL (QREFELT % 111)))
                       (|HDTOP;emit_gen_lst| |page| |doc_lst| '|showDoc|
                        |star?| %)
                       (COND
                        ((SPADCALL |star?| (QREFELT % 131))
                         (|HDTOP;star_remark| |page| %)))
                       (SPADCALL |page| "\\endscroll" (QREFELT % 32))
                       (|HDTOP;add_exposure_button| |page| %)
                       (EXIT (SPADCALL |page| (QREFELT % 39)))))))))) 

(SDEFUN |HDTOP;gen_search1|
        ((|pat| (|String|))
         (|reg_lst|
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))))
         (|doc_lst|
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))))
         (% (|Void|)))
        (SPROG
         ((|reg_cnt| #1=(|Integer|)) (|doc_cnt| #1#) (|cnt| (|Integer|))
          (|lst|
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
                                                 (|String|))))))))))
          (|page| (|HyperdocPage|)) (|pre1| (|String|)) (|pre2| (|String|))
          (|title| (|List| (|String|))) (|star?| (|Reference| (|Boolean|))))
         (SEQ (LETT |reg_lst| (|HDTOP;drop_unexposed_lines| |reg_lst| %))
              (LETT |doc_lst| (|HDTOP;drop_unexposed_lines| |doc_lst| %))
              (LETT |reg_cnt| (|HDTOP;count_lsts| (QCAR |reg_lst|) %))
              (LETT |doc_cnt| (|HDTOP;count_lsts| (QCAR |doc_lst|) %))
              (LETT |cnt| (+ |reg_cnt| |doc_cnt|))
              (EXIT
               (COND ((EQL |cnt| 0) (|HDTOP;empty_result| "entry" |pat| "" %))
                     ((EQL |cnt| 1)
                      (SEQ
                       (LETT |lst|
                             (COND ((EQL |reg_cnt| 1) (QCAR |reg_lst|))
                                   (#2='T (QCAR |doc_lst|))))
                       (EXIT (|HDTOP;show_single_list| |lst| %))))
                     (#2#
                      (SEQ
                       (LETT |page|
                             (SPADCALL (SPADCALL (QREFELT % 23))
                                       (QREFELT % 38)))
                       (|HDTOP;set_reg_list| |page| (CONS 0 |reg_lst|) %)
                       (|HDTOP;set_doc_list| |page| |doc_lst| %)
                       (SPADCALL |page| '|filter|
                                 (SPADCALL |pat| (QREFELT % 33))
                                 (QREFELT % 21))
                       (LETT |pre1|
                             (COND ((QREFELT % 13) "exposed entries match")
                                   (#2# "entries match")))
                       (LETT |pre2|
                             (SPADCALL (LIST (STRINGIMAGE |cnt|) " " |pre1|)
                                       (QREFELT % 113)))
                       (LETT |title|
                             (LIST |pre2| " {\\em "
                                   (|HDTOP;escape_if_needed| |pat| %) "}"))
                       (|HDTOP;add_title| |page| |title| %)
                       (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
                       (COND
                        ((> |doc_cnt| 0)
                         (|HDTOP;say_item_count| |page|
                          "{\\bf Construct Summary:} " |reg_cnt| "name matches"
                          "names match" NIL %)))
                       (LETT |star?| (SPADCALL NIL (QREFELT % 111)))
                       (|HDTOP;emit_gen_lst| |page| |reg_lst| '|showConstruct|
                        |star?| %)
                       (COND
                        ((> |doc_cnt| 0)
                         (SEQ
                          (|HDTOP;say_item_count| |page|
                           "\\newline{\\bf Documentation Summary:} " |doc_cnt|
                           "mention" "mentions" (LIST " of {\\em " |pat| "}")
                           %)
                          (EXIT
                           (|HDTOP;emit_gen_lst| |page| |doc_lst| '|showDoc|
                            |star?| %)))))
                       (COND
                        ((SPADCALL |star?| (QREFELT % 131))
                         (|HDTOP;star_remark| |page| %)))
                       (SPADCALL |page| "\\endscroll" (QREFELT % 32))
                       (|HDTOP;add_exposure_button| |page| %)
                       (EXIT (SPADCALL |page| (QREFELT % 39)))))))))) 

(SDEFUN |HDTOP;doc_search0| ((|pat| (|String|)) (% (|Void|)))
        (SPROG
         ((|doc_u|
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
         (SEQ
          (COND ((EQUAL |pat| "*") (|HDTOP;star_error| %))
                (#1='T
                 (SEQ (LETT |doc_u| (SPADCALL |pat| (QREFELT % 160)))
                      (EXIT
                       (COND
                        ((QEQCAR |doc_u| 1)
                         (|HDTOP;error_page| (QCDR |doc_u|) %))
                        (#1#
                         (|HDTOP;doc_search1| |pat|
                          (CONS (QCDR |doc_u|) (QCDR |doc_u|)) %)))))))))) 

(SDEFUN |HDTOP;gen_search0|
        ((|pat| (|String|)) (|includeDoc?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|reg_u|
           (|Union|
            #1=(|Record|
                (|:| |con_info|
                     (|Record| (|:| |categories| (|List| (|Symbol|)))
                               (|:| |domains| (|List| (|Symbol|)))
                               (|:| |packages| (|List| (|Symbol|)))))
                (|:| |op_info|
                     (|List|
                      (|Record| (|:| |name| (|Symbol|))
                                (|:| |sdl|
                                     (|List|
                                      (|Record|
                                       (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))))
            (|ErrorIndicator|)))
          (|doc_u|
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
            (|ErrorIndicator|)))
          (|doc_lst| #1#))
         (SEQ
          (COND ((EQUAL |pat| "*") (|HDTOP;star_error| %))
                (#2='T
                 (SEQ (LETT |reg_u| (SPADCALL |pat| (QREFELT % 161)))
                      (EXIT
                       (COND
                        ((QEQCAR |reg_u| 1)
                         (|HDTOP;error_page| (QCDR |reg_u|) %))
                        (#2#
                         (SEQ (LETT |doc_lst| (CONS (VECTOR NIL NIL NIL) NIL))
                              (COND
                               (|includeDoc?|
                                (SEQ
                                 (LETT |doc_u|
                                       (SPADCALL |pat| (QREFELT % 160)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |doc_u| 1)
                                    (|HDTOP;error_page| (QCDR |doc_u|) %))
                                   (#2# (LETT |doc_lst| (QCDR |doc_u|))))))))
                              (EXIT
                               (|HDTOP;gen_search1| |pat|
                                (CONS (QCDR |reg_u|) (QCDR |reg_u|))
                                (CONS |doc_lst| |doc_lst|) %)))))))))))) 

(SDEFUN |HDTOP;repeat_search|
        ((|page| (|HyperdocPage|)) (|exp?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|pat| (|String|))
          (|reg_lst_u|
           (|Union|
            (|Record|
             (|:| |cur|
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
                                         (|Record|
                                          (|:| |signature| (|SExpression|))
                                          (|:| |condition| (|SExpression|))
                                          (|:| |origin| (|SExpression|))
                                          (|:| |documentation|
                                               (|String|))))))))))
             (|:| |save|
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
                                         (|Record|
                                          (|:| |signature| (|SExpression|))
                                          (|:| |condition| (|SExpression|))
                                          (|:| |origin| (|SExpression|))
                                          (|:| |documentation|
                                               (|String|)))))))))))
            "failed"))
          (|doc_lst|
           (|Record|
            (|:| |cur|
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
                                        (|Record|
                                         (|:| |signature| (|SExpression|))
                                         (|:| |condition| (|SExpression|))
                                         (|:| |origin| (|SExpression|))
                                         (|:| |documentation|
                                              (|String|))))))))))
            (|:| |save|
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
                                        (|Record|
                                         (|:| |signature| (|SExpression|))
                                         (|:| |condition| (|SExpression|))
                                         (|:| |origin| (|SExpression|))
                                         (|:| |documentation|
                                              (|String|)))))))))))))
         (SEQ (SETELT % 13 |exp?|)
              (LETT |pat|
                    (SPADCALL (SPADCALL |page| '|filter| (QREFELT % 19))
                              (QREFELT % 66)))
              (LETT |reg_lst_u| (|HDTOP;get_reg_list| |page| %))
              (LETT |doc_lst| (|HDTOP;get_doc_list| |page| %))
              (EXIT
               (COND
                ((QEQCAR |reg_lst_u| 1)
                 (|HDTOP;doc_search1| |pat| |doc_lst| %))
                ('T
                 (|HDTOP;gen_search1| |pat| (QCDR |reg_lst_u|) |doc_lst|
                  %))))))) 

(SDEFUN |HDTOP;select_opr|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|k| (|Integer|))
         (%
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sdl|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))))
        (SPROG
         ((|bs| (|SExpression|)) (|branch| (|Symbol|))
          (|opr|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (|j0| #1=(|Integer|)) (|j| #1#) (#2=#:G1151 NIL)
          (|sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|)))))
         (SEQ
          (LETT |branch|
                (SEQ (LETT |bs| (SPADCALL |page| '|branch| (QREFELT % 19)))
                     (EXIT
                      (COND ((SPADCALL |bs| (QREFELT % 57)) '|names|)
                            (#3='T (SPADCALL |bs| (QREFELT % 59)))))))
          (EXIT
           (COND
            ((EQUAL |branch| '|names|)
             (SPADCALL |opl| (+ |k| 1) (QREFELT % 138)))
            (#3#
             (SEQ (LETT |j| (LETT |j0| 1))
                  (SEQ
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ (LETT |opr| (|SPADfirst| |opl|)) (LETT |j0| |j|)
                              (LETT |j| (+ |j| (LENGTH (QCDR |opr|))))
                              (EXIT
                               (COND
                                ((> |j| |k|)
                                 (PROGN (LETT #2# |$NoValue|) (GO #4=#:G1147)))
                                ('T (LETT |opl| (CDR |opl|))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #4# (EXIT #2#))
                  (LETT |sd|
                        (SPADCALL (QCDR |opr|) (+ (- |k| |j0|) 1)
                                  (QREFELT % 140)))
                  (EXIT (CONS (QCAR |opr|) (LIST |sd|)))))))))) 

(SDEFUN |HDTOP;show_selected_ops|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (% (|Void|)))
        (SPROG
         ((|ope|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (|branch| (|Symbol|)))
         (SEQ
          (LETT |page|
                (SPADCALL
                 (|HDTOP;copy_property_list| (SPADCALL |page| (QREFELT % 124))
                  %)
                 (QREFELT % 38)))
          (|HDTOP;set_op_lst| |page| |opl| %)
          (LETT |branch|
                (COND ((SPADCALL (LENGTH |opl|) 1 (QREFELT % 90)) '|names|)
                      (#1='T
                       (SEQ (LETT |ope| (|SPADfirst| |opl|))
                            (EXIT
                             (COND
                              ((<= (LENGTH (QCDR |ope|)) (QREFELT % 15))
                               '|documentation|)
                              (#1# '|names|)))))))
          (EXIT
           (|HDTOP;show_op_lines0| |page| |opl| |branch| (QREFELT % 13) %))))) 

(SDEFUN |HDTOP;show_ops_int|
        ((|page| (|HyperdocPage|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|k| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|opr|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ (LETT |opr| (|HDTOP;select_opr| |page| |opl| |k| %))
              (LETT |opl| (LIST |opr|))
              (EXIT (|HDTOP;show_selected_ops| |page| |opl| %))))) 

(SDEFUN |HDTOP;show_ops_list|
        ((|page| (|HyperdocPage|)) (|pair| (|List| (|SExpression|)))
         (% (|Void|)))
        (SPROG
         ((|i| #1=(|Integer|)) (|j| #1#)
          (|grd|
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
          (|ope|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |i| (SPADCALL (|SPADfirst| |pair|) (QREFELT % 70)))
              (LETT |j|
                    (SPADCALL (SPADCALL |pair| 2 (QREFELT % 63))
                              (QREFELT % 70)))
              (LETT |grd| (|HDTOP;get_ops_grd| |page| %))
              (LETT |opl| (QCDR (SPADCALL |grd| |i| (QREFELT % 162))))
              (EXIT
               (COND ((EQL |j| 0) (|HDTOP;show_selected_ops| |page| |opl| %))
                     ('T
                      (SEQ (LETT |ope| (|HDTOP;select_opr| |page| |opl| |j| %))
                           (LETT |opl| (LIST |ope|))
                           (EXIT
                            (|HDTOP;show_selected_ops| |page| |opl| %))))))))) 

(SDEFUN |HDTOP;show_ops_filter|
        ((|page| (|HyperdocPage|))
         (|op_lst|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (% (|Void|)))
        (SPROG
         ((|pat| (|String|))
          (|pat2| (|Union| (|LogicalMatchingAutomaton|) (|ErrorIndicator|))))
         (SEQ (LETT |pat| (|HDTOP;get_input_string| |page| '|filter| %))
              (LETT |pat2| (SPADCALL |pat| (QREFELT % 164)))
              (EXIT
               (COND ((QEQCAR |pat2| 1) (|HDTOP;error_page| (QCDR |pat2|) %))
                     (#1='T
                      (SEQ
                       (LETT |op_lst|
                             (SPADCALL (QCDR |pat2|) |op_lst| (QREFELT % 166)))
                       (EXIT
                        (COND
                         ((NULL |op_lst|)
                          (|HDTOP;empty_result| "operation" |pat| "" %))
                         (#1#
                          (SEQ
                           (LETT |page|
                                 (SPADCALL
                                  (|HDTOP;copy_property_list|
                                   (SPADCALL |page| (QREFELT % 124)) %)
                                  (QREFELT % 38)))
                           (|HDTOP;set_op_lst| |page| |op_lst| %)
                           (EXIT
                            (|HDTOP;show_ops| |page|
                             (SPADCALL |page| '|exclusion| (QREFELT % 19))
                             %))))))))))))) 

(SDEFUN |HDTOP;show_ops|
        ((|page| (|HyperdocPage|)) (|key| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|op_lst|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|branch| (|Symbol|)) (|exposedOnlyIfTrue| (|Boolean|)))
         (SEQ (LETT |op_lst| (|HDTOP;get_op_lst| |page| %))
              (EXIT
               (COND
                ((SPADCALL |key| (QREFELT % 73))
                 (|HDTOP;show_ops_list| |page| (SPADCALL |key| (QREFELT % 56))
                  %))
                ((SPADCALL |key| (QREFELT % 69))
                 (|HDTOP;show_ops_int| |page| |op_lst|
                  (SPADCALL |key| (QREFELT % 70)) %))
                ((NULL (SPADCALL |key| (QREFELT % 61)))
                 (|error| "show_ops: unexpected form of key"))
                ('T
                 (SEQ (LETT |branch| (SPADCALL |key| (QREFELT % 59)))
                      (EXIT
                       (COND
                        ((EQUAL |branch| '|filter|)
                         (|HDTOP;show_ops_filter| |page| |op_lst| %))
                        ('T
                         (SEQ (SPADCALL |page| '|key| |key| (QREFELT % 21))
                              (LETT |exposedOnlyIfTrue| (QREFELT % 13))
                              (COND
                               ((OR (EQUAL |branch| '|exposureOn|)
                                    (EQUAL |branch| '|exposureOff|))
                                (SEQ
                                 (LETT |exposedOnlyIfTrue|
                                       (EQUAL |branch| '|exposureOn|))
                                 (LETT |key|
                                       (SPADCALL |page| '|exclusion|
                                                 (QREFELT % 19)))
                                 (EXIT (SETELT % 13 |exposedOnlyIfTrue|)))))
                              (EXIT
                               (|HDTOP;show_op_lines0| |page| |op_lst|
                                (SPADCALL |key| (QREFELT % 59))
                                |exposedOnlyIfTrue| %))))))))))))) 

(SDEFUN |HDTOP;con_filter_match|
        ((|pat| (|LogicalMatchingAutomaton|)) (|c| (|SExpression|))
         (|abbrev?| (|Boolean|)) (% (|Boolean|)))
        (SPROG ((|conname| #1=(|Symbol|)) (|subject| #1#))
               (SEQ
                (LETT |conname|
                      (SPADCALL
                       (SPADCALL (SPADCALL |c| (QREFELT % 75)) (QREFELT % 75))
                       (QREFELT % 59)))
                (LETT |subject|
                      (COND (|abbrev?| (|constructor?| |conname|))
                            ('T |conname|)))
                (EXIT
                 (SPADCALL |pat| (SPADCALL |subject| (QREFELT % 62))
                           (QREFELT % 167)))))) 

(SDEFUN |HDTOP;show_cons_filter| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|pat| (|String|))
          (|pat2| (|Union| (|LogicalMatchingAutomaton|) (|ErrorIndicator|)))
          (|e_prop| (|SExpression|)) (|abbrev?| (|Boolean|)) (#1=#:G1194 NIL)
          (|c| NIL) (#2=#:G1195 NIL) (|con_lst| (|List| (|SExpression|))))
         (SEQ (LETT |pat| (|HDTOP;get_input_string| |page| '|filter| %))
              (LETT |pat2| (SPADCALL |pat| (QREFELT % 164)))
              (EXIT
               (COND ((QEQCAR |pat2| 1) (|HDTOP;error_page| (QCDR |pat2|) %))
                     (#3='T
                      (SEQ
                       (LETT |con_lst|
                             (SPADCALL
                              (SPADCALL |page| '|cAlist| (QREFELT % 19))
                              (QREFELT % 56)))
                       (LETT |e_prop|
                             (SPADCALL |page| '|exclusion| (QREFELT % 19)))
                       (LETT |abbrev?|
                             (|HDTOP;is_symbol?| |e_prop| '|abbrs| %))
                       (LETT |con_lst|
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |c| NIL) (LETT #2# |con_lst|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |c| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((|HDTOP;con_filter_match| (QCDR |pat2|)
                                        |c| |abbrev?| %)
                                       (LETT #1# (CONS |c| #1#))))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#)))))
                       (EXIT
                        (COND
                         ((NULL |con_lst|)
                          (|HDTOP;empty_result| "constructor" |pat| "" %))
                         (#3#
                          (SEQ
                           (LETT |page|
                                 (SPADCALL
                                  (|HDTOP;copy_property_list|
                                   (SPADCALL |page| (QREFELT % 124)) %)
                                  (QREFELT % 38)))
                           (SPADCALL |page| '|cAlist|
                                     (SPADCALL |con_lst| (QREFELT % 55))
                                     (QREFELT % 21))
                           (EXIT
                            (|HDTOP;show_cons| |page|
                             (SPADCALL |page| '|exclusion| (QREFELT % 19))
                             %))))))))))))) 

(SDEFUN |HDTOP;show_cons|
        ((|page| (|HyperdocPage|)) (|key| (|SExpression|)) (% (|Void|)))
        (SPROG ((|branch| (|Symbol|)) (|exposedOnlyIfTrue| (|Boolean|)))
               (SEQ (LETT |branch| (SPADCALL |key| (QREFELT % 59)))
                    (EXIT
                     (COND
                      ((EQUAL |branch| '|filter|)
                       (|HDTOP;show_cons_filter| |page| %))
                      ('T
                       (SEQ (LETT |exposedOnlyIfTrue| (QREFELT % 13))
                            (COND
                             ((OR (EQUAL |branch| '|exposureOn|)
                                  (EQUAL |branch| '|exposureOff|))
                              (SEQ
                               (LETT |exposedOnlyIfTrue|
                                     (EQUAL |branch| '|exposureOn|))
                               (LETT |key|
                                     (SPADCALL |page| '|exclusion|
                                               (QREFELT % 19)))
                               (EXIT (SETELT % 13 |exposedOnlyIfTrue|)))))
                            (EXIT
                             (|HDTOP;show_constructors2| |page|
                              (|HDTOP;get_con_lst| |page| %)
                              (SPADCALL |key| (QREFELT % 59)) (QREFELT % 13)
                              %))))))))) 

(SDEFUN |HDTOP;do_filter|
        ((|page| (|HyperdocPage|)) (|data| (|SExpression|)) (% (|Void|)))
        (SPROG ((|l1| (|List| (|SExpression|))))
               (SEQ
                (LETT |page|
                      (SPADCALL
                       (|HDTOP;copy_property_list|
                        (SPADCALL |page| (QREFELT % 124)) %)
                       (QREFELT % 38)))
                (|HDTOP;add_title| |page| (LIST "Filter String") %)
                (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
                (SPADCALL |page|
                          "\\centerline{Enter filter string (use {\\em *} for wild card):}"
                          (QREFELT % 32))
                (SPADCALL |page| "\\centerline{" (QREFELT % 32))
                (LETT |l1|
                      (LIST (SPADCALL 50 (QREFELT % 100))
                            (SPADCALL "" (QREFELT % 33))
                            (SPADCALL '|filter| (QREFELT % 35))
                            (SPADCALL 'EM (QREFELT % 35))))
                (LETT |l1|
                      (LIST (SPADCALL '|bcStrings| (QREFELT % 35))
                            (SPADCALL |l1| (QREFELT % 55))))
                (SPADCALL |page| (LIST (SPADCALL |l1| (QREFELT % 55)))
                          (QREFELT % 37))
                (SPADCALL |page| "}\\vspace{1}\\centerline{" (QREFELT % 32))
                (LETT |l1|
                      (SPADCALL
                       (LIST (SPADCALL "\\fbox{Filter}" (QREFELT % 33))
                             (SPADCALL "" (QREFELT % 33)))
                       (SPADCALL |data| (QREFELT % 56)) (QREFELT % 168)))
                (LETT |l1|
                      (LIST (SPADCALL '|bcLispLinks| (QREFELT % 35))
                            (SPADCALL |l1| (QREFELT % 55))))
                (SPADCALL |page| (LIST (SPADCALL |l1| (QREFELT % 55)))
                          (QREFELT % 37))
                (SPADCALL |page| "}" (QREFELT % 32))
                (SPADCALL |page| "\\endscroll" (QREFELT % 32))
                (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;show_it|
        ((|page| (|HyperdocPage|)) (|count| (|SExpression|))
         (|ls|
          (|Record|
           (|:| |cur|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))
           (|:| |save|
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
                                       (|Record|
                                        (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation|
                                             (|String|))))))))))))
         (% (|Void|)))
        (SPROG
         ((|cnt| (|Integer|))
          (|#G444|
           (|Record| (|:| |quotient| #1=(|Integer|))
                     (|:| |remainder| #2=(|Integer|))))
          (|q| #1#) (|r| #2#)
          (|cur|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|kind| (|Symbol|)) (|j| NIL) (|lst| (|List| (|Symbol|)))
          (|name| (|Symbol|)))
         (SEQ (LETT |cnt| (SPADCALL |count| (QREFELT % 70)))
              (PROGN
               (LETT |#G444| (|divide_INT| |cnt| 8))
               (LETT |q| (QCAR |#G444|))
               (LETT |r| (QCDR |#G444|))
               |#G444|)
              (EXIT
               (COND
                ((EQL |r| 0)
                 (|HDTOP;show_ops_int| |page| (QCDR (QCAR |ls|)) |q| %))
                (#3='T
                 (SEQ (LETT |cur| (QCAR (QCAR |ls|)))
                      (LETT |lst|
                            (COND
                             ((EQL |r| 1)
                              (SEQ (LETT |kind| '|category|)
                                   (EXIT (QVELT |cur| 0))))
                             ((EQL |r| 2)
                              (SEQ (LETT |kind| '|domain|)
                                   (EXIT (QVELT |cur| 1))))
                             ((EQL |r| 3)
                              (SEQ (LETT |kind| '|package|)
                                   (EXIT (QVELT |cur| 2))))
                             (#3# (|error| "show_it: wrong r"))))
                      (SEQ (LETT |j| 1) G190
                           (COND ((NULL (< |j| |q|)) (GO G191)))
                           (SEQ (EXIT (LETT |lst| (CDR |lst|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (LETT |name| (|SPADfirst| |lst|))
                      (EXIT (|HDTOP;show_constructors| (LIST |name|) %))))))))) 

(SDEFUN |HDTOP;gen_search_jump|
        ((|page| (|HyperdocPage|)) (|u| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|#G450| #1=(|List| (|SExpression|))) (|ls| NIL) (|#G451| #1#)
          (|kinde| NIL) (|kind| #2=(|String|)) (|pat| #2#))
         (SEQ
          (PROGN
           (LETT |#G450| (SPADCALL |u| (QREFELT % 56)))
           (LETT |#G451| |#G450|)
           (LETT |ls| (|SPADfirst| |#G451|))
           (LETT |#G451| (CDR |#G451|))
           (LETT |kinde| (|SPADfirst| |#G451|))
           |#G450|)
          (LETT |kind| (SPADCALL |kinde| (QREFELT % 66)))
          (LETT |pat|
                (SPADCALL (SPADCALL |page| '|filter| (QREFELT % 19))
                          (QREFELT % 66)))
          (EXIT
           (COND ((EQUAL |kind| "operation") (|HDTOP;show_op_lines| |ls| %))
                 ('T (|HDTOP;show_constructors| |ls| %))))))) 

(SDEFUN |HDTOP;do_search_jump| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|#G455| #1=(|List| (|SExpression|))) (|te| NIL) (|#G456| #1#)
          (|ke| NIL) (|tag| (|Symbol|)) (|kind| (|String|)) (|pat| (|String|)))
         (SEQ
          (PROGN
           (LETT |#G455|
                 (SPADCALL (SPADCALL |page| '|items| (QREFELT % 19))
                           (QREFELT % 56)))
           (LETT |#G456| |#G455|)
           (LETT |te| (|SPADfirst| |#G456|))
           (LETT |#G456| (CDR |#G456|))
           (LETT |ke| (|SPADfirst| |#G456|))
           |#G455|)
          (LETT |tag| (SPADCALL |te| (QREFELT % 59)))
          (LETT |kind| (SPADCALL |ke| (QREFELT % 66))) (LETT |pat| "*")
          (EXIT
           (COND
            ((EQUAL |kind| "operation") (|HDTOP;do_operation_search| |pat| %))
            ('T (|HDTOP;do_constructor_search| |pat| |tag| |kind| %))))))) 

(SDEFUN |HDTOP;do_detailed_operation_search|
        ((|page| (|HyperdocPage|)) (|nam_f| (|Mapping| (|Boolean|) (|String|)))
         (|ari_f| (|Mapping| (|Boolean|) (|Integer|)))
         (|sig_f| (|Mapping| (|Boolean|) (|String|)))
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
           (|Mapping| (|Boolean|) (|String|)
                      (|Record| (|:| |signature| (|SExpression|))
                                (|:| |condition| (|SExpression|))
                                (|:| |origin| (|SExpression|))
                                (|:| |documentation| (|String|))))))
         (SEQ
          (LETT |f1|
                (CONS #'|HDTOP;do_detailed_operation_search!0|
                      (VECTOR |sig_f| |ari_f| % |nam_f|)))
          (EXIT (SPADCALL |f1| (QREFELT % 175)))))) 

(SDEFUN |HDTOP;do_detailed_operation_search!0| ((|n| NIL) (|sd| NIL) ($$ NIL))
        (PROG (|nam_f| % |ari_f| |sig_f|)
          (LETT |nam_f| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |ari_f| (QREFELT $$ 1))
          (LETT |sig_f| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|sig| NIL) (|sl| NIL))
                   (SEQ
                    (COND ((NULL (SPADCALL |n| |nam_f|)) NIL)
                          ('T
                           (SEQ (LETT |sig| (QVELT |sd| 0))
                                (COND
                                 ((NULL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |sig| (QREFELT % 56))
                                               (QREFELT % 169))
                                     (|spadConstant| % 170) (QREFELT % 171))
                                    |ari_f|))
                                  (EXIT NIL)))
                                (LETT |sl|
                                      (SPADCALL
                                       (SPADCALL '|Mapping| (QREFELT % 35))
                                       (SPADCALL |sig| (QREFELT % 56))
                                       (QREFELT % 173)))
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |sl| (QREFELT % 55))
                                            (QREFELT % 98))
                                  |sig_f|))))))))))) 

(SDEFUN |HDTOP;filter_constructors|
        ((|cl| (|List| (|Symbol|)))
         (|ari_f| (|Mapping| (|Boolean|) (|Integer|)))
         (|sig_f| (|Mapping| (|Boolean|) (|String|))) (% (|List| (|Symbol|))))
        (SPROG
         ((|c| NIL) (#1=#:G1240 NIL) (|sig| (|SExpression|))
          (|sl| (|List| (|SExpression|))) (|cs| (|String|)) (#2=#:G1239 NIL)
          (|res| (|List| (|Symbol|))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |c| NIL) (LETT #1# |cl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |sig| (SPADCALL |c| (QREFELT % 99)))
                          (EXIT
                           (COND
                            ((OR (SPADCALL |sig| (QREFELT % 57))
                                 (NULL
                                  (SPADCALL
                                   (- (LENGTH (SPADCALL |sig| (QREFELT % 56)))
                                      1)
                                   |ari_f|)))
                             (PROGN (LETT #2# |$NoValue|) (GO #3=#:G1230)))
                            ('T
                             (SEQ
                              (LETT |sl|
                                    (CONS (SPADCALL '|Mapping| (QREFELT % 35))
                                          (SPADCALL |sig| (QREFELT % 56))))
                              (LETT |cs|
                                    (SPADCALL (SPADCALL |sl| (QREFELT % 55))
                                              (QREFELT % 98)))
                              (COND
                               ((NULL (SPADCALL |cs| |sig_f|))
                                (EXIT (PROGN (LETT #2# |$NoValue|) (GO #3#)))))
                              (EXIT (LETT |res| (CONS |c| |res|)))))))))
                    #3# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |HDTOP;do_detailed_search1|
        ((|page| (|HyperdocPage|)) (|fl| (|List| (|Symbol|))) (|np| (|String|))
         (|ari_f| (|Mapping| (|Boolean|) (|Integer|)))
         (|sig_f| (|Mapping| (|Boolean|) (|String|)))
         (%
          (|Union|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))
           (|ErrorIndicator|))))
        (SPROG
         ((|ru|
           (|Union|
            (|Record| (|:| |categories| (|List| (|Symbol|)))
                      (|:| |domains| (|List| (|Symbol|)))
                      (|:| |packages| (|List| (|Symbol|))))
            (|ErrorIndicator|)))
          (|res0|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|res1|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))))
         (SEQ (LETT |ru| (SPADCALL |np| '|k| (QREFELT % 153)))
              (EXIT
               (COND ((QEQCAR |ru| 1) |ru|)
                     ('T
                      (SEQ (LETT |res0| (QCDR |ru|))
                           (LETT |res1| (VECTOR NIL NIL NIL))
                           (COND
                            ((EQUAL (|SPADfirst| |fl|) '|category|)
                             (SEQ
                              (QSETVELT |res1| 0
                                        (|HDTOP;filter_constructors|
                                         (QVELT |res0| 0) |ari_f| |sig_f| %))
                              (EXIT (LETT |fl| (CDR |fl|))))))
                           (COND
                            ((NULL (NULL |fl|))
                             (COND
                              ((EQUAL (|SPADfirst| |fl|) '|domain|)
                               (SEQ
                                (QSETVELT |res1| 1
                                          (|HDTOP;filter_constructors|
                                           (QVELT |res0| 1) |ari_f| |sig_f| %))
                                (EXIT (LETT |fl| (CDR |fl|))))))))
                           (COND
                            ((NULL (NULL |fl|))
                             (COND
                              ((EQUAL (|SPADfirst| |fl|) '|package|)
                               (SEQ
                                (QSETVELT |res1| 2
                                          (|HDTOP;filter_constructors|
                                           (QVELT |res0| 2) |ari_f| |sig_f| %))
                                (EXIT (LETT |fl| (CDR |fl|))))))))
                           (EXIT (CONS 0 |res1|))))))))) 

(SDEFUN |HDTOP;get_input_field|
        ((|page| (|HyperdocPage|)) (|key| (|Symbol|)) (% (|String|)))
        (SPROG ((|resu| (|Union| (|String|) "failed")))
               (SEQ (LETT |resu| (SPADCALL |page| |key| (QREFELT % 177)))
                    (EXIT
                     (COND ((QEQCAR |resu| 0) (QCDR |resu|))
                           ('T (|error| "get_input_field: no field value"))))))) 

(SDEFUN |HDTOP;get_string_filter|
        ((|s| (|String|))
         (% (|Union| (|Mapping| (|Boolean|) (|String|)) (|ErrorIndicator|))))
        (SPROG
         ((|tf| (|Mapping| (|Boolean|) (|String|)))
          (|pu| (|Union| (|LogicalMatchingAutomaton|) "failed"))
          (|pa| (|LogicalMatchingAutomaton|)))
         (SEQ (LETT |tf| (LIST #'|HDTOP;get_string_filter!0|))
              (COND ((OR (EQUAL |s| "*") (EQUAL |s| "")) (EXIT (CONS 0 |tf|))))
              (LETT |s| (SPADCALL |s| (QREFELT % 45)))
              (LETT |pu| (SPADCALL |s| 'T (QREFELT % 181)))
              (EXIT
               (COND ((QEQCAR |pu| 1) (CONS 1 (QREFELT % 178)))
                     ('T
                      (SEQ (LETT |pa| (QCDR |pu|))
                           (EXIT
                            (CONS 0
                                  (CONS #'|HDTOP;get_string_filter!1|
                                        (VECTOR % |pa|))))))))))) 

(SDEFUN |HDTOP;get_string_filter!1| ((|s1| NIL) ($$ NIL))
        (PROG (|pa| %)
          (LETT |pa| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |pa| (SPADCALL |s1| (QREFELT % 45)) (QREFELT % 167)))))) 

(SDEFUN |HDTOP;get_string_filter!0| ((|s| NIL) ($$ NIL)) 'T) 

(SDEFUN |HDTOP;char_to_dig|
        ((|c| (|Character|)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|i| (|Integer|)))
               (SEQ (LETT |i| |c|)
                    (EXIT
                     (COND ((< |i| 48) (CONS 1 "failed"))
                           (#1='T
                            (SEQ (LETT |i| (- |i| 48))
                                 (EXIT
                                  (COND ((< |i| 10) (CONS 0 |i|))
                                        (#1# (CONS 1 "failed"))))))))))) 

(SDEFUN |HDTOP;str_to_num|
        ((|s| (|String|)) (% (|Union| (|Integer|) "failed")))
        (SPROG
         ((|i| NIL) (#1=#:G1296 NIL) (|u1| (|Union| (|Integer|) "failed"))
          (#2=#:G1295 NIL) (|res| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |res| 0)
                (EXIT
                 (COND ((EQL (QCSIZE |s|) 0) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (SEQ (LETT |i| 1) (LETT #1# (QCSIZE |s|)) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (LETT |u1|
                                     (|HDTOP;char_to_dig|
                                      (SPADCALL |s| |i| (QREFELT % 49)) %))
                               (EXIT
                                (COND
                                 ((QEQCAR |u1| 1)
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed"))
                                   (GO #3=#:G1294)))
                                 ('T
                                  (LETT |res| (+ (* 10 |res|) (QCDR |u1|)))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 |res|))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |HDTOP;gen_num_filter|
        ((|s| (|String|))
         (% (|Union| (|Mapping| (|Boolean|) (|Integer|)) (|ErrorIndicator|))))
        (SPROG
         ((|tf| (|Mapping| (|Boolean|) (|Integer|))) (|k| (|Integer|))
          (|s1| #1=(|String|)) (|s2| #1#) (|i1| (|Integer|)) (|i2| (|Integer|))
          (#2=#:G1328 NIL) (|op| (|Symbol|))
          (|u1| (|Union| (|Integer|) "failed")) (|u| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |tf| (LIST #'|HDTOP;gen_num_filter!0|))
                (COND
                 ((OR (EQUAL |s| "*") (EQUAL |s| "")) (EXIT (CONS 0 |tf|))))
                (LETT |k| (SPADCALL (|STR_to_CHAR| "-") |s| (QREFELT % 87)))
                (EXIT
                 (COND
                  ((> |k| 0)
                   (SEQ
                    (LETT |s1|
                          (SPADCALL |s| (SPADCALL 1 (- |k| 1) (QREFELT % 51))
                                    (QREFELT % 52)))
                    (LETT |s2|
                          (SPADCALL |s|
                                    (SPADCALL (+ |k| 1) (QCSIZE |s|)
                                              (QREFELT % 51))
                                    (QREFELT % 52)))
                    (LETT |u1| (|HDTOP;str_to_num| |s1| %))
                    (EXIT
                     (COND ((QEQCAR |u1| 1) (CONS 1 (QREFELT % 178)))
                           (#3='T
                            (SEQ (LETT |i1| (QCDR |u1|))
                                 (LETT |u1| (|HDTOP;str_to_num| |s2| %))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |u1| 1) (CONS 1 (QREFELT % 178)))
                                   (#3#
                                    (SEQ (LETT |i2| (QCDR |u1|))
                                         (EXIT
                                          (COND
                                           ((< |i2| |i1|)
                                            (CONS 1 (QREFELT % 178)))
                                           (#3#
                                            (CONS 0
                                                  (CONS
                                                   #'|HDTOP;gen_num_filter!1|
                                                   (VECTOR |i2| %
                                                           |i1|))))))))))))))))
                  (#3#
                   (SEQ
                    (LETT |op|
                          (COND
                           ((|eql_SI| (SPADCALL |s| 1 (QREFELT % 49))
                                      (|STR_to_CHAR| "<"))
                            (COND
                             ((< (QCSIZE |s|) 2)
                              (PROGN
                               (LETT #2# (CONS 1 (QREFELT % 178)))
                               (GO #4=#:G1327)))
                             ((|eql_SI| (SPADCALL |s| 2 (QREFELT % 49))
                                        (|STR_to_CHAR| "="))
                              (SEQ
                               (LETT |s|
                                     (SPADCALL |s|
                                               (SPADCALL 3 (QCSIZE |s|)
                                                         (QREFELT % 51))
                                               (QREFELT % 52)))
                               (EXIT '|le|)))
                             (#3#
                              (SEQ
                               (LETT |s|
                                     (SPADCALL |s|
                                               (SPADCALL 2 (QCSIZE |s|)
                                                         (QREFELT % 51))
                                               (QREFELT % 52)))
                               (EXIT '|lt|)))))
                           ((|eql_SI| (SPADCALL |s| 1 (QREFELT % 49))
                                      (|STR_to_CHAR| ">"))
                            (COND
                             ((< (QCSIZE |s|) 2)
                              (PROGN
                               (LETT #2# (CONS 1 (QREFELT % 178)))
                               (GO #4#)))
                             ((|eql_SI| (SPADCALL |s| 2 (QREFELT % 49))
                                        (|STR_to_CHAR| "="))
                              (SEQ
                               (LETT |s|
                                     (SPADCALL |s|
                                               (SPADCALL 3 (QCSIZE |s|)
                                                         (QREFELT % 51))
                                               (QREFELT % 52)))
                               (EXIT '|ge|)))
                             (#3#
                              (SEQ
                               (LETT |s|
                                     (SPADCALL |s|
                                               (SPADCALL 2 (QCSIZE |s|)
                                                         (QREFELT % 51))
                                               (QREFELT % 52)))
                               (EXIT '|gt|)))))
                           (#3# '|eq|)))
                    (LETT |u1| (|HDTOP;str_to_num| |s| %))
                    (EXIT
                     (COND ((QEQCAR |u1| 1) (CONS 1 (QREFELT % 178)))
                           (#3#
                            (SEQ (LETT |u| (QCDR |u1|))
                                 (EXIT
                                  (COND
                                   ((EQUAL |op| '|eq|)
                                    (CONS 0
                                          (CONS #'|HDTOP;gen_num_filter!2|
                                                (VECTOR % |u|))))
                                   ((EQUAL |op| '|le|)
                                    (CONS 0
                                          (CONS #'|HDTOP;gen_num_filter!3|
                                                (VECTOR % |u|))))
                                   ((EQUAL |op| '|lt|)
                                    (CONS 0
                                          (CONS #'|HDTOP;gen_num_filter!4|
                                                (VECTOR % |u|))))
                                   ((EQUAL |op| '|ge|)
                                    (CONS 0
                                          (CONS #'|HDTOP;gen_num_filter!5|
                                                (VECTOR % |u|))))
                                   ((EQUAL |op| '|gt|)
                                    (CONS 0
                                          (CONS #'|HDTOP;gen_num_filter!6|
                                                (VECTOR % |u|))))
                                   (#3# (|error| "unimplemented"))))))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |HDTOP;gen_num_filter!6| ((|i| NIL) ($$ NIL))
        (PROG (|u| %)
          (LETT |u| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |i| |u| (QREFELT % 186)))))) 

(SDEFUN |HDTOP;gen_num_filter!5| ((|i| NIL) ($$ NIL))
        (PROG (|u| %)
          (LETT |u| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |i| |u| (QREFELT % 185)))))) 

(SDEFUN |HDTOP;gen_num_filter!4| ((|i| NIL) ($$ NIL))
        (PROG (|u| %)
          (LETT |u| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |i| |u| (QREFELT % 184)))))) 

(SDEFUN |HDTOP;gen_num_filter!3| ((|i| NIL) ($$ NIL))
        (PROG (|u| %)
          (LETT |u| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |i| |u| (QREFELT % 182)))))) 

(SDEFUN |HDTOP;gen_num_filter!2| ((|i| NIL) ($$ NIL))
        (PROG (|u| %)
          (LETT |u| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |i| |u| (QREFELT % 183)))))) 

(SDEFUN |HDTOP;gen_num_filter!1| ((|i| NIL) ($$ NIL))
        (PROG (|i1| % |i2|)
          (LETT |i1| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |i2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |i1| |i| (QREFELT % 182))
              (SPADCALL |i| |i2| (QREFELT % 182)))
             ('T NIL)))))) 

(SDEFUN |HDTOP;gen_num_filter!0| ((|i| NIL) ($$ NIL)) 'T) 

(SDEFUN |HDTOP;do_detailed_search|
        ((|page| (|HyperdocPage|)) (|data| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|which| (|Symbol|)) (|name| #1=(|String|)) (|nargs| #1#) (|sig| #1#)
          (|nfu|
           #2=(|Union| (|Mapping| (|Boolean|) (|String|)) (|ErrorIndicator|)))
          (|nam_f| (|Mapping| (|Boolean|) (|String|)))
          (|afu|
           (|Union| (|Mapping| (|Boolean|) (|Integer|)) (|ErrorIndicator|)))
          (|ari_f| (|Mapping| (|Boolean|) (|Integer|))) (|sfu| #2#)
          (|sig_f| (|Mapping| (|Boolean|) (|String|)))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|fl| (|List| (|Symbol|))) (|sf1| (|Symbol|)) (|desc| (|String|))
          (|resu|
           (|Union|
            (|Record| (|:| |categories| (|List| (|Symbol|)))
                      (|:| |domains| (|List| (|Symbol|)))
                      (|:| |packages| (|List| (|Symbol|))))
            (|ErrorIndicator|)))
          (|res1|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))))
         (SEQ (LETT |which| (SPADCALL |page| '|which| (QREFELT % 187)))
              (LETT |name| (|HDTOP;get_input_field| |page| '|name| %))
              (LETT |nargs| (|HDTOP;get_input_field| |page| '|nargs| %))
              (LETT |sig| (|HDTOP;get_input_field| |page| '|sig| %))
              (LETT |nfu| (|HDTOP;get_string_filter| |name| %))
              (EXIT
               (COND ((QEQCAR |nfu| 1) (|HDTOP;error_page| (QCDR |nfu|) %))
                     (#3='T
                      (SEQ (LETT |nam_f| (QCDR |nfu|))
                           (LETT |afu| (|HDTOP;gen_num_filter| |nargs| %))
                           (EXIT
                            (COND
                             ((QEQCAR |afu| 1)
                              (|HDTOP;error_page| (QCDR |afu|) %))
                             (#3#
                              (SEQ (LETT |ari_f| (QCDR |afu|))
                                   (LETT |sfu|
                                         (|HDTOP;get_string_filter| |sig| %))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |sfu| 1)
                                      (|HDTOP;error_page| (QCDR |sfu|) %))
                                     (#3#
                                      (SEQ (LETT |sig_f| (QCDR |sfu|))
                                           (EXIT
                                            (COND
                                             ((EQUAL |which| '|ops|)
                                              (SEQ
                                               (LETT |opl|
                                                     (|HDTOP;do_detailed_operation_search|
                                                      |page| |nam_f| |ari_f|
                                                      |sig_f| %))
                                               (EXIT
                                                (COND
                                                 ((NULL |opl|)
                                                  (|HDTOP;empty_result|
                                                   "operation" "" "" %))
                                                 (#3#
                                                  (|HDTOP;show_op_lines| |opl|
                                                   %))))))
                                             ((NULL (EQUAL |which| '|cons|))
                                              (|HDTOP;error_page2| "Error"
                                               (LIST
                                                "Choose either constructors or operations")
                                               %))
                                             ('T
                                              (SEQ (LETT |fl| NIL)
                                                   (COND
                                                    ((SPADCALL |page| '|cats|
                                                               (QREFELT % 188))
                                                     (LETT |fl|
                                                           (LIST
                                                            '|category|))))
                                                   (COND
                                                    ((SPADCALL |page| '|doms|
                                                               (QREFELT % 188))
                                                     (LETT |fl|
                                                           (CONS '|domain|
                                                                 |fl|))))
                                                   (COND
                                                    ((SPADCALL |page| '|paks|
                                                               (QREFELT % 188))
                                                     (LETT |fl|
                                                           (CONS '|package|
                                                                 |fl|))))
                                                   (LETT |fl| (NREVERSE |fl|))
                                                   (EXIT
                                                    (COND
                                                     ((NULL |fl|)
                                                      (|HDTOP;error_page2|
                                                       "Error"
                                                       (LIST "Nothing choosen")
                                                       %))
                                                     (#3#
                                                      (SEQ
                                                       (LETT |desc|
                                                             (COND
                                                              ((SPADCALL
                                                                (LENGTH |fl|) 1
                                                                (QREFELT % 90))
                                                               "constructor")
                                                              (#3#
                                                               (SEQ
                                                                (LETT |sf1|
                                                                      (|SPADfirst|
                                                                       |fl|))
                                                                (EXIT
                                                                 (COND
                                                                  ((EQUAL |sf1|
                                                                          '|default|)
                                                                   "default package")
                                                                  (#3#
                                                                   (SPADCALL
                                                                    |sf1|
                                                                    (QREFELT %
                                                                             62)))))))))
                                                       (LETT |resu|
                                                             (|HDTOP;do_detailed_search1|
                                                              |page| |fl|
                                                              |name| |ari_f|
                                                              |sig_f| %))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |resu| 1)
                                                          (|HDTOP;error_page|
                                                           (QCDR |resu|) %))
                                                         (#3#
                                                          (SEQ
                                                           (LETT |res1|
                                                                 (QCDR |resu|))
                                                           (EXIT
                                                            (|HDTOP;show_split_constructors|
                                                             |res1| |desc| ""
                                                             %))))))))))))))))))))))))))))) 

(SDEFUN |HDTOP;show_ops_from|
        ((|page| (|HyperdocPage|))
         (|lst|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (% (|Void|)))
        (SPROG
         ((|kind| (|String|)) (|domname| #1=(|SExpression|)) (|conform| #1#)
          (|exp_part| (|String|)) (|sl| (|List| (|String|)))
          (|from_part| #2=(|String|)) (|title| (|List| #2#)))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |domname| (SPADCALL |page| '|domname| (QREFELT % 19)))
              (LETT |kind|
                    (SPADCALL (SPADCALL |page| '|kind| (QREFELT % 19))
                              (QREFELT % 66)))
              (COND
               ((EQUAL |kind| "category")
                (LETT |domname| (SPADCALL NIL (QREFELT % 55)))))
              (COND
               ((NULL (SPADCALL |domname| (QREFELT % 57)))
                (LETT |lst|
                      (SPADCALL |lst| |conform| |domname| (QREFELT % 189)))))
              (LETT |conform|
                    (COND ((SPADCALL |domname| (QREFELT % 57)) |conform|)
                          (#3='T |domname|)))
              (LETT |exp_part|
                    (COND ((|HDTOP;exp_con?| |conform| %) "")
                          (#3# "unexposed ")))
              (LETT |from_part|
                    (SEQ
                     (LETT |sl|
                           (COND
                            ((SPADCALL |domname| (QREFELT % 57))
                             (SPADCALL |conform| 'T NIL (QREFELT % 190)))
                            (#3#
                             (SPADCALL |domname| |domname| 'T 'T NIL
                                       (QREFELT % 130)))))
                     (EXIT (SPADCALL (NREVERSE |sl|) (QREFELT % 113)))))
              (LETT |title|
                    (LIST " from " |exp_part| |kind| " {\\em " |from_part|
                          "}"))
              (SPADCALL |page| '|fromHeading| |title| (QREFELT % 21))
              (|HDTOP;set_op_lst| |page| |lst| %)
              (EXIT (|HDTOP;show_op_lines3| |page| |lst| '|names| %))))) 

(SDEFUN |HDTOP;do_op_from| ((|op| (|String|)) (|con| (|String|)) (% (|Void|)))
        (SPROG
         ((|page| (|HyperdocPage|)) (|ops| (|Symbol|)) (|con_sym| (|Symbol|))
          (|con_form| (|SExpression|)) (|kind_sym| (|Symbol|)) (#1=#:G1363 NIL)
          (|rec| NIL) (#2=#:G1364 NIL)
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |page| (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
              (LETT |ops| (SPADCALL |op| (QREFELT % 95)))
              (LETT |con_sym| (SPADCALL |con| (QREFELT % 95)))
              (LETT |con_form| (SPADCALL |con_sym| (QREFELT % 108)))
              (SPADCALL |page| '|conform| |con_form| (QREFELT % 21))
              (LETT |kind_sym| (|get_database| |con_sym| 'CONSTRUCTORKIND))
              (SPADCALL |page| '|kind|
                        (SPADCALL (SPADCALL |kind_sym| (QREFELT % 62))
                                  (QREFELT % 33))
                        (QREFELT % 21))
              (LETT |opl|
                    (SPADCALL |con_form| (SPADCALL NIL (QREFELT % 55))
                              (QREFELT % 191)))
              (LETT |opl|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |rec| NIL) (LETT #2# |opl|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQUAL (QCAR |rec|) |ops|)
                              (LETT #1# (CONS |rec| #1#))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (EXIT (|HDTOP;show_ops_from| |page| |opl| %))))) 

(SDEFUN |HDTOP;get_input_string|
        ((|page| (|HyperdocPage|)) (|label| (|Symbol|)) (% (|String|)))
        (SPROG ((|resu| (|Union| (|String|) "failed")))
               (SEQ (LETT |resu| (SPADCALL |page| |label| (QREFELT % 177)))
                    (EXIT (COND ((QEQCAR |resu| 0) (QCDR |resu|)) ('T "")))))) 

(SDEFUN |HDTOP;get_input_area|
        ((|page| (|HyperdocPage|)) (|narg| (|Integer|))
         (% (|List| (|String|))))
        (SPROG
         ((|pvars| (|List| (|Symbol|))) (#1=#:G1371 NIL) (|vi| NIL)
          (#2=#:G1373 NIL) (|i| NIL) (#3=#:G1372 NIL)
          (|res| (|List| (|String|))))
         (SEQ (LETT |pvars| |$PatternVariableList|)
              (LETT |res|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |vi| NIL) (LETT #2# |pvars|) (LETT |i| 1)
                          (LETT #3# |narg|) G190
                          (COND
                           ((OR (|greater_SI| |i| #3#) (ATOM #2#)
                                (PROGN (LETT |vi| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (|HDTOP;get_input_string| |page| |vi| %)
                                   #1#))))
                          (LETT |i|
                                (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT (NREVERSE #1#)))))
              (EXIT |res|)))) 

(SDEFUN |HDTOP;input_area_changed?|
        ((|page| (|HyperdocPage|)) (|narg| (|Integer|)) (% (|Boolean|)))
        (SPROG ((|res| (|Boolean|)))
               (SEQ
                (LETT |res|
                      (SPADCALL (|HDTOP;get_input_area| |page| |narg| %)
                                (SPADCALL |page| '|inputAreaList|
                                          (QREFELT % 19))
                                (QREFELT % 192)))
                (EXIT |res|)))) 

(SDEFUN |HDTOP;constructor_operations_page|
        ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|conform| #1=(|SExpression|)) (|name| (|Symbol|))
          (|kind| (|Symbol|)) (|narg| (|Integer|)) (|u| #1#)
          (|u1| (|SExpression|)) (#2=#:G1390 NIL)
          (|domu| (|Union| (|SExpression|) (|ErrorIndicator|)))
          (|title1| #3=(|String|)) (|title| (|List| #3#))
          (|use_args?| (|Boolean|)) (|domname| (|SExpression|))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |narg| (- (SPADCALL |conform| (QREFELT % 96)) 1))
              (LETT |u| (SPADCALL |page| '|domname| (QREFELT % 19)))
              (LETT |domu|
                    (SEQ
                     (EXIT
                      (SEQ
                       (COND
                        ((SPADCALL |u| (QREFELT % 73))
                         (COND
                          ((NULL (SPADCALL |u| (QREFELT % 57)))
                           (SEQ (LETT |u1| (SPADCALL |u| (QREFELT % 75)))
                                (EXIT
                                 (COND
                                  ((|HDTOP;is_symbol?| |u1| |name| %)
                                   (COND
                                    ((NULL
                                      (|HDTOP;input_area_changed?| |page|
                                       |narg| %))
                                     (PROGN
                                      (LETT #2# (CONS 0 |u|))
                                      (GO #4=#:G1381))))))))))))
                       (EXIT
                        (|HDTOP;get_evalable_constructor_form| |page| |name|
                         %))))
                     #4# (EXIT #2#)))
              (EXIT
               (COND ((QEQCAR |domu| 1) (|HDTOP;error_page| (QCDR |domu|) %))
                     ('T
                      (SEQ (LETT |domname| (QCDR |domu|))
                           (SPADCALL |page| '|domname| |domname|
                                     (QREFELT % 21))
                           (LETT |title1|
                                 (COND
                                  ((NULL (SPADCALL |domname| (QREFELT % 57)))
                                   (SPADCALL |domname| (QREFELT % 98)))
                                  (#5='T (SPADCALL |name| (QREFELT % 62)))))
                           (LETT |title|
                                 (LIST
                                  (|HDTOP;capitalize|
                                   (SPADCALL |kind| (QREFELT % 62)) %)
                                  " {\\sf " |title1| "}"))
                           (SPADCALL |page| '|heading| |title| (QREFELT % 21))
                           (LETT |use_args?|
                                 (NULL (SPADCALL |domname| (QREFELT % 57))))
                           (LETT |domname|
                                 (COND
                                  ((NULL (SPADCALL |domname| (QREFELT % 57)))
                                   |domname|)
                                  (#5# |conform|)))
                           (LETT |opl|
                                 (SPADCALL |conform| |domname|
                                           (QREFELT % 191)))
                           (EXIT (|HDTOP;show_ops_from| |page| |opl| %))))))))) 

(SDEFUN |HDTOP;unparse_args|
        ((|op| (|Symbol|)) (|args| (|List| (|SExpression|)))
         (% (|List| (|String|))))
        (SPROG
         ((|co_sig| (|List| (|Boolean|))) (|k| NIL) (|arg| NIL)
          (#1=#:G1397 NIL) (|k?| NIL) (#2=#:G1396 NIL)
          (|r1| (|List| (|String|))) (|res| (|List| (|String|))))
         (SEQ (LETT |res| NIL)
              (LETT |co_sig| (CDR (|get_database| |op| 'COSIG)))
              (SEQ (LETT |k| 1) (LETT |arg| NIL) (LETT #1# |args|)
                   (LETT |k?| NIL) (LETT #2# |co_sig|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |k?| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |arg| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |r1|
                          (SPADCALL |k?| |op| NIL |arg|
                                    (SPADCALL NIL (QREFELT % 55)) |k| NIL NIL
                                    (QREFELT % 193)))
                    (EXIT
                     (LETT |res|
                           (CONS (SPADCALL (NREVERSE |r1|) (QREFELT % 113))
                                 |res|))))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #1#
                                 (PROG1 (CDR #1#) (LETT |k| (|inc_SI| |k|))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |HDTOP;con_page| ((|form| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|lc| (|List| (|SExpression|))) (|op| (|Symbol|))
          (|args| (|List| (|String|))))
         (SEQ
          (COND
           ((SPADCALL |form| (QREFELT % 194))
            (|error| "con_page: invalid form"))
           ('T
            (SEQ (LETT |lc| (SPADCALL |form| (QREFELT % 56)))
                 (LETT |op| (SPADCALL (|SPADfirst| |lc|) (QREFELT % 59)))
                 (LETT |args| (|HDTOP;unparse_args| |op| (CDR |lc|) %))
                 (EXIT (|HDTOP;constructor_page| |op| |lc| |args| %)))))))) 

(SDEFUN |HDTOP;show_cons_kinds_filter|
        ((|page| (|HyperdocPage|)) (|data| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|#G511| #1=(|List| (|SExpression|))) (|kind| NIL) (|#G512| #1#)
          (|lst| NIL))
         (SEQ
          (PROGN
           (LETT |#G511| (SPADCALL |data| (QREFELT % 56)))
           (LETT |#G512| |#G511|)
           (LETT |kind| (|SPADfirst| |#G512|))
           (LETT |#G512| (CDR |#G512|))
           (LETT |lst| (|SPADfirst| |#G512|))
           |#G511|)
          (|HDTOP;set_con_lst| |page| |lst| %)
          (EXIT
           (|HDTOP;show_cons| |page|
            (SPADCALL |page| '|exclusion| (QREFELT % 19)) %))))) 

(SDEFUN |HDTOP;select_con|
        ((|page| (|HyperdocPage|)) (|data| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|i| (|Integer|))
          (|lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|form| (|SExpression|)))
         (SEQ (LETT |i| (SPADCALL |data| (QREFELT % 70)))
              (LETT |lst| (|HDTOP;get_con_lst| |page| %))
              (LETT |form| (QCAR (SPADCALL |lst| (+ |i| 1) (QREFELT % 195))))
              (EXIT
               (|HDTOP;con_page|
                (SPADCALL (LIST (SPADCALL |form| (QREFELT % 75)))
                          (QREFELT % 55))
                %))))) 

(SDEFUN |HDTOP;make_string_box|
        ((|width| (|Integer|)) (|name| (|Symbol|)) (% (|SExpression|)))
        (SPROG ((|e1| (|List| (|SExpression|))))
               (SEQ
                (LETT |e1|
                      (LIST (SPADCALL |width| (QREFELT % 100))
                            (SPADCALL "*" (QREFELT % 33))
                            (SPADCALL |name| (QREFELT % 35))
                            (SPADCALL 'EM (QREFELT % 35))))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL '|bcStrings| (QREFELT % 35))
                        (SPADCALL |e1| (QREFELT % 55)))
                  (QREFELT % 55)))))) 

(SDEFUN |HDTOP;make_text_item| ((|txt| (|String|)) (% (|SExpression|)))
        (CONS '|text| |txt|)) 

(SDEFUN |HDTOP;add_string_box|
        ((|txt| (|String|)) (|width| (|Integer|)) (|name| (|Symbol|))
         (|acc| (|List| (|SExpression|))) (% (|List| (|SExpression|))))
        (SEQ (LETT |acc| (CONS (|HDTOP;make_text_item| |txt| %) |acc|))
             (EXIT (CONS (|HDTOP;make_string_box| |width| |name| %) |acc|)))) 

(SDEFUN |HDTOP;add_button|
        ((|sname| (|Symbol|)) (|tname| (|String|))
         (|acc| (|List| (|SExpression|))) (% (|List| (|SExpression|))))
        (SPROG ((|l1| (|List| (|SExpression|))))
               (SEQ
                (LETT |l1|
                      (LIST (SPADCALL 1 (QREFELT % 100))
                            (SPADCALL |sname| (QREFELT % 35))))
                (LETT |l1|
                      (LIST (SPADCALL '|bcButtons| (QREFELT % 35))
                            (SPADCALL |l1| (QREFELT % 55))))
                (LETT |acc| (CONS (SPADCALL |l1| (QREFELT % 55)) |acc|))
                (EXIT
                 (CONS
                  (|HDTOP;make_text_item|
                   (SPADCALL (LIST " {\\em " |tname| "} ") (QREFELT % 113)) %)
                  |acc|))))) 

(SDEFUN |HDTOP;detailed_search| ((|pat| (|String|)) (% (|Void|)))
        (SPROG
         ((|page| (|HyperdocPage|)) (|lo| (|List| #1=(|SExpression|)))
          (|lc| (|List| #1#)) (|l1| (|List| (|SExpression|))))
         (SEQ (LETT |page| (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
              (|HDTOP;add_title| |page| (LIST "Detailed Search with Options")
               %)
              (SPADCALL |page| "\\beginscroll " (QREFELT % 32))
              (|HDTOP;add_list_to| |page|
               (LIST
                (SPADCALL "Select what you want to search for, then click on "
                          "{\\em Search} below." (QREFELT % 43))
                "\\horizontalline{}\\newline{}")
               %)
              (LETT |l1|
                    (LIST
                     (|HDTOP;make_text_item| "\\newline\\vspace{1}\\newline "
                      %)))
              (LETT |lo|
                    (LIST (SPADCALL "\\tab{3}{\\em Operations}" (QREFELT % 33))
                          (SPADCALL |l1| (QREFELT % 55))
                          (SPADCALL '|ops| (QREFELT % 35))))
              (LETT |l1| (LIST (|HDTOP;make_text_item| "\\tab{17}" %)))
              (LETT |l1| (|HDTOP;add_button| '|cats| "categories" |l1| %))
              (LETT |l1| (|HDTOP;add_button| '|doms| "domains" |l1| %))
              (LETT |l1| (|HDTOP;add_button| '|paks| "packages" |l1| %))
              (LETT |l1|
                    (CONS (|HDTOP;make_text_item| "\\newline\\tab{3}" %) |l1|))
              (LETT |l1| (|HDTOP;add_string_box| "name" 14 '|name| |l1| %))
              (LETT |l1| (|HDTOP;add_string_box| " \\#args" 4 '|nargs| |l1| %))
              (LETT |l1| (|HDTOP;add_string_box| "signature" 14 '|sig| |l1| %))
              (LETT |l1|
                    (CONS (|HDTOP;make_text_item| "\\vspace{1}\\newline " %)
                          |l1|))
              (LETT |l1| (NREVERSE |l1|))
              (LETT |lc|
                    (LIST
                     (SPADCALL "\\tab{3}{\\em Constructors}" (QREFELT % 33))
                     (SPADCALL |l1| (QREFELT % 55))
                     (SPADCALL '|cons| (QREFELT % 35))))
              (LETT |l1|
                    (LIST (SPADCALL '|bcRadioButtons| (QREFELT % 35))
                          (SPADCALL '|which| (QREFELT % 35))
                          (SPADCALL |lo| (QREFELT % 55))
                          (SPADCALL |lc| (QREFELT % 55))))
              (SPADCALL |page| (LIST (SPADCALL |l1| (QREFELT % 55)))
                        (QREFELT % 37))
              (SPADCALL |page| "\\vspace{1}\\newline\\centerline{ "
                        (QREFELT % 32))
              (LETT |l1|
                    (LIST (SPADCALL "\\fbox{Search}" (QREFELT % 33))
                          (SPADCALL "" (QREFELT % 33))
                          (SPADCALL '|generalSearchDo| (QREFELT % 35))
                          (SPADCALL NIL (QREFELT % 55))))
              (SPADCALL |page|
                        (LIST
                         (SPADCALL
                          (LIST (SPADCALL '|bcLinks| (QREFELT % 35))
                                (SPADCALL |l1| (QREFELT % 55)))
                          (QREFELT % 55)))
                        (QREFELT % 37))
              (SPADCALL |page| "}" (QREFELT % 32))
              (SPADCALL |page| "\\endscroll" (QREFELT % 32))
              (EXIT (SPADCALL |page| (QREFELT % 39)))))) 

(SDEFUN |HDTOP;exports_page| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG
         ((|conform| (|SExpression|)) (|name| (|Symbol|)) (|kind| (|Symbol|))
          (|domu| (|Union| (|SExpression|) (|ErrorIndicator|)))
          (|domname| #1=(|SExpression|)) (|con_string| (|String|))
          (|form_l| #1#)
          (|data|
           (|Record|
            (|:| |cats|
                 #2=(|List|
                     (|Record| (|:| |form| (|SExpression|))
                               (|:| |condition| (|SExpression|)))))
            (|:| |ops|
                 #3=(|List|
                     (|Record| (|:| |name| (|Symbol|))
                               (|:| |sdl|
                                    (|List|
                                     (|Record|
                                      (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))))
          (|e1| NIL) (#4=#:G1445 NIL)
          (|n_e1|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| #5=(|SExpression|))))
          (|n_lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|con_lst| #2#) (|rec| NIL) (#6=#:G1446 NIL) (|sd| NIL)
          (#7=#:G1447 NIL) (|p1| #5#) (|n_p1| (|SExpression|)) (#8=#:G1444 NIL)
          (|n_sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|n_sdl|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|no_lst|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|op_lst| #3#) (|cnt| (|Integer|)) (|prefix| (|List| (|String|)))
          (|title| (|List| (|String|))) (|star?| (|Reference| (|Boolean|)))
          (|lnk1| (|List| (|SExpression|))))
         (SEQ (LETT |conform| (SPADCALL |page| '|conform| (QREFELT % 19)))
              (LETT |name|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |kind| (|HDTOP;get_constructor_kind| |name| %))
              (LETT |domu|
                    (|HDTOP;get_evalable_constructor_form| |page| |name| %))
              (EXIT
               (COND ((QEQCAR |domu| 1) (|HDTOP;error_page| (QCDR |domu|) %))
                     (#9='T
                      (SEQ (LETT |domname| (QCDR |domu|))
                           (SPADCALL |page| '|domname| |domname|
                                     (QREFELT % 21))
                           (LETT |con_string|
                                 (COND
                                  ((SPADCALL |domname| (QREFELT % 57))
                                   (SPADCALL |name| (QREFELT % 62)))
                                  (#9# (SPADCALL |domname| (QREFELT % 98)))))
                           (LETT |form_l|
                                 (COND
                                  ((SPADCALL |domname| (QREFELT % 57))
                                   |conform|)
                                  (#9# |domname|)))
                           (LETT |data| (SPADCALL |form_l| (QREFELT % 197)))
                           (LETT |con_lst| (QCAR |data|))
                           (LETT |op_lst| (QCDR |data|))
                           (COND
                            ((NULL (SPADCALL |domname| (QREFELT % 57)))
                             (SEQ (LETT |n_lst| NIL)
                                  (SEQ (LETT |e1| NIL) (LETT #4# |con_lst|)
                                       G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN (LETT |e1| (CAR #4#)) NIL))
                                         (GO G191)))
                                       (SEQ (LETT |p1| (QCDR |e1|))
                                            (LETT |n_p1| (|simpHasPred| |p1|))
                                            (LETT |n_e1|
                                                  (COND
                                                   ((SPADCALL |p1| |n_p1|
                                                              (QREFELT % 71))
                                                    |e1|)
                                                   ('T
                                                    (CONS (QCAR |e1|)
                                                          |n_p1|))))
                                            (EXIT
                                             (LETT |n_lst|
                                                   (CONS |n_e1| |n_lst|))))
                                       (LETT #4# (CDR #4#)) (GO G190) G191
                                       (EXIT NIL))
                                  (LETT |con_lst| (NREVERSE |n_lst|))
                                  (LETT |no_lst| NIL)
                                  (SEQ (LETT |rec| NIL) (LETT #6# |op_lst|)
                                       G190
                                       (COND
                                        ((OR (ATOM #6#)
                                             (PROGN
                                              (LETT |rec| (CAR #6#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ (LETT |n_sdl| NIL)
                                            (SEQ (LETT |sd| NIL)
                                                 (LETT #7# (QCDR |rec|)) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |sd| (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |p1| (QVELT |sd| 1))
                                                    (LETT |n_p1|
                                                          (|simpHasPred| |p1|))
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL |n_p1|
                                                                 (QREFELT %
                                                                          57))
                                                       (PROGN
                                                        (LETT #8# |$NoValue|)
                                                        (GO #10=#:G1425)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |n_sd|
                                                              (COND
                                                               ((SPADCALL |p1|
                                                                          |n_p1|
                                                                          (QREFELT
                                                                           %
                                                                           71))
                                                                |sd|)
                                                               ('T
                                                                (VECTOR
                                                                 (QVELT |sd| 0)
                                                                 |n_p1|
                                                                 (QVELT |sd| 2)
                                                                 (QVELT |sd|
                                                                        3)))))
                                                        (EXIT
                                                         (LETT |n_sdl|
                                                               (CONS |n_sd|
                                                                     |n_sdl|)))))))))
                                                  #10# (EXIT #8#))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL (NULL |n_sdl|))
                                               (LETT |no_lst|
                                                     (CONS
                                                      (CONS (QCAR |rec|)
                                                            |n_sdl|)
                                                      |no_lst|))))))
                                       (LETT #6# (CDR #6#)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT (LETT |op_lst| (NREVERSE |no_lst|))))))
                           (LETT |page|
                                 (SPADCALL
                                  (|HDTOP;copy_property_list|
                                   (SPADCALL |page| (QREFELT % 124)) %)
                                  (QREFELT % 38)))
                           (LETT |cnt|
                                 (+ (LENGTH |con_lst|)
                                    (|HDTOP;count_ops| |op_lst| %)))
                           (LETT |prefix|
                                 (LIST (|HDTOP;get_count_str| |cnt| %)
                                       (COND ((> |cnt| 1) "exports")
                                             (#9# "export"))))
                           (LETT |title|
                                 (SPADCALL |prefix|
                                           (LIST " of "
                                                 (SPADCALL |kind|
                                                           (QREFELT % 62))
                                                 " {\\sf " |con_string| "}")
                                           (QREFELT % 110)))
                           (|HDTOP;add_title| |page| |title| %)
                           (LETT |star?| (SPADCALL NIL (QREFELT % 111)))
                           (SPADCALL |page| "\\beginscroll" (QREFELT % 32))
                           (|HDTOP;begin_menu| |page| %)
                           (COND
                            ((NULL (NULL |con_lst|))
                             (SEQ
                              (LETT |lnk1|
                                    (LIST |con_lst|
                                          (SPADCALL '|names| (QREFELT % 35))))
                              (|HDTOP;add_op_link0| |page| '|bcLinks|
                               (QREFELT % 53) '|dbShowCons1|
                               (SPADCALL |lnk1| (QREFELT % 55)) %)
                              (SPADCALL |page| "\\tab{2}" (QREFELT % 32))
                              (SPADCALL |page|
                                        "All attributes and operations from:"
                                        (QREFELT % 32))
                              (EXIT
                               (|HDTOP;name_con_table| |page| |con_lst| NIL
                                |star?| %)))))
                           (COND
                            ((NULL (NULL |op_lst|))
                             (SEQ
                              (COND
                               ((NULL (NULL |con_lst|))
                                (SPADCALL |page| "\\vspace{1}\\newline{}"
                                          (QREFELT % 32))))
                              (EXIT
                               (|HDTOP;display_exported_ops| |page| |op_lst|
                                %)))))
                           (|HDTOP;end_menu| |page| %)
                           (SPADCALL |page| "\\endscroll" (QREFELT % 32))
                           (EXIT (SPADCALL |page| (QREFELT % 39)))))))))) 

(MAKEPROP '|HDTOP;contains_formal| '|SPADreplace| '(XLAM (|se|) 'T)) 

(SDEFUN |HDTOP;contains_formal| ((|se| (|SExpression|)) (% (|Boolean|))) 'T) 

(SDEFUN |HDTOP;k_arg_page|
        ((|page| (|HyperdocPage|)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|al| #1=(|List| (|SExpression|))) (|i| (|Integer|))
          (|lst|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|form2| (|SExpression|)) (|conform| (|SExpression|))
          (|op| (|Symbol|)) (|args| #1#) (|n| (|Integer|))
          (|source| (|List| (|SExpression|))) (|arg_n| (|SExpression|))
          (|arg_form| (|SExpression|)) (|dom_name| (|SExpression|))
          (|arg_dom| (|SExpression|))
          (|descendants|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|rank| (|String|)))
         (SEQ (LETT |i| -1)
              (LETT |conform|
                    (COND
                     ((SPADCALL |arg| (QREFELT % 73))
                      (SEQ (LETT |al| (SPADCALL |arg| (QREFELT % 56)))
                           (LETT |i|
                                 (SPADCALL (SPADCALL |al| 2 (QREFELT % 63))
                                           (QREFELT % 70)))
                           (LETT |arg| (SPADCALL |al| 1 (QREFELT % 63)))
                           (LETT |lst| (|HDTOP;get_con_lst| |page| %))
                           (LETT |form2|
                                 (QCAR
                                  (SPADCALL |lst| (+ |i| 1) (QREFELT % 195))))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |form2| (QREFELT % 75))
                                       (QREFELT % 59))
                             (QREFELT % 108)))))
                     (#2='T (SPADCALL |page| '|conform| (QREFELT % 19)))))
              (LETT |op|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 75))
                              (QREFELT % 59)))
              (LETT |args|
                    (SPADCALL (SPADCALL |conform| (QREFELT % 123))
                              (QREFELT % 56)))
              (LETT |n| (SPADCALL |arg| |args| (QREFELT % 198)))
              (LETT |source|
                    (CDR
                     (SPADCALL (SPADCALL |op| (QREFELT % 99)) (QREFELT % 56))))
              (LETT |arg_n| (SPADCALL |source| |n| (QREFELT % 63)))
              (LETT |arg_form| (SPADCALL |args| |arg_n| (QREFELT % 106)))
              (LETT |dom_name|
                    (COND
                     ((< |i| 0) (SPADCALL |page| '|domname| (QREFELT % 19)))
                     (#2# (SPADCALL NIL (QREFELT % 55)))))
              (LETT |arg_dom|
                    (COND
                     ((NULL (SPADCALL |dom_name| (QREFELT % 57)))
                      (SPADCALL (CDR (SPADCALL |dom_name| (QREFELT % 56)))
                                |arg_n| (QREFELT % 106)))
                     ((OR (NULL |args|)
                          (NULL (|HDTOP;contains_formal| |arg_n| %)))
                      |arg_n|)
                     ('T (SPADCALL NIL (QREFELT % 55)))))
              (LETT |descendants|
                    (SPADCALL |arg_form| |arg_dom| (QREFELT % 118)))
              (LETT |page|
                    (SPADCALL
                     (|HDTOP;copy_property_list|
                      (SPADCALL |page| (QREFELT % 124)) %)
                     (QREFELT % 38)))
              (SPADCALL |page| '|conform| |conform| (QREFELT % 21))
              (SPADCALL |page| '|domname| (SPADCALL NIL (QREFELT % 55))
                        (QREFELT % 21))
              (|HDTOP;set_con_lst| |page| |descendants| %)
              (LETT |rank|
                    (COND ((> |n| 5) (STRCONC (STRINGIMAGE |n|) "-th"))
                          (#2#
                           (SPADCALL
                            (LIST "first" "second" "third" "fourth" "fifth")
                            |n| (QREFELT % 199)))))
              (SPADCALL |page| '|rank| (SPADCALL |rank| (QREFELT % 33))
                        (QREFELT % 21))
              (SPADCALL |page| '|thing| (SPADCALL "argument" (QREFELT % 33))
                        (QREFELT % 21))
              (EXIT (|HDTOP;show_cons| |page| '|names| %))))) 

(SDEFUN |HDTOP;get_builtin_opl|
        ((|c| (|Symbol|)) (|orig| (|SExpression|))
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
         ((|opl0| (|List| (|SExpression|))) (|tc| (|SExpression|)) (|r0| NIL)
          (#1=#:G1468 NIL) (|rl0| #2=(|List| (|SExpression|)))
          (|name| (|Symbol|)) (|s0| NIL) (#3=#:G1469 NIL) (|sl0| #2#)
          (|sig| (|SExpression|)) (|doc| (|String|))
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
         (SEQ (LETT |opl0| (GET |c| '|documentation|)) (LETT |res| NIL)
              (LETT |tc| 'T)
              (SEQ (LETT |r0| NIL) (LETT #1# |opl0|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r0| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rl0| (SPADCALL |r0| (QREFELT % 56)))
                        (LETT |name|
                              (SPADCALL (|SPADfirst| |rl0|) (QREFELT % 59)))
                        (COND ((EQUAL |name| 'CASE) (LETT |name| '|case|)))
                        (LETT |sdl| NIL)
                        (SEQ (LETT |s0| NIL) (LETT #3# (CDR |rl0|)) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |s0| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |sl0| (SPADCALL |s0| (QREFELT % 56)))
                                  (LETT |sig| (|SPADfirst| |sl0|))
                                  (LETT |doc|
                                        (SPADCALL
                                         (SPADCALL |sl0| 2 (QREFELT % 63))
                                         (QREFELT % 66)))
                                  (EXIT
                                   (LETT |sdl|
                                         (CONS (VECTOR |sig| |tc| |orig| |doc|)
                                               |sdl|))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (LETT |sdl| (NREVERSE |sdl|))
                        (EXIT (LETT |res| (CONS (CONS |name| |sdl|) |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |HDTOP;builtin_operations| ((|c| (|Symbol|)) (% (|Void|)))
        (SPROG
         ((|con_form| (|SExpression|))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|page| (|HyperdocPage|)))
         (SEQ (LETT |con_form| (SPADCALL |c| (QREFELT % 108)))
              (LETT |opl| (|HDTOP;get_builtin_opl| |c| |con_form| %))
              (LETT |page| (SPADCALL (SPADCALL (QREFELT % 23)) (QREFELT % 38)))
              (SPADCALL |page| '|conform| |con_form| (QREFELT % 21))
              (SPADCALL |page| '|kind| (SPADCALL "domain" (QREFELT % 33))
                        (QREFELT % 21))
              (EXIT (|HDTOP;show_ops_from| |page| |opl| %))))) 

(SDEFUN |HDTOP;do_search;SSSV;188|
        ((|pat| (|String|)) (|tag| (|Symbol|)) (|desc| (|String|))
         (% (|Void|)))
        (SEQ (LETT |pat| (|HDTOP;trim_pattern| |pat| %))
             (EXIT
              (COND ((EQUAL |tag| '|aok|) (|HDTOP;gen_search0| |pat| NIL %))
                    ((EQUAL |tag| '|det|) (|HDTOP;detailed_search| |pat| %))
                    ((EQUAL |tag| '|doc|) (|HDTOP;doc_search0| |pat| %))
                    ((EQUAL |tag| '|gen|) (|HDTOP;gen_search0| |pat| 'T %))
                    ((EQUAL |tag| '|o|) (|HDTOP;operation_search| |pat| %))
                    ((EQUAL |tag| '|oPageFrom|)
                     (|HDTOP;do_op_from| |pat| |desc| %))
                    ('T (|HDTOP;constructor_search| |pat| |tag| |desc| %)))))) 

(SDEFUN |HDTOP;show_spad_type_error| ((|s| #1=(|String|)) (% (|Void|)))
        (SPROG ((|msg| (|List| #1#)))
               (SEQ (LETT |msg| (LIST |s| "is not a valid constructor name"))
                    (EXIT (|HDTOP;error_page2| "Error" |msg| %))))) 

(SDEFUN |HDTOP;show_spad_type| ((|s| (|String|)) (% (|Void|)))
        (SPROG ((|cnu| (|Union| (|Symbol|) "failed")) (|name| (|Symbol|)))
               (SEQ (LETT |cnu| (|find_symbol| |s|))
                    (EXIT
                     (COND
                      ((QEQCAR |cnu| 1) (|HDTOP;show_spad_type_error| |s| %))
                      (#1='T
                       (SEQ (LETT |name| (QCDR |cnu|))
                            (EXIT
                             (COND
                              ((SPADCALL |name| (QREFELT % 72))
                               (|HDTOP;con_page|
                                (SPADCALL
                                 (LIST (SPADCALL |name| (QREFELT % 35)))
                                 (QREFELT % 55))
                                %))
                              (#1#
                               (|HDTOP;show_spad_type_error| |s| %))))))))))) 

(SDEFUN |HDTOP;load_gloss| ((% (|Void|)))
        (SPROG
         ((|kfn| #1=(|String|)) (|dfn| #1#) (|kf| #2=(|TextFile|)) (|df| #2#)
          (|kl| (|Union| (|String|) "failed")) (#3=#:G1496 NIL)
          (|dl| (|String|)) (|key| #4=(|String|)) (|k| (|Integer|))
          (|desc| #4#)
          (|gl|
           (|List|
            (|Record| (|:| |term| (|String|))
                      (|:| |description| (|String|))))))
         (SEQ (LETT |kfn| (STRCONC |$spadroot| "/algebra/glosskey.text"))
              (LETT |dfn| (STRCONC |$spadroot| "/algebra/glossdef.text"))
              (LETT |kf|
                    (SPADCALL (SPADCALL |kfn| (QREFELT % 204)) "input"
                              (QREFELT % 206)))
              (LETT |df|
                    (SPADCALL (SPADCALL |dfn| (QREFELT % 204)) "input"
                              (QREFELT % 206)))
              (LETT |gl| NIL)
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |kl| (SPADCALL |kf| (QREFELT % 207)))
                          (EXIT
                           (COND
                            ((QEQCAR |kl| 1)
                             (PROGN (LETT #3# |$NoValue|) (GO #5=#:G1491)))
                            ('T
                             (SEQ (LETT |dl| (SPADCALL |df| (QREFELT % 208)))
                                  (LETT |k|
                                        (SPADCALL (QREFELT % 10) (QCDR |kl|)
                                                  (QREFELT % 87)))
                                  (LETT |key|
                                        (SPADCALL (QCDR |kl|)
                                                  (SPADCALL 1 (- |k| 1)
                                                            (QREFELT % 51))
                                                  (QREFELT % 52)))
                                  (LETT |k|
                                        (SPADCALL (QREFELT % 10) |dl|
                                                  (QREFELT % 87)))
                                  (LETT |desc|
                                        (SPADCALL |dl|
                                                  (SPADCALL (+ |k| 1)
                                                            (QCSIZE |dl|)
                                                            (QREFELT % 51))
                                                  (QREFELT % 52)))
                                  (EXIT
                                   (LETT |gl|
                                         (CONS (CONS |key| |desc|) |gl|))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #5# (EXIT #3#))
              (SPADCALL |kf| (QREFELT % 209)) (SPADCALL |df| (QREFELT % 209))
              (SETELT % 201 (NREVERSE |gl|)) (EXIT (SETELT % 202 'T))))) 

(SDEFUN |HDTOP;do_gloss_page| ((|s| #1=(|String|)) (% (|Void|)))
        (SPROG
         ((|pat| (|Union| (|LogicalMatchingAutomaton|) (|ErrorIndicator|)))
          (#2=#:G1513 NIL)
          (|res|
           (|List|
            (|Record| (|:| |term| (|String|)) (|:| |description| (|String|)))))
          (|el| (|List| #1#)) (|page| (|HyperdocPage|)) (|gloss| NIL)
          (#3=#:G1514 NIL) (|l1| (|List| (|SExpression|))))
         (SEQ (COND ((EQUAL |s| "") (LETT |s| "*")))
              (EXIT
               (COND ((EQUAL |s| "*") (|HDTOP;downlink| "GlossaryPage" %))
                     (#4='T
                      (SEQ (LETT |pat| (SPADCALL |s| (QREFELT % 164)))
                           (EXIT
                            (COND
                             ((QEQCAR |pat| 1)
                              (|HDTOP;error_page| (QCDR |pat|) %))
                             (#4#
                              (SEQ
                               (COND
                                ((NULL (QREFELT % 202))
                                 (|HDTOP;load_gloss| %)))
                               (LETT |res| NIL)
                               (SEQ (LETT |gloss| NIL)
                                    (LETT #2# (QREFELT % 201)) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |gloss| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCDR |pat|) (QCAR |gloss|)
                                                  (QREFELT % 167))
                                        (LETT |res| (CONS |gloss| |res|))))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |res| (NREVERSE |res|))
                               (EXIT
                                (COND
                                 ((NULL |res|)
                                  (SEQ
                                   (LETT |el|
                                         (LIST "\\centerline{"
                                               "No glossary items match {\\em "
                                               |s| "}}"))
                                   (EXIT
                                    (|HDTOP;error_page2| "Sorry" |el| %))))
                                 (#4#
                                  (SEQ
                                   (LETT |page|
                                         (SPADCALL (SPADCALL (QREFELT % 23))
                                                   (QREFELT % 38)))
                                   (|HDTOP;add_title| |page|
                                    (LIST "Glossary items matching {\\em " |s|
                                          "}")
                                    %)
                                   (SPADCALL |page| "\\beginscroll\\beginmenu"
                                             (QREFELT % 32))
                                   (SEQ (LETT |gloss| NIL) (LETT #3# |res|)
                                        G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |gloss| (CAR #3#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (|HDTOP;add_list_to| |page|
                                           (LIST
                                            "\\item{\\em \\menuitemstyle{}}\\tab{0}{\\em "
                                            (|HDTOP;escape_if_needed|
                                             (QCAR |gloss|) %)
                                            "} " (QCDR |gloss|))
                                           %)))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT NIL))
                                   (SPADCALL |page|
                                             "\\endmenu \\endscroll\\newline "
                                             (QREFELT % 32))
                                   (LETT |l1|
                                         (LIST
                                          (SPADCALL "Search" (QREFELT % 33))
                                          (SPADCALL "" (QREFELT % 33))
                                          (SPADCALL '|htGlossSearch|
                                                    (QREFELT % 35))
                                          (SPADCALL NIL (QREFELT % 55))))
                                   (LETT |l1|
                                         (LIST
                                          (SPADCALL '|bcLinks| (QREFELT % 35))
                                          (SPADCALL |l1| (QREFELT % 55))))
                                   (SPADCALL |page|
                                             (LIST
                                              (SPADCALL |l1| (QREFELT % 55)))
                                             (QREFELT % 37))
                                   (SPADCALL |page|
                                             " for glossary entry matching "
                                             (QREFELT % 32))
                                   (LETT |l1|
                                         (LIST (SPADCALL 24 (QREFELT % 100))
                                               (SPADCALL "*" (QREFELT % 33))
                                               (SPADCALL '|filter|
                                                         (QREFELT % 35))
                                               (SPADCALL 'EM (QREFELT % 35))))
                                   (LETT |l1|
                                         (LIST
                                          (SPADCALL '|bcStrings|
                                                    (QREFELT % 35))
                                          (SPADCALL |l1| (QREFELT % 55))))
                                   (SPADCALL |page|
                                             (LIST
                                              (SPADCALL |l1| (QREFELT % 55)))
                                             (QREFELT % 37))
                                   (EXIT
                                    (SPADCALL |page|
                                              (QREFELT % 39)))))))))))))))))) 

(SDEFUN |HDTOP;do_gloss_search| ((|page| (|HyperdocPage|)) (% (|Void|)))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| (|HDTOP;get_input_string| |page| '|filter| %))
                    (EXIT (|HDTOP;do_gloss_page| |s| %))))) 

(SDEFUN |HDTOP;cons_opts|
        ((|page| (|HyperdocPage|)) (|tag| (|Symbol|)) (% (|Void|)))
        (COND ((EQUAL |tag| '|ancestors|) (|HDTOP;ancestors_page| |page| %))
              ((EQUAL |tag| '|children|) (|HDTOP;children_page| |page| %))
              ((EQUAL |tag| '|dependents|) (|HDTOP;dependents_page| |page| %))
              ((EQUAL |tag| '|descendents|)
               (|HDTOP;descendents_page| |page| %))
              ((EQUAL |tag| '|domains|) (|HDTOP;domains_page| |page| %))
              ((EQUAL |tag| '|exports|) (|HDTOP;exports_page| |page| %))
              ((EQUAL |tag| '|operations|)
               (|HDTOP;constructor_operations_page| |page| %))
              ((EQUAL |tag| '|parents|) (|HDTOP;parents_page| |page| %))
              ((EQUAL |tag| '|search_path|)
               (|HDTOP;show_search_path| |page| %))
              ((EQUAL |tag| '|users|) (|HDTOP;users_page| |page| %))
              ((EQUAL |tag| '|uses|) (|HDTOP;uses_page| |page| %))
              ('T (|error| "cons_opts: unimplemented")))) 

(SDEFUN |HDTOP;do_page_fun1;HpSSeV;195|
        ((|page| (|HyperdocPage|)) (|tag| (|Symbol|)) (|data| (|SExpression|))
         (% (|Void|)))
        (SPROG ((#1=#:G298 NIL))
               (COND
                ((EQUAL |tag| '|cons_opts|)
                 (|HDTOP;cons_opts| |page| (SPADCALL |data| (QREFELT % 59)) %))
                ((EQUAL |tag| '|dbChooseDomainOp|)
                 (|HDTOP;choose_domain_op| |page|
                  (SPADCALL |data| (QREFELT % 70)) %))
                ((EQUAL |tag| '|dbSelectCon|)
                 (|HDTOP;select_con| |page| |data| %))
                ((EQUAL |tag| '|dbShowCons|)
                 (|HDTOP;show_cons| |page| |data| %))
                ((EQUAL |tag| '|dbShowCons1|)
                 (|HDTOP;show_constructors2| |page|
                  (SPADCALL |data| (QREFELT % 75))
                  (SPADCALL
                   (SPADCALL (SPADCALL |data| (QREFELT % 123)) (QREFELT % 75))
                   (QREFELT % 59))
                  (QREFELT % 13) %))
                ((EQUAL |tag| '|dbShowConsKindsFilter|)
                 (|HDTOP;show_cons_kinds_filter| |page| |data| %))
                ((EQUAL |tag| '|dbShowOps|) (|HDTOP;show_ops| |page| |data| %))
                ((EQUAL |tag| '|htGlossSearch|)
                 (|HDTOP;do_gloss_search| |page| %))
                ((EQUAL |tag| '|htFilterPage|)
                 (|HDTOP;do_filter| |page| |data| %))
                ((EQUAL |tag| '|generalSearchDo|)
                 (|HDTOP;do_detailed_search| |page| |data| %))
                ((EQUAL |tag| '|genSearchSayJump|)
                 (|HDTOP;gen_search_jump| |page| |data| %))
                ((EQUAL |tag| '|grepSearchJump|)
                 (|HDTOP;do_search_jump| |page| %))
                ((EQUAL |tag| '|kArgPage|)
                 (|HDTOP;k_arg_page| |page| |data| %))
                ((EQUAL |tag| '|kxPage|)
                 (|HDTOP;downlink| (SPADCALL |data| (QREFELT % 66)) %))
                ((EQUAL |tag| '|repeatSearch|)
                 (|HDTOP;repeat_search| |page|
                  (NULL (SPADCALL |data| (QREFELT % 57))) %))
                ((EQUAL |tag| '|showConstruct|)
                 (|HDTOP;show_it| |page| |data|
                  (PROG2 (LETT #1# (|HDTOP;get_reg_list| |page| %))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0)
                                    (|Record|
                                     (|:| |cur|
                                          (|Record|
                                           (|:| |con_info|
                                                (|Record|
                                                 (|:| |categories|
                                                      (|List| (|Symbol|)))
                                                 (|:| |domains|
                                                      (|List| (|Symbol|)))
                                                 (|:| |packages|
                                                      (|List| (|Symbol|)))))
                                           (|:| |op_info|
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
                                     (|:| |save|
                                          (|Record|
                                           (|:| |con_info|
                                                (|Record|
                                                 (|:| |categories|
                                                      (|List| (|Symbol|)))
                                                 (|:| |domains|
                                                      (|List| (|Symbol|)))
                                                 (|:| |packages|
                                                      (|List| (|Symbol|)))))
                                           (|:| |op_info|
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
                                                              (|String|)))))))))))
                                    (|Union|
                                     (|Record|
                                      (|:| |cur|
                                           (|Record|
                                            (|:| |con_info|
                                                 (|Record|
                                                  (|:| |categories|
                                                       (|List| (|Symbol|)))
                                                  (|:| |domains|
                                                       (|List| (|Symbol|)))
                                                  (|:| |packages|
                                                       (|List| (|Symbol|)))))
                                            (|:| |op_info|
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
                                      (|:| |save|
                                           (|Record|
                                            (|:| |con_info|
                                                 (|Record|
                                                  (|:| |categories|
                                                       (|List| (|Symbol|)))
                                                  (|:| |domains|
                                                       (|List| (|Symbol|)))
                                                  (|:| |packages|
                                                       (|List| (|Symbol|)))))
                                            (|:| |op_info|
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
                                                               (|String|)))))))))))
                                     "failed")
                                    #1#))
                  %))
                ((EQUAL |tag| '|showDoc|)
                 (|HDTOP;show_it| |page| |data| (|HDTOP;get_doc_list| |page| %)
                  %))
                ('T (|error| "do_page_fun1: unimplemented"))))) 

(SDEFUN |HDTOP;do_gen_fun1;SSeV;196|
        ((|tag| (|Symbol|)) (|data| (|SExpression|)) (% (|Void|)))
        (COND ((EQUAL |tag| '|conPage|) (|HDTOP;con_page| |data| %))
              ((EQUAL |tag| '|conPageChoose|)
               (|HDTOP;con_page_choose| |data| %))
              ((EQUAL |tag| '|dbSpecialOperations|)
               (|HDTOP;builtin_operations| (SPADCALL |data| (QREFELT % 59)) %))
              ((EQUAL |tag| '|htGloss|)
               (|HDTOP;do_gloss_page| (SPADCALL |data| (QREFELT % 66)) %))
              ((EQUAL |tag| '|spadType|)
               (|HDTOP;show_spad_type| (SPADCALL |data| (QREFELT % 66)) %))
              ('T (|error| "do_gen_fun1: unimplemented")))) 

(DECLAIM (NOTINLINE |HyperdocTopPage;|)) 

(DEFUN |HyperdocTopPage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HyperdocTopPage|))
          (LETT % (GETREFV 212))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|HyperdocTopPage| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|STR_to_CHAR| "("))
          (QSETREFV % 7 (|STR_to_CHAR| "}"))
          (QSETREFV % 8 (|STR_to_CHAR| " "))
          (QSETREFV % 9 (|STR_to_CHAR| "*"))
          (QSETREFV % 10 (|STR_to_CHAR| "`"))
          (QSETREFV % 11 (|STR_to_CHAR| "s"))
          (QSETREFV % 12 (|STR_to_CHAR| "y"))
          (QSETREFV % 13 NIL)
          (QSETREFV % 14 10)
          (QSETREFV % 15 4)
          (QSETREFV % 53 "\\menuitemstyle{}")
          (QSETREFV % 178
                    (SPADCALL (LIST "Error" "Invalid pattern")
                              (QREFELT % 112)))
          (QSETREFV % 201 NIL)
          (QSETREFV % 202 NIL)
          %))) 

(DEFUN |HyperdocTopPage| ()
  (SPROG NIL
         (PROG (#1=#:G1555)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HyperdocTopPage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HyperdocTopPage|
                             (LIST (CONS NIL (CONS 1 (|HyperdocTopPage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|HyperdocTopPage|)))))))))) 

(MAKEPROP '|HyperdocTopPage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|char_lpar| '|char_rbrace| '|char_space|
              '|char_star| '|char_tick| '|char_s| '|char_y| '|exposed_only?|
              '|max_browse_count| '|max_description_count| (|SExpression|)
              (|Symbol|) (|HyperdocPage|) (0 . |get_property|) (|Void|)
              (6 . |set_property|) (|HyperdocAssociationList|) (13 . |empty|)
              (|Boolean|) (17 . |empty?|)
              (|Record| (|:| |key| 17) (|:| |entry| 16)) (22 . |first|)
              (27 . |rest|) (32 . |cons|) (38 . |reverse!|) (|String|)
              (43 . |add_to_description|) (49 . |convert|) (54 . |name|)
              (59 . |convert|) (|List| 16) (64 . |add_to|) (70 . |new|)
              (75 . |show|) (|List| 31) (|ErrorIndicator|) (80 . |retract|)
              (85 . |elt|) (|BrowserInformation|) (91 . |downcase|)
              (|Character|) (96 . |trim|) (|Integer|) (102 . |elt|)
              (|UniversalSegment| 48) (108 . SEGMENT) (114 . |elt|)
              '|menu_button| (|List| %) (120 . |convert|) (125 . |destruct|)
              (130 . |null?|) (135 . ~=) (141 . |symbol|)
              (146 . |exposed_constructor?|) (151 . |symbol?|) (156 . |string|)
              (161 . |elt|) (167 . |eq|) (173 . |void|) (177 . |string|)
              (|HyperdocUtilities|) (182 . |predicate_to_strings|)
              (189 . |integer?|) (194 . |integer|) (199 . =)
              (205 . |constructor_name?|) (210 . |list?|) (215 . |last|)
              (220 . |car|) (|NonNegativeInteger|) (225 . |first|)
              (231 . |rest|) (237 . |constructor_kind|) (|List| 17)
              (242 . |member?|) (|OutputForm|) (248 . |coerce|) (253 . |print|)
              (258 . |string?|) (263 . ~=) (269 . |position|) (|InputForm|)
              (275 . |parse|) (280 . ~=) (|Mapping| 24 16) (286 . |every?|)
              (|List| 46) (292 . |construct|) (297 . |coerce|) (302 . |#|)
              (307 . ~=) (313 . |constructor_to_string|)
              (318 . |constructor_signature|) (323 . |convert|) (|List| 24)
              (328 . |empty?|) (333 . |pair?|) (|Reference| 24)
              (338 . |setref|) (344 . |sublis_formal|) (350 . ~=)
              (356 . |constructor_form|) (361 . |concat|) (367 . |concat|)
              (373 . |ref|) (378 . |coerce|) (383 . |concat|)
              (|Record| (|:| |form| 16) (|:| |condition| 16)) (|List| 114)
              (388 . |ancestors|) (394 . |descendants|) (400 . |domains|)
              (406 . |children|) (412 . |dependents|) (417 . |uses|)
              (424 . |parents|) (429 . |cdr|) (434 . |get_property_list|)
              (439 . |users|) (444 . |constructor_documentation|)
              (449 . |constructor_signature|) (455 . |default_name?|)
              (460 . |con_to_strings|) (470 . |con_to_strings|) (479 . |deref|)
              (|None|) (484 . |search_path|) (491 . |sort|)
              (|Record| (|:| |signature| 16) (|:| |condition| 16)
                        (|:| |origin| 16) (|:| |documentation| 31))
              (|Record| (|:| |name| 17) (|:| |sdl| 139)) (|List| 136)
              (496 . |elt|) (|List| 135) (502 . |elt|)
              (|Record| (|:| |grp_tag| 16) (|:| |ops| 137)) (|List| 141)
              (508 . |group_by_origin|) (513 . |group_by_implementation|)
              (520 . |group_by_condition|) (|Union| 137 41)
              (525 . |search_operations|) (530 . |upperCase|) (535 . |setelt!|)
              (542 . |con_to_strings|)
              (|Record| (|:| |categories| 80) (|:| |domains| 80)
                        (|:| |packages| 80))
              (|Union| 151 41) (548 . |search_constructors|) (554 . |null?|)
              (559 . |convert|) (564 . |concat|) (570 . ~=)
              (|Record| (|:| |con_info| 151) (|:| |op_info| 137))
              (|Union| 158 41) (576 . |search_documentation|)
              (581 . |search_general|) (586 . |elt|) (|Union| 165 41)
              (592 . |convert_pattern|) (|LogicalMatchingAutomaton|)
              (597 . |filter_ops|) (603 . |do_match|) (609 . |concat|)
              (615 . |#|) (620 . |1|) (624 . -) (630 . |convert|)
              (635 . |cons|) (|Mapping| 24 31 135) (641 . |search_operations|)
              (|Union| 31 '"failed") (646 . |input_string|) '|pat_err|
              (|Union| 165 '"failed") (|LogicalRegularExpressionMatch|)
              (652 . |parse_pattern|) (658 . <=) (664 . =) (670 . <) (676 . >=)
              (682 . >) (688 . |button_value|) (694 . |button_on?|)
              (700 . |simp_ops_conditions|) (707 . |con_to_strings|)
              (714 . |operations|) (720 . ~=) (726 . |con_arg_to_strings|)
              (738 . |atom?|) (743 . |elt|)
              (|Record| (|:| |cats| 115) (|:| |ops| 137)) (749 . |exports|)
              (754 . |position|) (760 . |elt|) |HDTOP;do_search;SSSV;188|
              '|gloss_lst| '|gloss_valid| (|FileName|) (766 . |coerce|)
              (|TextFile|) (771 . |open|) (777 . |readLineIfCan!|)
              (782 . |readLine!|) (787 . |close!|)
              |HDTOP;do_page_fun1;HpSSeV;195| |HDTOP;do_gen_fun1;SSeV;196|)
           '#(|do_search| 792 |do_page_fun1| 799 |do_gen_fun1| 806) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|do_search|
                                 ((|Void|) (|String|) (|Symbol|) (|String|)))
                                T)
                              '((|do_page_fun1|
                                 ((|Void|) (|HyperdocPage|) (|Symbol|)
                                  (|SExpression|)))
                                T)
                              '((|do_gen_fun1|
                                 ((|Void|) (|Symbol|) (|SExpression|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 211
                                            '(2 18 16 0 17 19 3 18 20 0 17 16
                                              21 0 22 0 23 1 22 24 0 25 1 22 26
                                              0 27 1 22 0 0 28 2 22 0 26 0 29 1
                                              22 0 0 30 2 18 20 0 31 32 1 16 0
                                              31 33 1 18 17 0 34 1 16 0 17 35 2
                                              18 20 0 36 37 1 18 0 22 38 1 18
                                              20 0 39 1 41 40 0 42 2 31 0 0 0
                                              43 1 44 31 31 45 2 31 0 0 46 47 2
                                              31 46 0 48 49 2 50 0 48 48 51 2
                                              31 0 0 50 52 1 16 0 54 55 1 16 54
                                              0 56 1 16 24 0 57 2 17 24 0 0 58
                                              1 16 17 0 59 1 44 24 17 60 1 16
                                              24 0 61 1 17 31 0 62 2 36 16 0 48
                                              63 2 16 24 0 0 64 0 20 0 65 1 16
                                              31 0 66 3 67 40 16 24 40 68 1 16
                                              24 0 69 1 16 48 0 70 2 16 24 0 0
                                              71 1 44 24 17 72 1 16 24 0 73 1
                                              36 16 0 74 1 16 0 0 75 2 36 0 0
                                              76 77 2 36 0 0 76 78 1 44 17 17
                                              79 2 80 24 17 0 81 1 16 82 0 83 1
                                              82 20 0 84 1 16 24 0 85 2 46 24 0
                                              0 86 2 31 48 46 0 87 1 88 0 31 89
                                              2 48 24 0 0 90 2 36 24 91 0 92 1
                                              31 0 93 94 1 17 0 31 95 1 16 48 0
                                              96 2 16 24 0 0 97 1 67 31 16 98 1
                                              44 16 17 99 1 16 0 48 100 1 101
                                              24 0 102 1 16 24 0 103 2 104 24 0
                                              24 105 2 44 16 36 16 106 2 31 24
                                              0 0 107 1 44 16 17 108 2 40 0 0
                                              31 109 2 40 0 0 0 110 1 104 0 24
                                              111 1 41 0 40 112 1 31 0 54 113 2
                                              44 115 16 16 116 2 44 115 16 16
                                              117 2 44 115 16 16 118 2 44 115
                                              16 16 119 1 44 80 17 120 3 44 115
                                              17 16 16 121 1 44 115 16 122 1 16
                                              0 0 123 1 18 22 0 124 1 44 80 17
                                              125 1 44 31 17 126 2 44 16 17 36
                                              127 1 44 24 17 128 6 67 40 31 16
                                              16 24 24 40 129 5 67 40 16 16 24
                                              24 40 130 1 104 24 0 131 3 44 115
                                              16 16 132 133 1 80 0 0 134 2 137
                                              136 0 48 138 2 139 135 0 48 140 1
                                              44 142 137 143 3 44 142 36 16 137
                                              144 1 44 142 137 145 1 44 146 31
                                              147 1 46 0 0 148 3 31 46 0 48 46
                                              149 2 67 40 17 36 150 2 44 152 31
                                              17 153 1 88 24 0 154 1 88 16 0
                                              155 2 80 0 0 0 156 2 76 24 0 0
                                              157 1 44 159 31 160 1 44 159 31
                                              161 2 142 141 0 48 162 1 44 163
                                              31 164 2 44 137 165 137 166 2 44
                                              24 165 31 167 2 36 0 0 0 168 1 36
                                              76 0 169 0 48 0 170 2 48 0 0 0
                                              171 1 17 17 0 172 2 36 0 16 0 173
                                              1 44 137 174 175 2 18 176 0 17
                                              177 2 180 179 31 24 181 2 48 24 0
                                              0 182 2 48 24 0 0 183 2 48 24 0 0
                                              184 2 48 24 0 0 185 2 48 24 0 0
                                              186 2 18 17 0 17 187 2 18 24 0 17
                                              188 3 44 137 137 16 16 189 3 67
                                              40 16 24 40 190 2 44 137 16 16
                                              191 2 40 24 0 0 192 8 67 40 24 17
                                              36 16 16 48 24 40 193 1 16 24 0
                                              194 2 115 114 0 48 195 1 44 196
                                              16 197 2 36 48 16 0 198 2 40 31 0
                                              48 199 1 203 0 31 204 2 205 0 203
                                              31 206 1 205 176 0 207 1 205 31 0
                                              208 1 205 0 0 209 3 0 20 31 17 31
                                              200 3 0 20 18 17 16 210 2 0 20 17
                                              16 211)))))
           '|lookupComplete|)) 
