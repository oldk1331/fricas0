
(SDEFUN |FAUTON;new;BCB%;1|
        ((|wild?| (|Boolean|)) (|char| (|Character|)) (|accepting| (|Boolean|))
         (% (%)))
        (SPROG ((|r| (|n_Rec|)))
               (SEQ
                (LETT |r|
                      (VECTOR |wild?| |char| (CONS 1 "none") (CONS 1 "none") 0
                              |accepting|))
                (EXIT |r|)))) 

(SDEFUN |FAUTON;wild?;%B;2| ((|n| (%)) (% (|Boolean|)))
        (SPROG ((|r| (|n_Rec|))) (SEQ (LETT |r| |n|) (EXIT (QVELT |r| 0))))) 

(SDEFUN |FAUTON;accepting?;%B;3| ((|n| (%)) (% (|Boolean|)))
        (SPROG ((|r| (|n_Rec|))) (SEQ (LETT |r| |n|) (EXIT (QVELT |r| 5))))) 

(SDEFUN |FAUTON;char;%C;4| ((|n| (%)) (% (|Character|)))
        (SPROG ((|r| (|n_Rec|))) (SEQ (LETT |r| |n|) (EXIT (QVELT |r| 1))))) 

(SDEFUN |FAUTON;next;%U;5| ((|n| (%)) (% (|Union| % "none")))
        (SPROG ((|r| (|n_Rec|))) (SEQ (LETT |r| |n|) (EXIT (QVELT |r| 2))))) 

(SDEFUN |FAUTON;next;%CU;6|
        ((|n| (%)) (|c| (|Character|)) (% (|Union| % "none")))
        (SPROG ((|r| (|n_Rec|)))
               (SEQ (LETT |r| |n|)
                    (COND
                     ((OR (QVELT |r| 0) (|eql_SI| |c| (QVELT |r| 1)))
                      (EXIT (QVELT |r| 2))))
                    (EXIT (CONS 1 "none"))))) 

(SDEFUN |FAUTON;alt;%U;7| ((|n| (%)) (% (|Union| % "none")))
        (SPROG ((|r| (|n_Rec|))) (SEQ (LETT |r| |n|) (EXIT (QVELT |r| 3))))) 

(SDEFUN |FAUTON;gen;%I;8| ((|n| (%)) (% (|Integer|)))
        (SPROG ((|r| (|n_Rec|))) (SEQ (LETT |r| |n|) (EXIT (QVELT |r| 4))))) 

(SDEFUN |FAUTON;set_gen!;%2I;9| ((|n| (%)) (|k| (|Integer|)) (% (|Integer|)))
        (SPROG ((|r| (|n_Rec|)) (|res| (|Integer|)))
               (SEQ (LETT |r| |n|) (LETT |res| (QVELT |r| 4))
                    (QSETVELT |r| 4 |k|) (EXIT |res|)))) 

(SDEFUN |FAUTON;set_next!;2%V;10| ((|n| (%)) (|n1| (%)) (% (|Void|)))
        (SPROG ((|r| (|n_Rec|)))
               (SEQ (LETT |r| |n|) (EXIT (QSETVELT |r| 2 (CONS 0 |n1|)))))) 

(SDEFUN |FAUTON;set_alt!;2%V;11| ((|n| (%)) (|n1| (%)) (% (|Void|)))
        (SPROG ((|r| (|n_Rec|)))
               (SEQ (LETT |r| |n|) (EXIT (QSETVELT |r| 3 (CONS 0 |n1|)))))) 

(DECLAIM (NOTINLINE |MatchingAutomatonNode;|)) 

(DEFUN |MatchingAutomatonNode;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MatchingAutomatonNode|))
          (LETT % (GETREFV 23))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MatchingAutomatonNode| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |wild| (|Boolean|))
                              (|:| |char| (|Character|))
                              (|:| |next| (|Union| % #1="none"))
                              (|:| |alt| (|Union| % #1#))
                              (|:| |gen| (|Integer|))
                              (|:| |accepting| (|Boolean|))))
          %))) 

(DEFUN |MatchingAutomatonNode| ()
  (SPROG NIL
         (PROG (#1=#:G60)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MatchingAutomatonNode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MatchingAutomatonNode|
                             (LIST
                              (CONS NIL (CONS 1 (|MatchingAutomatonNode;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MatchingAutomatonNode|)))))))))) 

(MAKEPROP '|MatchingAutomatonNode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|n_Rec| (|Boolean|) (|Character|)
              |FAUTON;new;BCB%;1| |FAUTON;wild?;%B;2| |FAUTON;accepting?;%B;3|
              |FAUTON;char;%C;4| (|Union| % '#1="none") |FAUTON;next;%U;5|
              |FAUTON;next;%CU;6| |FAUTON;alt;%U;7| (|Integer|)
              |FAUTON;gen;%I;8| |FAUTON;set_gen!;%2I;9| (|Void|)
              |FAUTON;set_next!;2%V;10| |FAUTON;set_alt!;2%V;11|)
           '#(|wild?| 0 |set_next!| 5 |set_gen!| 11 |set_alt!| 17 |next| 23
              |new| 34 |gen| 41 |char| 46 |alt| 51 |accepting?| 56)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|wild?| ((|Boolean|) $$)) T)
                                   '((|char| ((|Character|) $$)) T)
                                   '((|next|
                                      ((|Union| $$ #1#) $$ (|Character|)))
                                     T)
                                   '((|next| ((|Union| $$ #1#) $$)) T)
                                   '((|alt| ((|Union| $$ #1#) $$)) T)
                                   '((|gen| ((|Integer|) $$)) T)
                                   '((|set_gen!| ((|Integer|) $$ (|Integer|)))
                                     T)
                                   '((|new|
                                      ($$ (|Boolean|) (|Character|)
                                       (|Boolean|)))
                                     T)
                                   '((|set_next!| ((|Void|) $$ $$)) T)
                                   '((|set_alt!| ((|Void|) $$ $$)) T)
                                   '((|accepting?| ((|Boolean|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 22
                                            '(1 0 7 0 10 2 0 20 0 0 21 2 0 17 0
                                              17 19 2 0 20 0 0 22 1 0 13 0 14 2
                                              0 13 0 8 15 3 0 0 7 8 7 9 1 0 17
                                              0 18 1 0 8 0 12 1 0 13 0 16 1 0 7
                                              0 11)))))
           '|lookupComplete|)) 
