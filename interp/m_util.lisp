
; )package "BOOT"

(IN-PACKAGE "BOOT")

; DEFPARAMETER($error_mark, GENSYM())

(DEFPARAMETER |$error_mark| (GENSYM))

; $mode_off := 0

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$mode_off| 0))

; $dir_name_off := 1

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$dir_name_off| 1))

; $index_table_off := 2

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$index_table_off| 2))

; $index_stream_off := 3

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$index_stream_off| 3))

; make_kaf(mode, dir_name, index_table, index_stream) ==
;     kaf := GETREFV(4)
;     kaf.$mode_off := mode
;     kaf.$dir_name_off := dir_name
;     kaf.$index_table_off := index_table
;     kaf.$index_stream_off := index_stream
;     kaf

(DEFUN |make_kaf| (|mode| |dir_name| |index_table| |index_stream|)
  (PROG (|kaf|)
    (RETURN
     (PROGN
      (SETQ |kaf| (GETREFV 4))
      (SETF (ELT |kaf| |$mode_off|) |mode|)
      (SETF (ELT |kaf| |$dir_name_off|) |dir_name|)
      (SETF (ELT |kaf| |$index_table_off|) |index_table|)
      (SETF (ELT |kaf| |$index_stream_off|) |index_stream|)
      |kaf|))))

; kaf_mode(kaf) == kaf.$mode_off

(DEFUN |kaf_mode| (|kaf|) (PROG () (RETURN (ELT |kaf| |$mode_off|))))

; kaf_dir_name(kaf) == kaf.$dir_name_off

(DEFUN |kaf_dir_name| (|kaf|) (PROG () (RETURN (ELT |kaf| |$dir_name_off|))))

; kaf_index_table(kaf) == kaf.$index_table_off

(DEFUN |kaf_index_table| (|kaf|)
  (PROG () (RETURN (ELT |kaf| |$index_table_off|))))

; kaf_set_indextable(kaf, index_table) ==
;     kaf.$index_table_off := index_table

(DEFUN |kaf_set_indextable| (|kaf| |index_table|)
  (PROG () (RETURN (SETF (ELT |kaf| |$index_table_off|) |index_table|))))

; kaf_index_stream(kaf) == kaf.$index_stream_off

(DEFUN |kaf_index_stream| (|kaf|)
  (PROG () (RETURN (ELT |kaf| |$index_stream_off|))))

; $index_filename := "index.KAF"

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$index_filename| '|index.KAF|))

