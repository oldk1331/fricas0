
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $printTimeIfTrue := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$printTimeIfTrue| NIL))

; $frameMessages := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$frameMessages| NIL))

; $displayStartMsgs := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$displayStartMsgs| NIL))

; $localVars := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$localVars| NIL))

; $UserLevel := 'development

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$UserLevel| '|development|))

; $reportInstantiations := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$reportInstantiations| NIL))

; $reportEachInstantiation := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$reportEachInstantiation| NIL))

; $reportCounts := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$reportCounts| NIL))

; $doNotCompileJustPrint := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$doNotCompileJustPrint| NIL))

; $PrintCompilerMessageIfTrue := true

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$PrintCompilerMessageIfTrue| T))

; $Rep := "$Rep"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Rep| '|$Rep|))

; $scanIfTrue := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$scanIfTrue| NIL))

; $Representation := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Representation| NIL))

; $definition := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$definition| NIL))

; $env := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$env| NIL))

; $e := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$e| NIL))

; $getPutTrace := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$getPutTrace| NIL))

; MAKEPROP("~>", 'Led, ["~>", "~>", 122, 121])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG () (RETURN (MAKEPROP '~> '|Led| (LIST '~> '~> 122 121)))))

; MAKEPROP('EQUATNUM, 'Nud, ['dummy, 'dummy, 0, 0])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG () (RETURN (MAKEPROP 'EQUATNUM '|Nud| (LIST '|dummy| '|dummy| 0 0)))))

; MAKEPROP('EQUATNUM, 'Led, ['dummy, 'dummy, 10000, 0])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN (MAKEPROP 'EQUATNUM '|Led| (LIST '|dummy| '|dummy| 10000 0)))))

; MAKEPROP('LET, 'Led, [":=", "LET", 125, 124])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG () (RETURN (MAKEPROP 'LET '|Led| (LIST '|:=| 'LET 125 124)))))

; MAKEPROP('SEGMENT, 'Led, ["..", "SEGMENT", 401, 699, ["boot-Seg"]])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP 'SEGMENT '|Led|
      (LIST '|..| 'SEGMENT 401 699 (LIST '|boot-Seg|))))))

; MAKEPROP('SEGMENT, 'isSuffix, true)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG () (RETURN (MAKEPROP 'SEGMENT '|isSuffix| T))))

; $mutableDomains := []     -- checked in DEFINE BOOT

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$mutableDomains| NIL))

; $maxSignatureLineNumber := 0

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$maxSignatureLineNumber| 0))

; $functionLocations := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$functionLocations| NIL))

; $globalExposureGroupAlist := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$globalExposureGroupAlist| NIL))

; $localExposureDataDefault := VECTOR(['basic, 'categories], [], [])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$localExposureDataDefault|
          (VECTOR (LIST '|basic| '|categories|) NIL NIL)))

; $localExposureData := VECTOR(['basic, 'categories], [], [])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$localExposureData| (VECTOR (LIST '|basic| '|categories|) NIL NIL)))

; $ReadingFile := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$ReadingFile| NIL))

; $NonNullStream := '"NonNullStream"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NonNullStream| "NonNullStream"))

; $NullStream := '"NullStream"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NullStream| "NullStream"))

; $UninitializedStream := '"UninitializedStream"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$UninitializedStream| "UninitializedStream"))

; $SPAD_ERRORS  := VECTOR(0, 0, 0)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ $SPAD_ERRORS (VECTOR 0 0 0)))

; $InteractiveMode := true

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$InteractiveMode| T))

; $ruleSetsInitialized := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$ruleSetsInitialized| NIL))

