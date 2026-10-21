
(MAKEPROP '|CHAR;=;2%B;1| '|SPADreplace| '|eql_SI|) 

(SDEFUN |CHAR;=;2%B;1| ((|a| (%)) (|b| (%)) (% (|Boolean|))) (|eql_SI| |a| |b|)) 

(MAKEPROP '|CHAR;<;2%B;2| '|SPADreplace| '|less_SI|) 

(SDEFUN |CHAR;<;2%B;2| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (|less_SI| |a| |b|)) 

(MAKEPROP '|CHAR;size;Nni;3| '|SPADreplace| '(XLAM NIL 1114112)) 

(SDEFUN |CHAR;size;Nni;3| ((% (|NonNegativeInteger|))) 1114112) 

(SDEFUN |CHAR;index;Pi%;4| ((|n| (|PositiveInteger|)) (% (%)))
        (SPADCALL (- |n| 1) (QREFELT % 13))) 

(SDEFUN |CHAR;lookup;%Pi;5| ((|c| (%)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G4 NIL))
               (PROG1 (LETT #1# (+ 1 (SPADCALL |c| (QREFELT % 16))))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |CHAR;char;I%;6| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 18))) 

(MAKEPROP '|CHAR;ord;%I;7| '|SPADreplace| '(XLAM (|c|) |c|)) 

(SDEFUN |CHAR;ord;%I;7| ((|c| (%)) (% (|Integer|))) |c|) 

(SDEFUN |CHAR;random;%;8| ((% (%))) (SPADCALL (RANDOM 128) (QREFELT % 13))) 

(SDEFUN |CHAR;space;%;9| ((% (%))) (SPADCALL 32 (QREFELT % 13))) 

(SDEFUN |CHAR;quote;%;10| ((% (%))) (SPADCALL 34 (QREFELT % 13))) 

(SDEFUN |CHAR;underscore;%;11| ((% (%))) (SPADCALL 95 (QREFELT % 13))) 

(SDEFUN |CHAR;newline;%;12| ((% (%))) (SPADCALL 10 (QREFELT % 13))) 

(SDEFUN |CHAR;coerce;%Of;13| ((|c| (%)) (% (|OutputForm|)))
        (NUM2USTR (SPADCALL |c| (QREFELT % 16)))) 

(SDEFUN |CHAR;digit?;%B;14| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 27) (QREFELT % 29))) 

(SDEFUN |CHAR;hexDigit?;%B;15| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 31) (QREFELT % 29))) 

(SDEFUN |CHAR;upperCase?;%B;16| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 33) (QREFELT % 29))) 

(SDEFUN |CHAR;lowerCase?;%B;17| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 35) (QREFELT % 29))) 

(SDEFUN |CHAR;alphabetic?;%B;18| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 37) (QREFELT % 29))) 

(SDEFUN |CHAR;alphanumeric?;%B;19| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 39) (QREFELT % 29))) 

(MAKEPROP '|CHAR;char;S%;20| '|SPADreplace| '|STR_to_CHAR|) 

(SDEFUN |CHAR;char;S%;20| ((|s| (|String|)) (% (%))) (|STR_to_CHAR| |s|)) 

(SDEFUN |CHAR;upperCase;2%;21| ((|c| (%)) (% (%)))
        (CHAR-CODE (CHAR-UPCASE (CODE-CHAR (SPADCALL |c| (QREFELT % 16)))))) 

(SDEFUN |CHAR;lowerCase;2%;22| ((|c| (%)) (% (%)))
        (CHAR-CODE (CHAR-DOWNCASE (CODE-CHAR (SPADCALL |c| (QREFELT % 16)))))) 

(MAKEPROP '|CHAR;hashUpdate!;Hs%Hs;23| '|SPADreplace| 'HASHSTATEUPDATE) 

(SDEFUN |CHAR;hashUpdate!;Hs%Hs;23|
        ((|hs| (|HashState|)) (|c| (%)) (% (|HashState|)))
        (HASHSTATEUPDATE |hs| |c|)) 

(DECLAIM (NOTINLINE |Character;|)) 

(DEFUN |Character;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Character|))
          (LETT % (GETREFV 50))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Character| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|SingleInteger|))
          %))) 