; get_io_index_stream(dir_name, io?) ==
;     ds := (io? => 'io; 'input)
;     ind_name := CONCAT(dir_name, '"/", $index_filename)
;     open_stream2(ind_name, ds, false)

(DEFUN |get_io_index_stream| (|dir_name| |io?|)
  (PROG (|ds| |ind_name|)
    (RETURN
     (PROGN
      (SETQ |ds| (COND (|io?| '|io|) ('T '|input|)))
      (SETQ |ind_name| (CONCAT |dir_name| "/" |$index_filename|))
      (|open_stream2| |ind_name| |ds| NIL)))))

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

; kaf_open2(name, io?) ==
;     full_name :=
;         io? => name
;         make_input_filename1(name)
;     NULL(full_name) => nil
;     res1 := true
;     if io? then
;         kind := file_kind(full_name)
;         res1 :=
;             kind = -1 => makedir(full_name) = 0
;             kind = 0 => nil
;             true
;     NULL(res1) => nil
;     stream := get_io_index_stream(full_name, io?)
;     NULL(stream) => nil
;     make_kaf((io? => 'output; 'input), full_name,
;              get_io_index_table(stream, io?), stream)

(DEFUN |kaf_open2| (|name| |io?|)
  (PROG (|full_name| |res1| |kind| |stream|)
    (RETURN
     (PROGN
      (SETQ |full_name|
              (COND (|io?| |name|) (#1='T (|make_input_filename1| |name|))))
      (COND ((NULL |full_name|) NIL)
            (#1#
             (PROGN
              (SETQ |res1| T)
              (COND
               (|io?| (SETQ |kind| (|file_kind| |full_name|))
                (SETQ |res1|
                        (COND
                         ((EQUAL |kind| (- 1)) (EQL (|makedir| |full_name|) 0))
                         ((EQL |kind| 0) NIL) (#1# T)))))
              (COND ((NULL |res1|) NIL)
                    (#1#
                     (PROGN
                      (SETQ |stream| (|get_io_index_stream| |full_name| |io?|))
                      (COND ((NULL |stream|) NIL)
                            (#1#
                             (|make_kaf|
                              (COND (|io?| '|output|) (#1# '|input|))
                              |full_name| (|get_io_index_table| |stream| |io?|)
                              |stream|)))))))))))))

; kaf_open(name, io?) ==
;     res1 := kaf_open2(name, io?)
;     NULL(res1) =>
;         ERROR(FORMAT(nil, '"Can not open ~s", name))
;     res1

(DEFUN |kaf_open| (|name| |io?|)
  (PROG (|res1|)
    (RETURN
     (PROGN
      (SETQ |res1| (|kaf_open2| |name| |io?|))
      (COND ((NULL |res1|) (ERROR (FORMAT NIL "Can not open ~s" |name|)))
            ('T |res1|))))))

; kaf_close(kaf) ==
;     istr := kaf_index_stream(kaf)
;     if kaf_mode(kaf) = 'output then
;         write_indextable(istr, kaf_index_table(kaf))
;     CLOSE(istr)

(DEFUN |kaf_close| (|kaf|)
  (PROG (|istr|)
    (RETURN
     (PROGN
      (SETQ |istr| (|kaf_index_stream| |kaf|))
      (COND
       ((EQ (|kaf_mode| |kaf|) '|output|)
        (|write_indextable| |istr| (|kaf_index_table| |kaf|))))
      (CLOSE |istr|)))))

; kaf_read(kaf, key, sv) ==
;     not(kaf_mode(kaf) = 'input) =>
;         ERROR('"not input stream")
;     NULL(entry := find_key(kaf_index_table(kaf), key)) =>
;         sv = $error_mark =>
;             ERROR(FORMAT(nil, '"key ~a not found", key))
;         sv
;     pos := CADR(entry)
;     NULL(pos) => CDDR(entry)
;     NUMBERP(pos) =>
;         stream := kaf_index_stream(kaf)
;         FILE_-POSITION(stream, pos)
;         READ(stream)
;     BREAK()

(DEFUN |kaf_read| (|kaf| |key| |sv|)
  (PROG (|entry| |pos| |stream|)
    (RETURN
     (COND ((NULL (EQ (|kaf_mode| |kaf|) '|input|)) (ERROR "not input stream"))
           ((NULL (SETQ |entry| (|find_key| (|kaf_index_table| |kaf|) |key|)))
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
                     (SETQ |stream| (|kaf_index_stream| |kaf|))
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
;     entry := find_key(kaf_index_table(kaf), key)
;     NULL(entry) =>
;         kaf_set_indextable(kaf,
;                            CONS([key, :pos], kaf_index_table(kaf)))
;     SETF(CDR(entry), pos)

(DEFUN |make_entry| (|kaf| |key| |pos|)
  (PROG (|entry|)
    (RETURN
     (PROGN
      (SETQ |entry| (|find_key| (|kaf_index_table| |kaf|) |key|))
      (COND
       ((NULL |entry|)
        (|kaf_set_indextable| |kaf|
         (CONS (CONS |key| |pos|) (|kaf_index_table| |kaf|))))
       ('T (SETF (CDR |entry|) |pos|)))))))

; kaf_write(kaf, key, val) ==
;     not(kaf_mode(kaf) = 'output) =>
;         ERROR('"not output stream")
;     stream := kaf_index_stream(kaf)
;     pos :=
;         NULL(val) => CONS(nil, val)
;         [FILE_-POSITION(stream)]
;     make_entry(kaf, key, pos)
;     if NUMBERP(CAR(pos)) then write_to_stream(val, stream)

(DEFUN |kaf_write| (|kaf| |key| |val|)
  (PROG (|stream| |pos|)
    (RETURN
     (COND
      ((NULL (EQ (|kaf_mode| |kaf|) '|output|)) (ERROR "not output stream"))
      (#1='T
       (PROGN
        (SETQ |stream| (|kaf_index_stream| |kaf|))
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
;     itable := kaf_index_table(kaf)
;     itable := assoc_delete_equal(itable, key)
;     kaf_set_indextable(kaf, itable)

(DEFUN |kaf_remove| (|kaf| |key|)
  (PROG (|itable|)
    (RETURN
     (PROGN
      (SETQ |itable| (|kaf_index_table| |kaf|))
      (SETQ |itable| (|assoc_delete_equal| |itable| |key|))
      (|kaf_set_indextable| |kaf| |itable|)))))

; rkeys2(kaf) ==
;     MAPCAR(function CAR, kaf_index_table(kaf))

(DEFUN |rkeys2| (|kaf|)
  (PROG () (RETURN (MAPCAR #'CAR (|kaf_index_table| |kaf|)))))

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
;         is_dir_separator?(n.k) => k := -1
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
            (COND ((|is_dir_separator?| (ELT |n| |k|)) (SETQ |k| (- 1)))
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
;     while k >=0 and not(is_dir_separator?(n.k)) repeat
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
                  (NULL (|is_dir_separator?| (ELT |n| |k|)))))
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
;     while k >=0 and not(is_dir_separator?(n.k)) repeat
;         k := k - 1
;     k < 0 => '""
;     k = 0 => '"/"
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
                  (NULL (|is_dir_separator?| (ELT |n| |k|)))))
            (RETURN NIL))
           (#1='T (SETQ |k| (- |k| 1)))))))
      (COND ((MINUSP |k|) "") ((EQL |k| 0) "/") (#1# (SUBSTRING |n| 0 |k|)))))))

; make_filename2(n, e) ==
;     has_extention?(n, e) => n
;     CONCAT(n, '".", e)

(DEFUN |make_filename2| (|n| |e|)
  (PROG ()
    (RETURN (COND ((|has_extention?| |n| |e|) |n|) ('T (CONCAT |n| "." |e|))))))

; probe_name(name) ==
;     fricas_probe_file(name) => name
;     nil

(DEFUN |probe_name| (|name|)
  (PROG () (RETURN (COND ((|fricas_probe_file| |name|) |name|) ('T NIL)))))

; make_input_filename2(n, e) ==
;     make_input_filename1(make_filename2(n, e))

(DEFUN |make_input_filename2| (|n| |e|)
  (PROG () (RETURN (|make_input_filename1| (|make_filename2| |n| |e|)))))

; make_input_filename1(name) ==
;     is_absolute_name?(name) =>
;         probe_name(name)
;     ext := file_extention(name)
;     d_lst := get_directory_list(ext)
;     found := false
;     for d in d_lst while(not(found)) repeat
;         n1 := CONCAT(d, '"/", name)
;         found := fricas_probe_file(n1)
;     found => n1
;     probe_name(name)

(DEFUN |make_input_filename1| (|name|)
  (PROG (|ext| |d_lst| |found| |n1|)
    (RETURN
     (COND ((|is_absolute_name?| |name|) (|probe_name| |name|))
           (#1='T
            (PROGN
             (SETQ |ext| (|file_extention| |name|))
             (SETQ |d_lst| (|get_directory_list| |ext|))
             (SETQ |found| NIL)
             ((LAMBDA (|bfVar#2| |d|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#2|) (PROGN (SETQ |d| (CAR |bfVar#2|)) NIL)
                       |found|)
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |n1| (CONCAT |d| "/" |name|))
                    (SETQ |found| (|fricas_probe_file| |n1|)))))
                 (SETQ |bfVar#2| (CDR |bfVar#2|))))
              |d_lst| NIL)
             (COND (|found| |n1|) (#1# (|probe_name| |name|)))))))))

; find_file(name, ftl) ==
;     res := nil
;     for ft in ftl while(not(res)) repeat
;         res := make_input_filename2(name, ft)
;     res

(DEFUN |find_file| (|name| |ftl|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#3| |ft|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |ft| (CAR |bfVar#3|)) NIL) |res|)
            (RETURN NIL))
           ('T (SETQ |res| (|make_input_filename2| |name| |ft|))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       |ftl| NIL)
      |res|))))

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
;         is_dir_separator?(n.0) => SUBSTRING(n, 1, #n - 1)
;         n
;     is_dir_separator?(d.(#d - 1)) => CONCAT(d, n)
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
                              ((|is_dir_separator?| (ELT |n| 0))
                               (SUBSTRING |n| 1 (- (LENGTH |n|) 1)))
                              (#1# |n|)))
                     (COND
                      ((|is_dir_separator?| (ELT |d| (- (LENGTH |d|) 1)))
                       (CONCAT |d| |n|))
                      (#1# (CONCAT |d| '/ |n|))))))))))))

; new_fname(d, n, e) ==
;     good := false
;     res := nil
;     while not(good) repeat
;         res := make_fname(d, PNAME(GENSYM(n)), e)
;         good := not(fricas_probe_file(res))
;     res

(DEFUN |new_fname| (|d| |n| |e|)
  (PROG (|good| |res|)
    (RETURN
     (PROGN
      (SETQ |good| NIL)
      (SETQ |res| NIL)
      ((LAMBDA ()
         (LOOP
          (COND (|good| (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |res| (|make_fname| |d| (PNAME (GENSYM |n|)) |e|))
                  (SETQ |good| (NULL (|fricas_probe_file| |res|)))))))))
      |res|))))

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
             ((LAMBDA (|bfVar#4| |i|)
                (LOOP
                 (COND ((OR (> |i| |bfVar#4|) (NOT |res|)) (RETURN NIL))
                       (#1# (SETQ |res| (EQUAL (ELT |n| |i|) (ELT |sr| |i|)))))
                 (SETQ |i| (+ |i| 1))))
              (- (LENGTH |sr|) 1) 0)
             |res|))))))

; delete_file(f) == DELETE_-FILE(f)

(DEFUN |delete_file| (|f|) (PROG () (RETURN (DELETE-FILE |f|))))

; MAKE_INSTREAM(name) ==
;     NULL(fn := make_input_filename1(name)) => nil
;     open_stream2(fn, 'input, false)

(DEFUN MAKE_INSTREAM (|name|)
  (PROG (|fn|)
    (RETURN
     (COND ((NULL (SETQ |fn| (|make_input_filename1| |name|))) NIL)
           ('T (|open_stream2| |fn| '|input| NIL))))))

; MAKE_OUTSTREAM(name) == open_stream(name, 'output, false)

(DEFUN MAKE_OUTSTREAM (|name|)
  (PROG () (RETURN (|open_stream| |name| '|output| NIL))))

; make_out_stream(name) == cons(true, MAKE_OUTSTREAM(name))

(DEFUN |make_out_stream| (|name|)
  (PROG () (RETURN (CONS T (MAKE_OUTSTREAM |name|)))))

; make_append_stream(name) == cons(true, open_stream(name, 'output, true))

(DEFUN |make_append_stream| (|name|)
  (PROG () (RETURN (CONS T (|open_stream| |name| '|output| T)))))

; make_std_out_stream() == cons(false, get_lisp_std_out())

(DEFUN |make_std_out_stream| ()
  (PROG () (RETURN (CONS NIL (|get_lisp_std_out|)))))

; make_compiler_output_name(dir_name, name) ==
;     CONCAT(dir_name, '"/", name, '".lsp")

(DEFUN |make_compiler_output_name| (|dir_name| |name|)
  (PROG () (RETURN (CONCAT |dir_name| "/" |name| ".lsp"))))

; make_compiler_output_stream(lib, name) ==
;     open_stream(make_compiler_output_name(kaf_dir_name(lib), name),
;                 'output, false)

(DEFUN |make_compiler_output_stream| (|lib| |name|)
  (PROG ()
    (RETURN
     (|open_stream| (|make_compiler_output_name| (|kaf_dir_name| |lib|) |name|)
      '|output| NIL))))

; compile_lib(dir_name) ==
;     name := file_basename(dir_name)
;     compile_lib_file(make_compiler_output_name(dir_name, name))

(DEFUN |compile_lib| (|dir_name|)
  (PROG (|name|)
    (RETURN
     (PROGN
      (SETQ |name| (|file_basename| |dir_name|))
      (|compile_lib_file| (|make_compiler_output_name| |dir_name| |name|))))))

; known_Lisp_equalty?(d) ==
;     f := compiledLookup("=", [['Boolean], "%", "%"], d)
;     null(f) => nil
;     GET(BPINAME(CAR(f)), 'SPADreplace)

(DEFUN |known_Lisp_equalty?| (|d|)
  (PROG (|f|)
    (RETURN
     (PROGN
      (SETQ |f| (|compiledLookup| '= (LIST (LIST '|Boolean|) '% '%) |d|))
      (COND ((NULL |f|) NIL) ('T (GET (BPINAME (CAR |f|)) '|SPADreplace|)))))))

; DELASC(k, l) == [e for e in l | ATOM(e) or not(first(e) = k)]

(DEFUN DELASC (|k| |l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#6| |bfVar#5| |e|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#5|) (PROGN (SETQ |e| (CAR |bfVar#5|)) NIL))
           (RETURN (NREVERSE |bfVar#6|)))
          ('T
           (AND (OR (ATOM |e|) (NULL (EQUAL (CAR |e|) |k|)))
                (SETQ |bfVar#6| (CONS |e| |bfVar#6|)))))
         (SETQ |bfVar#5| (CDR |bfVar#5|))))
      NIL |l| NIL))))

; assoc_del(k, l) == [e for e in l | not(first(e) = k)]

(DEFUN |assoc_del| (|k| |l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#8| |bfVar#7| |e|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#7|) (PROGN (SETQ |e| (CAR |bfVar#7|)) NIL))
           (RETURN (NREVERSE |bfVar#8|)))
          ('T
           (AND (NULL (EQUAL (CAR |e|) |k|))
                (SETQ |bfVar#8| (CONS |e| |bfVar#8|)))))
         (SETQ |bfVar#7| (CDR |bfVar#7|))))
      NIL |l| NIL))))

; assoc_add(k, d, l) == cons([k, :d], assoc_del(k, l))

(DEFUN |assoc_add| (|k| |d| |l|)
  (PROG () (RETURN (CONS (CONS |k| |d|) (|assoc_del| |k| |l|)))))

; ASSOCLEFT(l) == [CAR(e) for e in l]

(DEFUN ASSOCLEFT (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#10| |bfVar#9| |e|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#9|) (PROGN (SETQ |e| (CAR |bfVar#9|)) NIL))
           (RETURN (NREVERSE |bfVar#10|)))
          ('T (SETQ |bfVar#10| (CONS (CAR |e|) |bfVar#10|))))
         (SETQ |bfVar#9| (CDR |bfVar#9|))))
      NIL |l| NIL))))

; ASSOCRIGHT(l) == [CDR(e) for e in l]

(DEFUN ASSOCRIGHT (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#12| |bfVar#11| |e|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#11|) (PROGN (SETQ |e| (CAR |bfVar#11|)) NIL))
           (RETURN (NREVERSE |bfVar#12|)))
          ('T (SETQ |bfVar#12| (CONS (CDR |e|) |bfVar#12|))))
         (SETQ |bfVar#11| (CDR |bfVar#11|))))
      NIL |l| NIL))))

; LASSOC(k, l) ==
;     res := nil
;     found := false
;     for e in l while not(found) repeat
;         if CAR(e) = k then
;             res := CDR(e)
;             found := true
;     res

(DEFUN LASSOC (|k| |l|)
  (PROG (|res| |found|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      (SETQ |found| NIL)
      ((LAMBDA (|bfVar#13| |e|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#13|) (PROGN (SETQ |e| (CAR |bfVar#13|)) NIL)
                |found|)
            (RETURN NIL))
           ('T
            (COND
             ((EQUAL (CAR |e|) |k|) (SETQ |res| (CDR |e|)) (SETQ |found| T)))))
          (SETQ |bfVar#13| (CDR |bfVar#13|))))
       |l| NIL)
      |res|))))

; rassoc(k, l) ==
;     res := nil
;     found := false
;     for e in l while not(found) repeat
;         if CDR(e) = k then
;             res := CAR(e)
;             found := true
;     res

(DEFUN |rassoc| (|k| |l|)
  (PROG (|res| |found|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      (SETQ |found| NIL)
      ((LAMBDA (|bfVar#14| |e|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#14|) (PROGN (SETQ |e| (CAR |bfVar#14|)) NIL)
                |found|)
            (RETURN NIL))
           ('T
            (COND
             ((EQUAL (CDR |e|) |k|) (SETQ |res| (CAR |e|)) (SETQ |found| T)))))
          (SETQ |bfVar#14| (CDR |bfVar#14|))))
       |l| NIL)
      |res|))))

; QLASSQ(p, al) == CDR(ASSQ(p, al))

(DEFUN QLASSQ (|p| |al|) (PROG () (RETURN (CDR (ASSQ |p| |al|)))))

; hashable(d) ==
;     (p := known_Lisp_equalty?(d)) = 'EQ or p = 'EQL or p = 'EQUAL

(DEFUN |hashable| (|d|)
  (PROG (|p|)
    (RETURN
     (OR (EQ (SETQ |p| (|known_Lisp_equalty?| |d|)) 'EQ) (EQ |p| 'EQL)
         (EQ |p| 'EQUAL)))))

; read_line(st) == READ_-LINE(st, nil, nil)

(DEFUN |read_line| (|st|) (PROG () (RETURN (READ-LINE |st| NIL NIL))))

; bright_warn(m) ==
;     sayBrightly(["%l", '"===> ", m, "%l"])

(DEFUN |bright_warn| (|m|)
  (PROG () (RETURN (|sayBrightly| (LIST '|%l| "===> " |m| '|%l|)))))

; COT(x) == COS(x)/SIN(x)

(DEFUN COT (|x|) (PROG () (RETURN (/ (COS |x|) (SIN |x|)))))

; is_char?(c) == CHARACTERP(c)

(DEFUN |is_char?| (|c|) (PROG () (RETURN (CHARACTERP |c|))))

; first_symbol(s) ==
;     pos := search_str('" ", s, 0)
;     INTERN(SUBSTRING(s, 0, pos))

(DEFUN |first_symbol| (|s|)
  (PROG (|pos|)
    (RETURN
     (PROGN
      (SETQ |pos| (|search_str| " " |s| 0))
      (INTERN (SUBSTRING |s| 0 |pos|))))))

; DOWNCASE(s) == STRING_-DOWNCASE(s)

(DEFUN DOWNCASE (|s|) (PROG () (RETURN (STRING-DOWNCASE |s|))))