; $InterpreterMacroAlist := [
;         ["%i", 'complex, 0, 1],
;         ["%e", 'exp, 1],
;         ["%pi", 'pi],
;         ["SF", 'DoubleFloat],
;         ["%infinity", 'infinity],
;         ["%plusInfinity", 'plusInfinity],
;         ["%minusInfinity", 'minusInfinity]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$InterpreterMacroAlist|
          (LIST (LIST '|%i| '|complex| 0 1) (LIST '|%e| '|exp| 1)
                (LIST '|%pi| '|pi|) (LIST 'SF '|DoubleFloat|)
                (LIST '|%infinity| '|infinity|)
                (LIST '|%plusInfinity| '|plusInfinity|)
                (LIST '|%minusInfinity| '|minusInfinity|))))

; $InitialCommandSynonymAlist := [
;        ["?",         :'"what commands"],
;        ["apropos",   :'"what things"],
;        ["cache",     :'"set functions cache"],
;        ["cl",        :'"clear"],
;        ["co",        :'"compile"],
;        ["d",         :'"display"],
;        ["expose",    :'"set expose add constructor"],
;        ["fortran",   :'"set output fortran"],
;        ["h",         :'"help"],
;        ["hd",        :'"system hypertex &"],
;        ["kclam",     :'"boot clearClams ( )"],
;        ["killcaches",:'"boot clearConstructorCaches()"],
;        ["prompt",    :'"set message prompt"],
;        ["recurrence",:'"set functions recurrence"],
;        ["restore",   :'"history )restore"],
;        ["save",      :'"history )save"],
;        ["startGraphics",   :'"system $FRICAS/lib/viewman &"],
;        ["stopGraphics",    :'"lisp (|sockSendSignal| 2 15)"],
;        ["time",      :'"set message time"],
;        ["storage",   :'"set message storage"],
;        ["type",      :'"set message type"],
;        ["unexpose",  :'"set expose drop constructor"],
;        ["wc",        :'"what categories"],
;        ["wd",        :'"what domains"],
;        ["wp",        :'"what packages"],
;        ["ws",        :'"what synonyms"]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$InitialCommandSynonymAlist|
          (LIST (CONS '? "what commands") (CONS '|apropos| "what things")
                (CONS '|cache| "set functions cache") (CONS '|cl| "clear")
                (CONS '|co| "compile") (CONS '|d| "display")
                (CONS '|expose| "set expose add constructor")
                (CONS '|fortran| "set output fortran") (CONS '|h| "help")
                (CONS '|hd| "system hypertex &")
                (CONS '|kclam| "boot clearClams ( )")
                (CONS '|killcaches| "boot clearConstructorCaches()")
                (CONS '|prompt| "set message prompt")
                (CONS '|recurrence| "set functions recurrence")
                (CONS '|restore| "history )restore")
                (CONS '|save| "history )save")
                (CONS '|startGraphics| "system $FRICAS/lib/viewman &")
                (CONS '|stopGraphics| "lisp (|sockSendSignal| 2 15)")
                (CONS '|time| "set message time")
                (CONS '|storage| "set message storage")
                (CONS '|type| "set message type")
                (CONS '|unexpose| "set expose drop constructor")
                (CONS '|wc| "what categories") (CONS '|wd| "what domains")
                (CONS '|wp| "what packages") (CONS '|ws| "what synonyms"))))

; $CommandSynonymAlist := COPY($InitialCommandSynonymAlist)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$CommandSynonymAlist| (COPY |$InitialCommandSynonymAlist|)))

; DEFPARAMETER($ConstructorCache, MAKE_HASHTABLE('EQ))

(DEFPARAMETER |$ConstructorCache| (MAKE_HASHTABLE 'EQ))

; $instantRecord := MAKE_HASHTABLE('EQ)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$instantRecord| (MAKE_HASHTABLE 'EQ)))

; $useIntegerSubdomain := true

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$useIntegerSubdomain| T))

; $clamList := [
;   ['canCoerce, 'hash, 'EQUAL, 'count],
;   ['canCoerceFrom, 'hash, 'EQUAL, 'count],
;   ['coerceConvertMmSelection, 'hash, 'EQUAL, 'count],
;   ['isLegitimateMode, 'hash, 'EQUAL, 'count],
;   ['isValidType, 'hash, 'EQUAL, 'count],
;   ['resolveTT,   'hash, 'EQUAL, 'count],
;   ['selectMms1, 'hash, 'EQUAL, 'count],
;   ['underDomainOf, 'hash, 'EQUAL, 'count],
;   ['findRetractMms, 'hash, 'EQUAL, 'count],
;   ['getConstantFromDomain, 'hash, 'EQUAL, 'count],
;   ['interpLookup, 'hash, 'EQUAL, 'count]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$clamList|
          (LIST (LIST '|canCoerce| '|hash| 'EQUAL '|count|)
                (LIST '|canCoerceFrom| '|hash| 'EQUAL '|count|)
                (LIST '|coerceConvertMmSelection| '|hash| 'EQUAL '|count|)
                (LIST '|isLegitimateMode| '|hash| 'EQUAL '|count|)
                (LIST '|isValidType| '|hash| 'EQUAL '|count|)
                (LIST '|resolveTT| '|hash| 'EQUAL '|count|)
                (LIST '|selectMms1| '|hash| 'EQUAL '|count|)
                (LIST '|underDomainOf| '|hash| 'EQUAL '|count|)
                (LIST '|findRetractMms| '|hash| 'EQUAL '|count|)
                (LIST '|getConstantFromDomain| '|hash| 'EQUAL '|count|)
                (LIST '|interpLookup| '|hash| 'EQUAL '|count|))))

; $failed := '"failed"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$failed| "failed"))

; $univariateDomains := [
;     'UnivariatePolynomial,
;     'UnivariateTaylorSeries,
;     'UnivariateLaurentSeries,
;     'UnivariatePuiseuxSeries]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$univariateDomains|
          (LIST '|UnivariatePolynomial| '|UnivariateTaylorSeries|
                '|UnivariateLaurentSeries| '|UnivariatePuiseuxSeries|)))

; $multivariateDomains := [
;     'MultivariatePolynomial,
;     'DistributedMultivariatePolynomial,
;     'HomogeneousDistributedMultivariatePolynomial,
;     'GeneralDistributedMultivariatePolynomial]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$multivariateDomains|
          (LIST '|MultivariatePolynomial| '|DistributedMultivariatePolynomial|
                '|HomogeneousDistributedMultivariatePolynomial|
                '|GeneralDistributedMultivariatePolynomial|)))

; $Primitives := ['Union, 'Mapping, 'Record, 'Enumeration]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$Primitives| (LIST '|Union| '|Mapping| '|Record| '|Enumeration|)))

; $DomainsWithoutLisplibs := [
;   'CAPSULE, 'Union, 'Record, 'SubDomain, 'Mapping, 'Enumeration, 'Mode]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$DomainsWithoutLisplibs|
          (LIST 'CAPSULE '|Union| '|Record| '|SubDomain| '|Mapping|
                '|Enumeration| '|Mode|)))

; $QuickCode := true -- controls generation of QREFELT etc.

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$QuickCode| T))

; $QuickLet := true  -- controls generation of LET tracing.

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$QuickLet| T))

; $domainTraceNameAssoc := []   -- alist of traced domains

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$domainTraceNameAssoc| NIL))

; $tracedMapSignatures := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$tracedMapSignatures| NIL))

; $highlightAllowed := true

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$highlightAllowed| T))

; $ConstructorNames := ['SubDomain, 'Union, 'Record]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$ConstructorNames| (LIST '|SubDomain| '|Union| '|Record|)))

; $SpecialDomainNames := ["add", 'CAPSULE, 'SubDomain, 'Union, 'Record]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$SpecialDomainNames|
          (LIST '|add| 'CAPSULE '|SubDomain| '|Union| '|Record|)))

; $CategoryNames := [
;    'Category, 'CATEGORY, 'RecordCategory, 'Join, 'EnumerationCategory,
;    'UnionCategory]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$CategoryNames|
          (LIST '|Category| 'CATEGORY '|RecordCategory| '|Join|
                '|EnumerationCategory| '|UnionCategory|)))

; $printStorageIfTrue := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$printStorageIfTrue| NIL))

; $noEnv := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$noEnv| NIL))

; $SideEffectFreeFunctionList := [
;   'null, "case", "0", "1", ":", "::", 'has, 'Mapping, 'Record, 'Union,
;   'Enumeration, 'elt, "=", ">", ">=", "<", "<=", 'MEMBER, 'is, 'isnt,
;   'ATOM]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$SideEffectFreeFunctionList|
          (LIST '|null| '|case| '|0| '|1| '|:| '|::| '|has| '|Mapping|
                '|Record| '|Union| '|Enumeration| '|elt| '= '> '>= '< '<=
                'MEMBER '|is| '|isnt| 'ATOM)))

; $AnonymousFunction := ['AnonymousFunction]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$AnonymousFunction| (LIST '|AnonymousFunction|)))

; $Any := ['Any]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Any| (LIST '|Any|)))

; $BFtag := ":BF:"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$BFtag| '|:BF:|))

; $Boolean := ['Boolean]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Boolean| (LIST '|Boolean|)))

; $Category := ['Category]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Category| (LIST '|Category|)))

; $Exit :=  ['Exit]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Exit| (LIST '|Exit|)))

; $OutputForm := ['OutputForm]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$OutputForm| (LIST '|OutputForm|)))

; $Float := ['Float]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Float| (LIST '|Float|)))

; $DoubleFloat := ['DoubleFloat]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$DoubleFloat| (LIST '|DoubleFloat|)))

; $Integer := ['Integer]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Integer| (LIST '|Integer|)))

; $SingleInteger := ['SingleInteger]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$SingleInteger| (LIST '|SingleInteger|)))

; $ComplexInteger := ['Complex, $Integer]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$ComplexInteger| (LIST '|Complex| |$Integer|)))

; $NonNegativeInteger := ['NonNegativeInteger]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$NonNegativeInteger| (LIST '|NonNegativeInteger|)))

