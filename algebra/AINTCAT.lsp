
(DEFPARAMETER |AIntervalCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |AIntervalCategory;|)) 

(DEFPARAMETER |AIntervalCategory;AL| 'NIL) 

(DEFUN |AIntervalCategory| (|t#1|)
  (LET (#1=#:G30 (#2=#:G31 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |AIntervalCategory;AL|)) (CDR #1#))
          (T
           (SETQ |AIntervalCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|AIntervalCategory;| #2#)))
                            |AIntervalCategory;AL|))
           #1#)))) 

(DEFUN |AIntervalCategory;| (|t#1|)
  (SPROG ((#1=#:G29 NIL))
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
                                                           ((|positive?|
                                                             ((|Boolean|) %))
                                                            (|has| |t#1|
                                                                   (|SetWithZero|)))
                                                           ((|negative?|
                                                             ((|Boolean|) %))
                                                            (|has| |t#1|
                                                                   (|SetWithZero|)))
                                                           ((- (% %))
                                                            (|has| |t#1|
                                                                   (|AbelianGroup|)))
                                                           ((- (% % %))
                                                            (|has| |t#1|
                                                                   (|AbelianGroup|)))
                                                           ((*
                                                             (% (|Integer|) %))
                                                            (|has| |t#1|
                                                                   (|AbelianGroup|)))
                                                           ((|width| (|t#1| %))
                                                            (|has| |t#1|
                                                                   (|AbelianGroup|)))
                                                           ((|abs| (% %))
                                                            (|has| |t#1|
                                                                   (|AbelianGroup|)))
                                                           ((* (% |t#1| %))
                                                            (|has| |t#1|
                                                                   (|OrderedMagma|)))
                                                           ((* (% % %))
                                                            (|has| |t#1|
                                                                   (|OrderedMagma|)))
                                                           ((^
                                                             (% %
                                                              (|PositiveInteger|)))
                                                            (|has| |t#1|
                                                                   (|OrderedMagma|)))
                                                           ((^
                                                             (% %
                                                              (|NonNegativeInteger|)))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|MagmaWithUnit|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagma|))))
                                                           ((* (% |t#1| %))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((* (% % %))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((^
                                                             (% %
                                                              (|PositiveInteger|)))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((^
                                                             (% %
                                                              (|NonNegativeInteger|)))
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|MagmaWithUnit|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
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
                                                                   (|AbelianMonoid|)))
                                                           ((|SetWithZero|)
                                                            (|has| |t#1|
                                                                   (|SetWithZero|)))
                                                           ((|Magma|)
                                                            (|has| |t#1|
                                                                   (|OrderedMagma|)))
                                                           ((|MagmaWithZero|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|MagmaWithZero|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagma|))))
                                                           ((|MagmaWithUnit|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|MagmaWithUnit|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagma|))))
                                                           ((|SemiGroup|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiGroup|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagma|))))
                                                           ((|Monoid|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|Monoid|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagma|))))
                                                           ((|SemiRng|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRng|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagma|))))
                                                           ((|SemiRing|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRing|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagma|))))
                                                           ((|Magma|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((|MagmaWithZero|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|MagmaWithZero|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((|MagmaWithUnit|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|MagmaWithUnit|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((|SemiGroup|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiGroup|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((|Monoid|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|Monoid|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((|SemiRng|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRng|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|)))))
                                                           ((|SemiRing|)
                                                            (AND
                                                             (|has| |t#1|
                                                                    (|SemiRing|))
                                                             (|has| |t#1|
                                                                    (|OrderedMagmaWithZero|))
                                                             (|not|
                                                              (|has| |t#1|
                                                                     (|OrderedMagma|))))))
                                                         NIL NIL)))))))
           (SETELT #1# 0 (LIST '|AIntervalCategory| |t#1|))))) 
