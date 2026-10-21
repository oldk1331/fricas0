
(SDEFUN |FMT1DINT;coerce;%Of;1| ((|x| (%)) (% (|OutputForm|)))
        (|coerceRe2E| |x|
                      (ELT
                       (|Record| (|:| |prolog| (|OutputBox|))
                                 (|:| |fmt| (|OutputBox|))
                                 (|:| |epilog| (|OutputBox|)))
                       0))) 

(SDEFUN |FMT1DINT;defaultPrologue;SOb;2|
        ((|label| (|String|)) (% (|OutputBox|))) (SPADCALL (QREFELT % 10))) 

(SDEFUN |FMT1DINT;defaultEpilogue;SOb;3|
        ((|label| (|String|)) (% (|OutputBox|))) (SPADCALL (QREFELT % 10))) 

(SDEFUN |FMT1DINT;fricasEscapeString| ((|s| (|String|)) (% (|String|)))
        (SPROG
         ((|cc| (|CharacterClass|)) (|p| (|Integer|)) (|n| (|Integer|))
          (|esc| (|String|)) (|str| (|String|)))
         (SEQ (LETT |cc| (SPADCALL "\"_" (QREFELT % 15)))
              (LETT |p| (SPADCALL |cc| |s| 1 (QREFELT % 17)))
              (EXIT
               (COND ((ZEROP |p|) |s|)
                     ('T
                      (SEQ (LETT |str| "") (LETT |n| 1)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (>
                                    (LETT |p|
                                          (SPADCALL |cc| |s| |n|
                                                    (QREFELT % 17)))
                                    0))
                                  (GO G191)))
                                (SEQ
                                 (LETT |str|
                                       (STRCONC |str|
                                                (SPADCALL |s|
                                                          (SPADCALL |n|
                                                                    (- |p| 1)
                                                                    (QREFELT %
                                                                             19))
                                                          (QREFELT % 20))))
                                 (LETT |n| (+ |p| 1))
                                 (LETT |esc|
                                       (SPADCALL "_"
                                                 (SPADCALL |s| |p|
                                                           (QREFELT % 22))
                                                 (QREFELT % 23)))
                                 (EXIT (LETT |str| (STRCONC |str| |esc|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (STRCONC |str|
                                     (SPADCALL |s|
                                               (SPADCALL |n| (QCSIZE |s|)
                                                         (QREFELT % 19))
                                               (QREFELT % 20))))))))))) 

(SDEFUN |FMT1DINT;formatFloat;SOb;5| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL (SPADCALL (|STR_to_CHAR| "_") |s| (QREFELT % 25))
                  (QREFELT % 26))) 

(SDEFUN |FMT1DINT;formatString;SOb;6| ((|s| (|String|)) (% (|OutputBox|)))
        (SEQ
         (COND
          ((> (QCSIZE |s|) 1)
           (COND
            ((|eql_SI| (SPADCALL |s| 1 (QREFELT % 22)) (|STR_to_CHAR| "\""))
             (COND
              ((|eql_SI| (SPADCALL |s| (QCSIZE |s|) (QREFELT % 22))
                         (|STR_to_CHAR| "\""))
               (EXIT
                (SPADCALL "\"" "\""
                          (SPADCALL
                           (|FMT1DINT;fricasEscapeString|
                            (SPADCALL |s|
                                      (SPADCALL 2 (- (QCSIZE |s|) 1)
                                                (QREFELT % 19))
                                      (QREFELT % 20))
                            %)
                           (QREFELT % 26))
                          (QREFELT % 28)))))))))
         (EXIT
          (SPADCALL (|FMT1DINT;fricasEscapeString| |s| %) (QREFELT % 26))))) 

(SDEFUN |FMT1DINT;formatSymbol;SOb;7| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL |s| (QREFELT % 26))) 

(SDEFUN |FMT1DINT;formatFunctionSymbol;SOb;8|
        ((|s| (|String|)) (% (|OutputBox|))) (SPADCALL |s| (QREFELT % 26))) 

