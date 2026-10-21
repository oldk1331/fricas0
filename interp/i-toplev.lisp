
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $interpOnly := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$interpOnly| NIL))

; DEFPARAMETER($QuietCommand, NIL)

(DEFPARAMETER |$QuietCommand| NIL)

; DEFPARAMETER($ProcessInteractiveValue, NIL)

(DEFPARAMETER |$ProcessInteractiveValue| NIL)

; DEFPARAMETER($QuietCommand_tmp, nil)

(DEFPARAMETER |$QuietCommand_tmp| NIL)

; intSetQuiet() ==
;   $QuietCommand_tmp := true

(DEFUN |intSetQuiet| () (PROG () (RETURN (SETQ |$QuietCommand_tmp| T))))

; intUnsetQuiet() ==
;   $QuietCommand_tmp := nil

(DEFUN |intUnsetQuiet| () (PROG () (RETURN (SETQ |$QuietCommand_tmp| NIL))))

; $relative_directory_list := '("share/msgs" "share/spadhelp")

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$relative_directory_list| '("share/msgs" "share/spadhelp")))

; $relative_library_directory_list := '("algebra")

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$relative_library_directory_list| '("algebra")))

; $directory_list := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$directory_list| NIL))

; $library_directory_list := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$library_directory_list| NIL))

; $spadroot := '""

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$spadroot| ""))

; make_absolute_filename(name) == append_directory_name($spadroot,name)

(DEFUN |make_absolute_filename| (|name|)
  (PROG () (RETURN (|append_directory_name| |$spadroot| |name|))))

; reroot(dir) ==
;     $spadroot := dir
;     $directory_list := MAPCAR(function make_absolute_filename,
;                               $relative_directory_list)
;     $library_directory_list := MAPCAR(function make_absolute_filename,
;                                       $relative_library_directory_list)

(DEFUN |reroot| (|dir|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$spadroot| |dir|)
      (SETQ |$directory_list|
              (MAPCAR #'|make_absolute_filename| |$relative_directory_list|))
      (SETQ |$library_directory_list|
              (MAPCAR #'|make_absolute_filename|
                      |$relative_library_directory_list|))))))

