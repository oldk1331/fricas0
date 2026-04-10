
; )package "BOOT"

(IN-PACKAGE "BOOT")

; DEFPARAMETER($error_mark, GENSYM())

(DEFPARAMETER |$error_mark| (GENSYM))

; get_io_index_table(stream, io?) ==
;     pos := READ(stream, nil, nil)
;     NUMBERP(pos) =>
;         FILE_-POSITION(stream, pos)
;         res := READ(stream)
;         FILE_-POSITION(stream, pos)
;         res
;     io? =>
;         FILE_-POSITION(stream, 0)
;         PRINC('"                    ", stream)
;         nil
;     nil

(DEFUN |get_io_index_table| (|stream| |io?|)
  (PROG (|pos| |res|)
    (RETURN
     (PROGN
      (SETQ |pos| (READ |stream| NIL NIL))
      (COND
       ((NUMBERP |pos|)
        (PROGN
         (FILE-POSITION |stream| |pos|)
         (SETQ |res| (READ |stream|))
         (FILE-POSITION |stream| |pos|)
         |res|))
       (|io?|
        (PROGN
         (FILE-POSITION |stream| 0)
         (PRINC "                    " |stream|)
         NIL))
       ('T NIL))))))

; kaf_open(name, io?) ==
;     full_name :=
;         io? => make_full_namestring(name)
;         make_input_filename1(name)
;     if io? then
;         kind := file_kind(full_name)
;         if kind = -1 then
;             makedir(full_name)
;         else if kind = 0 then
;             ERROR(FORMAT(nil, '"~s is an existing file, not a library",
;                   full_name))
;     stream := get_io_index_stream(full_name, io?)
;     make_kaf((io? => 'output; 'input), full_name,
;              get_io_index_table(stream, io?), stream)

(DEFUN |kaf_open| (|name| |io?|)
  (PROG (|full_name| |kind| |stream|)
    (RETURN
     (PROGN
      (SETQ |full_name|
              (COND (|io?| (|make_full_namestring| |name|))
                    (#1='T (|make_input_filename1| |name|))))
      (COND
       (|io?| (SETQ |kind| (|file_kind| |full_name|))
        (COND ((EQUAL |kind| (- 1)) (|makedir| |full_name|))
              ((EQL |kind| 0)
               (ERROR
                (FORMAT NIL "~s is an existing file, not a library"
                        |full_name|))))))
      (SETQ |stream| (|get_io_index_stream| |full_name| |io?|))
      (|make_kaf| (COND (|io?| '|output|) (#1# '|input|)) |full_name|
       (|get_io_index_table| |stream| |io?|) |stream|)))))

; kaf_close(kaf) ==
;     istr := LIBSTREAM_-INDEXSTREAM(kaf)
;     if LIBSTREAM_-MODE(kaf) = 'output then
;         write_indextable(istr, LIBSTREAM_-INDEXTABLE(kaf))
;     CLOSE(istr)

(DEFUN |kaf_close| (|kaf|)
  (PROG (|istr|)
    (RETURN
     (PROGN
      (SETQ |istr| (LIBSTREAM-INDEXSTREAM |kaf|))
      (COND
       ((EQ (LIBSTREAM-MODE |kaf|) '|output|)
        (|write_indextable| |istr| (LIBSTREAM-INDEXTABLE |kaf|))))
      (CLOSE |istr|)))))

; kaf_read(kaf, key, sv) ==
;     not(LIBSTREAM_-MODE(kaf) = 'input) =>
;         ERROR('"not input stream")
;     NULL(entry := find_key(LIBSTREAM_-INDEXTABLE(kaf), key)) =>
;         sv = $error_mark =>
;             ERROR(FORMAT(nil, '"key ~a not found", key))
;         sv
;     pos := CADR(entry)
;     NULL(pos) => CDDR(entry)
;     NUMBERP(pos) =>
;         stream := LIBSTREAM_-INDEXSTREAM(kaf)
;         FILE_-POSITION(stream, pos)
;         READ(stream)
;     BREAK()

(DEFUN |kaf_read| (|kaf| |key| |sv|)
  (PROG (|entry| |pos| |stream|)
    (RETURN
     (COND
      ((NULL (EQ (LIBSTREAM-MODE |kaf|) '|input|)) (ERROR "not input stream"))
      ((NULL (SETQ |entry| (|find_key| (LIBSTREAM-INDEXTABLE |kaf|) |key|)))
       (COND
        ((EQUAL |sv| |$error_mark|)
         (ERROR (FORMAT NIL "key ~a not found" |key|)))
        (#1='T |sv|)))
      (#1#
       (PROGN
        (SETQ |pos| (CADR |entry|))
        (COND ((NULL |pos|) (CDDR |entry|))
              ((NUMBERP |pos|)
               (PROGN
                (SETQ |stream| (LIBSTREAM-INDEXSTREAM |kaf|))
                (FILE-POSITION |stream| |pos|)
                (READ |stream|)))
              (#1# (BREAK)))))))))

; kaf_read_list(kaf, key) ==
;     IDENTP(key) => kaf_read(kaf, PNAME(key), [])
;     BREAK()

(DEFUN |kaf_read_list| (|kaf| |key|)
  (PROG ()
    (RETURN
     (COND ((IDENTP |key|) (|kaf_read| |kaf| (PNAME |key|) NIL))
           ('T (BREAK))))))

; make_entry(kaf, key, pos) ==
;     entry := find_key(LIBSTREAM_-INDEXTABLE(kaf), key)
;     NULL(entry) =>
;         kaf_set_indextable(kaf,
;                            CONS([key, :pos], LIBSTREAM_-INDEXTABLE(kaf)))
;     SETF(CDR(entry), pos)

(DEFUN |make_entry| (|kaf| |key| |pos|)
  (PROG (|entry|)
    (RETURN
     (PROGN
      (SETQ |entry| (|find_key| (LIBSTREAM-INDEXTABLE |kaf|) |key|))
      (COND
       ((NULL |entry|)
        (|kaf_set_indextable| |kaf|
         (CONS (CONS |key| |pos|) (LIBSTREAM-INDEXTABLE |kaf|))))
       ('T (SETF (CDR |entry|) |pos|)))))))

; kaf_write(kaf, key, val) ==
;     not(LIBSTREAM_-MODE(kaf) = 'output) =>
;         ERROR('"not output stream")
;     stream := LIBSTREAM_-INDEXSTREAM(kaf)
;     pos :=
;         NULL(val) => CONS(nil, val)
;         [FILE_-POSITION(stream)]
;     make_entry(kaf, key, pos)
;     if NUMBERP(CAR(pos)) then write_to_stream(val, stream)

(DEFUN |kaf_write| (|kaf| |key| |val|)
  (PROG (|stream| |pos|)
    (RETURN
     (COND
      ((NULL (EQ (LIBSTREAM-MODE |kaf|) '|output|))
       (ERROR "not output stream"))
      (#1='T
       (PROGN
        (SETQ |stream| (LIBSTREAM-INDEXSTREAM |kaf|))
        (SETQ |pos|
                (COND ((NULL |val|) (CONS NIL |val|))
                      (#1# (LIST (FILE-POSITION |stream|)))))
        (|make_entry| |kaf| |key| |pos|)
        (COND ((NUMBERP (CAR |pos|)) (|write_to_stream| |val| |stream|)))))))))

; kaf_write0(kaf, key, val) ==
;     IDENTP(key) => kaf_write(kaf, PNAME(key), val)
;     BREAK()

(DEFUN |kaf_write0| (|kaf| |key| |val|)
  (PROG ()
    (RETURN
     (COND ((IDENTP |key|) (|kaf_write| |kaf| (PNAME |key|) |val|))
           ('T (BREAK))))))

; kaf_remove(kaf, key) ==
;     itable := LIBSTREAM_-INDEXTABLE(kaf)
;     itable := assoc_delete_equal(itable, key)
;     kaf_set_indextable(kaf, itable)

(DEFUN |kaf_remove| (|kaf| |key|)
  (PROG (|itable|)
    (RETURN
     (PROGN
      (SETQ |itable| (LIBSTREAM-INDEXTABLE |kaf|))
      (SETQ |itable| (|assoc_delete_equal| |itable| |key|))
      (|kaf_set_indextable| |kaf| |itable|)))))

; rkeys2(kaf) ==
;     MAPCAR(function CAR, LIBSTREAM_-INDEXTABLE(kaf))

(DEFUN |rkeys2| (|kaf|)
  (PROG () (RETURN (MAPCAR #'CAR (LIBSTREAM-INDEXTABLE |kaf|)))))

; rkeys(name) ==
;     kaf := kaf_open(name, false)
;     res := rkeys2(kaf)
;     kaf_close(kaf)
;     res

(DEFUN |rkeys| (|name|)
  (PROG (|kaf| |res|)
    (RETURN
     (PROGN
      (SETQ |kaf| (|kaf_open| |name| NIL))
      (SETQ |res| (|rkeys2| |kaf|))
      (|kaf_close| |kaf|)
      |res|))))

; get_directory_list(ft) ==
;     cd := get_current_directory()
;     member(ft, ['"NRLIB", '"DAASE"]) =>
;         $UserLevel = 'development => cons(cd, $library_directory_list)
;         $library_directory_list
;     [cd, get_home_dir(), :$directory_list]

(DEFUN |get_directory_list| (|ft|)
  (PROG (|cd|)
    (RETURN
     (PROGN
      (SETQ |cd| (|get_current_directory|))
      (COND
       ((|member| |ft| (LIST "NRLIB" "DAASE"))
        (COND
         ((EQ |$UserLevel| '|development|)
          (CONS |cd| |$library_directory_list|))
         (#1='T |$library_directory_list|)))
       (#1# (CONS |cd| (CONS (|get_home_dir|) |$directory_list|))))))))

; object2String2(x) ==
;     STRINGP(x) => x
;     IDENTP(x)  => x
;     WRITE_-TO_-STRING(x)

(DEFUN |object2String2| (|x|)
  (PROG ()
    (RETURN
     (COND ((STRINGP |x|) |x|) ((IDENTP |x|) |x|) ('T (WRITE-TO-STRING |x|))))))

; filler_chars(n, char_str) ==
;     not(STRINGP(char_str)) => BREAK()
;     n <= 0 => '""
;     make_string0(n, char_str.0)

(DEFUN |filler_chars| (|n| |char_str|)
  (PROG ()
    (RETURN
     (COND ((NULL (STRINGP |char_str|)) (BREAK)) ((NOT (< 0 |n|)) "")
           ('T (|make_string0| |n| (ELT |char_str| 0)))))))

; filler_spaces(n) == filler_chars(n, '" ")

(DEFUN |filler_spaces| (|n|) (PROG () (RETURN (|filler_chars| |n| " "))))

; SNAME(s) ==
;     not(SYMBOLP(s)) => BREAK()
;     SYMBOL_-NAME(s)

(DEFUN SNAME (|s|)
  (PROG ()
    (RETURN (COND ((NULL (SYMBOLP |s|)) (BREAK)) ('T (SYMBOL-NAME |s|))))))

; ext_position(n) ==
;     k := #n - 1
;     dot := '".".0
;     while k >= 0 and not(n.k = dot) repeat
;         is_dir_sepatator?(n.k) => k := -1
;         k := k - 1
;     k

(DEFUN |ext_position| (|n|)
  (PROG (|k| |dot|)
    (RETURN
     (PROGN
      (SETQ |k| (- (LENGTH |n|) 1))
      (SETQ |dot| (ELT "." 0))
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT (AND (NOT (MINUSP |k|)) (NULL (EQUAL (ELT |n| |k|) |dot|))))
            (RETURN NIL))
           (#1='T
            (COND ((|is_dir_sepatator?| (ELT |n| |k|)) (SETQ |k| (- 1)))
                  (#1# (SETQ |k| (- |k| 1)))))))))
      |k|))))

; file_extention(n) ==
;     k := ext_position(n)
;     k < 0 => '""
;     SUBSTRING(n, k + 1, #n - 1 - k)

(DEFUN |file_extention| (|n|)
  (PROG (|k|)
    (RETURN
     (PROGN
      (SETQ |k| (|ext_position| |n|))
      (COND ((MINUSP |k|) "")
            ('T (SUBSTRING |n| (+ |k| 1) (- (- (LENGTH |n|) 1) |k|))))))))

; drop_extention(n) ==
;     k := ext_position(n)
;     k < 0 => n
;     SUBSTRING(n, 0, k)

(DEFUN |drop_extention| (|n|)
  (PROG (|k|)
    (RETURN
     (PROGN
      (SETQ |k| (|ext_position| |n|))
      (COND ((MINUSP |k|) |n|) ('T (SUBSTRING |n| 0 |k|)))))))

; has_extention?(s, e) ==
;     not((m := #e) < (n := #s)) => false
;     l := n - m
;     not(s.(l - 1) = '".".0) => false
;     res := true
;     for i in 0..(m - 1) while res repeat
;         res := s.(l + i) = e.i
;     res

(DEFUN |has_extention?| (|s| |e|)
  (PROG (|m| |n| |l| |res|)
    (RETURN
     (COND ((NULL (< (SETQ |m| (LENGTH |e|)) (SETQ |n| (LENGTH |s|)))) NIL)
           (#1='T
            (PROGN
             (SETQ |l| (- |n| |m|))
             (COND ((NULL (EQUAL (ELT |s| (- |l| 1)) (ELT "." 0))) NIL)
                   (#1#
                    (PROGN
                     (SETQ |res| T)
                     ((LAMBDA (|bfVar#1| |i|)
                        (LOOP
                         (COND
                          ((OR (> |i| |bfVar#1|) (NOT |res|)) (RETURN NIL))
                          (#1#
                           (SETQ |res|
                                   (EQUAL (ELT |s| (+ |l| |i|))
                                          (ELT |e| |i|)))))
                         (SETQ |i| (+ |i| 1))))
                      (- |m| 1) 0)
                     |res|)))))))))

; last_dir_separator(n) ==
;     k := #n - 1
;     while k >=0 and not(is_dir_sepatator?(n.k)) repeat
;         k := k - 1
;     k

(DEFUN |last_dir_separator| (|n|)
  (PROG (|k|)
    (RETURN
     (PROGN
      (SETQ |k| (- (LENGTH |n|) 1))
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT
             (AND (NOT (MINUSP |k|))
                  (NULL (|is_dir_sepatator?| (ELT |n| |k|)))))
            (RETURN NIL))
           ('T (SETQ |k| (- |k| 1)))))))
      |k|))))

; drop_directory_part(n) ==
;     k := last_dir_separator(n) + 1
;     SUBSTRING(n, k, #n - k)

(DEFUN |drop_directory_part| (|n|)
  (PROG (|k|)
    (RETURN
     (PROGN
      (SETQ |k| (+ (|last_dir_separator| |n|) 1))
      (SUBSTRING |n| |k| (- (LENGTH |n|) |k|))))))

; file_basename(n) ==
;     k := last_dir_separator(n) + 1
;     l := ext_position(n)
;     l < 0 => SUBSTRING(n, k, #n - k)
;     SUBSTRING(n, k, l - k)

(DEFUN |file_basename| (|n|)
  (PROG (|k| |l|)
    (RETURN
     (PROGN
      (SETQ |k| (+ (|last_dir_separator| |n|) 1))
      (SETQ |l| (|ext_position| |n|))
      (COND ((MINUSP |l|) (SUBSTRING |n| |k| (- (LENGTH |n|) |k|)))
            ('T (SUBSTRING |n| |k| (- |l| |k|))))))))

; file_directory(n) ==
;     k := #n - 1
;     while k >=0 and not(is_dir_sepatator?(n.k)) repeat
;         k := k - 1
;     k < 0 => '""
;     k = 0 => "/"
;     SUBSTRING(n, 0, k)

(DEFUN |file_directory| (|n|)
  (PROG (|k|)
    (RETURN
     (PROGN
      (SETQ |k| (- (LENGTH |n|) 1))
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT
             (AND (NOT (MINUSP |k|))
                  (NULL (|is_dir_sepatator?| (ELT |n| |k|)))))
            (RETURN NIL))
           (#1='T (SETQ |k| (- |k| 1)))))))
      (COND ((MINUSP |k|) "") ((EQL |k| 0) '/) (#1# (SUBSTRING |n| 0 |k|)))))))

; make_filename2(n, e) ==
;     has_extention?(n, e) => n
;     CONCAT(n, '".", e)

(DEFUN |make_filename2| (|n| |e|)
  (PROG ()
    (RETURN (COND ((|has_extention?| |n| |e|) |n|) ('T (CONCAT |n| "." |e|))))))

; make_input_filename2(n, e) ==
;     make_input_filename1(make_filename2(n, e))

(DEFUN |make_input_filename2| (|n| |e|)
  (PROG () (RETURN (|make_input_filename1| (|make_filename2| |n| |e|)))))

; erase_lib0(n, e) == erase_lib(make_filename2(n, e))

(DEFUN |erase_lib0| (|n| |e|)
  (PROG () (RETURN (|erase_lib| (|make_filename2| |n| |e|)))))

; make_fname(d, n, e) ==
;     n = '"" => throwMessage '"name part can not be empty"
;     n :=
;         e = '"" => n
;         CONCAT(n, '".", e)
;     d = '"" => n
;     n :=
;         is_dir_sepatator?(n.0) => SUBSTRING(n, 1, #n - 1)
;         n
;     is_dir_sepatator?(d.(#d - 1)) => CONCAT(d, n)
;     CONCAT(d, "/", n)

(DEFUN |make_fname| (|d| |n| |e|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |n| "") (|throwMessage| "name part can not be empty"))
           (#1='T
            (PROGN
             (SETQ |n| (COND ((EQUAL |e| "") |n|) (#1# (CONCAT |n| "." |e|))))
             (COND ((EQUAL |d| "") |n|)
                   (#1#
                    (PROGN
                     (SETQ |n|
                             (COND
                              ((|is_dir_sepatator?| (ELT |n| 0))
                               (SUBSTRING |n| 1 (- (LENGTH |n|) 1)))
                              (#1# |n|)))
                     (COND
                      ((|is_dir_sepatator?| (ELT |d| (- (LENGTH |d|) 1)))
                       (CONCAT |d| |n|))
                      (#1# (CONCAT |d| '/ |n|))))))))))))

; is_system_path?(n) ==
;     #n < #(sr := $spadroot) => false
;     res := true
;     for i in 0..(#sr - 1) while res repeat
;         res := n.i = sr.i
;     res

(DEFUN |is_system_path?| (|n|)
  (PROG (|sr| |res|)
    (RETURN
     (COND ((< (LENGTH |n|) (LENGTH (SETQ |sr| |$spadroot|))) NIL)
           (#1='T
            (PROGN
             (SETQ |res| T)
             ((LAMBDA (|bfVar#2| |i|)
                (LOOP
                 (COND ((OR (> |i| |bfVar#2|) (NOT |res|)) (RETURN NIL))
                       (#1# (SETQ |res| (EQUAL (ELT |n| |i|) (ELT |sr| |i|)))))
                 (SETQ |i| (+ |i| 1))))
              (- (LENGTH |sr|) 1) 0)
             |res|))))))

; delete_file(f) == DELETE_-FILE(f)

(DEFUN |delete_file| (|f|) (PROG () (RETURN (DELETE-FILE |f|))))