(SDEFUN |FMT1DINT;parenthesize;2S2Ob;9|
        ((|left| #1=(|String|)) (|right| #1#) (|b| (|OutputBox|))
         (% (|OutputBox|)))
        (SPADCALL
         (LIST (SPADCALL |left| (QREFELT % 26)) |b|
               (SPADCALL |right| (QREFELT % 26)))
         (QREFELT % 33))) 

(SDEFUN |FMT1DINT;substitute|
        ((|x| (|OutputForm|)) (|y| (|OutputForm|)) (|z| (|OutputForm|))
         (% (|OutputForm|)))
        (SPROG
         ((#1=#:G56 NIL) (|a| NIL) (#2=#:G57 NIL)
          (|args| (|List| (|OutputForm|))))
         (SEQ
          (COND ((SPADCALL |x| |z| (QREFELT % 35)) |y|)
                ((SPADCALL |z| (QREFELT % 37)) |z|)
                ('T
                 (SEQ
                  (LETT |args|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |a| NIL)
                              (LETT #2# (SPADCALL |z| (QREFELT % 39))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |a| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS
                                       (|FMT1DINT;substitute| |x| |y| |a| %)
                                       #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (EXIT
                   (SPADCALL
                    (|FMT1DINT;substitute| |x| |y|
                     (SPADCALL |z| (QREFELT % 40)) %)
                    |args| (QREFELT % 41))))))))) 

(SDEFUN |FMT1DINT;getDExpression| ((|e| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG
         ((|op| #1=(|OutputForm|)) (|args| #2=(|List| (|OutputForm|)))
          (|op2| #1#) (|args2| #2#))
         (SEQ
          (COND ((SPADCALL |e| (QREFELT % 37)) (SPADCALL (QREFELT % 42)))
                (#3='T
                 (SEQ (LETT |op| (SPADCALL |e| (QREFELT % 40)))
                      (COND
                       ((NULL (SPADCALL |op| '* (QREFELT % 44)))
                        (EXIT (SPADCALL (QREFELT % 42)))))
                      (LETT |args| (SPADCALL |e| (QREFELT % 39)))
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |args|) 2 (QREFELT % 46))
                         (SPADCALL (QREFELT % 42)))
                        (#3#
                         (SEQ
                          (LETT |op2|
                                (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                                          (QREFELT % 40)))
                          (COND
                           ((NULL (SPADCALL |op2| 'CONCAT (QREFELT % 44)))
                            (EXIT (SPADCALL (QREFELT % 42)))))
                          (LETT |args2|
                                (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                                          (QREFELT % 39)))
                          (COND
                           ((OR (SPADCALL (LENGTH |args2|) 2 (QREFELT % 46))
                                (NULL
                                 (SPADCALL (|SPADfirst| |args2|) '|d|
                                           (QREFELT % 44))))
                            (EXIT (SPADCALL (QREFELT % 42)))))
                          (EXIT (SPADCALL |args2| 2 (QREFELT % 47))))))))))))) 

(SDEFUN |FMT1DINT;integral;IM;12|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1DINT;integral;IM;12!0| %))) 

(SDEFUN |FMT1DINT;integral;IM;12!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG
         ((|bl| NIL) (|bu| NIL) (|lb| NIL) (#1=#:G74 NIL) (|x| NIL) (|bx| NIL)
          (|a| NIL) (|ba| NIL) (|b2| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |bl|
                  (SPADCALL
                   (SPADCALL |args| (|spadConstant| % 48) (QREFELT % 47))
                   (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
            (LETT |bu|
                  (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                            (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
            (EXIT
             (COND
              ((SPADCALL |bu| (QREFELT % 51))
               (SEQ
                (LETT |lb|
                      (LIST
                       (SPADCALL (SPADCALL |args| 3 (QREFELT % 47))
                                 (SPADCALL (QREFELT % 49)) (QREFELT % 50))))
                (COND
                 ((NULL (SPADCALL |bl| (QREFELT % 51)))
                  (LETT |lb| (SPADCALL |lb| |bl| (QREFELT % 53)))))
                (EXIT
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL "int" (QREFELT % 26)) |lb|
                                  (QREFELT % 54)))
                  (GO #2=#:G73)))))
              ('T
               (SEQ (LETT |b2| |bu|)
                    (LETT |x|
                          (|FMT1DINT;getDExpression|
                           (SPADCALL |args| 3 (QREFELT % 47)) %))
                    (LETT |ba|
                          (SPADCALL (SPADCALL |args| 3 (QREFELT % 47))
                                    (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                    (COND
                     ((SPADCALL |x| (SPADCALL (QREFELT % 42)) (QREFELT % 55))
                      (SEQ
                       (LETT |bx|
                             (SPADCALL |x| (SPADCALL (QREFELT % 49))
                                       (QREFELT % 50)))
                       (LETT |a|
                             (SPADCALL
                              (SPADCALL (SPADCALL |args| 3 (QREFELT % 47))
                                        (QREFELT % 39))
                              (QREFELT % 56)))
                       (EXIT
                        (COND
                         ((SPADCALL |bl| (QREFELT % 51))
                          (LETT |ba|
                                (SPADCALL
                                 (|FMT1DINT;substitute| |x|
                                  (SPADCALL |args| 2 (QREFELT % 47)) |a| %)
                                 (SPADCALL (QREFELT % 49)) (QREFELT % 50))))
                         ('T
                          (SEQ
                           (LETT |ba|
                                 (SPADCALL |a| (SPADCALL (QREFELT % 49))
                                           (QREFELT % 50)))
                           (EXIT
                            (LETT |b2|
                                  (SPADCALL
                                   (LIST |bx| (SPADCALL "=" (QREFELT % 26))
                                         |bl| (SPADCALL ".." (QREFELT % 26))
                                         |bu|)
                                   (QREFELT % 33)))))))))))
                    (EXIT
                     (SPADCALL (SPADCALL "integral" (QREFELT % 26))
                               (LIST |ba| |b2|) (QREFELT % 54)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |FMT1DINT;operatorWithLimits|
        ((|s| (|String|)) (|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ (CONS #'|FMT1DINT;operatorWithLimits!0| (VECTOR |s| %))))) 

(SDEFUN |FMT1DINT;operatorWithLimits!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |s|)
          (LETT % (QREFELT $$ 1))
          (LETT |s| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bl| NIL) (|bu| NIL) (|ba| NIL) (|b2| NIL))
                   (SEQ
                    (LETT |bl|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 48)
                                     (QREFELT % 47))
                           (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                    (LETT |ba|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                                    (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |args| (QREFELT % 59)) 2
                                 (QREFELT % 60))
                       (COND
                        ((SPADCALL |bl| (QREFELT % 51))
                         (SPADCALL (SPADCALL |s| (QREFELT % 26)) (LIST |ba|)
                                   (QREFELT % 54)))
                        ('T
                         (SPADCALL (SPADCALL |s| (QREFELT % 26))
                                   (LIST |ba| |bl|) (QREFELT % 54)))))
                      ('T
                       (SEQ (LETT |bu| |ba|)
                            (LETT |ba|
                                  (SPADCALL (SPADCALL |args| 3 (QREFELT % 47))
                                            (SPADCALL (QREFELT % 49))
                                            (QREFELT % 50)))
                            (LETT |b2|
                                  (SPADCALL
                                   (LIST |bl| (SPADCALL " .. " (QREFELT % 26))
                                         |bu|)
                                   (QREFELT % 33)))
                            (EXIT
                             (SPADCALL (SPADCALL |s| (QREFELT % 26))
                                       (LIST |ba| |b2|)
                                       (QREFELT % 54))))))))))))) 

(SDEFUN |FMT1DINT;sum;IM;14|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMT1DINT;operatorWithLimits| "sum" |p| %)) 

(SDEFUN |FMT1DINT;product;IM;15|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMT1DINT;operatorWithLimits| "product" |p| %)) 

(SDEFUN |FMT1DINT;theMap;ILOb;16|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG
         ((|a| (|OutputForm|)) (|b| (|OutputBox|)) (|s| (|String|))
          (|p1| (|Integer|)) (|p2| (|Integer|)))
         (SEQ (LETT |a| (|SPADfirst| |args|))
              (LETT |s|
                    (SEQ
                     (COND
                      ((SPADCALL |a| (QREFELT % 37))
                       (COND
                        ((NULL (SPADCALL |a| (QREFELT % 63)))
                         (COND
                          ((NULL (SPADCALL |a| (QREFELT % 64)))
                           (EXIT ";?;")))))))
                     (LETT |b|
                           (SPADCALL |a| (SPADCALL (QREFELT % 49))
                                     (QREFELT % 50)))
                     (EXIT (|SPADfirst| (SPADCALL |b| (QREFELT % 66))))))
              (LETT |p1| (SPADCALL (|STR_to_CHAR| ";") |s| (QREFELT % 67)))
              (LETT |p2|
                    (SPADCALL (|STR_to_CHAR| ";") |s| (+ |p1| 1)
                              (QREFELT % 68)))
              (EXIT
               (SPADCALL "theMap(" ")"
                         (SPADCALL
                          (SPADCALL |s|
                                    (SPADCALL (+ |p1| 1) (- |p2| 1)
                                              (QREFELT % 19))
                                    (QREFELT % 20))
                          (QREFELT % 26))
                         (QREFELT % 28)))))) 

(SDEFUN |FMT1DINT;overbar;I2M;17|
        ((|p| #1=(|Integer|))
         (|hh| (|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMT1DINT;overbar;I2M;17!0| (VECTOR |hh| |p| %)))) 

(SDEFUN |FMT1DINT;overbar;I2M;17!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p| |hh|)
          (LETT % (QREFELT $$ 2))
          (LETT |p| (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL "overbar" (QREFELT % 26))
                      (LIST (SPADCALL |p| |args| |hh|)) (QREFELT % 54)))))) 

(SDEFUN |FMT1DINT;box;2M;18|
        ((|hh| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMT1DINT;box;2M;18!0| (VECTOR |hh| %)))) 

(SDEFUN |FMT1DINT;box;2M;18!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |hh|)
          (LETT % (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL "box" (QREFELT % 26))
                      (LIST
                       (SPADCALL |prec|
                                 (LIST
                                  (SPADCALL |args| (|spadConstant| % 48)
                                            (QREFELT % 47)))
                                 |hh|))
                      (QREFELT % 54)))))) 

(SDEFUN |FMT1DINT;nthRoot;I3M;19|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMT1DINT;nthRoot;I3M;19!0| (VECTOR |h2| |h1| % |p|))))) 

(SDEFUN |FMT1DINT;nthRoot;I3M;19!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |h1| |h2|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bx| NIL))
                   (SEQ
                    (LETT |bx|
                          (SPADCALL |p|
                                    (LIST
                                     (SPADCALL |args| (|spadConstant| % 48)
                                               (QREFELT % 47)))
                                    |h1|))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |args| (QREFELT % 59))
                                 (QREFELT % 72))
                       (SPADCALL (SPADCALL "sqrt" (QREFELT % 26)) (LIST |bx|)
                                 (QREFELT % 54)))
                      ('T
                       (SPADCALL (SPADCALL "nthRoot" (QREFELT % 26))
                                 (LIST |bx|
                                       (SPADCALL |p|
                                                 (LIST
                                                  (SPADCALL |args| 2
                                                            (QREFELT % 47)))
                                                 |h2|))
                                 (QREFELT % 54))))))))))) 

