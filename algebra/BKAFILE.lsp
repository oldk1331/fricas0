
(SDEFUN |BKAFILE;openIfCan;FnSU;1|
        ((|fn| (|FileName|)) (|mode| (|String|)) (% (|Union| % "failed")))
        (SPROG ((|res| (|None|)))
               (SEQ
                (COND
                 ((OR (EQUAL |mode| "input") (EQUAL |mode| "output"))
                  (SEQ
                   (LETT |res|
                         (|kaf_open2| (SPADCALL |fn| (QREFELT % 8))
                                      (EQUAL |mode| "output")))
                   (EXIT
                    (COND ((NULL |res|) (CONS 1 "failed"))
                          ('T (CONS 0 |res|))))))
                 ('T
                  (|error|
                   (LIST '|mathprint|
                         (LIST 'CONCAT
                               (SPADCALL "IO mode must be input or output"
                                         (QREFELT % 10))
                               (SPADCALL |mode| (QREFELT % 10)))))))))) 

(SDEFUN |BKAFILE;open;FnS%;2| ((|fn| (|FileName|)) (|mode| (|String|)) (% (%)))
        (SPROG ((|res1| (|Union| % "failed")))
               (SEQ (LETT |res1| (SPADCALL |fn| |mode| (QREFELT % 12)))
                    (EXIT
                     (COND
                      ((QEQCAR |res1| 1)
                       (|error|
                        (LIST '|mathprint|
                              (LIST 'CONCAT
                                    (SPADCALL "Can not open: " (QREFELT % 10))
                                    (SPADCALL (SPADCALL |fn| (QREFELT % 8))
                                              (QREFELT % 10))))))
                      ('T (QCDR |res1|))))))) 

(MAKEPROP '|BKAFILE;close!;%V;3| '|SPADreplace| '|kaf_close|) 

(SDEFUN |BKAFILE;close!;%V;3| ((|f| (%)) (% (|Void|))) (|kaf_close| |f|)) 

(SDEFUN |BKAFILE;read;%SN;4| ((|f| (%)) (|key| (|String|)) (% (|None|)))
        (SPADCALL (|kaf_read| |f| |key| |$error_mark|) (QREFELT % 18))) 

(SDEFUN |BKAFILE;read;%S2N;5|
        ((|f| (%)) (|key| (|String|)) (|val| (|None|)) (% (|None|)))
        (SPADCALL (|kaf_read| |f| |key| (SPADCALL |val| (QREFELT % 20)))
                  (QREFELT % 18))) 

(SDEFUN |BKAFILE;write!;%SNV;6|
        ((|f| (%)) (|key| (|String|)) (|val| (|None|)) (% (|Void|)))
        (SPROG ((|res1| (|Union| (|None|) "failed")))
               (SEQ
                (LETT |res1|
                      (|trappedSpadEval| (SPADCALL |val| (QREFELT % 20))))
                (EXIT
                 (COND
                  ((QEQCAR |res1| 1) (|error| "can not save value to file"))
                  ('T (|kaf_write| |f| |key| (QCDR |res1|)))))))) 

(MAKEPROP '|BKAFILE;remove!;%SV;7| '|SPADreplace| '|kaf_remove|) 

(SDEFUN |BKAFILE;remove!;%SV;7| ((|f| (%)) (|key| (|String|)) (% (|Void|)))
        (|kaf_remove| |f| |key|)) 

(MAKEPROP '|BKAFILE;keys;%L;8| '|SPADreplace| '|rkeys2|) 

(SDEFUN |BKAFILE;keys;%L;8| ((|f| (%)) (% (|List| (|String|)))) (|rkeys2| |f|)) 

(DECLAIM (NOTINLINE |BasicKeyedAccessFile;|)) 

(DEFUN |BasicKeyedAccessFile;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BasicKeyedAccessFile|))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BasicKeyedAccessFile| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |BasicKeyedAccessFile| ()
  (SPROG NIL
         (PROG (#1=#:G28)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BasicKeyedAccessFile|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BasicKeyedAccessFile|
                             (LIST
                              (CONS NIL (CONS 1 (|BasicKeyedAccessFile;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|BasicKeyedAccessFile|)))))))))) 

(MAKEPROP '|BasicKeyedAccessFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|FileName|) (0 . |coerce|)
              (|OutputForm|) (5 . |coerce|) (|Union| % '"failed")
              |BKAFILE;openIfCan;FnSU;1| |BKAFILE;open;FnS%;2| (|Void|)
              |BKAFILE;close!;%V;3| (|None|) (|FileSerialization|)
              (10 . |deserialize|) |BKAFILE;read;%SN;4| (15 . |serialize|)
              |BKAFILE;read;%S2N;5| |BKAFILE;write!;%SNV;6|
              |BKAFILE;remove!;%SV;7| (|List| 6) |BKAFILE;keys;%L;8|)
           '#(|write!| 20 |remove!| 27 |read| 33 |openIfCan| 46 |open| 52
              |keys| 58 |close!| 63)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|openIfCan|
                                 ((|Union| $$ "failed") (|FileName|)
                                  (|String|)))
                                T)
                              '((|open| ($$ (|FileName|) (|String|))) T)
                              '((|close!| ((|Void|) $$)) T)
                              '((|read| ((|None|) $$ (|String|))) T)
                              '((|read| ((|None|) $$ (|String|) (|None|))) T)
                              '((|write!| ((|Void|) $$ (|String|) (|None|))) T)
                              '((|remove!| ((|Void|) $$ (|String|))) T)
                              '((|keys| ((|List| (|String|)) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 25
                                            '(1 7 6 0 8 1 6 9 0 10 1 17 16 16
                                              18 1 17 16 16 20 3 0 14 0 6 16 22
                                              2 0 14 0 6 23 3 0 16 0 6 16 21 2
                                              0 16 0 6 19 2 0 11 7 6 12 2 0 0 7
                                              6 13 1 0 24 0 25 1 0 14 0 15)))))
           '|lookupComplete|)) 
