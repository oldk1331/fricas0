
(SDEFUN |BASFILE;openIfCan;FnSU;1|
        ((|fn| (|FileName|)) (|mode| (|String|)) (% (|Union| % "failed")))
        (SPROG ((|res1| (|None|)))
               (SEQ
                (COND
                 ((EQUAL |mode| "input")
                  (SEQ
                   (LETT |res1|
                         (|open_stream2| (SPADCALL |fn| (QREFELT % 8)) '|input|
                                         NIL))
                   (EXIT
                    (COND ((NULL |res1|) (CONS 1 "failed"))
                          (#1='T (CONS 0 |res1|))))))
                 ((EQUAL |mode| "output")
                  (SEQ
                   (LETT |res1|
                         (|open_stream2| (SPADCALL |fn| (QREFELT % 8))
                                         '|output| NIL))
                   (EXIT
                    (COND ((NULL |res1|) (CONS 1 "failed"))
                          (#1# (CONS 0 |res1|))))))
                 (#1#
                  (|error|
                   (LIST '|mathprint|
                         (LIST 'CONCAT
                               (SPADCALL "IO mode must be input or output"
                                         (QREFELT % 10))
                               (SPADCALL |mode| (QREFELT % 10)))))))))) 

(SDEFUN |BASFILE;open;FnS%;2| ((|fn| (|FileName|)) (|mode| (|String|)) (% (%)))
        (SPROG ((|res| (|Union| % "failed")))
               (SEQ (LETT |res| (SPADCALL |fn| |mode| (QREFELT % 12)))
                    (EXIT
                     (COND
                      ((QEQCAR |res| 1)
                       (COND
                        ((EQUAL |mode| "input")
                         (|error|
                          (LIST '|mathprint|
                                (LIST 'CONCAT
                                      (SPADCALL "Can not open for input: "
                                                (QREFELT % 10))
                                      (SPADCALL |fn| (QREFELT % 13))))))
                        ((EQUAL |mode| "output")
                         (|error|
                          (LIST '|mathprint|
                                (LIST 'CONCAT
                                      (SPADCALL "Can not open for output: "
                                                (QREFELT % 10))
                                      (SPADCALL |fn| (QREFELT % 13))))))
                        (#1='T
                         (|error|
                          (LIST '|mathprint|
                                (LIST 'CONCAT
                                      (SPADCALL
                                       "IO mode must be input or output"
                                       (QREFELT % 10))
                                      (SPADCALL |mode| (QREFELT % 10))))))))
                      (#1# (QCDR |res|))))))) 

(MAKEPROP '|BASFILE;close!;%V;3| '|SPADreplace| 'CLOSE) 

(SDEFUN |BASFILE;close!;%V;3| ((|f| (%)) (% (|Void|))) (CLOSE |f|)) 

(SDEFUN |BASFILE;readIfCan;%U;4| ((|f| (%)) (% (|Union| (|None|) "failed")))
        (SPROG ((|res1| (|None|)))
               (SEQ (LETT |res1| (READ |f| NIL |$eof_marker|))
                    (EXIT
                     (COND ((|eof_marker?| |res1|) (CONS 1 "failed"))
                           ('T (CONS 0 (SPADCALL |res1| (QREFELT % 19))))))))) 

(SDEFUN |BASFILE;read;%N;5| ((|f| (%)) (% (|None|)))
        (SPROG ((|res1| (|None|)))
               (SEQ (LETT |res1| (READ |f| NIL |$eof_marker|))
                    (EXIT
                     (COND ((|eof_marker?| |res1|) (|error| "End of file"))
                           ('T (SPADCALL |res1| (QREFELT % 19)))))))) 

(SDEFUN |BASFILE;write!;%NV;6| ((|f| (%)) (|d| (|None|)) (% (|Void|)))
        (SPROG ((|res1| (|Union| (|None|) "failed")))
               (SEQ
                (LETT |res1| (|trappedSpadEval| (SPADCALL |d| (QREFELT % 23))))
                (EXIT
                 (COND
                  ((QEQCAR |res1| 1)
                   (|error| "The value cannot be saved to a file."))
                  ('T (|write_to_stream| (QCDR |res1|) |f|))))))) 

(MAKEPROP '|BASFILE;flush;%V;7| '|SPADreplace| 'FORCE-OUTPUT) 

(SDEFUN |BASFILE;flush;%V;7| ((|f| (%)) (% (|Void|))) (FORCE-OUTPUT |f|)) 

(DECLAIM (NOTINLINE |BasicFile;|)) 

(DEFUN |BasicFile;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BasicFile|))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BasicFile| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |BasicFile| ()
  (SPROG NIL
         (PROG (#1=#:G37)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BasicFile|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BasicFile|
                             (LIST (CONS NIL (CONS 1 (|BasicFile;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|BasicFile|)))))))))) 

(MAKEPROP '|BasicFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|FileName|) (0 . |coerce|)
              (|OutputForm|) (5 . |coerce|) (|Union| % '"failed")
              |BASFILE;openIfCan;FnSU;1| (10 . |coerce|) |BASFILE;open;FnS%;2|
              (|Void|) |BASFILE;close!;%V;3| (|None|) (|FileSerialization|)
              (15 . |deserialize|) (|Union| 17 '"failed")
              |BASFILE;readIfCan;%U;4| |BASFILE;read;%N;5| (20 . |serialize|)
              |BASFILE;write!;%NV;6| |BASFILE;flush;%V;7|)
           '#(|write!| 25 |readIfCan| 31 |read| 36 |openIfCan| 41 |open| 47
              |flush| 53 |close!| 58)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|open| ($$ (|FileName|) (|String|))) T)
                                   '((|openIfCan|
                                      ((|Union| $$ "failed") (|FileName|)
                                       (|String|)))
                                     T)
                                   '((|close!| ((|Void|) $$)) T)
                                   '((|read| ((|None|) $$)) T)
                                   '((|readIfCan|
                                      ((|Union| (|None|) "failed") $$))
                                     T)
                                   '((|write!| ((|Void|) $$ (|None|))) T)
                                   '((|flush| ((|Void|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 25
                                            '(1 7 6 0 8 1 6 9 0 10 1 7 9 0 13 1
                                              18 17 17 19 1 18 17 17 23 2 0 15
                                              0 17 24 1 0 20 0 21 1 0 17 0 22 2
                                              0 11 7 6 12 2 0 0 7 6 14 1 0 15 0
                                              25 1 0 15 0 16)))))
           '|lookupComplete|)) 
