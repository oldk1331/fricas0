
(SDEFUN |LF;Si;2F;1| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 21) |x| (QREFELT % 30))) 

(SDEFUN |LF;Ci;2F;2| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 22) |x| (QREFELT % 30))) 

(SDEFUN |LF;Shi;2F;3| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 23) |x| (QREFELT % 30))) 

(SDEFUN |LF;Chi;2F;4| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 24) |x| (QREFELT % 30))) 

(SDEFUN |LF;Ei;2F;5| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 19) |x| (QREFELT % 30))) 

(SDEFUN |LF;erf;2F;6| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 26) |x| (QREFELT % 30))) 

(SDEFUN |LF;erfi;2F;7| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 27) |x| (QREFELT % 30))) 

(SDEFUN |LF;li;2F;8| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 20) |x| (QREFELT % 30))) 

(SDEFUN |LF;dilog;2F;9| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 25) |x| (QREFELT % 30))) 

(SDEFUN |LF;fresnelS;2F;10| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 28) |x| (QREFELT % 30))) 

(SDEFUN |LF;fresnelC;2F;11| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 29) |x| (QREFELT % 30))) 

(SDEFUN |LF;belong?;BoB;12| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (SPADCALL |op| (QREFELT % 8) (QREFELT % 43))) 

(SDEFUN |LF;isi| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 45)) (|spadConstant| % 46))
              ('T (SPADCALL (QREFELT % 21) |x| (QREFELT % 47))))) 

(SDEFUN |LF;ici| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 22) |x| (QREFELT % 47))) 

(SDEFUN |LF;ishi| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 45)) (|spadConstant| % 46))
              ('T (SPADCALL (QREFELT % 23) |x| (QREFELT % 47))))) 

(SDEFUN |LF;ichi| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 24) |x| (QREFELT % 47))) 

(SDEFUN |LF;ierf| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 45)) (|spadConstant| % 46))
              ('T (SPADCALL (QREFELT % 26) |x| (QREFELT % 47))))) 

(SDEFUN |LF;ierfi| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 45)) (|spadConstant| % 46))
              ('T (SPADCALL (QREFELT % 27) |x| (QREFELT % 47))))) 

(SDEFUN |LF;ili2| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 49) (QREFELT % 50))
          (|spadConstant| % 46))
         ('T (SPADCALL (QREFELT % 25) |x| (QREFELT % 47))))) 

(SDEFUN |LF;ifis| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 45)) (|spadConstant| % 46))
              ('T (SPADCALL (QREFELT % 28) |x| (QREFELT % 47))))) 

(SDEFUN |LF;ific| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 45)) (|spadConstant| % 46))
              ('T (SPADCALL (QREFELT % 29) |x| (QREFELT % 47))))) 

(SDEFUN |LF;integrand| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|)
                  (SPADCALL (SPADCALL |l| (QREFELT % 52)) (QREFELT % 54))
                  (SPADCALL |l| (QREFELT % 55)) (QREFELT % 56))) 

(SDEFUN |LF;integral;FSF;23| ((|f| (F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|k| (|Kernel| F)))
               (SPADCALL (QREFELT % 16)
                         (LIST
                          (SPADCALL |f|
                                    (LETT |k| (SPADCALL |x| (QREFELT % 58)))
                                    (QREFELT % 12) (QREFELT % 56))
                          (QREFELT % 12) (SPADCALL |k| (QREFELT % 59)))
                         (QREFELT % 61)))) 