(SDEFUN |FMT1DINT;emptyArgument?| ((|a| (|OutputForm|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |a| (QREFELT % 37))
          (COND
           ((SPADCALL |a| (QREFELT % 63))
            (COND ((EQUAL (SPADCALL |a| (QREFELT % 74)) " ") 'T)
                  (#1='T (EQUAL (SPADCALL |a| (QREFELT % 74)) ""))))
           (#1# NIL)))
         (#1#
          (SPADCALL (SPADCALL |a| (QREFELT % 40)) 'NOTHING (QREFELT % 44))))) 

(SDEFUN |FMT1DINT;scripts;IM;21|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1DINT;scripts;IM;21!0| %))) 

(SDEFUN |FMT1DINT;scripts;IM;21!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG ((|b1| NIL) (|a| NIL) (#1=#:G111 NIL) (|bx| NIL))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| (QREFELT % 56))
                                (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (LETT |args| (SPADCALL |args| (QREFELT % 75)))
                (EXIT
                 (COND ((SPADCALL |args| (QREFELT % 76)) |b1|)
                       ('T
                        (SEQ
                         (LETT |bx|
                               (SPADCALL (SPADCALL |args| (QREFELT % 56))
                                         (SPADCALL (QREFELT % 49))
                                         (QREFELT % 50)))
                         (SEQ (LETT |a| NIL)
                              (LETT #1# (SPADCALL |args| (QREFELT % 75))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((|FMT1DINT;emptyArgument?| |a| %)
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", empty()$OutputForm"
                                                         (QREFELT % 26)))
                                         (QREFELT % 33))))
                                 ('T
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", " (QREFELT % 26))
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (QREFELT % 49))
                                                         (QREFELT % 50)))
                                         (QREFELT % 33)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SPADCALL (SPADCALL "scripts" (QREFELT % 26))
                                    (LIST |b1|
                                          (SPADCALL "[" "]" |bx|
                                                    (QREFELT % 28)))
                                    (QREFELT % 54)))))))))) 

(SDEFUN |FMT1DINT;subscript;IM;22|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1DINT;subscript;IM;22!0| %))) 