; $PositiveInteger := ['PositiveInteger]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$PositiveInteger| (LIST '|PositiveInteger|)))

; $RationalNumber := ['Fraction, ['Integer]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$RationalNumber| (LIST '|Fraction| (LIST '|Integer|))))

; $String := ['String]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$String| (LIST '|String|)))

; $Symbol := ['Symbol]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Symbol| (LIST '|Symbol|)))

; $Void := ['Void]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Void| (LIST '|Void|)))

; $QuotientField := 'Fraction

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$QuotientField| '|Fraction|))

; $FunctionalExpression := 'Expression

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$FunctionalExpression| '|Expression|))

; $InteractiveFrame := [[[]]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$InteractiveFrame| (LIST (LIST NIL))))

; $DomainsInScope := [[]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$DomainsInScope| (LIST NIL)))

; $EmptyEnvironment := [[[]]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$EmptyEnvironment| (LIST (LIST NIL))))

; $EmptyMode := "$EmptyMode"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$EmptyMode| '|$EmptyMode|))

; $NoValue := "$NoValue"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NoValue| '|$NoValue|))

; $NoValueMode := 'NoValueMode

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NoValueMode| '|NoValueMode|))

; $DummyFunctorNames := ['Mapping]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$DummyFunctorNames| (LIST '|Mapping|)))

