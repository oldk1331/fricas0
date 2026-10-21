
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $printLoadMsgs := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$printLoadMsgs| NIL))

; $spadLibFT := '"NRLIB"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$spadLibFT| "NRLIB"))

; $LISPLIB := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ $LISPLIB NIL))

; $libFile := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$libFile| NIL))

; $no_lisp_compile := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$no_lisp_compile| NIL))

; $lisplibForm := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$lisplibForm| NIL))

; $lisplibKind := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$lisplibKind| NIL))

; $lisplibModemapAlist := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$lisplibModemapAlist| NIL))

; $lisplibModemap := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$lisplibModemap| NIL))

; $lisplibOperationAlist := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$lisplibOperationAlist| NIL))

; $lisplibMissingFunctions := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$lisplibMissingFunctions| NIL))

; readLib(fn) == kaf_open(fn, false)

(DEFUN |readLib| (|fn|) (PROG () (RETURN (|kaf_open| |fn| NIL))))

; writeLib(fn) == kaf_open(fn, true)

(DEFUN |writeLib| (|fn|) (PROG () (RETURN (|kaf_open| |fn| T))))

; writeLib0(fn, ft) == kaf_open(make_filename2(fn, ft), true)

(DEFUN |writeLib0| (|fn| |ft|)
  (PROG () (RETURN (|kaf_open| (|make_filename2| |fn| |ft|) T))))

; lisplibWrite(prop, val, lib_file) ==
;   -- this may someday not write NIL keys, but it will now
;   if $LISPLIB then
;      kaf_write(lib_file, prop, val)

(DEFUN |lisplibWrite| (|prop| |val| |lib_file|)
  (PROG () (RETURN (COND ($LISPLIB (|kaf_write| |lib_file| |prop| |val|))))))