(SDEFUN |FMT1DINT;subscript;IM;22!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG ((|b1| NIL) (|b2| NIL))
               (SEQ
                (LETT |b1|
                      (SPADCALL
                       (SPADCALL |args| (|spadConstant| % 48) (QREFELT % 47))
                       (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                                (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL |args| (|spadConstant| % 79) (QREFELT % 47))
                    (QREFELT % 64))
                   (SPADCALL (LIST |b1| (SPADCALL "[" "]" |b2| (QREFELT % 28)))
                             (QREFELT % 33)))
                  ('T
                   (SPADCALL (SPADCALL "subscript" (QREFELT % 26))
                             (LIST |b1| (SPADCALL "[" "]" |b2| (QREFELT % 28)))
                             (QREFELT % 54)))))))) 

(SDEFUN |FMT1DINT;altsupersub;IM;23|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1DINT;altsupersub;IM;23!0| %))) 

(SDEFUN |FMT1DINT;altsupersub;IM;23!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG ((|b1| NIL) (|a| NIL) (#1=#:G122 NIL) (|bx| NIL))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| (QREFELT % 56))
                                (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (LETT |args| (SPADCALL |args| (QREFELT % 75)))
                (EXIT
                 (COND ((SPADCALL |args| (QREFELT % 76)) |b1|)
                       ('T
                        (SEQ
                         (LETT |bx|
                               (SPADCALL (SPADCALL |args| (QREFELT % 56))
                                         (SPADCALL (QREFELT % 49))
                                         (QREFELT % 50)))
                         (SEQ (LETT |a| NIL)
                              (LETT #1# (SPADCALL |args| (QREFELT % 75))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((|FMT1DINT;emptyArgument?| |a| %)
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", empty()$OutputForm"
                                                         (QREFELT % 26)))
                                         (QREFELT % 33))))
                                 ('T
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", " (QREFELT % 26))
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (QREFELT % 49))
                                                         (QREFELT % 50)))
                                         (QREFELT % 33)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SPADCALL (SPADCALL "supersub" (QREFELT % 26))
                                    (LIST |b1|
                                          (SPADCALL "[" "]" |bx|
                                                    (QREFELT % 28)))
                                    (QREFELT % 54)))))))))) 

(SDEFUN |FMT1DINT;prime;IM;24|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (SEQ (CONS #'|FMT1DINT;prime;IM;24!0| (VECTOR |p| %))))) 

(SDEFUN |FMT1DINT;prime;IM;24!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b1| NIL) (|n| NIL) (|b2| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 48)
                                     (QREFELT % 47))
                           (SPADCALL |p| (|spadConstant| % 48) (QREFELT % 83))
                           (QREFELT % 50)))
                    (LETT |n|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                                    (QREFELT % 84)))
                    (EXIT
                     (COND
                      ((SPADCALL |n| (|spadConstant| % 85) (QREFELT % 87))
                       (|error| "error in PRIME expression"))
                      ('T
                       (SEQ
                        (LETT |b2|
                              (SPADCALL (SPADCALL |n| (QREFELT % 88))
                                        (QREFELT % 26)))
                        (EXIT
                         (SPADCALL (SPADCALL "prime" (QREFELT % 26))
                                   (LIST |b1| |b2|) (QREFELT % 54))))))))))))) 

(SDEFUN |FMT1DINT;power;I3M;25|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMT1DINT;power;I3M;25!0| (VECTOR |h2| |h1| % |p|))))) 

(SDEFUN |FMT1DINT;power;I3M;25!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |h1| |h2|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b1| NIL) (|b2| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 48) (QREFELT % 83))
                           (LIST
                            (SPADCALL |args| (|spadConstant| % 48)
                                      (QREFELT % 47)))
                           |h1|))
                    (LETT |b2|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 48) (QREFELT % 83))
                           (LIST (SPADCALL |args| 2 (QREFELT % 47))) |h2|))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 87))
                               (SPADCALL
                                (LIST |b1| (SPADCALL "^" (QREFELT % 26)) |b2|)
                                (QREFELT % 33))
                               (QREFELT % 90))))))))) 

(SDEFUN |FMT1DINT;fraction;I3M;26|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMT1DINT;fraction;I3M;26!0|
                      (VECTOR |h2| |h1| % |p|))))) 