(DEFUN |Character| ()
  (SPROG NIL
         (PROG (#1=#:G25)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Character|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Character|
                             (LIST (CONS NIL (CONS 1 (|Character;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|Character|)))))))))) 

(MAKEPROP '|Character| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) |CHAR;=;2%B;1|
              |CHAR;<;2%B;2| (|NonNegativeInteger|) |CHAR;size;Nni;3|
              (|Integer|) |CHAR;char;I%;6| (|PositiveInteger|)
              |CHAR;index;Pi%;4| |CHAR;ord;%I;7| |CHAR;lookup;%Pi;5|
              (0 . |coerce|) |CHAR;random;%;8| |CHAR;space;%;9|
              |CHAR;quote;%;10| |CHAR;underscore;%;11| |CHAR;newline;%;12|
              (|OutputForm|) |CHAR;coerce;%Of;13| (|CharacterClass|)
              (5 . |digit|) (|Character|) (9 . |member?|) |CHAR;digit?;%B;14|
              (15 . |hexDigit|) |CHAR;hexDigit?;%B;15| (19 . |upperCase|)
              |CHAR;upperCase?;%B;16| (23 . |lowerCase|)
              |CHAR;lowerCase?;%B;17| (27 . |alphabetic|)
              |CHAR;alphabetic?;%B;18| (31 . |alphanumeric|)
              |CHAR;alphanumeric?;%B;19| (|String|) |CHAR;char;S%;20|
              |CHAR;upperCase;2%;21| |CHAR;lowerCase;2%;22| (|HashState|)
              |CHAR;hashUpdate!;Hs%Hs;23| (|List| %) (|SingleInteger|)
              (|InputForm|))
           '#(~= 35 |upperCase?| 41 |upperCase| 46 |underscore| 51 |space| 55
              |smaller?| 59 |size| 65 |sign| 69 |random| 74 |quote| 78
              |positive?| 82 |ord| 87 |newline| 92 |negative?| 96 |min| 101
              |max| 107 |lowerCase?| 113 |lowerCase| 118 |lookup| 123 |latex|
              128 |index| 133 |hexDigit?| 138 |hashUpdate!| 143 |hash| 149
              |enumerate| 154 |digit?| 158 |convert| 163 |coerce| 168 |char|
              173 |alphanumeric?| 183 |alphabetic?| 188 >= 193 > 199 = 205 <=
              211 < 217)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|Finite&| |OrderedSet&| NIL NIL |SetCategory&| |Hashable&|
                     NIL |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|Finite|) (|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|SetCategory|) (|Hashable|)
                      (|CoercibleTo| 24) (|PartialOrder|) (|BasicType|)
                      (|ConvertibleTo| 49))
                   (|makeByteWordVec2| 49
                                       '(1 6 0 12 18 0 26 0 27 2 26 7 28 0 29 0
                                         26 0 31 0 26 0 33 0 26 0 35 0 26 0 37
                                         0 26 0 39 2 0 7 0 0 1 1 0 7 0 34 1 0 0
                                         0 43 0 0 0 22 0 0 0 20 2 0 7 0 0 1 0 0
                                         10 11 1 1 12 0 1 0 0 0 19 0 0 0 21 1 1
                                         7 0 1 1 0 12 0 16 0 0 0 23 1 1 7 0 1 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 7 0 36 1 0 0
                                         0 44 1 0 14 0 17 1 0 41 0 1 1 0 0 14
                                         15 1 0 7 0 32 2 0 45 45 0 46 1 0 48 0
                                         1 0 0 47 1 1 0 7 0 30 1 0 49 0 1 1 0
                                         24 0 25 1 0 0 12 13 1 0 0 41 42 1 0 7
                                         0 40 1 0 7 0 38 2 0 7 0 0 1 2 0 7 0 0
                                         1 2 0 7 0 0 8 2 0 7 0 0 1 2 0 7 0 0
                                         9)))))
           '|lookupComplete|)) 