; $EmptyVector := VECTOR()

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$EmptyVector| (VECTOR)))

; $true := ['QUOTE, true]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$true| (LIST 'QUOTE T)))

; $false := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$false| NIL))

; $suffix := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$suffix| NIL))

; $BasicPredicates := '(INTEGERP STRINGP FLOATP)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$BasicPredicates| '(INTEGERP STRINGP FLOATP)))

; $reportCompilation := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$reportCompilation| NIL))

; $streamCount := 0

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$streamCount| 0))

; $cacheAlist := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$cacheAlist| NIL))

; $cacheCount := 0

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$cacheCount| 0))

; $reportExitModeStack := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$reportExitModeStack| NIL))

; $prefix := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$prefix| NIL))

; $formalArgList := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$formalArgList| NIL))

; $FormalMapVariableList := [
;     "#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10",
;     "#11", "#12", "#13", "#14", "#15", "#16", "#17", "#18", "#19", "#20",
;     "#21", "#22", "#23", "#24", "#25", "#26", "#27", "#28", "#29", "#30",
;     "#31", "#32", "#33", "#34", "#35", "#36", "#37", "#38", "#39", "#40",
;     "#41", "#42", "#43", "#44", "#45", "#46", "#47", "#48", "#49", "#50"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$FormalMapVariableList|
          (LIST '|#1| '|#2| '|#3| '|#4| '|#5| '|#6| '|#7| '|#8| '|#9| '|#10|
                '|#11| '|#12| '|#13| '|#14| '|#15| '|#16| '|#17| '|#18| '|#19|
                '|#20| '|#21| '|#22| '|#23| '|#24| '|#25| '|#26| '|#27| '|#28|
                '|#29| '|#30| '|#31| '|#32| '|#33| '|#34| '|#35| '|#36| '|#37|
                '|#38| '|#39| '|#40| '|#41| '|#42| '|#43| '|#44| '|#45| '|#46|
                '|#47| '|#48| '|#49| '|#50|)))

; $PatternVariableList := [
;     "*1", "*2", "*3", "*4", "*5", "*6", "*7", "*8", "*9", "*10", "*11",
;     "*12", "*13", "*14", "*15", "*16", "*17", "*18", "*19", "*20", "*21",
;     "*22", "*23", "*24", "*25", "*26", "*27", "*28", "*29", "*30", "*31",
;     "*32", "*33", "*34", "*35", "*36", "*37", "*38", "*39", "*40", "*41",
;     "*42", "*43", "*44", "*45", "*46", "*47", "*48", "*49", "*50"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$PatternVariableList|
          (LIST '*1 '*2 '*3 '*4 '*5 '*6 '*7 '*8 '*9 '*10 '*11 '*12 '*13 '*14
                '*15 '*16 '*17 '*18 '*19 '*20 '*21 '*22 '*23 '*24 '*25 '*26
                '*27 '*28 '*29 '*30 '*31 '*32 '*33 '*34 '*35 '*36 '*37 '*38
                '*39 '*40 '*41 '*42 '*43 '*44 '*45 '*46 '*47 '*48 '*49 '*50)))

; $ModeVariableList := [
;     "DV$1", "DV$2", "DV$3", "DV$4", "DV$5", "DV$6", "DV$7", "DV$8", "DV$9",
;     "DV$10", "DV$11", "DV$12", "DV$13", "DV$14", "DV$15", "DV$16", "DV$17",
;     "DV$18", "DV$19", "DV$20"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$ModeVariableList|
          (LIST 'DV$1 'DV$2 'DV$3 'DV$4 'DV$5 'DV$6 'DV$7 'DV$8 'DV$9 'DV$10
                'DV$11 'DV$12 'DV$13 'DV$14 'DV$15 'DV$16 'DV$17 'DV$18 'DV$19
                'DV$20)))

; $TriangleVariableList := [
;     "t#1", "t#2", "t#3", "t#4", "t#5", "t#6", "t#7", "t#8", "t#9", "t#10",
;     "t#11", "t#12", "t#13", "t#14", "t#15", "t#16", "t#17", "t#18",
;     "t#19", "t#20", "t#21", "t#22", "t#23", "t#24", "t#25", "t#26", "t#27",
;     "t#28", "t#29", "t#30", "t#31", "t#32", "t#33", "t#34", "t#35", "t#36",
;     "t#37", "t#38", "t#39", "t#40", "t#41", "t#42", "t#43", "t#44", "t#45",
;     "t#46", "t#47", "t#48", "t#49", "t#50"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$TriangleVariableList|
          (LIST '|t#1| '|t#2| '|t#3| '|t#4| '|t#5| '|t#6| '|t#7| '|t#8| '|t#9|
                '|t#10| '|t#11| '|t#12| '|t#13| '|t#14| '|t#15| '|t#16| '|t#17|
                '|t#18| '|t#19| '|t#20| '|t#21| '|t#22| '|t#23| '|t#24| '|t#25|
                '|t#26| '|t#27| '|t#28| '|t#29| '|t#30| '|t#31| '|t#32| '|t#33|
                '|t#34| '|t#35| '|t#36| '|t#37| '|t#38| '|t#39| '|t#40| '|t#41|
                '|t#42| '|t#43| '|t#44| '|t#45| '|t#46| '|t#47| '|t#48| '|t#49|
                '|t#50|)))

; $FormalFunctionParameterList := [
;     "##1", "##2", "##3", "##4", "##5", "##6", "##7", "##8", "##9", "##10",
;     "##11", "##12", "##13", "##14", "##15"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$FormalFunctionParameterList|
          (LIST '|##1| '|##2| '|##3| '|##4| '|##5| '|##6| '|##7| '|##8| '|##9|
                '|##10| '|##11| '|##12| '|##13| '|##14| '|##15|)))

; $PrimitiveDomainNames := [
;     'List, 'Integer, 'NonNegativeInteger, 'PositiveInteger,
;     'SingleInteger, 'String, 'Boolean]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$PrimitiveDomainNames|
          (LIST '|List| '|Integer| '|NonNegativeInteger| '|PositiveInteger|
                '|SingleInteger| '|String| '|Boolean|)))

; $optimizableConstructorNames := [
;     'List, 'Integer, 'PositiveInteger, 'NonNegativeInteger, 'SingleInteger,
;     'String, 'Boolean, 'Symbol, 'DoubleFloat, 'PrimitiveArray, 'Vector,
;     'Matrix, 'OneDimensionalArray, 'TwoDimensionalArray, 'U32Vector,
;     'U32Matrix, 'U16Vector, 'U16Matrix, 'U8Vector, 'U8Matrix,
;     'I32Vector, 'I32Matrix, 'I16Vector, 'I16Matrix, 'I8Vector, 'I8Matrix,
;     'U64Int, 'PrimitiveTwoDimensionalArray,
;     'DoubleFloatVector, 'DoubleFloatMatrix, 'ComplexDoubleFloatVector,
;     'ComplexDoubleFloatMatrix, 'Character, 'SortedExponentVector,
;     'HashState]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$optimizableConstructorNames|
          (LIST '|List| '|Integer| '|PositiveInteger| '|NonNegativeInteger|
                '|SingleInteger| '|String| '|Boolean| '|Symbol| '|DoubleFloat|
                '|PrimitiveArray| '|Vector| '|Matrix| '|OneDimensionalArray|
                '|TwoDimensionalArray| '|U32Vector| '|U32Matrix| '|U16Vector|
                '|U16Matrix| '|U8Vector| '|U8Matrix| '|I32Vector| '|I32Matrix|
                '|I16Vector| '|I16Matrix| '|I8Vector| '|I8Matrix| '|U64Int|
                '|PrimitiveTwoDimensionalArray| '|DoubleFloatVector|
                '|DoubleFloatMatrix| '|ComplexDoubleFloatVector|
                '|ComplexDoubleFloatMatrix| '|Character|
                '|SortedExponentVector| '|HashState|)))

; $Zero := ["0"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$Zero| (LIST '|0|)))

; $One  := ["1"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$One| (LIST '|1|)))

; $NonMentionableDomainNames := [
;       "%", 'Rep, 'Record, 'Union, 'Mapping, 'Enumeration]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$NonMentionableDomainNames|
          (LIST '% '|Rep| '|Record| '|Union| '|Mapping| '|Enumeration|)))

; $CategoryFrame := [[[]]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$CategoryFrame| (LIST (LIST NIL))))

; $InitialDomainsInScope := ["$EmptyMode", "$NoValueMode"]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$InitialDomainsInScope| (LIST '|$EmptyMode| '|$NoValueMode|)))

; $InitialModemapFrame := [[[]]]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$InitialModemapFrame| (LIST (LIST NIL))))

; $NRTaddForm := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NRTaddForm| NIL))

; $NRTdeltaList := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NRTdeltaList| NIL))

; $NRTdeltaListComp := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NRTdeltaListComp| NIL))

; $NRTbase := 0

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NRTbase| 0))

; $NRTdeltaLength := 0

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NRTdeltaLength| 0))

; $NRTmonitorIfTrue := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$NRTmonitorIfTrue| NIL))