(SDEFUN |FMT1DINT;fraction;I3M;26!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |h1| |h2|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b1| NIL) (|b2| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 48) (QREFELT % 83))
                           (LIST
                            (SPADCALL |args| (|spadConstant| % 48)
                                      (QREFELT % 47)))
                           |h1|))
                    (LETT |b2|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 48) (QREFELT % 83))
                           (LIST (SPADCALL |args| 2 (QREFELT % 47))) |h2|))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 87))
                               (SPADCALL
                                (LIST |b1| (SPADCALL "/" (QREFELT % 26)) |b2|)
                                (QREFELT % 33))
                               (QREFELT % 90))))))))) 

(SDEFUN |FMT1DINT;slash;I3M;27|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL |p| |h1| |h2| (QREFELT % 92))) 

(SDEFUN |FMT1DINT;binomial;ILOb;28|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG ((|b1| #1=(|OutputBox|)) (|b2| #1#))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT % 47))
                                (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                                (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (EXIT
                 (SPADCALL (SPADCALL "binomial" (QREFELT % 26))
                           (LIST |b1| |b2|) (QREFELT % 54)))))) 

(SDEFUN |FMT1DINT;zag;ILOb;29|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG ((|b1| #1=(|OutputBox|)) (|b2| #1#))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT % 47))
                                (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 47))
                                (SPADCALL (QREFELT % 49)) (QREFELT % 50)))
                (EXIT
                 (SPADCALL (SPADCALL "zag" (QREFELT % 26)) (LIST |b1| |b2|)
                           (QREFELT % 54)))))) 

(SDEFUN |FMT1DINT;vconcat;2M;30|
        ((|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL "vconcat[" "]"
                  (SPADCALL ", " (SPADCALL (QREFELT % 96))
                            (SPADCALL (SPADCALL (QREFELT % 49)) (QREFELT % 97))
                            (QREFELT % 98))
                  (QREFELT % 99))) 

(SDEFUN |FMT1DINT;pile;2M;31|
        ((|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL "pile[" "]"
                  (SPADCALL ", " (SPADCALL (QREFELT % 96))
                            (SPADCALL (SPADCALL (QREFELT % 49)) (QREFELT % 97))
                            (QREFELT % 98))
                  (QREFELT % 99))) 

(SDEFUN |FMT1DINT;matrix;2SM;32|
        ((|left| #1=(|String|)) (|right| #1#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMT1DINT;matrix;2SM;32!0|
                      (VECTOR |right| |left| (QREFELT % 6) %))))) 

(SDEFUN |FMT1DINT;matrix;2SM;32!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |do_input| |left| |right|)
          (LETT % (QREFELT $$ 3))
          (LETT |do_input| (QREFELT $$ 2))
          (LETT |left| (QREFELT $$ 1))
          (LETT |right| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|entries| NIL) (|lp| NIL))
                   (SEQ
                    (LETT |entries|
                          (SPADCALL |prec| (SPADCALL |args| (QREFELT % 75))
                                    (SPADCALL ", " (SPADCALL (QREFELT % 96))
                                              (SPADCALL
                                               (SPADCALL (QREFELT % 49))
                                               (QREFELT % 97))
                                              (QREFELT % 98))))
                    (LETT |lp|
                          (COND
                           (|do_input|
                            (SPADCALL "matrix" |left| (QREFELT % 102)))
                           ('T |left|)))
                    (EXIT
                     (SPADCALL |lp| |right| |entries| (QREFELT % 28))))))))) 

