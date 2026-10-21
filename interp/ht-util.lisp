
; )package "BOOT"

(IN-PACKAGE "BOOT")

; htSay2(page, x) == bcHt2(page, x)

(DEFUN |htSay2| (|page| |x|) (PROG () (RETURN (|bcHt2| |page| |x|))))

; htSayList1(page, lx) ==
;   for x in lx repeat bcHt2(page, x)

(DEFUN |htSayList1| (|page| |lx|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#1| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#1|) (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
           (RETURN NIL))
          ('T (|bcHt2| |page| |x|)))
         (SETQ |bfVar#1| (CDR |bfVar#1|))))
      |lx| NIL))))

; bcHt2(page, line) == ht_add_item(page, line)

(DEFUN |bcHt2| (|page| |line|) (PROG () (RETURN (|ht_add_item| |page| |line|))))

; htShowPage1(page) ==
; -- show the page which has been computed
;    ht_add_string(page, '"\endscroll")
;    ht_show_page(page)

(DEFUN |htShowPage1| (|page|)
  (PROG ()
    (RETURN
     (PROGN (|ht_add_string| |page| "\\endscroll") (|ht_show_page| |page|)))))

; htInitPage(title, propList) ==
;     page := ht_new_page(propList)
;     bcHt2(page, ['"\begin{page}{", htpName page, '"}{"])
;     htSay2(page, title)
;     ht_add_string(page, '"} \beginscroll ")
;     page

(DEFUN |htInitPage| (|title| |propList|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |page| (|ht_new_page| |propList|))
      (|bcHt2| |page| (LIST "\\begin{page}{" (|htpName| |page|) "}{"))
      (|htSay2| |page| |title|)
      (|ht_add_string| |page| "} \\beginscroll ")
      |page|))))

; $activePageList := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$activePageList| NIL))

; htpName htPage ==
; -- GENSYM whose value is the page
;   ELT(htPage, 0)

(DEFUN |htpName| (|htPage|) (PROG () (RETURN (ELT |htPage| 0))))

; htpRadioButtonAlist htPage ==
; -- alist of radio button group names and labels
;   ELT(htPage, 4)

(DEFUN |htpRadioButtonAlist| (|htPage|) (PROG () (RETURN (ELT |htPage| 4))))

; htpButtonValue(htPage, groupName) ==
;   for buttonName in LASSOC(groupName, htpRadioButtonAlist htPage) repeat
;     (stripSpaces htpLabelInputString(htPage, buttonName)) = '"t" =>
;       return buttonName

(DEFUN |htpButtonValue| (|htPage| |groupName|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#2| |buttonName|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#2|)
               (PROGN (SETQ |buttonName| (CAR |bfVar#2|)) NIL))
           (RETURN NIL))
          ('T
           (COND
            ((EQUAL
              (|stripSpaces| (|htpLabelInputString| |htPage| |buttonName|))
              "t")
             (IDENTITY (RETURN |buttonName|))))))
         (SETQ |bfVar#2| (CDR |bfVar#2|))))
      (LASSOC |groupName| (|htpRadioButtonAlist| |htPage|)) NIL))))

; htpInputAreaAlist htPage ==
; -- Alist of input-area labels, and default values
;   ELT(htPage, 5)

(DEFUN |htpInputAreaAlist| (|htPage|) (PROG () (RETURN (ELT |htPage| 5))))

; htpPropertyList htPage ==
; -- Association list of user-defined properties
;   ELT(htPage, 6)

(DEFUN |htpPropertyList| (|htPage|) (PROG () (RETURN (ELT |htPage| 6))))

; htpProperty(htPage, propName) ==
;   LASSOC(propName, ELT(htPage, 6))

(DEFUN |htpProperty| (|htPage| |propName|)
  (PROG () (RETURN (LASSOC |propName| (ELT |htPage| 6)))))

; htpSetProperty(htPage, propName, val) ==
;   pair := assoc(propName, ELT(htPage, 6))
;   pair => RPLACD(pair, val)
;   SETELT(htPage, 6, [[propName, :val], :ELT(htPage, 6)])

(DEFUN |htpSetProperty| (|htPage| |propName| |val|)
  (PROG (|pair|)
    (RETURN
     (PROGN
      (SETQ |pair| (|assoc| |propName| (ELT |htPage| 6)))
      (COND (|pair| (RPLACD |pair| |val|))
            ('T
             (SETELT |htPage| 6
              (CONS (CONS |propName| |val|) (ELT |htPage| 6)))))))))

