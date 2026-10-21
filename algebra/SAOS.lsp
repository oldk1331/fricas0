
(MAKEPROP '|SAOS;create;%;1| '|SPADreplace| '(XLAM NIL '?)) 

(SDEFUN |SAOS;create;%;1| ((% (%))) '?) 

(MAKEPROP '|SAOS;<;2%B;2| '|SPADreplace| '(XLAM (|a| |b|) NIL)) 

(SDEFUN |SAOS;<;2%B;2| ((|a| (%)) (|b| (%)) (% (|Boolean|))) NIL) 

(SDEFUN |SAOS;coerce;%Of;3| ((|a| (%)) (% (|OutputForm|)))
        (SPADCALL "?" (QREFELT % 11))) 

(MAKEPROP '|SAOS;=;2%B;4| '|SPADreplace| '(XLAM (|a| |b|) 'T)) 

(SDEFUN |SAOS;=;2%B;4| ((|a| (%)) (|b| (%)) (% (|Boolean|))) 'T) 

(MAKEPROP '|SAOS;min;3%;5| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |SAOS;min;3%;5| ((|a| (%)) (|b| (%)) (% (%))) |a|) 

(MAKEPROP '|SAOS;max;3%;6| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |SAOS;max;3%;6| ((|a| (%)) (|b| (%)) (% (%))) |a|) 

(MAKEPROP '|SAOS;convert;%S;7| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |SAOS;convert;%S;7| ((|a| (%)) (% (|Symbol|))) |a|) 

(SDEFUN |SAOS;hashUpdate!;Hs%Hs;8|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPADCALL |s| 42 (QREFELT % 20))) 

(DECLAIM (NOTINLINE |SingletonAsOrderedSet;|)) 

(DEFUN |SingletonAsOrderedSet;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SingletonAsOrderedSet|))
          (LETT % (GETREFV 23))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SingletonAsOrderedSet| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |SingletonAsOrderedSet| ()
  (SPROG NIL
         (PROG (#1=#:G9)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SingletonAsOrderedSet|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SingletonAsOrderedSet|
                             (LIST
                              (CONS NIL (CONS 1 (|SingletonAsOrderedSet;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|SingletonAsOrderedSet|)))))))))) 

(MAKEPROP '|SingletonAsOrderedSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL |SAOS;create;%;1| (|Boolean|)
              |SAOS;<;2%B;2| (|String|) (|OutputForm|) (0 . |outputForm|)
              |SAOS;coerce;%Of;3| |SAOS;=;2%B;4| |SAOS;min;3%;5|
              |SAOS;max;3%;6| (|Symbol|) |SAOS;convert;%S;7| (|HashState|)
              (|SingleInteger|) (5 . |hashUpdate!|) |SAOS;hashUpdate!;Hs%Hs;8|
              (|Integer|))
           '#(~= 11 |smaller?| 17 |sign| 23 |positive?| 28 |negative?| 33 |min|
              38 |max| 44 |latex| 50 |hashUpdate!| 55 |hash| 61 |create| 66
              |convert| 70 |coerce| 75 >= 80 > 86 = 92 <= 98 < 104)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL |Hashable&| |SetCategory&| NIL
                     |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|Hashable|) (|SetCategory|)
                      (|CoercibleTo| 10) (|PartialOrder|) (|BasicType|)
                      (|Canonical|))
                   (|makeByteWordVec2| 22
                                       '(1 10 0 9 11 2 19 18 18 0 20 2 0 7 0 0
                                         1 2 0 7 0 0 1 1 1 22 0 1 1 1 7 0 1 1 1
                                         7 0 1 2 0 0 0 0 14 2 0 0 0 0 15 1 0 9
                                         0 1 2 0 18 18 0 21 1 0 19 0 1 0 0 0 6
                                         1 0 16 0 17 1 0 10 0 12 2 0 7 0 0 1 2
                                         0 7 0 0 1 2 0 7 0 0 13 2 0 7 0 0 1 2 0
                                         7 0 0 8)))))
           '|lookupComplete|)) 