(SDEFUN |FMT1DINT;setOperatorHandlers!|
        ((|oh|
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
         (%
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))))
        (SPROG ((#1=#:G517 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SPADCALL |oh| 0 "NOTHING" (SPADCALL (QREFELT % 104))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%pi" (SPADCALL "%pi" (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%e" (SPADCALL "%e" (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%i" (SPADCALL "%i" (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%Infinity"
                            (SPADCALL "%Infinity" (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "infinity"
                            (SPADCALL "%Infinity" (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "..." (SPADCALL "..." (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "cos"
                            (SPADCALL "cos" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "cot"
                            (SPADCALL "cot" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "csc"
                            (SPADCALL "csc" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "log"
                            (SPADCALL "log" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sec"
                            (SPADCALL "sec" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sin"
                            (SPADCALL "sin" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "tan"
                            (SPADCALL "tan" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "cosh"
                            (SPADCALL "cosh" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "coth"
                            (SPADCALL "coth" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "csch"
                            (SPADCALL "csch" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sech"
                            (SPADCALL "sech" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sinh"
                            (SPADCALL "sinh" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "tanh"
                            (SPADCALL "tanh" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "acos"
                            (SPADCALL "acos" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "asin"
                            (SPADCALL "asin" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "atan"
                            (SPADCALL "atan" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "erf"
                            (SPADCALL "erf" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "Gamma"
                            (SPADCALL "Gamma" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 108))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "-"
                            (SPADCALL "-" 710 (SPADCALL 715 (QREFELT % 97))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "not"
                            (SPADCALL "not " 710 (SPADCALL 715 (QREFELT % 97))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "QUOTE"
                            (SPADCALL "quote" (SPADCALL (QREFELT % 96))
                                      (SPADCALL #2="(" #3=")"
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 49))
                                                 (QREFELT % 97))
                                                (QREFELT % 99))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "OVERBAR"
                            (SPADCALL (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 70))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "BOX"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 49))
                                       (QREFELT % 97))
                             (QREFELT % 71))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "Aleph"
                            (SPADCALL "Aleph" (SPADCALL (QREFELT % 96))
                                      (SPADCALL #2# #3#
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 49))
                                                 (QREFELT % 97))
                                                (QREFELT % 99))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "BRACE"
                            (SPADCALL "set" (SPADCALL (QREFELT % 96))
                                      (SPADCALL "[" "]"
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 49))
                                                 (QREFELT % 97))
                                                (QREFELT % 99))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "BRACKET"
                            (SPADCALL "[" "]"
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 99))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "PAREN"
                            (SPADCALL "(" ")"
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 99))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "ROOT"
                            (SPADCALL "sqrt" (SPADCALL (QREFELT % 96))
                                      (SPADCALL #2# #3#
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 49))
                                                 (QREFELT % 97))
                                                (QREFELT % 99))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "SEGMENT"
                            (SPADCALL "" " .. " (SPADCALL 990 (QREFELT % 97))
                                      (QREFELT % 99))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "STRING"
                            (SPADCALL "\"" "\""
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 99))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "rem"
                            (SPADCALL " rem " 810 (SPADCALL 811 (QREFELT % 97))
                                      (SPADCALL 811 (QREFELT % 97))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "quo"
                            (SPADCALL " quo " 810 (SPADCALL 811 (QREFELT % 97))
                                      (SPADCALL 811 (QREFELT % 97))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "exquo"
                            (SPADCALL " exquo " 810
                                      (SPADCALL 811 (QREFELT % 97))
                                      (SPADCALL 811 (QREFELT % 97))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "^"
                            (SPADCALL 950 (SPADCALL 960 (QREFELT % 97))
                                      (SPADCALL 960 (QREFELT % 97))
                                      (QREFELT % 91))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "/"
                            (SPADCALL 910 (SPADCALL 910 (QREFELT % 97))
                                      (SPADCALL 910 (QREFELT % 97))
                                      (QREFELT % 92))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "OVER"
                            (SPADCALL 910 (SPADCALL 910 (QREFELT % 97))
                                      (SPADCALL 910 (QREFELT % 97))
                                      (QREFELT % 92))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SLASH"
                            (SPADCALL 910 (SPADCALL 910 (QREFELT % 97))
                                      (SPADCALL 910 (QREFELT % 97))
                                      (QREFELT % 93))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "ZAG" (ELT % 95) (QREFELT % 106))
                  (SPADCALL |oh| 2 "BINOMIAL" (ELT % 94) (QREFELT % 106))
                  (SPADCALL |oh| 2 "PRIME"
                            (SPADCALL (SPADCALL (QREFELT % 96)) (QREFELT % 89))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "ROOT"
                            (SPADCALL 970
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 73))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SUB" (SPADCALL 950 (QREFELT % 81))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SEGMENT"
                            (SPADCALL " .. " 100 (SPADCALL 100 (QREFELT % 97))
                                      (SPADCALL 100 (QREFELT % 97))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "TENSOR"
                            (SPADCALL "tensor" (SPADCALL (QREFELT % 96))
                                      (SPADCALL #4="(" #5=")"
                                                (SPADCALL #6=", "
                                                          (SPADCALL
                                                           (QREFELT % 96))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 49))
                                                           (QREFELT % 97))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 49))
                                                           (QREFELT % 97))
                                                          (QREFELT % 110))
                                                (QREFELT % 99))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "EQUATNUM"
                            (SPADCALL "\\EQUATNUM" (SPADCALL (QREFELT % 96))
                                      (SPADCALL #4# #5#
                                                (SPADCALL #6#
                                                          (SPADCALL
                                                           (QREFELT % 96))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 49))
                                                           (QREFELT % 97))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 49))
                                                           (QREFELT % 97))
                                                          (QREFELT % 110))
                                                (QREFELT % 99))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "OVERLABEL"
                            (SPADCALL "\\OVERLABEL" (SPADCALL (QREFELT % 96))
                                      (SPADCALL #4# #5#
                                                (SPADCALL #6#
                                                          (SPADCALL
                                                           (QREFELT % 96))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 49))
                                                           (QREFELT % 97))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 49))
                                                           (QREFELT % 97))
                                                          (QREFELT % 110))
                                                (QREFELT % 99))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "=="
                            (SPADCALL "==" 400 (SPADCALL 401 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "="
                            (SPADCALL "=" 400 (SPADCALL 400 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "~="
                            (SPADCALL "~= " 400 (SPADCALL 400 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "<"
                            (SPADCALL "<" 400 (SPADCALL 400 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 ">"
                            (SPADCALL ">" 400 (SPADCALL 400 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "<="
                            (SPADCALL "<=" 400 (SPADCALL 400 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 ">="
                            (SPADCALL ">=" 400 (SPADCALL 400 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "and"
                            (SPADCALL " and " 300 (SPADCALL 300 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "or"
                            (SPADCALL " or " 200 (SPADCALL 200 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "LET"
                            (SPADCALL ":=" 125 (SPADCALL 125 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "->"
                            (SPADCALL " -> " 990 (SPADCALL 990 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "~>"
                            (SPADCALL " ~> " 100 (SPADCALL 110 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "+->"
                            (SPADCALL " +-> " 100 (SPADCALL 110 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "|"
                            (SPADCALL " | " 100 (SPADCALL 100 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SIGMA" (SPADCALL 750 (QREFELT % 61))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "PI" (SPADCALL 750 (QREFELT % 62))
                            (QREFELT % 106))
                  (SPADCALL |oh| 3 "SIGMA2" (SPADCALL 750 (QREFELT % 61))
                            (QREFELT % 106))
                  (SPADCALL |oh| 3 "PI2" (SPADCALL 750 (QREFELT % 62))
                            (QREFELT % 106))
                  (SPADCALL |oh| 3 "INTSIGN" (SPADCALL 700 (QREFELT % 58))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "+"
                            (SPADCALL "+" "-" 700 (SPADCALL 700 (QREFELT % 97))
                                      (QREFELT % 111))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "-"
                            (SPADCALL "+" "-" 700 (SPADCALL 700 (QREFELT % 97))
                                      (QREFELT % 111))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "*"
                            (SPADCALL "*" 800 (SPADCALL 800 (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "AGGLST"
                            (SPADCALL ", " (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "AGGSET"
                            (SPADCALL "; " (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "CONCAT"
                            (SPADCALL "" (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "CONCATB"
                            (SPADCALL " " (SPADCALL (QREFELT % 96))
                                      (SPADCALL (SPADCALL (QREFELT % 49))
                                                (QREFELT % 97))
                                      (QREFELT % 98))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "ALTSUPERSUB" (SPADCALL 900 (QREFELT % 82))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "SUPERSUB" (SPADCALL 900 (QREFELT % 77))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "SC"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 49))
                                       (QREFELT % 97))
                             (QREFELT % 101))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "VCONCAT"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 49))
                                       (QREFELT % 97))
                             (QREFELT % 100))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "ROW"
                            (SPADCALL "[" "]"
                                      (SPADCALL ", " (SPADCALL (QREFELT % 96))
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 49))
                                                 (QREFELT % 97))
                                                (QREFELT % 98))
                                      (QREFELT % 99))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "MATRIX" (SPADCALL "[" "]" (QREFELT % 103))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "theMap" (ELT % 69) (QREFELT % 106))
                  (EXIT (PROGN (LETT #1# |oh|) (GO #7=#:G516)))))
                #7# (EXIT #1#)))) 

(SDEFUN |FMT1DINT;operatorHandlers;Oh;34|
        ((%
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))))
        (QREFELT % 113)) 

(DECLAIM (NOTINLINE |Format1DInternal;|)) 

(DEFUN |Format1DInternal;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|Format1DInternal| DV$1))
          (LETT % (GETREFV 115))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Format1DInternal| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 113
                    (|FMT1DINT;setOperatorHandlers!| (SPADCALL (QREFELT % 112))
                     %))
          %))) 

(DEFUN |Format1DInternal| (#1=#:G519)
  (SPROG NIL
         (PROG (#2=#:G520)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|Format1DInternal|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Format1DInternal;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|Format1DInternal|)))))))))) 

(MAKEPROP '|Format1DInternal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|OutputForm|)
              |FMT1DINT;coerce;%Of;1| (|OutputBox|) (0 . |empty|) (|String|)
              |FMT1DINT;defaultPrologue;SOb;2| |FMT1DINT;defaultEpilogue;SOb;3|
              (|CharacterClass|) (4 . |charClass|) (|Integer|) (9 . |position|)
              (|UniversalSegment| 16) (16 . SEGMENT) (22 . |elt|) (|Character|)
              (28 . |elt|) (34 . |concat|) (40 . |char|) (45 . |remove|)
              (51 . |box|) |FMT1DINT;formatFloat;SOb;5|
              |FMT1DINT;parenthesize;2S2Ob;9| |FMT1DINT;formatString;SOb;6|
              |FMT1DINT;formatSymbol;SOb;7|
              |FMT1DINT;formatFunctionSymbol;SOb;8| (|List| %) (56 . |hconcat|)
              (|Boolean|) (61 . =) (|OutputFormTools|) (67 . |atom?|)
              (|List| 7) (72 . |arguments|) (77 . |operator|) (82 . |elt|)
              (88 . |empty|) (|Symbol|) (92 . |is_symbol?|)
              (|NonNegativeInteger|) (98 . ~=) (104 . |elt|) (110 . |1|)
              (114 . |minPrecedence|) (118 . |formatExpression|)
              (124 . |empty?|) (|List| 9) (129 . |concat|)
              (135 . |formatFunction|) (141 . ~=) (147 . |first|)
              (|Mapping| 9 16 38) |FMT1DINT;integral;IM;12| (152 . |#|)
              (157 . =) |FMT1DINT;sum;IM;14| |FMT1DINT;product;IM;15|
              (163 . |string?|) (168 . |symbol?|) (|List| 11) (173 . |lines|)
              (178 . |position|) (184 . |position|) |FMT1DINT;theMap;ILOb;16|
              |FMT1DINT;overbar;I2M;17| |FMT1DINT;box;2M;18| (191 . |one?|)
              |FMT1DINT;nthRoot;I3M;19| (196 . |string|) (201 . |rest|)
              (206 . |empty?|) |FMT1DINT;scripts;IM;21| (|PositiveInteger|)
              (211 . |1|) (215 . |1|) |FMT1DINT;subscript;IM;22|
              |FMT1DINT;altsupersub;IM;23| (219 . +) (225 . |numberOfPrimes|)
              (230 . |0|) (234 . |0|) (238 . <) (244 . |convert|)
              |FMT1DINT;prime;IM;24| (249 . |parenthesizeIf|)
              |FMT1DINT;power;I3M;25| |FMT1DINT;fraction;I3M;26|
              |FMT1DINT;slash;I3M;27| |FMT1DINT;binomial;ILOb;28|
              |FMT1DINT;zag;ILOb;29| (255 . |maxPrecedence|)
              (259 . |formatExpression|) (264 . |nary|) (271 . |bracket|)
              |FMT1DINT;vconcat;2M;30| |FMT1DINT;pile;2M;31| (278 . |concat|)
              |FMT1DINT;matrix;2SM;32| (284 . |nothing|)
              (|OperatorHandlers| 57) (288 . |setHandler!|)
              (296 . |formatConstant|) (301 . |function|) (308 . |prefix|)
              (315 . |infix|) (323 . |naryPlus|) (331 . |new|) '|operatorData|
              |FMT1DINT;operatorHandlers;Oh;34|)
           '#(|zag| 335 |vconcat| 341 |theMap| 346 |sum| 352 |subscript| 357
              |slash| 362 |scripts| 369 |product| 374 |prime| 379 |prefix| 384
              |precedence| 391 |power| 397 |pile| 404 |parenthesizeIf| 409
              |parenthesize| 415 |overbar| 422 |operatorHandlers| 428
              |numberOfPrimes| 432 |nthRoot| 437 |nothing| 444 |naryPlus| 448
              |nary| 456 |minPrecedence| 463 |maxPrecedence| 467 |matrix| 471
              |integral| 477 |infix| 482 |function| 490 |fraction| 497
              |formatSymbol| 504 |formatString| 509 |formatInteger| 514
              |formatFunctionSymbol| 519 |formatFunction| 524 |formatFloat| 530
              |formatExpression| 535 |formatConstant| 551 |defaultPrologue| 556
              |defaultEpilogue| 561 |coerce| 566 |bracket| 571 |box| 578
              |binomial| 583 |binary| 589 |altsupersub| 595)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(|FormatterCategory&| NIL)
                       (CONS '#((|FormatterCategory|) (|CoercibleTo| 7))
                             (|makeByteWordVec2| 114
                                                 '(0 9 0 10 1 14 0 11 15 3 11
                                                   16 14 0 16 17 2 18 0 16 16
                                                   19 2 11 0 0 18 20 2 11 21 0
                                                   16 22 2 11 0 0 21 23 1 21 0
                                                   11 24 2 11 0 21 0 25 1 9 0
                                                   11 26 1 9 0 32 33 2 7 34 0 0
                                                   35 1 36 34 7 37 1 36 38 7 39
                                                   1 36 7 7 40 2 7 0 0 32 41 0
                                                   7 0 42 2 36 34 7 43 44 2 45
                                                   34 0 0 46 2 38 7 0 16 47 0
                                                   16 0 48 0 0 16 49 2 0 9 7 16
                                                   50 1 9 34 0 51 2 52 0 0 9 53
                                                   2 0 9 9 52 54 2 7 34 0 0 55
                                                   1 38 7 0 56 1 38 45 0 59 2
                                                   45 34 0 0 60 1 36 34 7 63 1
                                                   36 34 7 64 1 9 65 0 66 2 11
                                                   16 21 0 67 3 11 16 21 0 16
                                                   68 1 16 34 0 72 1 36 11 7 74
                                                   1 38 0 0 75 1 38 34 0 76 0
                                                   78 0 79 0 45 0 80 2 16 0 0 0
                                                   83 1 0 16 7 84 0 45 0 85 0
                                                   16 0 86 2 16 34 0 0 87 1 16
                                                   11 0 88 2 0 9 34 9 90 0 0 16
                                                   96 1 0 57 16 97 3 0 57 11 16
                                                   57 98 3 0 57 11 11 57 99 2
                                                   11 0 0 0 102 0 0 57 104 4
                                                   105 57 0 16 11 57 106 1 0 57
                                                   11 107 3 0 57 11 16 57 108 3
                                                   0 57 11 16 57 109 4 0 57 11
                                                   16 57 57 110 4 0 57 11 11 16
                                                   57 111 0 105 0 112 2 0 9 16
                                                   38 95 1 0 57 57 100 2 0 9 16
                                                   38 69 1 0 57 16 61 1 0 57 16
                                                   81 3 0 57 16 57 57 93 1 0 57
                                                   16 77 1 0 57 16 62 1 0 57 16
                                                   89 3 0 57 11 16 57 109 2 0
                                                   57 16 57 1 3 0 57 16 57 57
                                                   91 1 0 57 57 101 2 0 9 34 9
                                                   90 3 0 9 11 11 9 28 2 0 57
                                                   16 57 70 0 0 105 114 1 0 16
                                                   7 84 3 0 57 16 57 57 73 0 0
                                                   57 104 4 0 57 11 11 16 57
                                                   111 3 0 57 11 16 57 98 0 0
                                                   16 49 0 0 16 96 2 0 57 11 11
                                                   103 1 0 57 16 58 4 0 57 11
                                                   16 57 57 110 3 0 57 11 16 57
                                                   108 3 0 57 16 57 57 92 1 0 9
                                                   11 30 1 0 9 11 29 1 0 9 16 1
                                                   1 0 9 11 31 2 0 9 9 52 54 1
                                                   0 9 11 27 2 0 9 7 16 50 1 0
                                                   9 7 1 1 0 57 16 97 1 0 57 11
                                                   107 1 0 9 11 12 1 0 9 11 13
                                                   1 0 7 0 8 3 0 57 11 11 57 99
                                                   1 0 57 57 71 2 0 9 16 38 94
                                                   2 0 57 57 57 1 1 0 57 16
                                                   82)))))
           '|lookupComplete|)) 
