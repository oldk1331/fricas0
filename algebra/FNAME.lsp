
(MAKEPROP '|FNAME;=;2%B;1| '|SPADreplace| 'EQUAL) 

(SDEFUN |FNAME;=;2%B;1| ((|f1| (%)) (|f2| (%)) (% (|Boolean|)))
        (EQUAL |f1| |f2|)) 

(SDEFUN |FNAME;coerce;%Of;2| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |f| (QREFELT % 9)) (QREFELT % 11))) 

(MAKEPROP '|FNAME;coerce;%S;3| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |FNAME;coerce;%S;3| ((|f| (%)) (% (|String|))) |f|) 

(MAKEPROP '|FNAME;coerce;S%;4| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |FNAME;coerce;S%;4| ((|s| (|String|)) (% (%))) |s|) 

(MAKEPROP '|FNAME;filename;3S%;5| '|SPADreplace| '|make_fname|) 

(SDEFUN |FNAME;filename;3S%;5|
        ((|d| #1=(|String|)) (|n| #1#) (|e| #1#) (% (%)))
        (|make_fname| |d| |n| |e|)) 

(MAKEPROP '|FNAME;directory;%S;6| '|SPADreplace| '|file_directory|) 

(SDEFUN |FNAME;directory;%S;6| ((|f| (%)) (% (|String|)))
        (|file_directory| |f|)) 

(MAKEPROP '|FNAME;name;%S;7| '|SPADreplace| '|file_basename|) 

(SDEFUN |FNAME;name;%S;7| ((|f| (%)) (% (|String|))) (|file_basename| |f|)) 

(MAKEPROP '|FNAME;extension;%S;8| '|SPADreplace| '|file_extention|) 

(SDEFUN |FNAME;extension;%S;8| ((|f| (%)) (% (|String|)))
        (|file_extention| |f|)) 

(SDEFUN |FNAME;exists?;%B;9| ((|f| (%)) (% (|Boolean|)))
        (SPROG ((|se| (|SExpression|)))
               (SEQ (LETT |se| (|fricas_probe_file| |f|))
                    (EXIT (NULL (SPADCALL |se| (QREFELT % 19))))))) 

(MAKEPROP '|FNAME;readable?;%B;10| '|SPADreplace| '|can_open?|) 

(SDEFUN |FNAME;readable?;%B;10| ((|f| (%)) (% (|Boolean|))) (|can_open?| |f|)) 

(SDEFUN |FNAME;writable?;%B;11| ((|f| (%)) (% (|Boolean|)))
        (SPROG ((|n| (|String|)) (|r1| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 9)))
                    (LETT |r1| (|writablep| |n| 0))
                    (EXIT
                     (COND ((> |r1| 0) 'T) ((EQL |r1| 0) NIL)
                           ('T
                            (SEQ (LETT |n| (|file_directory| |n|))
                                 (COND ((EQUAL |n| "") (LETT |n| ".")))
                                 (LETT |r1| (|writablep| |n| 1))
                                 (EXIT (> |r1| 0))))))))) 

(SDEFUN |FNAME;new;3S%;12| ((|d| #1=(|String|)) (|pref| #1#) (|e| #1#) (% (%)))
        (SPROG ((|r1| (|Integer|)))
               (SEQ (COND ((EQUAL |d| "") (LETT |d| ".")))
                    (LETT |r1| (|writablep| |d| 1))
                    (EXIT
                     (COND ((> |r1| 0) (|new_fname| |d| |pref| |e|))
                           ('T
                            (|error|
                             "new: directory must exist and be writable"))))))) 

(DECLAIM (NOTINLINE |FileName;|)) 

(DEFUN |FileName;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FileName|))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FileName| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FileName| ()
  (SPROG NIL
         (PROG (#1=#:G19)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FileName|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FileName|
                             (LIST (CONS NIL (CONS 1 (|FileName;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|FileName|)))))))))) 

(MAKEPROP '|FileName| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) |FNAME;=;2%B;1| (|String|)
              |FNAME;coerce;%S;3| (|OutputForm|) (0 . |coerce|)
              |FNAME;coerce;%Of;2| |FNAME;coerce;S%;4| |FNAME;filename;3S%;5|
              |FNAME;directory;%S;6| |FNAME;name;%S;7| |FNAME;extension;%S;8|
              (|SExpression|) (5 . |null?|) |FNAME;exists?;%B;9|
              |FNAME;readable?;%B;10| |FNAME;writable?;%B;11|
              |FNAME;new;3S%;12|)
           '#(~= 10 |writable?| 16 |readable?| 21 |new| 26 |name| 33 |latex| 38
              |filename| 43 |extension| 50 |exists?| 55 |directory| 60 |coerce|
              65 = 80)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FileNameCategory|) (|SetCategory|)
                           (|CoercibleTo| 10) (|BasicType|))
                        (|makeByteWordVec2| 23
                                            '(1 8 10 0 11 1 18 6 0 19 2 0 6 0 0
                                              1 1 0 6 0 22 1 0 6 0 21 3 0 0 8 8
                                              8 23 1 0 8 0 16 1 0 8 0 1 3 0 0 8
                                              8 8 14 1 0 8 0 17 1 0 6 0 20 1 0
                                              8 0 15 1 0 10 0 12 1 0 8 0 9 1 0
                                              0 8 13 2 0 6 0 0 7)))))
           '|lookupComplete|)) 