(SDEFUN |LF;iint| ((|l| (|List| F)) (% (F)))
        (COND
         ((SPADCALL (|SPADfirst| |l|) (QREFELT % 45)) (|spadConstant| % 46))
         ('T (SPADCALL (QREFELT % 16) |l| (QREFELT % 63))))) 

(SDEFUN |LF;ddint| ((|l| (|List| F)) (% (|OutputForm|)))
        (SPADCALL
         (SPADCALL (SPADCALL (|LF;integrand| |l| %) (QREFELT % 65))
                   (SPADCALL (SPADCALL '|d| (QREFELT % 66))
                             (SPADCALL (SPADCALL |l| (QREFELT % 55))
                                       (QREFELT % 65))
                             (QREFELT % 67))
                   (QREFELT % 68))
         (SPADCALL (SPADCALL (CDR |l|) (QREFELT % 55)) (QREFELT % 65))
         (SPADCALL (SPADCALL (CDR (CDR |l|)) (QREFELT % 55)) (QREFELT % 65))
         (QREFELT % 69))) 

(SDEFUN |LF;eqint| ((|k1| (|Kernel| F)) (|k2| (|Kernel| F)) (% (|Boolean|)))
        (SPROG
         ((|a1| #1=(|List| F)) (|a2| #1#) (#2=#:G62 NIL) (|res| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT % 70)))
                (LETT |a2| (SPADCALL |k2| (QREFELT % 70)))
                (LETT |res|
                      (SPADCALL (SPADCALL |k1| (QREFELT % 71))
                                (SPADCALL |k2| (QREFELT % 71)) (QREFELT % 72)))
                (COND ((NULL |res|) (PROGN (LETT #2# |res|) (GO #3=#:G61))))
                (LETT |res| (SPADCALL |a1| |a2| (QREFELT % 73)))
                (COND (|res| (PROGN (LETT #2# |res|) (GO #3#))))
                (EXIT
                 (LETT |res|
                       (COND
                        ((SPADCALL (SPADCALL |a1| 3 (QREFELT % 75))
                                   (SPADCALL |a2| 3 (QREFELT % 75))
                                   (QREFELT % 50))
                         (SPADCALL
                          (SPADCALL (SPADCALL |a1| 1 (QREFELT % 75))
                                    (LIST
                                     (SPADCALL (SPADCALL |a1| 2 (QREFELT % 75))
                                               (QREFELT % 54)))
                                    (LIST (SPADCALL |a2| 2 (QREFELT % 75)))
                                    (QREFELT % 77))
                          (SPADCALL |a2| 1 (QREFELT % 75)) (QREFELT % 50)))
                        ('T NIL))))))
          #3# (EXIT #2#)))) 

(SDEFUN |LF;dvint| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT % 55)) |x| (QREFELT % 78))
                   (|LF;integrand| |l| %) (QREFELT % 79))
         (SPADCALL (QREFELT % 16)
                   (LIST (SPADCALL (|SPADfirst| |l|) |x| (QREFELT % 78))
                         (SPADCALL |l| (QREFELT % 52))
                         (SPADCALL |l| (QREFELT % 55)))
                   (QREFELT % 61))
         (QREFELT % 80))) 

(SDEFUN |LF;iiint| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|nu| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|lval| (|List| F)))
         (SEQ (LETT |nu| (|exquo_INT| (LENGTH |l|) 2))
              (EXIT
               (COND ((QEQCAR |nu| 1) (|error| "impossible"))
                     (#1='T
                      (SEQ (LETT |n| (QCDR |nu|))
                           (LETT |lval| (SPADCALL |l| |n| (QREFELT % 82)))
                           (EXIT
                            (COND
                             ((SPADCALL (ELT % 45) |lval| (QREFELT % 84))
                              (|spadConstant| % 46))
                             (#1#
                              (SPADCALL (QREFELT % 17) |l|
                                        (QREFELT % 63)))))))))))) 

(SDEFUN |LF;dviint| ((|l| (|List| F)) (|v| (|Symbol|)) (% (F)))
        (SPROG
         ((|nu| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|lvf| (|List| F)) (#1=#:G80 NIL)
          (|vf| NIL) (#2=#:G81 NIL) (|lv| (|List| (|Symbol|)))
          (|m| (|Integer|)))
         (SEQ (LETT |nu| (|exquo_INT| (LENGTH |l|) 2))
              (EXIT
               (COND ((QEQCAR |nu| 1) (|error| "impossible"))
                     (#3='T
                      (SEQ (LETT |n| (QCDR |nu|))
                           (LETT |lvf| (SPADCALL |l| |n| (QREFELT % 85)))
                           (LETT |lv|
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |vf| NIL) (LETT #2# |lvf|) G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |vf| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |vf| (QREFELT % 86))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#)))))
                           (LETT |m| (SPADCALL |v| |lv| (QREFELT % 88)))
                           (EXIT
                            (COND ((EQL |m| 0) (|spadConstant| % 46))
                                  (#3#
                                   (SPADCALL |l| (+ |n| |m|)
                                             (QREFELT % 75)))))))))))) 

(SDEFUN |LF;dvdint| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|y| (F)) (|d| (F)) (|k| (|Kernel| F)) (|f| (F)) (|h| (F)) (|g| (F))
          (|dh| (F)) (|p1| (F)) (|dg| (F)) (|p2| (F)) (|df| (F)) (|p3| (F)))
         (SEQ
          (COND
           ((EQUAL |x|
                   (SPADCALL (LETT |y| (SPADCALL |l| (QREFELT % 55)))
                             (QREFELT % 86)))
            (|spadConstant| % 46))
           (#1='T
            (SEQ
             (LETT |k|
                   (SPADCALL (LETT |d| (SPADCALL |l| (QREFELT % 52)))
                             (QREFELT % 54)))
             (LETT |f| (|SPADfirst| |l|))
             (LETT |h| (SPADCALL (CDR (CDR |l|)) (QREFELT % 55)))
             (LETT |g| (SPADCALL (CDR |l|) (QREFELT % 55)))
             (LETT |dh| (SPADCALL |h| |x| (QREFELT % 78)))
             (LETT |p1|
                   (SEQ (LETT |dh| (SPADCALL |h| |x| (QREFELT % 78)))
                        (EXIT
                         (COND
                          ((SPADCALL |dh| (|spadConstant| % 46) (QREFELT % 50))
                           (|spadConstant| % 46))
                          (#1#
                           (SPADCALL |dh| (SPADCALL |f| |k| |h| (QREFELT % 56))
                                     (QREFELT % 79)))))))
             (LETT |p2|
                   (SEQ (LETT |dg| (SPADCALL |g| |x| (QREFELT % 78)))
                        (EXIT
                         (COND
                          ((SPADCALL |dg| (|spadConstant| % 46) (QREFELT % 50))
                           (|spadConstant| % 46))
                          (#1#
                           (SPADCALL |dg| (SPADCALL |f| |k| |g| (QREFELT % 56))
                                     (QREFELT % 79)))))))
             (LETT |p3|
                   (SEQ (LETT |df| (SPADCALL |f| |x| (QREFELT % 78)))
                        (EXIT
                         (COND
                          ((SPADCALL |df| (|spadConstant| % 46) (QREFELT % 50))
                           (|spadConstant| % 46))
                          (#1#
                           (SPADCALL (QREFELT % 18) (LIST |df| |d| |y| |g| |h|)
                                     (QREFELT % 61)))))))
             (EXIT
              (SPADCALL (SPADCALL |p1| |p2| (QREFELT % 80)) |p3|
                        (QREFELT % 80))))))))) 

(SDEFUN |LF;integral;FSbF;31| ((|f| (F)) (|s| (|SegmentBinding| F)) (% (F)))
        (SPROG ((|x| (|Kernel| F)))
               (SEQ
                (LETT |x|
                      (SPADCALL (SPADCALL |s| (QREFELT % 91)) (QREFELT % 58)))
                (EXIT
                 (SPADCALL (QREFELT % 18)
                           (LIST
                            (SPADCALL |f| |x| (QREFELT % 12) (QREFELT % 56))
                            (QREFELT % 12) (SPADCALL |x| (QREFELT % 59))
                            (SPADCALL (SPADCALL |s| (QREFELT % 93))
                                      (QREFELT % 94))
                            (SPADCALL (SPADCALL |s| (QREFELT % 93))
                                      (QREFELT % 95)))
                           (QREFELT % 61)))))) 

(SDEFUN |LF;ili| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 49) (QREFELT % 50))
          (|error| "Invalid argument"))
         ((SPADCALL |x| '|exp| (QREFELT % 97))
          (SPADCALL
           (|SPADfirst|
            (SPADCALL (SPADCALL |x| (QREFELT % 54)) (QREFELT % 70)))
           (QREFELT % 35)))
         ('T (SPADCALL (QREFELT % 20) |x| (QREFELT % 47))))) 

(SDEFUN |LF;iei| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 46) (QREFELT % 50))
          (|error| "Invalid argument"))
         ((SPADCALL |x| '|log| (QREFELT % 97))
          (SPADCALL
           (|SPADfirst|
            (SPADCALL (SPADCALL |x| (QREFELT % 54)) (QREFELT % 70)))
           (QREFELT % 38)))
         ('T (SPADCALL (QREFELT % 19) |x| (QREFELT % 47))))) 

(SDEFUN |LF;operator;2Bo;34| ((|op| (|BasicOperator|)) (% (|BasicOperator|)))
        (COND ((SPADCALL |op| '|integral| (QREFELT % 98)) (QREFELT % 16))
              ((SPADCALL |op| '|%iint| (QREFELT % 98)) (QREFELT % 17))
              ((SPADCALL |op| '|%defint| (QREFELT % 98)) (QREFELT % 18))
              ((SPADCALL |op| '|Ei| (QREFELT % 98)) (QREFELT % 19))
              ((SPADCALL |op| '|Si| (QREFELT % 98)) (QREFELT % 21))
              ((SPADCALL |op| '|Ci| (QREFELT % 98)) (QREFELT % 22))
              ((SPADCALL |op| '|Shi| (QREFELT % 98)) (QREFELT % 23))
              ((SPADCALL |op| '|Chi| (QREFELT % 98)) (QREFELT % 24))
              ((SPADCALL |op| '|li| (QREFELT % 98)) (QREFELT % 20))
              ((SPADCALL |op| '|erf| (QREFELT % 98)) (QREFELT % 26))
              ((SPADCALL |op| '|erfi| (QREFELT % 98)) (QREFELT % 27))
              ((SPADCALL |op| '|dilog| (QREFELT % 98)) (QREFELT % 25))
              ((SPADCALL |op| '|fresnelC| (QREFELT % 98)) (QREFELT % 29))
              ((SPADCALL |op| '|fresnelS| (QREFELT % 98)) (QREFELT % 28))
              ('T (|error| "Not a Liouvillian operator")))) 

(SDEFUN |LF;pint| ((|l| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|integral| (QREFELT % 125)) |l|)
                  (QREFELT % 126))) 

(SDEFUN |LF;inint| ((|l| (|List| F)) (% (|InputForm|)))
        (SPROG ((|r2| (|InputForm|)))
               (SEQ
                (LETT |r2|
                      (SPADCALL
                       (LIST (SPADCALL '|::| (QREFELT % 125))
                             (SPADCALL (SPADCALL |l| (QREFELT % 55))
                                       (QREFELT % 127))
                             (SPADCALL '|Symbol| (QREFELT % 125)))
                       (QREFELT % 126)))
                (EXIT
                 (|LF;pint|
                  (LIST (SPADCALL (|LF;integrand| |l| %) (QREFELT % 127)) |r2|)
                  %))))) 

(SDEFUN |LF;indint| ((|l| (|List| F)) (% (|InputForm|)))
        (|LF;pint|
         (LIST (SPADCALL (|LF;integrand| |l| %) (QREFELT % 127))
               (SPADCALL
                (CONS (SPADCALL '= (QREFELT % 125))
                      (LIST
                       (SPADCALL (SPADCALL |l| (QREFELT % 55)) (QREFELT % 127))
                       (SPADCALL
                        (CONS (SPADCALL 'SEGMENT (QREFELT % 125))
                              (LIST
                               (SPADCALL (SPADCALL (CDR |l|) (QREFELT % 55))
                                         (QREFELT % 127))
                               (SPADCALL
                                (SPADCALL (CDR (CDR |l|)) (QREFELT % 55))
                                (QREFELT % 127))))
                        (QREFELT % 126))))
                (QREFELT % 126)))
         %)) 

(DECLAIM (NOTINLINE |LiouvillianFunction;|)) 

(DEFUN |LiouvillianFunction;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|LiouvillianFunction| DV$1 DV$2))
          (LETT % (GETREFV 128))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LiouvillianFunction|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|prim|)
          (QSETREFV % 12 (SPADCALL (SPADCALL (QREFELT % 10)) (QREFELT % 11)))
          (QSETREFV % 16 (SPADCALL '|integral| (QREFELT % 15)))
          (QSETREFV % 17 (SPADCALL '|%iint| (QREFELT % 15)))
          (QSETREFV % 18 (SPADCALL '|%defint| (QREFELT % 15)))
          (QSETREFV % 19 (SPADCALL '|Ei| (QREFELT % 15)))
          (QSETREFV % 20 (SPADCALL '|li| (QREFELT % 15)))
          (QSETREFV % 21 (SPADCALL '|Si| (QREFELT % 15)))
          (QSETREFV % 22 (SPADCALL '|Ci| (QREFELT % 15)))
          (QSETREFV % 23 (SPADCALL '|Shi| (QREFELT % 15)))
          (QSETREFV % 24 (SPADCALL '|Chi| (QREFELT % 15)))
          (QSETREFV % 25 (SPADCALL '|dilog| (QREFELT % 15)))
          (QSETREFV % 26 (SPADCALL '|erf| (QREFELT % 15)))
          (QSETREFV % 27 (SPADCALL '|erfi| (QREFELT % 15)))
          (QSETREFV % 28 (SPADCALL '|fresnelS| (QREFELT % 15)))
          (QSETREFV % 29 (SPADCALL '|fresnelC| (QREFELT % 15)))
          (SPADCALL (QREFELT % 19) (CONS (|function| |LF;iei|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 20) (CONS (|function| |LF;ili|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 21) (CONS (|function| |LF;isi|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 22) (CONS (|function| |LF;ici|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 23) (CONS (|function| |LF;ishi|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 24) (CONS (|function| |LF;ichi|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 26) (CONS (|function| |LF;ierf|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 27) (CONS (|function| |LF;ierfi|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 25) (CONS (|function| |LF;ili2|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 28) (CONS (|function| |LF;ifis|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 29) (CONS (|function| |LF;ific|) %)
                    (QREFELT % 102))
          (SPADCALL (QREFELT % 16) (CONS (|function| |LF;iint|) %)
                    (QREFELT % 104))
          (SPADCALL (QREFELT % 17) (CONS (|function| |LF;iiint|) %)
                    (QREFELT % 104))
          (SPADCALL (QREFELT % 21) (CONS #'|LiouvillianFunction!0| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 22) (CONS #'|LiouvillianFunction!1| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 23) (CONS #'|LiouvillianFunction!2| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 24) (CONS #'|LiouvillianFunction!3| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 19) (CONS #'|LiouvillianFunction!4| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 20) (CONS #'|LiouvillianFunction!5| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 26) (CONS #'|LiouvillianFunction!6| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 27) (CONS #'|LiouvillianFunction!7| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 25) (CONS #'|LiouvillianFunction!8| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 28) (CONS #'|LiouvillianFunction!9| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 29) (CONS #'|LiouvillianFunction!10| %)
                    (QREFELT % 107))
          (SPADCALL (QREFELT % 16) '|%specialEqual|
                    (CONS (|function| |LF;eqint|) %) (QREFELT % 123))
          (SPADCALL (QREFELT % 16) '|%specialDiff|
                    (CONS (|function| |LF;dvint|) %) (QREFELT % 123))
          (SPADCALL (QREFELT % 17) '|%specialDiff|
                    (CONS (|function| |LF;dviint|) %) (QREFELT % 123))
          (SPADCALL (QREFELT % 18) '|%specialDiff|
                    (CONS (|function| |LF;dvdint|) %) (QREFELT % 123))
          (SPADCALL (QREFELT % 18) '|%specialDisp|
                    (CONS (|function| |LF;ddint|) %) (QREFELT % 123))
          (COND
           ((|HasCategory| |#1| '(|ConvertibleTo| (|InputForm|)))
            (PROGN
             (SPADCALL (QREFELT % 16) '|%specialInput|
                       (CONS (|function| |LF;inint|) %) (QREFELT % 123))
             (SPADCALL (QREFELT % 18) '|%specialInput|
                       (CONS (|function| |LF;indint|) %) (QREFELT % 123)))))
          %))) 

(DEFUN |LiouvillianFunction| (&REST #1=#:G172)
  (SPROG NIL
         (PROG (#2=#:G173)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LiouvillianFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LiouvillianFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LiouvillianFunction|)))))))))) 

(DEFUN |LiouvillianFunction!10| (|z1| %)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT % 118)) (SPADCALL |z1| 2 (QREFELT % 115))
              (QREFELT % 79))
    (SPADCALL 2 (QREFELT % 121)) (QREFELT % 106))
   (QREFELT % 108))) 

(DEFUN |LiouvillianFunction!9| (|z1| %)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT % 118)) (SPADCALL |z1| 2 (QREFELT % 115))
              (QREFELT % 79))
    (SPADCALL 2 (QREFELT % 121)) (QREFELT % 106))
   (QREFELT % 105))) 

(DEFUN |LiouvillianFunction!8| (|z1| %)
  (SPADCALL (SPADCALL |z1| (QREFELT % 112))
            (SPADCALL (|spadConstant| % 49) |z1| (QREFELT % 120))
            (QREFELT % 106))) 

(DEFUN |LiouvillianFunction!7| (|z1| %)
  (SPADCALL
   (SPADCALL 2 (SPADCALL (SPADCALL |z1| 2 (QREFELT % 115)) (QREFELT % 111))
             (QREFELT % 117))
   (SPADCALL (SPADCALL (QREFELT % 118)) (QREFELT % 119)) (QREFELT % 106))) 

(DEFUN |LiouvillianFunction!6| (|z1| %)
  (SPADCALL
   (SPADCALL 2
             (SPADCALL
              (SPADCALL (SPADCALL |z1| 2 (QREFELT % 115)) (QREFELT % 116))
              (QREFELT % 111))
             (QREFELT % 117))
   (SPADCALL (SPADCALL (QREFELT % 118)) (QREFELT % 119)) (QREFELT % 106))) 

(DEFUN |LiouvillianFunction!5| (|z1| %)
  (SPADCALL (SPADCALL |z1| (QREFELT % 112)) (QREFELT % 113))) 

(DEFUN |LiouvillianFunction!4| (|z1| %)
  (SPADCALL (SPADCALL |z1| (QREFELT % 111)) |z1| (QREFELT % 106))) 

(DEFUN |LiouvillianFunction!3| (|z1| %)
  (SPADCALL (SPADCALL |z1| (QREFELT % 110)) |z1| (QREFELT % 106))) 

(DEFUN |LiouvillianFunction!2| (|z1| %)
  (SPADCALL (SPADCALL |z1| (QREFELT % 109)) |z1| (QREFELT % 106))) 

(DEFUN |LiouvillianFunction!1| (|z1| %)
  (SPADCALL (SPADCALL |z1| (QREFELT % 108)) |z1| (QREFELT % 106))) 

(DEFUN |LiouvillianFunction!0| (|z1| %)
  (SPADCALL (SPADCALL |z1| (QREFELT % 105)) |z1| (QREFELT % 106))) 

(MAKEPROP '|LiouvillianFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              (|Symbol|) (0 . |new|) (4 . |coerce|) '|dummy| (|BasicOperator|)
              (|CommonOperators|) (9 . |operator|) '|opint| '|opiint| '|opdint|
              '|opei| '|opli| '|opsi| '|opci| '|opshi| '|opchi| '|opli2|
              '|operf| '|operfi| '|opfis| '|opfic| (14 . |elt|) |LF;Si;2F;1|
              |LF;Ci;2F;2| |LF;Shi;2F;3| |LF;Chi;2F;4| |LF;Ei;2F;5|
              |LF;erf;2F;6| |LF;erfi;2F;7| |LF;li;2F;8| |LF;dilog;2F;9|
              |LF;fresnelS;2F;10| |LF;fresnelC;2F;11| (|Boolean|) (20 . |has?|)
              |LF;belong?;BoB;12| (26 . |zero?|) (31 . |0|) (35 . |kernel|)
              (41 . |1|) (45 . |1|) (49 . =) (|List| 7) (55 . |second|)
              (|Kernel| %) (60 . |retract|) (65 . |third|) (70 . |eval|)
              (|Kernel| 7) (77 . |kernel|) (82 . |coerce|) (|List| %)
              (87 . |elt|) |LF;integral;FSF;23| (93 . |kernel|) (|OutputForm|)
              (99 . |coerce|) (104 . |coerce|) (109 . |hconcat|) (115 . *)
              (121 . |int|) (128 . |argument|) (133 . |operator|) (138 . =)
              (144 . =) (|Integer|) (150 . |elt|) (|List| 53) (156 . |subst|)
              (163 . |differentiate|) (169 . *) (175 . +)
              (|NonNegativeInteger|) (181 . |rest|) (|Mapping| 42 7)
              (187 . |every?|) (193 . |first|) (199 . |retract|) (|List| 9)
              (204 . |position|) (210 . |0|) (|SegmentBinding| 7)
              (214 . |variable|) (|Segment| 7) (219 . |segment|) (224 . |low|)
              (229 . |high|) |LF;integral;FSbF;31| (234 . |is?|) (240 . |is?|)
              |LF;operator;2Bo;34| (|Mapping| 7 7)
              (|BasicOperatorFunctions1| 7) (246 . |evaluate|) (|Mapping| 7 51)
              (252 . |evaluate|) (258 . |sin|) (263 . /) (269 . |derivative|)
              (275 . |cos|) (280 . |sinh|) (285 . |cosh|) (290 . |exp|)
              (295 . |log|) (300 . |inv|) (|PositiveInteger|) (305 . ^)
              (311 . -) (316 . *) (322 . |pi|) (326 . |sqrt|) (331 . -)
              (337 . |coerce|) (|None|) (342 . |setProperty|) (|InputForm|)
              (349 . |convert|) (354 . |convert|) (359 . |convert|))
           '#(|operator| 364 |li| 369 |integral| 374 |fresnelS| 386 |fresnelC|
              391 |erfi| 396 |erf| 401 |dilog| 406 |belong?| 411 |Si| 416 |Shi|
              421 |Ei| 426 |Ci| 431 |Chi| 436)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|belong?| ((|Boolean|) (|BasicOperator|))) T)
                              '((|operator|
                                 ((|BasicOperator|) (|BasicOperator|)))
                                T)
                              '((|Ei| (|#2| |#2|)) T) '((|Si| (|#2| |#2|)) T)
                              '((|Ci| (|#2| |#2|)) T) '((|Shi| (|#2| |#2|)) T)
                              '((|Chi| (|#2| |#2|)) T) '((|li| (|#2| |#2|)) T)
                              '((|erf| (|#2| |#2|)) T)
                              '((|erfi| (|#2| |#2|)) T)
                              '((|dilog| (|#2| |#2|)) T)
                              '((|fresnelS| (|#2| |#2|)) T)
                              '((|fresnelC| (|#2| |#2|)) T)
                              '((|integral| (|#2| |#2| (|Symbol|))) T)
                              '((|integral|
                                 (|#2| |#2| (|SegmentBinding| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 127
                                            '(0 9 0 10 1 7 0 9 11 1 14 13 9 15
                                              2 7 0 13 0 30 2 13 42 0 9 43 1 7
                                              42 0 45 0 7 0 46 2 7 0 13 0 47 0
                                              6 0 48 0 7 0 49 2 7 42 0 0 50 1
                                              51 7 0 52 1 7 53 0 54 1 51 7 0 55
                                              3 7 0 0 53 0 56 1 57 0 9 58 1 7 0
                                              53 59 2 7 0 13 60 61 2 7 0 13 60
                                              63 1 7 64 0 65 1 9 64 0 66 2 64 0
                                              0 0 67 2 64 0 0 0 68 3 64 0 0 0 0
                                              69 1 57 51 0 70 1 57 13 0 71 2 13
                                              42 0 0 72 2 51 42 0 0 73 2 51 7 0
                                              74 75 3 7 0 0 76 60 77 2 7 0 0 9
                                              78 2 7 0 0 0 79 2 7 0 0 0 80 2 51
                                              0 0 81 82 2 51 42 83 0 84 2 51 0
                                              0 81 85 1 7 9 0 86 2 87 74 9 0 88
                                              0 6 0 89 1 90 9 0 91 1 90 92 0 93
                                              1 92 7 0 94 1 92 7 0 95 2 7 42 0
                                              9 97 2 13 42 0 9 98 2 101 13 13
                                              100 102 2 101 13 13 103 104 1 7 0
                                              0 105 2 7 0 0 0 106 2 101 13 13
                                              100 107 1 7 0 0 108 1 7 0 0 109 1
                                              7 0 0 110 1 7 0 0 111 1 7 0 0 112
                                              1 7 0 0 113 2 7 0 0 114 115 1 7 0
                                              0 116 2 7 0 114 0 117 0 7 0 118 1
                                              7 0 0 119 2 7 0 0 0 120 1 7 0 74
                                              121 3 13 0 0 9 122 123 1 9 124 0
                                              125 1 124 0 60 126 1 7 124 0 127
                                              1 0 13 13 99 1 0 7 7 38 2 0 7 7 9
                                              62 2 0 7 7 90 96 1 0 7 7 40 1 0 7
                                              7 41 1 0 7 7 37 1 0 7 7 36 1 0 7
                                              7 39 1 0 42 13 44 1 0 7 7 31 1 0
                                              7 7 33 1 0 7 7 35 1 0 7 7 32 1 0
                                              7 7 34)))))
           '|lookupComplete|)) 