; initroot() ==
;     spadroot := getEnv('"FRICAS")
;     if not(spadroot) then
;         bin_parent_dir := STRCONC(file_directory(first(getCLArgs())),
;                                   '"/../")
;         if fricas_probe_file(STRCONC(bin_parent_dir, '"algebra/interp.daase"))
;         then spadroot := bin_parent_dir
;         else ERROR('"Environment variable FRICAS is not set!")
;     spadroot := fricas_probe_file(spadroot)
;     if spadroot then
;         reroot(trim_directory_name(NAMESTRING(spadroot)))
;     else
;         ERROR('"Environment variable FRICAS is not valid!")

(DEFUN |initroot| ()
  (PROG (|bin_parent_dir| |spadroot|)
    (RETURN
     (PROGN
      (SETQ |spadroot| (|getEnv| "FRICAS"))
      (COND
       ((NULL |spadroot|)
        (SETQ |bin_parent_dir|
                (STRCONC (|file_directory| (CAR (|getCLArgs|))) "/../"))
        (COND
         ((|fricas_probe_file|
           (STRCONC |bin_parent_dir| "algebra/interp.daase"))
          (SETQ |spadroot| |bin_parent_dir|))
         (#1='T (ERROR "Environment variable FRICAS is not set!")))))
      (SETQ |spadroot| (|fricas_probe_file| |spadroot|))
      (COND
       (|spadroot| (|reroot| (|trim_directory_name| (NAMESTRING |spadroot|))))
       (#1# (ERROR "Environment variable FRICAS is not valid!")))))))

; $trace_stream := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$trace_stream| NIL))

; CUROUTSTREAM := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ CUROUTSTREAM NIL))

; fricas_restart() ==
;     -- Need to reinitialize various streams because
;     -- CLISP closes them when dumping executable
;     CUROUTSTREAM := $trace_stream := get_lisp_std_out()
;     $algebra_out_rec.$stream_off := make_std_out_stream()
;     $fortran_out_rec.$stream_off := make_std_out_stream()
;     $mathml_out_rec.$stream_off := make_std_out_stream()
;     $texmacs_out_rec.$stream_off := make_std_out_stream()
;     $html_out_rec.$stream_off := make_std_out_stream()
;     $openmath_out_rec.$stream_off := make_std_out_stream()
;     $tex_out_rec.$stream_off := make_std_out_stream()
;     $formatted_out_rec.$stream_off := make_std_out_stream()
;     fricas_init()
;     fricas_restart2()

(DEFUN |fricas_restart| ()
  (PROG (CUROUTSTREAM)
    (RETURN
     (PROGN
      (SETQ CUROUTSTREAM (SETQ |$trace_stream| (|get_lisp_std_out|)))
      (SETF (ELT |$algebra_out_rec| |$stream_off|) (|make_std_out_stream|))
      (SETF (ELT |$fortran_out_rec| |$stream_off|) (|make_std_out_stream|))
      (SETF (ELT |$mathml_out_rec| |$stream_off|) (|make_std_out_stream|))
      (SETF (ELT |$texmacs_out_rec| |$stream_off|) (|make_std_out_stream|))
      (SETF (ELT |$html_out_rec| |$stream_off|) (|make_std_out_stream|))
      (SETF (ELT |$openmath_out_rec| |$stream_off|) (|make_std_out_stream|))
      (SETF (ELT |$tex_out_rec| |$stream_off|) (|make_std_out_stream|))
      (SETF (ELT |$formatted_out_rec| |$stream_off|) (|make_std_out_stream|))
      (|fricas_init|)
      (|fricas_restart2|)))))

; interpsysInitialization(display_messages) ==
;   -- The function "interpsysInitialization" begins the interpreter process,
;   -- reads in the profile and prints start-up messages.
;   $PrintCompilerMessageIfTrue: local := nil
;   resetWorkspaceVariables()
;   save_displayStartMsgs := $displayStartMsgs
;   if not(display_messages) then
;       $displayStartMsgs := display_messages
;   initHist()
;   initNewWorld()
;   open_interp_db(display_messages)
;   createInitializers()
;   init_msg := '"FriCAS initialization: %1b"
;   if $displayStartMsgs then say_msg("S2IZ0053", init_msg, ['"interpreter"])
;   initializeTimedNames()
;   $InteractiveFrame := makeInitialModemapFrame()
;   initializeInterpreterFrameRing()
;   setOutputAlgebra "%initialize%"
;   loadExposureGroupData()
;   if $displayStartMsgs then say_msg("S2IZ0053", init_msg, ['"database"])
;   if not $ruleSetsInitialized then initializeRuleSets()
;   if $displayStartMsgs then say_msg("S2IZ0053", init_msg, ['"constructors"])
;   makeConstructorsAutoLoad()
;   GCMSG(NIL)
;   SETQ($IOindex,1)
;   if $displayStartMsgs then say_msg("S2IZ0053", init_msg, ['"history"])
;   initHist()
;   if $displayStartMsgs then spadStartUpMsgs()
;   $superHash := MAKE_HASHTABLE('EQUAL)
;   $displayStartMsgs := save_displayStartMsgs

(DEFUN |interpsysInitialization| (|display_messages|)
  (PROG (|$PrintCompilerMessageIfTrue| |init_msg| |save_displayStartMsgs|)
    (DECLARE (SPECIAL |$PrintCompilerMessageIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$PrintCompilerMessageIfTrue| NIL)
      (|resetWorkspaceVariables|)
      (SETQ |save_displayStartMsgs| |$displayStartMsgs|)
      (COND
       ((NULL |display_messages|)
        (SETQ |$displayStartMsgs| |display_messages|)))
      (|initHist|)
      (|initNewWorld|)
      (|open_interp_db| |display_messages|)
      (|createInitializers|)
      (SETQ |init_msg| "FriCAS initialization: %1b")
      (COND
       (|$displayStartMsgs|
        (|say_msg| 'S2IZ0053 |init_msg| (LIST "interpreter"))))
      (|initializeTimedNames|)
      (SETQ |$InteractiveFrame| (|makeInitialModemapFrame|))
      (|initializeInterpreterFrameRing|)
      (|setOutputAlgebra| '|%initialize%|)
      (|loadExposureGroupData|)
      (COND
       (|$displayStartMsgs|
        (|say_msg| 'S2IZ0053 |init_msg| (LIST "database"))))
      (COND ((NULL |$ruleSetsInitialized|) (|initializeRuleSets|)))
      (COND
       (|$displayStartMsgs|
        (|say_msg| 'S2IZ0053 |init_msg| (LIST "constructors"))))
      (|makeConstructorsAutoLoad|)
      (GCMSG NIL)
      (SETQ |$IOindex| 1)
      (COND
       (|$displayStartMsgs| (|say_msg| 'S2IZ0053 |init_msg| (LIST "history"))))
      (|initHist|)
      (COND (|$displayStartMsgs| (|spadStartUpMsgs|)))
      (SETQ |$superHash| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$displayStartMsgs| |save_displayStartMsgs|)))))

; interpsys_restart() ==
;   $IOindex := 1
;   $InteractiveFrame := makeInitialModemapFrame()
;   loadExposureGroupData()
;   initHist()
;   initializeInterpreterFrameRing()
;   buildHtMacroTable()
;
;   if $displayStartMsgs then spadStartUpMsgs()
;   $currentLine := nil
;   -- open databases
;   open_interp_db(true)
;   open_operation_db(true)
;   open_category_db(true)
;   open_browse_db(true)
;   makeConstructorsAutoLoad()
;   createInitializers2()

(DEFUN |interpsys_restart| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$IOindex| 1)
      (SETQ |$InteractiveFrame| (|makeInitialModemapFrame|))
      (|loadExposureGroupData|)
      (|initHist|)
      (|initializeInterpreterFrameRing|)
      (|buildHtMacroTable|)
      (COND (|$displayStartMsgs| (|spadStartUpMsgs|)))
      (SETQ |$currentLine| NIL)
      (|open_interp_db| T)
      (|open_operation_db| T)
      (|open_category_db| T)
      (|open_browse_db| T)
      (|makeConstructorsAutoLoad|)
      (|createInitializers2|)))))

; readSpadProfileIfThere() ==
;   -- reads SPADPROF INPUT if it exists
;   file := getEnv('"FRICAS_INITFILE")
;   file = '"" => nil
;   efile :=
;         file and (fn := make_input_filename1(file)) => fn
;         fn := make_input_filename2('"_.fricas", '"input") => fn
;         fn := make_input_filename2('"_.axiom", '"input") => fn
;         nil
;   efile =>
;     $edit_file := efile
;     read_or_compile(true, efile)
;   NIL

(DEFUN |readSpadProfileIfThere| ()
  (PROG (|efile| |fn| |file|)
    (RETURN
     (PROGN
      (SETQ |file| (|getEnv| "FRICAS_INITFILE"))
      (COND ((EQUAL |file| "") NIL)
            (#1='T
             (PROGN
              (SETQ |efile|
                      (COND
                       ((AND |file|
                             (SETQ |fn| (|make_input_filename1| |file|)))
                        |fn|)
                       ((SETQ |fn| (|make_input_filename2| ".fricas" "input"))
                        |fn|)
                       ((SETQ |fn| (|make_input_filename2| ".axiom" "input"))
                        |fn|)
                       (#1# NIL)))
              (COND
               (|efile|
                (PROGN
                 (SETQ |$edit_file| |efile|)
                 (|read_or_compile| T |efile|)))
               (#1# NIL)))))))))

; DEFPARAMETER($inRetract, nil)

(DEFPARAMETER |$inRetract| NIL)

; processInteractive(form, posnForm) ==
;     $timedNameStack : local := NIL
;     $statsInfo : local := NIL
;     -- no need to collect stats if we are not going to print them.
;     if $printStorageIfTrue or $printTimeIfTrue then
;         initializeTimedStack()
;     finally(
;         object := processInteractive0(form, posnForm),
;           while $timedNameStack repeat stopTimingProcess peekTimedName())
;     object

(DEFUN |processInteractive| (|form| |posnForm|)
  (PROG (|$statsInfo| |$timedNameStack| |object|)
    (DECLARE (SPECIAL |$statsInfo| |$timedNameStack|))
    (RETURN
     (PROGN
      (SETQ |$timedNameStack| NIL)
      (SETQ |$statsInfo| NIL)
      (COND
       ((OR |$printStorageIfTrue| |$printTimeIfTrue|)
        (|initializeTimedStack|)))
      (|finally| (SETQ |object| (|processInteractive0| |form| |posnForm|))
       ((LAMBDA ()
          (LOOP
           (COND ((NOT |$timedNameStack|) (RETURN NIL))
                 ('T (|stopTimingProcess| (|peekTimedName|))))))))
      |object|))))

; processInteractive0(form, posnForm) ==
;   --  Top-level dispatcher for the interpreter.  It sets local variables
;   --  and then calls processInteractive1 to do most of the work.
;   --  This function receives the output from the parser.
;
;   $op: local:= (form is [op,:.] => op; form) --name of operator
;   $Coerce: local := NIL
;   $compErrorMessageStack:local := nil
;   $freeVars : local := NIL
;   $mapList:local := NIL            --list of maps being type analyzed
;   $compilingMap:local:= NIL        --true when compiling a map
;   $compilingLoop:local:= NIL       --true when compiling a loop body
;   $interpOnly: local := NIL        --true when in interpret only mode
;   $whereCacheList: local := NIL    --maps compiled because of where
;   $timeGlobalName: local := '$compTimeSum  --see incrementTimeSum
;   $declaredMode: local := NIL      --Weak type propagation for symbols
;   $localVars:local := NIL          --list of local variables in function
;   $analyzingMapList:local := NIL   --names of maps currently being
;                                    --analyzed
;   $instantCoerceCount: local := 0
;   $instantCanCoerceCount: local := 0
;   $instantMmCondCount: local := 0
;   $minivector: local := NIL
;   $domPvar: local := NIL
;   $inRetract: local := NIL
;   object := processInteractive1(form, posnForm)
;   if not($ProcessInteractiveValue) then
;     if $reportInstantiations = true then
;       reportInstantiations()
;       CLRHASH $instantRecord
;     writeHistModesAndValues()
;     updateHist()
;   if $printTimeIfTrue then printTime()
;   if $printStorageIfTrue then printStorage()
;   object

(DEFUN |processInteractive0| (|form| |posnForm|)
  (PROG (|$inRetract| |$domPvar| |$minivector| |$instantMmCondCount|
         |$instantCanCoerceCount| |$instantCoerceCount| |$analyzingMapList|
         |$localVars| |$declaredMode| |$timeGlobalName| |$whereCacheList|
         |$interpOnly| |$compilingLoop| |$compilingMap| |$mapList| |$freeVars|
         |$compErrorMessageStack| |$Coerce| |$op| |object| |op|)
    (DECLARE
     (SPECIAL |$inRetract| |$domPvar| |$minivector| |$instantMmCondCount|
      |$instantCanCoerceCount| |$instantCoerceCount| |$analyzingMapList|
      |$localVars| |$declaredMode| |$timeGlobalName| |$whereCacheList|
      |$interpOnly| |$compilingLoop| |$compilingMap| |$mapList| |$freeVars|
      |$compErrorMessageStack| |$Coerce| |$op|))
    (RETURN
     (PROGN
      (SETQ |$op|
              (COND
               ((AND (CONSP |form|) (PROGN (SETQ |op| (CAR |form|)) #1='T))
                |op|)
               (#1# |form|)))
      (SETQ |$Coerce| NIL)
      (SETQ |$compErrorMessageStack| NIL)
      (SETQ |$freeVars| NIL)
      (SETQ |$mapList| NIL)
      (SETQ |$compilingMap| NIL)
      (SETQ |$compilingLoop| NIL)
      (SETQ |$interpOnly| NIL)
      (SETQ |$whereCacheList| NIL)
      (SETQ |$timeGlobalName| '|$compTimeSum|)
      (SETQ |$declaredMode| NIL)
      (SETQ |$localVars| NIL)
      (SETQ |$analyzingMapList| NIL)
      (SETQ |$instantCoerceCount| 0)
      (SETQ |$instantCanCoerceCount| 0)
      (SETQ |$instantMmCondCount| 0)
      (SETQ |$minivector| NIL)
      (SETQ |$domPvar| NIL)
      (SETQ |$inRetract| NIL)
      (SETQ |object| (|processInteractive1| |form| |posnForm|))
      (COND
       ((NULL |$ProcessInteractiveValue|)
        (COND
         ((EQUAL |$reportInstantiations| T) (|reportInstantiations|)
          (CLRHASH |$instantRecord|)))
        (|writeHistModesAndValues|) (|updateHist|)))
      (COND (|$printTimeIfTrue| (|printTime|)))
      (COND (|$printStorageIfTrue| (|printStorage|)))
      |object|))))

; processInteractive1(form, posnForm) ==
;   -- calls the analysis and output printing routines
;   $e : local := $InteractiveFrame
;   recordFrame 'system
;
;   startTimingProcess 'analysis
;   object   := interpretTopLevel(form, posnForm)
;   stopTimingProcess 'analysis
;
;   startTimingProcess 'print
;   if not($ProcessInteractiveValue) then
;     recordAndPrint(objValUnwrap object,objMode object)
;   recordFrame 'normal
;   stopTimingProcess 'print
;
;   object

(DEFUN |processInteractive1| (|form| |posnForm|)
  (PROG (|$e| |object|)
    (DECLARE (SPECIAL |$e|))
    (RETURN
     (PROGN
      (SETQ |$e| |$InteractiveFrame|)
      (|recordFrame| '|system|)
      (|startTimingProcess| '|analysis|)
      (SETQ |object| (|interpretTopLevel| |form| |posnForm|))
      (|stopTimingProcess| '|analysis|)
      (|startTimingProcess| '|print|)
      (COND
       ((NULL |$ProcessInteractiveValue|)
        (|recordAndPrint| (|objValUnwrap| |object|) (|objMode| |object|))))
      (|recordFrame| '|normal|)
      (|stopTimingProcess| '|print|)
      |object|))))

; ncParseAndInterpretString s ==
;    processInteractive(parseFromString(s), nil)

(DEFUN |ncParseAndInterpretString| (|s|)
  (PROG () (RETURN (|processInteractive| (|parseFromString| |s|) NIL))))

; recordAndPrint(x,md) ==
;   --  Prints out the value x which is of type m, and records the changes
;   --  in environment $e into $InteractiveFrame
;   --  $printAnyIfTrue  is documented in setvart.boot. controlled with )se me any
;   if md = '(Any) and $printAnyIfTrue  then
;     md' := first  x
;     x' := rest x
;   else
;     x' := x
;     md' := md
;   mode:= (md=$EmptyMode => quadSch(); md)
;   if (md ~= $Void) or $printVoidIfTrue then
;     if null $collectOutput then TERPRI(get_algebra_stream())
;     if $QuietCommand = false then
;       output(x',md')
;   putHist('%,'value,objNewWrap(x,md),$e)
;   if $printTypeIfTrue then printType(x', md')
;   'done

(DEFUN |recordAndPrint| (|x| |md|)
  (PROG (|md'| |x'| |mode|)
    (RETURN
     (PROGN
      (COND
       ((AND (EQUAL |md| '(|Any|)) |$printAnyIfTrue|) (SETQ |md'| (CAR |x|))
        (SETQ |x'| (CDR |x|)))
       (#1='T (SETQ |x'| |x|) (SETQ |md'| |md|)))
      (SETQ |mode| (COND ((EQUAL |md| |$EmptyMode|) (|quadSch|)) (#1# |md|)))
      (COND
       ((OR (NOT (EQUAL |md| |$Void|)) |$printVoidIfTrue|)
        (COND ((NULL |$collectOutput|) (TERPRI (|get_algebra_stream|))))
        (COND ((NULL |$QuietCommand|) (|output| |x'| |md'|)))))
      (|putHist| '% '|value| (|objNewWrap| |x| |md|) |$e|)
      (COND (|$printTypeIfTrue| (|printType| |x'| |md'|)))
      '|done|))))

; printType(x, m) ==  -- m is the mode/type of the result
;   if m is ['Union, :argl] then
;     x' := retract(objNewWrap(x,m))
;     m' := objMode x'
;     m := ['Union, :[arg for arg in argl | sameUnionBranch(arg, m')], '"..."]
;   if $printTypeIfTrue then
;     type_msg := '"%rjon Type: %1 %rjoff"
;     type_string := outputDomainConstructor(m)
;     $collectOutput =>
;         $outputLines :=
;             [justifyMyType msgText(type_msg, [type_string]), :$outputLines]
;     ioHook("startType")
;     say_msg_local(type_msg, [type_string])
;     ioHook("endOfType")

(DEFUN |printType| (|x| |m|)
  (PROG (|argl| |x'| |m'| |type_msg| |type_string|)
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |m|) (EQ (CAR |m|) '|Union|)
             (PROGN (SETQ |argl| (CDR |m|)) #1='T))
        (SETQ |x'| (|retract| (|objNewWrap| |x| |m|)))
        (SETQ |m'| (|objMode| |x'|))
        (SETQ |m|
                (CONS '|Union|
                      (APPEND
                       ((LAMBDA (|bfVar#2| |bfVar#1| |arg|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#1|)
                                 (PROGN (SETQ |arg| (CAR |bfVar#1|)) NIL))
                             (RETURN (NREVERSE |bfVar#2|)))
                            (#1#
                             (AND (|sameUnionBranch| |arg| |m'|)
                                  (SETQ |bfVar#2| (CONS |arg| |bfVar#2|)))))
                           (SETQ |bfVar#1| (CDR |bfVar#1|))))
                        NIL |argl| NIL)
                       (CONS "..." NIL))))))
      (COND
       (|$printTypeIfTrue| (SETQ |type_msg| "%rjon Type: %1 %rjoff")
        (SETQ |type_string| (|outputDomainConstructor| |m|))
        (COND
         (|$collectOutput|
          (SETQ |$outputLines|
                  (CONS
                   (|justifyMyType|
                    (|msgText| |type_msg| (LIST |type_string|)))
                   |$outputLines|)))
         (#1#
          (PROGN
           (|ioHook| '|startType|)
           (|say_msg_local| |type_msg| (LIST |type_string|))
           (|ioHook| '|endOfType|))))))))))

; sameUnionBranch(uArg, m) ==
;   uArg is [":", ., t] => t = m
;   uArg = m

(DEFUN |sameUnionBranch| (|uArg| |m|)
  (PROG (|ISTMP#1| |ISTMP#2| |t|)
    (RETURN
     (COND
      ((AND (CONSP |uArg|) (EQ (CAR |uArg|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |uArg|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1='T))))))
       (EQUAL |t| |m|))
      (#1# (EQUAL |uArg| |m|))))))

; msgText(msg, args) ==
;   msg := segmentKeyedMsg(msg)
;   msg := substituteSegmentedMsg(msg,args)
;   msg := flowSegmentedMsg(msg,$LINELENGTH,$MARGIN)
;   concatenateStringList([STRINGIMAGE x for x in CDAR msg])

(DEFUN |msgText| (|msg| |args|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |msg| (|segmentKeyedMsg| |msg|))
      (SETQ |msg| (|substituteSegmentedMsg| |msg| |args|))
      (SETQ |msg| (|flowSegmentedMsg| |msg| $LINELENGTH $MARGIN))
      (|concatenateStringList|
       ((LAMBDA (|bfVar#4| |bfVar#3| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#3|) (PROGN (SETQ |x| (CAR |bfVar#3|)) NIL))
             (RETURN (NREVERSE |bfVar#4|)))
            ('T (SETQ |bfVar#4| (CONS (STRINGIMAGE |x|) |bfVar#4|))))
           (SETQ |bfVar#3| (CDR |bfVar#3|))))
        NIL (CDAR |msg|) NIL))))))

; justifyMyType(t) ==
;   len := #t
;   len > $LINELENGTH => t
;   CONCAT(filler_spaces($LINELENGTH - len), t)

(DEFUN |justifyMyType| (|t|)
  (PROG (|len|)
    (RETURN
     (PROGN
      (SETQ |len| (LENGTH |t|))
      (COND ((< $LINELENGTH |len|) |t|)
            ('T (CONCAT (|filler_spaces| (- $LINELENGTH |len|)) |t|)))))))

; typeTimePrin x ==
;   maprinSpecial(x,0,79)

(DEFUN |typeTimePrin| (|x|) (PROG () (RETURN (|maprinSpecial| |x| 0 79))))

; printTime() ==
;   $collectOutput or null $statsInfo => nil
;   s := makeLongTimeString($interpreterTimedNames, $interpreterTimedClasses)
;   ioHook("startTime")
;   say_msg_local('"%rjon Time: %1 %rjoff", [s])
;   ioHook("endOfTime")

(DEFUN |printTime| ()
  (PROG (|s|)
    (RETURN
     (COND ((OR |$collectOutput| (NULL |$statsInfo|)) NIL)
           ('T
            (PROGN
             (SETQ |s|
                     (|makeLongTimeString| |$interpreterTimedNames|
                      |$interpreterTimedClasses|))
             (|ioHook| '|startTime|)
             (|say_msg_local| "%rjon Time: %1 %rjoff" (LIST |s|))
             (|ioHook| '|endOfTime|)))))))

; printStorage() ==
;   $collectOutput or null $statsInfo => nil
;   storeString :=
;     makeLongSpaceString($interpreterTimedNames, $interpreterTimedClasses)
;   ioHook("startStorage")
;   say_msg_local('"%rjon Storage: %1 %rjoff", [storeString])
;   ioHook("endOfStorage")

(DEFUN |printStorage| ()
  (PROG (|storeString|)
    (RETURN
     (COND ((OR |$collectOutput| (NULL |$statsInfo|)) NIL)
           ('T
            (PROGN
             (SETQ |storeString|
                     (|makeLongSpaceString| |$interpreterTimedNames|
                      |$interpreterTimedClasses|))
             (|ioHook| '|startStorage|)
             (|say_msg_local| "%rjon Storage: %1 %rjoff" (LIST |storeString|))
             (|ioHook| '|endOfStorage|)))))))

; interpretTopLevel(x, posnForm) ==
;   --  Top level entry point from processInteractive1.  Sets up catch
;   --  for a thrown result
;   savedTimerStack := COPY $timedNameStack
;   c := CATCH('interpreter,interpret(x, posnForm))
;   while savedTimerStack ~= $timedNameStack repeat
;     stopTimingProcess peekTimedName()
;   c = 'tryAgain => interpretTopLevel(x, posnForm)
;   c

(DEFUN |interpretTopLevel| (|x| |posnForm|)
  (PROG (|savedTimerStack| |c|)
    (RETURN
     (PROGN
      (SETQ |savedTimerStack| (COPY |$timedNameStack|))
      (SETQ |c| (CATCH '|interpreter| (|interpret| |x| |posnForm|)))
      ((LAMBDA ()
         (LOOP
          (COND ((EQUAL |savedTimerStack| |$timedNameStack|) (RETURN NIL))
                (#1='T (|stopTimingProcess| (|peekTimedName|)))))))
      (COND ((EQ |c| '|tryAgain|) (|interpretTopLevel| |x| |posnForm|))
            (#1# |c|))))))

; interpret_in_new_env(x) ==
;     $e : local := [[[]]]
;     $localExposureData : local := COPY_-SEQ($localExposureDataDefault)
;     interpret(x, nil)

(DEFUN |interpret_in_new_env| (|x|)
  (PROG (|$localExposureData| |$e|)
    (DECLARE (SPECIAL |$localExposureData| |$e|))
    (RETURN
     (PROGN
      (SETQ |$e| (LIST (LIST NIL)))
      (SETQ |$localExposureData| (COPY-SEQ |$localExposureDataDefault|))
      (|interpret| |x| NIL)))))

; interpret(x, posnForm) ==
;   --type analyzes and evaluates expression x, returns object
;   $env:local := [[NIL]]
;   $genValue:local := true       --evaluate all generated code
;   $compilingMap : local := false
;   $definingMap : local := false
;   $minivector : local := NIL
;   $insideCompileBodyIfTrue : local := false
;   -- counter used to limit recursion depth during resolve
;   $resolve_level : local := 0
;   interpret1(x,nil,posnForm)

(DEFUN |interpret| (|x| |posnForm|)
  (PROG (|$resolve_level| |$insideCompileBodyIfTrue| |$minivector|
         |$definingMap| |$compilingMap| |$genValue| |$env|)
    (DECLARE
     (SPECIAL |$resolve_level| |$insideCompileBodyIfTrue| |$minivector|
      |$definingMap| |$compilingMap| |$genValue| |$env|))
    (RETURN
     (PROGN
      (SETQ |$env| (LIST (LIST NIL)))
      (SETQ |$genValue| T)
      (SETQ |$compilingMap| NIL)
      (SETQ |$definingMap| NIL)
      (SETQ |$minivector| NIL)
      (SETQ |$insideCompileBodyIfTrue| NIL)
      (SETQ |$resolve_level| 0)
      (|interpret1| |x| NIL |posnForm|)))))

; interpret1(x,rootMode,posnForm) ==
;   -- dispatcher for the type analysis routines.  type analyzes and
;   -- evaluates the expression x in the rootMode (if non-nil)
;   -- which may be $EmptyMode.  returns an object if evaluating, and a
;   -- modeset otherwise
;
;   -- create the attributed tree
;
;   node := mkAtreeWithSrcPos(x, posnForm)
;   if rootMode then putTarget(node,rootMode)
;
;   -- do type analysis and evaluation of expression.  The real guts
;
;   modeSet:= bottomUp node
;   newRootMode := (null rootMode => first modeSet ; rootMode)
;   argVal := getArgValue(node, newRootMode)
;   argVal and not $genValue => objNew(argVal, newRootMode)
;   argVal and (val:=getValue node) => interpret2(val,newRootMode,posnForm)
;   system_error("S2IS0053",
;       '"Interpreter code generation failed for expression %1s", [x])

(DEFUN |interpret1| (|x| |rootMode| |posnForm|)
  (PROG (|node| |modeSet| |newRootMode| |argVal| |val|)
    (RETURN
     (PROGN
      (SETQ |node| (|mkAtreeWithSrcPos| |x| |posnForm|))
      (COND (|rootMode| (|putTarget| |node| |rootMode|)))
      (SETQ |modeSet| (|bottomUp| |node|))
      (SETQ |newRootMode|
              (COND ((NULL |rootMode|) (CAR |modeSet|)) (#1='T |rootMode|)))
      (SETQ |argVal| (|getArgValue| |node| |newRootMode|))
      (COND
       ((AND |argVal| (NULL |$genValue|)) (|objNew| |argVal| |newRootMode|))
       ((AND |argVal| (SETQ |val| (|getValue| |node|)))
        (|interpret2| |val| |newRootMode| |posnForm|))
       (#1#
        (|system_error| 'S2IS0053
         "Interpreter code generation failed for expression %1s"
         (LIST |x|))))))))

; interpret2(object,m1,posnForm) ==
;   x := objVal object
;   m := objMode object
;   m=$EmptyMode =>
;     x is [op, :.]  and op in '(SPADMAP STREAM) => objNew(x, m1)
;     m1 = $EmptyMode => objNew(x,m)
;     systemErrorHere '"interpret2"
;   m1 =>
;     if (ans := coerceInteractive(object,m1)) then ans
;     else throwMsgCannotCoerceWithValue(x, m, m1)
;   object

(DEFUN |interpret2| (|object| |m1| |posnForm|)
  (PROG (|x| |m| |op| |ans|)
    (RETURN
     (PROGN
      (SETQ |x| (|objVal| |object|))
      (SETQ |m| (|objMode| |object|))
      (COND
       ((EQUAL |m| |$EmptyMode|)
        (COND
         ((AND (CONSP |x|) (PROGN (SETQ |op| (CAR |x|)) #1='T)
               (|member| |op| '(SPADMAP STREAM)))
          (|objNew| |x| |m1|))
         ((EQUAL |m1| |$EmptyMode|) (|objNew| |x| |m|))
         (#1# (|systemErrorHere| "interpret2"))))
       (|m1|
        (COND ((SETQ |ans| (|coerceInteractive| |object| |m1|)) |ans|)
              (#1# (|throwMsgCannotCoerceWithValue| |x| |m| |m1|))))
       (#1# |object|))))))
