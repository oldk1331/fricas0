
(DEFPARAMETER |AIntervalCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |AIntervalCategory;|)) 

(DEFPARAMETER |AIntervalCategory;AL| 'NIL) 

(DEFUN |AIntervalCategory| (|t#1|)
  (LET (#1=#:G29 (#2=#:G30 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |AIntervalCategory;AL|)) (CDR #1#))
          (T
           (SETQ |AIntervalCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|AIntervalCategory;| #2#)))
                            |AIntervalCategory;AL|))
           #1#)))) 

(DEFUN |AIntervalCategory;| (|t#1|)
  (SPROG ((#1=#:G28 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (COND (|AIntervalCategory;CAT|)
                                         ('T
                                          (LETT |AIntervalCategory;CAT|
                                                (|Join| (|AbelianSemiGroup|)
                                                        (|mkCategory|
                                                         '(((|interval|
                                                             (% |t#1| |t#1|))
                                                            T)
                                                           ((|qinterval|
                                                             (% |t#1| |t#1|))
                                                            T)
                                                           ((|inf| (|t#1| %))
                                                            T)
                                                           ((|sup| (|t#1| %))
                                                            T)
                                                           ((|coerce|
                                                             ((|List| |t#1|)
                                                              %))
                                                            T)
                                                           ((|error?|
                                                             ((|Boolean|) %))
                                                            T)
                                                           ((=
                                                             ((|Boolean|) % %))
                                                            T)
                                                           ((|contains?|
                                                             ((|Boolean|) %
                                                              |t#1|))
                                                            T)
                                                           ((|contains?|
                                                             ((|Boolean|) % %))
                                                            T)
                                                           ((+ (% % |t#1|)) T)
                                                           ((+ (% % %)) T)
                                                           ((*
                                                             (%
                                                              (|PositiveInteger|)
                                                              %))
                                                            T)
                                                           ((|Zero| (%)
                                                                    |constant|)
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianMonoid|)))
                                                           ((|zero?|
                                                             ((|Boolean|) %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianMonoid|)))
                                                           ((|positive?|
                                                             ((|Boolean|) %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianMonoid|)))
                                                           ((|negative?|
                                                             ((|Boolean|) %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianMonoid|)))
                                                           ((- (% %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianGroup|)))
                                                           ((- (% % %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianGroup|)))
                                                           ((*
                                                             (% (|Integer|) %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianGroup|)))
                                                           ((|width| (|t#1| %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianGroup|)))
                                                           ((|abs| (% %))
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianGroup|)))
                                                           ((* (% |t#1| %))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRng|))
                                                             (|has| |t#1|
                                                                    (|OrderedSemiGroup|))))
                                                           ((* (% % %))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRng|))
                                                             (|has| |t#1|
                                                                    (|OrderedSemiGroup|))))
                                                           ((^
                                                             (% %
                                                              (|PositiveInteger|)))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRng|))
                                                             (|has| |t#1|
                                                                    (|OrderedSemiGroup|))))
                                                           ((^
                                                             (% %
                                                              (|NonNegativeInteger|)))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRing|))
                                                             (|has| |t#1|
                                                                    (|OrderedMonoid|))))
                                                           ((|unit?|
                                                             ((|Boolean|) %))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|Field|))
                                                             (|has| |t#1|
                                                                    (|OrderedRing|))))
                                                           ((|inv| (% %))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|Field|))
                                                             (|has| |t#1|
                                                                    (|OrderedRing|))))
                                                           ((/ (% % %))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|Field|))
                                                             (|has| |t#1|
                                                                    (|OrderedRing|)))))
                                                         '(((|AbelianMonoid|)
                                                            (|has| |t#1|
                                                                   (|OrderedAbelianMonoid|)))
                                                           ((|SemiRng|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRng|))
                                                             (|has| |t#1|
                                                                    (|OrderedSemiGroup|))))
                                                           ((|SemiRing|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRing|))
                                                             (|has| |t#1|
                                                                    (|OrderedMonoid|)))))
                                                         NIL NIL)))))))
           (SETELT #1# 0 (LIST '|AIntervalCategory| |t#1|))))) 