; loadLibIfNotLoaded libName ==
;   -- replaces old SpadCondLoad
;   -- loads if library is not already loaded
;   GET(libName, 'LOADED) => NIL
;   loadLib libName

(DEFUN |loadLibIfNotLoaded| (|libName|)
  (PROG ()
    (RETURN (COND ((GET |libName| 'LOADED) NIL) ('T (|loadLib| |libName|))))))

; loadLib cname ==
;   startTimingProcess 'load
;   fullLibName := get_database(cname, 'OBJECT) or return nil
;   systemdir? := is_system_path?(fullLibName)
;   update? := not systemdir?
;   loadLibNoUpdate1(cname, fullLibName)
;   kind := get_database(cname, 'CONSTRUCTORKIND)
;   if update? then
;       updateCategoryTable(cname, kind)
;   stopTimingProcess 'load

(DEFUN |loadLib| (|cname|)
  (PROG (|fullLibName| |systemdir?| |update?| |kind|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|load|)
      (SETQ |fullLibName| (OR (|get_database| |cname| 'OBJECT) (RETURN NIL)))
      (SETQ |systemdir?| (|is_system_path?| |fullLibName|))
      (SETQ |update?| (NULL |systemdir?|))
      (|loadLibNoUpdate1| |cname| |fullLibName|)
      (SETQ |kind| (|get_database| |cname| 'CONSTRUCTORKIND))
      (COND (|update?| (|updateCategoryTable| |cname| |kind|)))
      (|stopTimingProcess| '|load|)))))

; loadLibNoUpdate1(cname, fullLibName) ==
;   if $printLoadMsgs then
;     kind := get_database(cname, 'CONSTRUCTORKIND)
;     say_msg("S2IL0002", '"Loading %1 for %2 %3b", [fullLibName, kind, cname])
;   load_quietly(fullLibName)
;   clearConstructorCache cname
;   MAKEPROP(cname,'LOADED,fullLibName)

(DEFUN |loadLibNoUpdate1| (|cname| |fullLibName|)
  (PROG (|kind|)
    (RETURN
     (PROGN
      (COND
       (|$printLoadMsgs|
        (SETQ |kind| (|get_database| |cname| 'CONSTRUCTORKIND))
        (|say_msg| 'S2IL0002 "Loading %1 for %2 %3b"
         (LIST |fullLibName| |kind| |cname|))))
      (|load_quietly| |fullLibName|)
      (|clearConstructorCache| |cname|)
      (MAKEPROP |cname| 'LOADED |fullLibName|)))))

; loadLibNoUpdate(cname, fullLibName) ==
;     startTimingProcess 'load
;     loadLibNoUpdate1(cname, fullLibName)
;     stopTimingProcess 'load

(DEFUN |loadLibNoUpdate| (|cname| |fullLibName|)
  (PROG ()
    (RETURN
     (PROGN
      (|startTimingProcess| '|load|)
      (|loadLibNoUpdate1| |cname| |fullLibName|)
      (|stopTimingProcess| '|load|)))))

; convertOpAlist2compilerInfo(opalist) ==
;    "append"/[[formatSig(op,sig) for sig in siglist]
;                 for [op,:siglist] in opalist] where
;       formatSig(op, [typelist, slot,:stuff]) ==
;           pred := if stuff then first stuff else 'T
;           impl := if rest stuff then CADR stuff else 'ELT -- handles 'CONST
;           [[op, typelist], pred, [impl, '%, slot]]

(DEFUN |convertOpAlist2compilerInfo| (|opalist|)
  (PROG (|op| |siglist|)
    (RETURN
     ((LAMBDA (|bfVar#5| |bfVar#4| |bfVar#3|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#4|) (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
           (RETURN |bfVar#5|))
          (#1='T
           (AND (CONSP |bfVar#3|)
                (PROGN
                 (SETQ |op| (CAR |bfVar#3|))
                 (SETQ |siglist| (CDR |bfVar#3|))
                 #1#)
                (SETQ |bfVar#5|
                        (APPEND |bfVar#5|
                                ((LAMBDA (|bfVar#2| |bfVar#1| |sig|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#1|)
                                          (PROGN
                                           (SETQ |sig| (CAR |bfVar#1|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#2|)))
                                     (#1#
                                      (SETQ |bfVar#2|
                                              (CONS
                                               (|convertOpAlist2compilerInfo,formatSig|
                                                |op| |sig|)
                                               |bfVar#2|))))
                                    (SETQ |bfVar#1| (CDR |bfVar#1|))))
                                 NIL |siglist| NIL))))))
         (SETQ |bfVar#4| (CDR |bfVar#4|))))
      NIL |opalist| NIL))))
(DEFUN |convertOpAlist2compilerInfo,formatSig| (|op| |bfVar#6|)
  (PROG (|typelist| |slot| |stuff| |pred| |impl|)
    (RETURN
     (PROGN
      (SETQ |typelist| (CAR |bfVar#6|))
      (SETQ |slot| (CADR . #1=(|bfVar#6|)))
      (SETQ |stuff| (CDDR . #1#))
      (SETQ |pred| (COND (|stuff| (CAR |stuff|)) (#2='T 'T)))
      (SETQ |impl| (COND ((CDR |stuff|) (CADR |stuff|)) (#2# 'ELT)))
      (LIST (LIST |op| |typelist|) |pred| (LIST |impl| '% |slot|))))))

; updateCategoryFrameForConstructor(constructor) ==
;    opAlist := get_database(constructor, 'OPERATIONALIST)
;    [[dc, :sig], [pred, impl]] :=
;         get_database(constructor, 'CONSTRUCTORMODEMAP)
;    $CategoryFrame := put(constructor,'isFunctor,
;        convertOpAlist2compilerInfo(opAlist),
;        addModemap(constructor, dc, sig, pred, impl,
;            put(constructor, 'mode, ['Mapping,:sig], $CategoryFrame)))

(DEFUN |updateCategoryFrameForConstructor| (|constructor|)
  (PROG (|opAlist| |LETTMP#1| |dc| |sig| |pred| |impl|)
    (RETURN
     (PROGN
      (SETQ |opAlist| (|get_database| |constructor| 'OPERATIONALIST))
      (SETQ |LETTMP#1| (|get_database| |constructor| 'CONSTRUCTORMODEMAP))
      (SETQ |dc| (CAAR . #1=(|LETTMP#1|)))
      (SETQ |sig| (CDAR . #1#))
      (SETQ |pred| (CAADR . #2=(|LETTMP#1|)))
      (SETQ |impl| (CADADR . #2#))
      (SETQ |$CategoryFrame|
              (|put| |constructor| '|isFunctor|
               (|convertOpAlist2compilerInfo| |opAlist|)
               (|addModemap| |constructor| |dc| |sig| |pred| |impl|
                (|put| |constructor| '|mode| (CONS '|Mapping| |sig|)
                 |$CategoryFrame|))))))))

; loadFunctor u ==
;   null atom u => loadFunctor first u
;   loadLibIfNotLoaded u
;   u

(DEFUN |loadFunctor| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL (ATOM |u|)) (|loadFunctor| (CAR |u|)))
           ('T (PROGN (|loadLibIfNotLoaded| |u|) |u|))))))

; makeConstructorsAutoLoad() ==
;   for cnam in allConstructors() repeat
;     REMPROP(cnam,'LOADED)
;     systemDependentMkAutoload(cnam,cnam)

(DEFUN |makeConstructorsAutoLoad| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#7| |cnam|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#7|) (PROGN (SETQ |cnam| (CAR |bfVar#7|)) NIL))
           (RETURN NIL))
          ('T
           (PROGN
            (REMPROP |cnam| 'LOADED)
            (|systemDependentMkAutoload| |cnam| |cnam|))))
         (SETQ |bfVar#7| (CDR |bfVar#7|))))
      (|allConstructors|) NIL))))

; systemDependentMkAutoload(fn,cnam) ==
;     FBOUNDP(cnam) => "next"
;     asharpName := get_database(cnam, 'ASHARP?) =>
;          kind := get_database(cnam, 'CONSTRUCTORKIND)
;          cosig := get_database(cnam, 'COSIG)
;          file := get_database(cnam, 'OBJECT)
;          SET_-LIB_-FILE_-GETTER(file, cnam)
;          kind = 'category =>
;               ASHARPMKAUTOLOADCATEGORY(file, cnam, asharpName, cosig)
;          ASHARPMKAUTOLOADFUNCTOR(file, cnam, asharpName, cosig)
;     spad_set_autoload(cnam)

(DEFUN |systemDependentMkAutoload| (|fn| |cnam|)
  (PROG (|asharpName| |kind| |cosig| |file|)
    (RETURN
     (COND ((FBOUNDP |cnam|) '|next|)
           ((SETQ |asharpName| (|get_database| |cnam| 'ASHARP?))
            (PROGN
             (SETQ |kind| (|get_database| |cnam| 'CONSTRUCTORKIND))
             (SETQ |cosig| (|get_database| |cnam| 'COSIG))
             (SETQ |file| (|get_database| |cnam| 'OBJECT))
             (SET-LIB-FILE-GETTER |file| |cnam|)
             (COND
              ((EQ |kind| '|category|)
               (ASHARPMKAUTOLOADCATEGORY |file| |cnam| |asharpName| |cosig|))
              (#1='T
               (ASHARPMKAUTOLOADFUNCTOR |file| |cnam| |asharpName| |cosig|)))))
           (#1# (|spad_set_autoload| |cnam|))))))

; autoLoad(cname) ==
;   if not GET(cname, 'LOADED) then
;       FMAKUNBOUND cname
;       loadLib cname

(DEFUN |autoLoad| (|cname|)
  (PROG ()
    (RETURN
     (COND
      ((NULL (GET |cname| 'LOADED)) (FMAKUNBOUND |cname|)
       (|loadLib| |cname|))))))

; compDefineLisplib(df:=["DEF",[op,:.],:.],m,e,prefix,fal,fn) ==
;   --fn= compDefineCategory OR compDefineFunctor
;   sayMSG(filler_chars(72, '"-"))
;   $LISPLIB: local := 'T
;   $op: local := op
;   $lisplibPredicates: local := NIL -- set by makePredicateBitVector
;   $lisplibForm: local := NIL
;   $lisplibKind: local := NIL
;   $lisplibAbbreviation: local := NIL
;   $lisplibAncestors: local := NIL
;   $lisplibModemap: local := NIL
;   $lisplibModemapAlist: local := NIL
;   $lisplibOperationAlist: local := NIL
;   $lisplibSuperDomain: local := NIL
;   $libFile: local := NIL
;   $lisplibCategory: local := nil
;   $compiler_output_stream : local := nil
;   --for categories, is rhs of definition; otherwise, is target of functor
;   --will eventually become the "constructorCategory" property in lisplib
;   --set in compDefineCategory1 if category, otherwise in finalizeLisplib
;   libName := getConstructorAbbreviation op
;   name := SNAME(libName)
;   sayMSG ['"   initializing ",$spadLibFT,:bright libName,
;     '"for",:bright op]
;   -- following guarantee's compiler output files get closed.
;   UNWIND_-PROTECT(
;       PROGN(initializeLisplib(name),
;             sayMSG ['"   compiling into ", $spadLibFT, :bright libName],
;             res := FUNCALL(fn, df, m, e, prefix, fal),
;             sayMSG ['"   finalizing ",$spadLibFT,:bright libName],
;             finalizeLisplib($libFile)),
;       PROGN(if $compiler_output_stream then CLOSE($compiler_output_stream),
;             kaf_close($libFile)))
;   lisplibDoRename(name)
;   if not($no_lisp_compile) then
;       compile_lib(make_filename2(name, $spadLibFT))
;   FRESH_-LINE(get_algebra_stream())
;   sayMSG(filler_chars(72, '"-"))
;   if $bootstrap_db then
;       merge_constructor_info()
;   else
;       merge_info_from_objects([get_database(op, 'ABBREVIATION)], [], false)
;   res

(DEFUN |compDefineLisplib| (|df| |m| |e| |prefix| |fal| |fn|)
  (PROG (|$compiler_output_stream| |$lisplibCategory| |$libFile|
         |$lisplibSuperDomain| |$lisplibOperationAlist| |$lisplibModemapAlist|
         |$lisplibModemap| |$lisplibAncestors| |$lisplibAbbreviation|
         |$lisplibKind| |$lisplibForm| |$lisplibPredicates| |$op| $LISPLIB
         |res| |name| |libName| |op|)
    (DECLARE
     (SPECIAL |$compiler_output_stream| |$lisplibCategory| |$libFile|
      |$lisplibSuperDomain| |$lisplibOperationAlist| |$lisplibModemapAlist|
      |$lisplibModemap| |$lisplibAncestors| |$lisplibAbbreviation|
      |$lisplibKind| |$lisplibForm| |$lisplibPredicates| |$op| $LISPLIB))
    (RETURN
     (PROGN
      (SETQ |op| (CAADR |df|))
      (|sayMSG| (|filler_chars| 72 "-"))
      (SETQ $LISPLIB 'T)
      (SETQ |$op| |op|)
      (SETQ |$lisplibPredicates| NIL)
      (SETQ |$lisplibForm| NIL)
      (SETQ |$lisplibKind| NIL)
      (SETQ |$lisplibAbbreviation| NIL)
      (SETQ |$lisplibAncestors| NIL)
      (SETQ |$lisplibModemap| NIL)
      (SETQ |$lisplibModemapAlist| NIL)
      (SETQ |$lisplibOperationAlist| NIL)
      (SETQ |$lisplibSuperDomain| NIL)
      (SETQ |$libFile| NIL)
      (SETQ |$lisplibCategory| NIL)
      (SETQ |$compiler_output_stream| NIL)
      (SETQ |libName| (|getConstructorAbbreviation| |op|))
      (SETQ |name| (SNAME |libName|))
      (|sayMSG|
       (CONS "   initializing "
             (CONS |$spadLibFT|
                   (APPEND (|bright| |libName|)
                           (CONS "for" (|bright| |op|))))))
      (UNWIND-PROTECT
          (PROGN
           (|initializeLisplib| |name|)
           (|sayMSG|
            (CONS "   compiling into "
                  (CONS |$spadLibFT| (|bright| |libName|))))
           (SETQ |res| (FUNCALL |fn| |df| |m| |e| |prefix| |fal|))
           (|sayMSG|
            (CONS "   finalizing " (CONS |$spadLibFT| (|bright| |libName|))))
           (|finalizeLisplib| |$libFile|))
        (PROGN
         (COND (|$compiler_output_stream| (CLOSE |$compiler_output_stream|)))
         (|kaf_close| |$libFile|)))
      (|lisplibDoRename| |name|)
      (COND
       ((NULL |$no_lisp_compile|)
        (|compile_lib| (|make_filename2| |name| |$spadLibFT|))))
      (FRESH-LINE (|get_algebra_stream|))
      (|sayMSG| (|filler_chars| 72 "-"))
      (COND (|$bootstrap_db| (|merge_constructor_info|))
            ('T
             (|merge_info_from_objects|
              (LIST (|get_database| |op| 'ABBREVIATION)) NIL NIL)))
      |res|))))

; initializeLisplib libName ==
;   erase_lib0(libName, '"erlib")
;   $libFile:= writeLib0(libName,'"erlib")
;   $compiler_output_stream := make_compiler_output_stream($libFile, libName)

(DEFUN |initializeLisplib| (|libName|)
  (PROG ()
    (RETURN
     (PROGN
      (|erase_lib0| |libName| "erlib")
      (SETQ |$libFile| (|writeLib0| |libName| "erlib"))
      (SETQ |$compiler_output_stream|
              (|make_compiler_output_stream| |$libFile| |libName|))))))

; finalizeLisplib(libFile) ==
;   lisplibWrite('"constructorForm", removeZeroOne($lisplibForm), libFile)
;   lisplibWrite('"constructorKind", kind := $lisplibKind, libFile)
;   lisplibWrite('"constructorModemap", removeZeroOne($lisplibModemap), libFile)
;   $lisplibCategory:= $lisplibCategory or $lisplibModemap.mmTarget
;   -- set to target of modemap for package/domain constructors;
;   -- to the right-hand sides (the definition) for category constructors
;   lisplibWrite('"constructorCategory", removeZeroOne($lisplibCategory),
;                libFile)
;   lisplibWrite('"sourceFile", $edit_file, libFile)
;   lisplibWrite('"modemaps", removeZeroOne($lisplibModemapAlist), libFile)
;   ops := getConstructorOps($lisplibForm, kind)
;   lisplibWrite('"operationAlist", removeZeroOne(ops), libFile)
;   lisplibWrite('"superDomain", removeZeroOne($lisplibSuperDomain), libFile)
;   lisplibWrite('"predicates", removeZeroOne($lisplibPredicates), libFile)
;   lisplibWrite('"abbreviation", $lisplibAbbreviation, libFile)
;   lisplibWrite('"ancestors", removeZeroOne($lisplibAncestors), libFile)
;   lisplibWrite('"documentation", finalizeDocumentation(), libFile)

(DEFUN |finalizeLisplib| (|libFile|)
  (PROG (|kind| |ops|)
    (RETURN
     (PROGN
      (|lisplibWrite| "constructorForm" (|removeZeroOne| |$lisplibForm|)
       |libFile|)
      (|lisplibWrite| "constructorKind" (SETQ |kind| |$lisplibKind|) |libFile|)
      (|lisplibWrite| "constructorModemap" (|removeZeroOne| |$lisplibModemap|)
       |libFile|)
      (SETQ |$lisplibCategory|
              (OR |$lisplibCategory| (CADAR |$lisplibModemap|)))
      (|lisplibWrite| "constructorCategory"
       (|removeZeroOne| |$lisplibCategory|) |libFile|)
      (|lisplibWrite| "sourceFile" |$edit_file| |libFile|)
      (|lisplibWrite| "modemaps" (|removeZeroOne| |$lisplibModemapAlist|)
       |libFile|)
      (SETQ |ops| (|getConstructorOps| |$lisplibForm| |kind|))
      (|lisplibWrite| "operationAlist" (|removeZeroOne| |ops|) |libFile|)
      (|lisplibWrite| "superDomain" (|removeZeroOne| |$lisplibSuperDomain|)
       |libFile|)
      (|lisplibWrite| "predicates" (|removeZeroOne| |$lisplibPredicates|)
       |libFile|)
      (|lisplibWrite| "abbreviation" |$lisplibAbbreviation| |libFile|)
      (|lisplibWrite| "ancestors" (|removeZeroOne| |$lisplibAncestors|)
       |libFile|)
      (|lisplibWrite| "documentation" (|finalizeDocumentation|) |libFile|)))))

; lisplibDoRename(libName) ==
;     replace_lib(make_filename2(libName, '"erlib"),
;                 make_filename2(libName, $spadLibFT))

(DEFUN |lisplibDoRename| (|libName|)
  (PROG ()
    (RETURN
     (|replace_lib| (|make_filename2| |libName| "erlib")
      (|make_filename2| |libName| |$spadLibFT|)))))

; lisplibError(cname,fname,type,cn,fn,typ,error) ==
;   $bootStrapMode and error = "wrongType" => nil
;   sayMSG bright ['"  Illegal ",$spadLibFT]
;   error in '(duplicateAbb  wrongType) =>
;     say_msg("S2IL0007", CONCAT(
;         '"%1b claims that its constructor name is the %2 %3b but %3b is",
;         '" already known to be the %d for %4 %5b .:"),
;         [[fname,$spadLibFT], type, cname, typ, cn])
;   error is 'abbIsName =>
;       throw_msg("S2IL0008",
;           '"%1b is the name of a %2 constructor from %3b .",
;           [fname, typ, [fn,$spadLibFT]])

(DEFUN |lisplibError| (|cname| |fname| |type| |cn| |fn| |typ| |error|)
  (PROG ()
    (RETURN
     (COND ((AND |$bootStrapMode| (EQ |error| '|wrongType|)) NIL)
           ('T
            (PROGN
             (|sayMSG| (|bright| (LIST "  Illegal " |$spadLibFT|)))
             (COND
              ((|member| |error| '(|duplicateAbb| |wrongType|))
               (|say_msg| 'S2IL0007
                (CONCAT
                 "%1b claims that its constructor name is the %2 %3b but %3b is"
                 " already known to be the %d for %4 %5b .:")
                (LIST (LIST |fname| |$spadLibFT|) |type| |cname| |typ| |cn|)))
              ((EQ |error| '|abbIsName|)
               (|throw_msg| 'S2IL0008
                "%1b is the name of a %2 constructor from %3b ."
                (LIST |fname| |typ| (LIST |fn| |$spadLibFT|)))))))))))

; getPartialConstructorModemapSig(c) ==
;     (s := getConstructorSignature(c)) => rest(s)
;     throw_msg_unknown_type(c, true)

(DEFUN |getPartialConstructorModemapSig| (|c|)
  (PROG (|s|)
    (RETURN
     (COND ((SETQ |s| (|getConstructorSignature| |c|)) (CDR |s|))
           ('T (|throw_msg_unknown_type| |c| T))))))

; getConstructorOps(form, kind) ==
;     kind is 'category => getCategoryOps(form)
;     getFunctorOps(form)

(DEFUN |getConstructorOps| (|form| |kind|)
  (PROG ()
    (RETURN
     (COND ((EQ |kind| '|category|) (|getCategoryOps| |form|))
           ('T (|getFunctorOps| |form|))))))

; getCategoryOps(catForm) ==
;     -- returns operations of first catForm
;     transformOperationAlist getSlot1FromCategoryForm(catForm)

(DEFUN |getCategoryOps| (|catForm|)
  (PROG ()
    (RETURN
     (|transformOperationAlist| (|getSlot1FromCategoryForm| |catForm|)))))

; getFunctorOps(form) ==
;     transformOperationAlist $lisplibOperationAlist

(DEFUN |getFunctorOps| (|form|)
  (PROG () (RETURN (|transformOperationAlist| |$lisplibOperationAlist|))))

; transformOperationAlist operationAlist ==
;   --  this transforms the operationAlist which is written out onto LISPLIBs.
;   --  The original form of this list is a list of items of the form:
;   --        ((<op> <signature>) <condition> (ELT $ n))
;   --  The new form is an op-Alist which has entries (<op> . signature-Alist)
;   --      where signature-Alist has entries (<signature> . item)
;   --        where item has form (<slotNumber> <condition> <kind>)
;   --          where <kind> =
;   --             NIL  => function
;   --             CONST => constant ... and others
;   newAlist:= nil
;   for [[op, sig], condition, implementation] in operationAlist repeat
;     kind:=
;       implementation is [eltEtc,.,n] and eltEtc in '(CONST ELT) => eltEtc
;       implementation is [impOp,:.] =>
;         impOp = 'XLAM => implementation
;         impOp = CONST => impOp
;         system_error("S2IL0025", '"Unexpected type of entry in domain: %1s",
;                      [impOp])
;       implementation = 'mkRecord => 'mkRecord
;       system_error("S2IL0025", '"Unexpected type of entry in domain: %1s",
;                    [implementation])
;     signatureItem:=
;       if u:= assoc([op,sig],$functionLocations) then n := [n,:rest u]
;       kind = 'ELT =>
;         condition = 'T => [sig,n]
;         [sig,n,condition]
;       [sig,n,condition,kind]
;     itemList := insert(signatureItem, QLASSQ(op, newAlist))
;     newAlist:= insertAlist(op,itemList,newAlist)
;   newAlist

(DEFUN |transformOperationAlist| (|operationAlist|)
  (PROG (|newAlist| |ISTMP#1| |op| |ISTMP#2| |sig| |ISTMP#3| |condition|
         |ISTMP#4| |implementation| |eltEtc| |n| |impOp| |kind| |u|
         |signatureItem| |itemList|)
    (RETURN
     (PROGN
      (SETQ |newAlist| NIL)
      ((LAMBDA (|bfVar#9| |bfVar#8|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |bfVar#8| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#8|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |bfVar#8|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |op| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |sig| (CAR |ISTMP#2|)) #1#)))))
                 (PROGN
                  (SETQ |ISTMP#3| (CDR |bfVar#8|))
                  (AND (CONSP |ISTMP#3|)
                       (PROGN
                        (SETQ |condition| (CAR |ISTMP#3|))
                        (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                        (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                             (PROGN
                              (SETQ |implementation| (CAR |ISTMP#4|))
                              #1#)))))
                 (PROGN
                  (SETQ |kind|
                          (COND
                           ((AND (CONSP |implementation|)
                                 (PROGN
                                  (SETQ |eltEtc| (CAR |implementation|))
                                  (SETQ |ISTMP#1| (CDR |implementation|))
                                  (AND (CONSP |ISTMP#1|)
                                       (PROGN
                                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                        (AND (CONSP |ISTMP#2|)
                                             (EQ (CDR |ISTMP#2|) NIL)
                                             (PROGN
                                              (SETQ |n| (CAR |ISTMP#2|))
                                              #1#)))))
                                 (|member| |eltEtc| '(CONST ELT)))
                            |eltEtc|)
                           ((AND (CONSP |implementation|)
                                 (PROGN
                                  (SETQ |impOp| (CAR |implementation|))
                                  #1#))
                            (COND ((EQ |impOp| 'XLAM) |implementation|)
                                  ((EQUAL |impOp| CONST) |impOp|)
                                  (#1#
                                   (|system_error| 'S2IL0025
                                    "Unexpected type of entry in domain: %1s"
                                    (LIST |impOp|)))))
                           ((EQ |implementation| '|mkRecord|) '|mkRecord|)
                           (#1#
                            (|system_error| 'S2IL0025
                             "Unexpected type of entry in domain: %1s"
                             (LIST |implementation|)))))
                  (SETQ |signatureItem|
                          (PROGN
                           (COND
                            ((SETQ |u|
                                     (|assoc| (LIST |op| |sig|)
                                      |$functionLocations|))
                             (SETQ |n| (CONS |n| (CDR |u|)))))
                           (COND
                            ((EQ |kind| 'ELT)
                             (COND ((EQ |condition| 'T) (LIST |sig| |n|))
                                   (#1# (LIST |sig| |n| |condition|))))
                            (#1# (LIST |sig| |n| |condition| |kind|)))))
                  (SETQ |itemList|
                          (|insert| |signatureItem| (QLASSQ |op| |newAlist|)))
                  (SETQ |newAlist|
                          (|insertAlist| |op| |itemList| |newAlist|))))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       |operationAlist| NIL)
      |newAlist|))))

; getConstructorModemap form ==
;     get_database(opOf(form), 'CONSTRUCTORMODEMAP)

(DEFUN |getConstructorModemap| (|form|)
  (PROG () (RETURN (|get_database| (|opOf| |form|) 'CONSTRUCTORMODEMAP))))

; getConstructorSignature form ==
;   (mm := get_database(opOf(form), 'CONSTRUCTORMODEMAP)) =>
;     [[.,:sig],:.] := mm
;     sig
;   NIL

(DEFUN |getConstructorSignature| (|form|)
  (PROG (|mm| |sig|)
    (RETURN
     (COND
      ((SETQ |mm| (|get_database| (|opOf| |form|) 'CONSTRUCTORMODEMAP))
       (PROGN (SETQ |sig| (CDAR |mm|)) |sig|))
      ('T NIL)))))

; getSlot1FromCategoryForm ([op, :argl]) ==
;   u:= eval [op,:MAPCAR('MKQ,TAKE(#argl,$FormalMapVariableList))]
;   null VECP u =>
;     systemErrorHere '"getSlot1FromCategoryForm"
;   u.1

(DEFUN |getSlot1FromCategoryForm| (|bfVar#10|)
  (PROG (|op| |argl| |u|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#10|))
      (SETQ |argl| (CDR |bfVar#10|))
      (SETQ |u|
              (|eval|
               (CONS |op|
                     (MAPCAR 'MKQ
                             (TAKE (LENGTH |argl|)
                              |$FormalMapVariableList|)))))
      (COND ((NULL (VECP |u|)) (|systemErrorHere| "getSlot1FromCategoryForm"))
            ('T (ELT |u| 1)))))))

; mkEvalableCategoryForm(c, e) ==       --from DEFINE
;   c is [op,:argl] =>
;     op="Join" =>
;         nargs := [mkEvalableCategoryForm(x, e) or return nil for x in argl]
;         nargs => ["JoinInner", ["LIST", :nargs]]
;     op is "DomainSubstitutionMacro" =>
;         mkEvalableCategoryForm(CADR argl, e)
;     op is "mkCategory" => c
;     MEMQ(op,$CategoryNames) =>
;         [x, m, e] := compOrCroak(c, $EmptyMode, e)
;         m=$Category => optFunctorBody x
;     get_database(op, 'CONSTRUCTORKIND) = 'category or
;       get(op,"isCategory",$CategoryFrame) =>
;         [op,:[quotifyCategoryArgument x for x in argl]]
;     [x, m, e] := compOrCroak(c, $EmptyMode, e)
;     m=$Category => x
;   MKQ c

(DEFUN |mkEvalableCategoryForm| (|c| |e|)
  (PROG (|op| |argl| |nargs| |LETTMP#1| |x| |m|)
    (RETURN
     (COND
      ((AND (CONSP |c|)
            (PROGN (SETQ |op| (CAR |c|)) (SETQ |argl| (CDR |c|)) #1='T))
       (COND
        ((EQ |op| '|Join|)
         (PROGN
          (SETQ |nargs|
                  ((LAMBDA (|bfVar#12| |bfVar#11| |x|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#11|)
                            (PROGN (SETQ |x| (CAR |bfVar#11|)) NIL))
                        (RETURN (NREVERSE |bfVar#12|)))
                       (#1#
                        (SETQ |bfVar#12|
                                (CONS
                                 (OR (|mkEvalableCategoryForm| |x| |e|)
                                     (RETURN NIL))
                                 |bfVar#12|))))
                      (SETQ |bfVar#11| (CDR |bfVar#11|))))
                   NIL |argl| NIL))
          (COND (|nargs| (LIST '|JoinInner| (CONS 'LIST |nargs|))))))
        ((EQ |op| '|DomainSubstitutionMacro|)
         (|mkEvalableCategoryForm| (CADR |argl|) |e|))
        ((EQ |op| '|mkCategory|) |c|)
        ((MEMQ |op| |$CategoryNames|)
         (PROGN
          (SETQ |LETTMP#1| (|compOrCroak| |c| |$EmptyMode| |e|))
          (SETQ |x| (CAR |LETTMP#1|))
          (SETQ |m| (CADR . #2=(|LETTMP#1|)))
          (SETQ |e| (CADDR . #2#))
          (COND ((EQUAL |m| |$Category|) (|optFunctorBody| |x|)))))
        ((OR (EQ (|get_database| |op| 'CONSTRUCTORKIND) '|category|)
             (|get| |op| '|isCategory| |$CategoryFrame|))
         (CONS |op|
               ((LAMBDA (|bfVar#14| |bfVar#13| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#13|)
                         (PROGN (SETQ |x| (CAR |bfVar#13|)) NIL))
                     (RETURN (NREVERSE |bfVar#14|)))
                    (#1#
                     (SETQ |bfVar#14|
                             (CONS (|quotifyCategoryArgument| |x|)
                                   |bfVar#14|))))
                   (SETQ |bfVar#13| (CDR |bfVar#13|))))
                NIL |argl| NIL)))
        (#1#
         (PROGN
          (SETQ |LETTMP#1| (|compOrCroak| |c| |$EmptyMode| |e|))
          (SETQ |x| (CAR |LETTMP#1|))
          (SETQ |m| (CADR . #3=(|LETTMP#1|)))
          (SETQ |e| (CADDR . #3#))
          (COND ((EQUAL |m| |$Category|) |x|))))))
      (#1# (MKQ |c|))))))

; isDomainForm(D,e) ==
;   --added for MPOLY 3/83 by RDJ
;   MEMQ(IFCAR D, $SpecialDomainNames) or isFunctor D or
;     -- ((D is ['Mapping,target,:.]) and isCategoryForm(target)) or
;      ((getmode(D, e) is ['Mapping, target, :.]) and isCategoryForm(target)) or
;        isCategoryForm(getmode(D, e)) or isDomainConstructorForm(D, e)

(DEFUN |isDomainForm| (D |e|)
  (PROG (|ISTMP#1| |ISTMP#2| |target|)
    (RETURN
     (OR (MEMQ (IFCAR D) |$SpecialDomainNames|) (|isFunctor| D)
         (AND
          (PROGN
           (SETQ |ISTMP#1| (|getmode| D |e|))
           (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
                (PROGN
                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|)
                      (PROGN (SETQ |target| (CAR |ISTMP#2|)) 'T)))))
          (|isCategoryForm| |target|))
         (|isCategoryForm| (|getmode| D |e|))
         (|isDomainConstructorForm| D |e|)))))

; isDomainConstructorForm(D,e) ==
;   D is [op,:argl] and (u:= get(op,"value",e)) and
;     u is [.,["Mapping",target,:.],:.] and
;       isCategoryForm(EQSUBSTLIST(argl, $FormalMapVariableList, target))

(DEFUN |isDomainConstructorForm| (D |e|)
  (PROG (|op| |argl| |u| |ISTMP#1| |ISTMP#2| |ISTMP#3| |target|)
    (RETURN
     (AND (CONSP D) (PROGN (SETQ |op| (CAR D)) (SETQ |argl| (CDR D)) #1='T)
          (SETQ |u| (|get| |op| '|value| |e|)) (CONSP |u|)
          (PROGN
           (SETQ |ISTMP#1| (CDR |u|))
           (AND (CONSP |ISTMP#1|)
                (PROGN
                 (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Mapping|)
                      (PROGN
                       (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                       (AND (CONSP |ISTMP#3|)
                            (PROGN (SETQ |target| (CAR |ISTMP#3|)) #1#)))))))
          (|isCategoryForm|
           (EQSUBSTLIST |argl| |$FormalMapVariableList| |target|))))))

; isFunctor(x) ==
;     op := opOf(x)
;     not(IDENTP(op)) => false
;     -- logically wrong, but the compiler expects this
;     op = "Mapping" => false
;     MEMQ(op, '(Record SubDomain Union)) => true
;     $InteractiveMode =>
;         MEMQ(get_database(op, 'CONSTRUCTORKIND), '(domain package))
;     not(MEMQ(get_database(op, 'CONSTRUCTORKIND), '(domain package))) => false
;     u := get(op,'isFunctor,$CategoryFrame) => u
;     updateCategoryFrameForConstructor(op)
;     get(op, 'isFunctor, $CategoryFrame)

(DEFUN |isFunctor| (|x|)
  (PROG (|op| |u|)
    (RETURN
     (PROGN
      (SETQ |op| (|opOf| |x|))
      (COND ((NULL (IDENTP |op|)) NIL) ((EQ |op| '|Mapping|) NIL)
            ((MEMQ |op| '(|Record| |SubDomain| |Union|)) T)
            (|$InteractiveMode|
             (MEMQ (|get_database| |op| 'CONSTRUCTORKIND)
                   '(|domain| |package|)))
            ((NULL
              (MEMQ (|get_database| |op| 'CONSTRUCTORKIND)
                    '(|domain| |package|)))
             NIL)
            ((SETQ |u| (|get| |op| '|isFunctor| |$CategoryFrame|)) |u|)
            ('T
             (PROGN
              (|updateCategoryFrameForConstructor| |op|)
              (|get| |op| '|isFunctor| |$CategoryFrame|))))))))