; htpLabelInputString(htPage, label) ==
; -- value user typed as input string on page
;   props := LASSOC(label, htpInputAreaAlist htPage)
;   props and STRINGP (s := ELT(props,0)) =>
;     s = '"" => s
;     trimString s
;   nil

(DEFUN |htpLabelInputString| (|htPage| |label|)
  (PROG (|props| |s|)
    (RETURN
     (PROGN
      (SETQ |props| (LASSOC |label| (|htpInputAreaAlist| |htPage|)))
      (COND
       ((AND |props| (STRINGP (SETQ |s| (ELT |props| 0))))
        (COND ((EQUAL |s| "") |s|) (#1='T (|trimString| |s|))))
       (#1# NIL))))))

; stringize s ==
;   STRINGP s => s
;   PRINC_-TO_-STRING s

(DEFUN |stringize| (|s|)
  (PROG () (RETURN (COND ((STRINGP |s|) |s|) ('T (PRINC-TO-STRING |s|))))))

; mkCurryFun(fun, val) ==
;   name := GENTEMP()
;   code :=
;     ['DEFUN, name, '(arg), ['APPLY, MKQ fun, ['CONS, 'arg, MKQ val]]]
;   EVAL code
;   name

(DEFUN |mkCurryFun| (|fun| |val|)
  (PROG (|name| |code|)
    (RETURN
     (PROGN
      (SETQ |name| (GENTEMP))
      (SETQ |code|
              (LIST 'DEFUN |name| '(|arg|)
                    (LIST 'APPLY (MKQ |fun|) (LIST 'CONS '|arg| (MKQ |val|)))))
      (EVAL |code|)
      |name|))))

; htMakeDoneButton(page, message, func) ==
;     ht_add_to_page(page, [['doneButton, message, func]])

(DEFUN |htMakeDoneButton| (|page| |message| |func|)
  (PROG ()
    (RETURN
     (|ht_add_to_page| |page| (LIST (LIST '|doneButton| |message| |func|))))))

; htMakeDoitButton(page, label, command) ==
;     ht_add_to_page(page, [['doitButton, label, command]])

(DEFUN |htMakeDoitButton| (|page| |label| |command|)
  (PROG ()
    (RETURN
     (|ht_add_to_page| |page| (LIST (LIST '|doitButton| |label| |command|))))))

; doDoitButton(htPage, command) ==
;   executeInterpreterCommand command

(DEFUN |doDoitButton| (|htPage| |command|)
  (PROG () (RETURN (|executeInterpreterCommand| |command|))))

; executeInterpreterCommand command ==
;   PRINC command
;   TERPRI()
;   setCurrentLine(command)
;   CATCH('SPAD_READER, parseAndInterpret command)
; --  MRX I'm not sure whether I should call ioHook("startPrompt")/ioHook("endOfPrompt") here
;   princPrompt()
;   FORCE_-OUTPUT()

(DEFUN |executeInterpreterCommand| (|command|)
  (PROG ()
    (RETURN
     (PROGN
      (PRINC |command|)
      (TERPRI)
      (|setCurrentLine| |command|)
      (CATCH 'SPAD_READER (|parseAndInterpret| |command|))
      (|princPrompt|)
      (FORCE-OUTPUT)))))

; htDoneButton(func, htPage) ==
;   NULL FBOUNDP func =>
;     systemError ['"unknown function", func]
;   FUNCALL(SYMBOL_-FUNCTION func, htPage)

(DEFUN |htDoneButton| (|func| |htPage|)
  (PROG ()
    (RETURN
     (COND
      ((NULL (FBOUNDP |func|))
       (|systemError| (LIST "unknown function" |func|)))
      ('T (FUNCALL (SYMBOL-FUNCTION |func|) |htPage|))))))

; quoteString string == CONCAT('"_"", string, '"_"")

(DEFUN |quoteString| (|string|) (PROG () (RETURN (CONCAT "\"" |string| "\""))))

; $funnyQuote := char 127

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$funnyQuote| (|char| 127)))

; $funnyBacks := char 31

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$funnyBacks| (|char| 31)))

; htEscapeString str ==
;   str := SUBSTITUTE($funnyQuote, char '_", str)
;   SUBSTITUTE($funnyBacks, char '_\, str)

(DEFUN |htEscapeString| (|str|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |str| (SUBSTITUTE |$funnyQuote| (|char| '|"|) |str|))
      (SUBSTITUTE |$funnyBacks| (|char| '|\\|) |str|)))))

; unescapeStringsInForm form ==
;   STRINGP form =>
;     str := NSUBSTITUTE(char '_", $funnyQuote, form)
;     NSUBSTITUTE(char '_\, $funnyBacks, str)
;   CONSP form =>
;     unescapeStringsInForm first form
;     unescapeStringsInForm rest form
;     form
;   form

(DEFUN |unescapeStringsInForm| (|form|)
  (PROG (|str|)
    (RETURN
     (COND
      ((STRINGP |form|)
       (PROGN
        (SETQ |str| (NSUBSTITUTE (|char| '|"|) |$funnyQuote| |form|))
        (NSUBSTITUTE (|char| '|\\|) |$funnyBacks| |str|)))
      ((CONSP |form|)
       (PROGN
        (|unescapeStringsInForm| (CAR |form|))
        (|unescapeStringsInForm| (CDR |form|))
        |form|))
      ('T |form|)))))

; bcBlankLine(page) ==
;     ht_add_string(page, '"\vspace{1}\newline ")

(DEFUN |bcBlankLine| (|page|)
  (PROG () (RETURN (|ht_add_string| |page| "\\vspace{1}\\newline "))))

; errorPage([heading, kind, :info]) ==
;   kind = 'invalidType => BREAK()
;   page :=
;       heading = 'error => htInitPage('"Error", nil)
;       htInitPage(heading, nil)
;   bcBlankLine(page)
;   for x in info repeat htSay2(page, x)
;   htShowPage1(page)

(DEFUN |errorPage| (|bfVar#4|)
  (PROG (|heading| |kind| |info| |page|)
    (RETURN
     (PROGN
      (SETQ |heading| (CAR |bfVar#4|))
      (SETQ |kind| (CADR . #1=(|bfVar#4|)))
      (SETQ |info| (CDDR . #1#))
      (COND ((EQ |kind| '|invalidType|) (BREAK))
            (#2='T
             (PROGN
              (SETQ |page|
                      (COND
                       ((EQ |heading| '|error|) (|htInitPage| "Error" NIL))
                       (#2# (|htInitPage| |heading| NIL))))
              (|bcBlankLine| |page|)
              ((LAMBDA (|bfVar#3| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#3|)
                        (PROGN (SETQ |x| (CAR |bfVar#3|)) NIL))
                    (RETURN NIL))
                   (#2# (|htSay2| |page| |x|)))
                  (SETQ |bfVar#3| (CDR |bfVar#3|))))
               |info| NIL)
              (|htShowPage1| |page|))))))))

; bcFinish(name,arg,:args) == bcGen bcMkFunction(name,arg,args)

(DEFUN |bcFinish| (|name| |arg| &REST |args|)
  (PROG () (RETURN (|bcGen| (|bcMkFunction| |name| |arg| |args|)))))

; bcMkFunction(name,arg,args) ==
;   args := [x for x in args | x]
;   STRCONC(name,'"(",arg,"STRCONC"/[STRCONC('",", x) for x in args],'")")

(DEFUN |bcMkFunction| (|name| |arg| |args|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |args|
              ((LAMBDA (|bfVar#6| |bfVar#5| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#5|)
                        (PROGN (SETQ |x| (CAR |bfVar#5|)) NIL))
                    (RETURN (NREVERSE |bfVar#6|)))
                   (#1='T (AND |x| (SETQ |bfVar#6| (CONS |x| |bfVar#6|)))))
                  (SETQ |bfVar#5| (CDR |bfVar#5|))))
               NIL |args| NIL))
      (STRCONC |name| "(" |arg|
       ((LAMBDA (|bfVar#8| |bfVar#7| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#7|) (PROGN (SETQ |x| (CAR |bfVar#7|)) NIL))
             (RETURN |bfVar#8|))
            (#1# (SETQ |bfVar#8| (STRCONC |bfVar#8| (STRCONC "," |x|)))))
           (SETQ |bfVar#7| (CDR |bfVar#7|))))
        "" |args| NIL)
       ")")))))

; bcFindString(s,i,n,char) ==  or/[j for j in i..n | s.j = char]

(DEFUN |bcFindString| (|s| |i| |n| |char|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#9| |j|)
        (LOOP
         (COND ((> |j| |n|) (RETURN |bfVar#9|))
               ('T
                (AND (EQUAL (ELT |s| |j|) |char|)
                     (PROGN
                      (SETQ |bfVar#9| |j|)
                      (COND (|bfVar#9| (RETURN |bfVar#9|)))))))
         (SETQ |j| (+ |j| 1))))
      NIL |i|))))

; bcGen command ==
;   page := htInitPage('"Basic Command",nil)
;   string :=
;     #command < 50 => STRCONC('"{\centerline{\tt ",command,'" }}")
;     STRCONC('"{\tt ",command,'" }")
;   ht_add_to_page(page, [
;      '(text
;         "{Here is the FriCAS command you could have issued to compute this result:}"
;             "\vspace{2}\newline "),
;       ['text,:string]])
;   htMakeDoitButton(page, '"Do It", command)
;   htShowPage1(page)

(DEFUN |bcGen| (|command|)
  (PROG (|page| |string|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| "Basic Command" NIL))
      (SETQ |string|
              (COND
               ((< (LENGTH |command|) 50)
                (STRCONC "{\\centerline{\\tt " |command| " }}"))
               ('T (STRCONC "{\\tt " |command| " }"))))
      (|ht_add_to_page| |page|
       (LIST
        '(|text|
          "{Here is the FriCAS command you could have issued to compute this result:}"
          "\\vspace{2}\\newline ")
        (CONS '|text| |string|)))
      (|htMakeDoitButton| |page| "Do It" |command|)
      (|htShowPage1| |page|)))))

; bcString2WordList s == fn(s,0,MAXINDEX s) where
;   fn(s,i,n) ==
;     i > n => nil
;     k := or/[j for j in i..n | s.j ~= char '_  ]
;     null INTEGERP k => nil
;     l := bcFindString(s,k + 1,n,char '_  )
;     null INTEGERP l => [SUBSTRING(s,k,nil)]
;     [SUBSTRING(s,k,l-k),:fn(s,l + 1,n)]

(DEFUN |bcString2WordList| (|s|)
  (PROG () (RETURN (|bcString2WordList,fn| |s| 0 (MAXINDEX |s|)))))
(DEFUN |bcString2WordList,fn| (|s| |i| |n|)
  (PROG (|k| |l|)
    (RETURN
     (COND ((< |n| |i|) NIL)
           (#1='T
            (PROGN
             (SETQ |k|
                     ((LAMBDA (|bfVar#10| |j|)
                        (LOOP
                         (COND ((> |j| |n|) (RETURN |bfVar#10|))
                               (#1#
                                (AND (NOT (EQUAL (ELT |s| |j|) (|char| '| |)))
                                     (PROGN
                                      (SETQ |bfVar#10| |j|)
                                      (COND
                                       (|bfVar#10| (RETURN |bfVar#10|)))))))
                         (SETQ |j| (+ |j| 1))))
                      NIL |i|))
             (COND ((NULL (INTEGERP |k|)) NIL)
                   (#1#
                    (PROGN
                     (SETQ |l|
                             (|bcFindString| |s| (+ |k| 1) |n| (|char| '| |)))
                     (COND
                      ((NULL (INTEGERP |l|)) (LIST (SUBSTRING |s| |k| NIL)))
                      (#1#
                       (CONS (SUBSTRING |s| |k| (- |l| |k|))
                             (|bcString2WordList,fn| |s| (+ |l| 1)
                              |n|)))))))))))))

; bcwords2liststring u ==
;   null u => nil
;   STRCONC('"[",first u,fn rest u) where
;     fn(u) ==
;       null u => '"]"
;       STRCONC('", ",first u,fn rest u)

(DEFUN |bcwords2liststring| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) NIL)
           ('T (STRCONC "[" (CAR |u|) (|bcwords2liststring,fn| (CDR |u|))))))))
(DEFUN |bcwords2liststring,fn| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) "]")
           ('T (STRCONC ", " (CAR |u|) (|bcwords2liststring,fn| (CDR |u|))))))))

; bcVectorGen vec == bcwords2liststring vec

(DEFUN |bcVectorGen| (|vec|) (PROG () (RETURN (|bcwords2liststring| |vec|))))

; bcError string ==
;   sayBrightlyNT '"NOTE: "
;   sayBrightly string

(DEFUN |bcError| (|string|)
  (PROG ()
    (RETURN (PROGN (|sayBrightlyNT| "NOTE: ") (|sayBrightly| |string|)))))

; htStringPad(n,w) ==
;   s := STRINGIMAGE n
;   ws := #s
;   STRCONC('"\space{",STRINGIMAGE (w - ws + 1),'"}",s)

(DEFUN |htStringPad| (|n| |w|)
  (PROG (|s| |ws|)
    (RETURN
     (PROGN
      (SETQ |s| (STRINGIMAGE |n|))
      (SETQ |ws| (LENGTH |s|))
      (STRCONC "\\space{" (STRINGIMAGE (+ (- |w| |ws|) 1)) "}" |s|)))))
