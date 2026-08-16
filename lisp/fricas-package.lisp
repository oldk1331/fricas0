;;; We put this in separate file to avoid problems with compilation.
(defpackage "FRICAS-LISP"
     (:use :common-lisp))
#+:sbcl
(eval-when (:execute :compile-toplevel :load-toplevel)
    (ignore-errors (require "SB-SPROF")))

#+:cmu
(eval-when (:execute :compile-toplevel :load-toplevel)
    (setf STREAM::*DEFAULT-EXTERNAL-FORMAT* :ISO8859-1))

#+:poplog
(eval-when (:compile-toplevel :execute :load-toplevel)
      (set-syntax-from-char #\@ #\@))

(in-package "FRICAS-LISP")
;;; Aldor 1.1.0 and before produces IN-PACKAGE statements with :use options.
;;; These are not allowed in ANSI Common Lisp, so we have to provide our own
;;; IN-PACKAGE.  The :use options can actually be ignored, so we do not use
;;; (defpackage package options)
;;; (in-package package)
#+:cmu
(shadow "UNION" "FRICAS-LISP")
#+:cmu
(shadow "NUNION" "FRICAS-LISP")

#+gcl
(shadow "QUIT")

(export '(QUIT CHDIR |getEnv| |getCLArgs| |load_quietly|
          |get_current_directory|
          |trim_directory_name| |append_directory_name| |pad_directory_name|
          |file_kind| |makedir| |fricas_compile_file| |fricas_compile_fasl|
          |fricas_probe_file| |run_program| |run_shell_command|
          DEFCONST |exit_with_status| MEMQ |quiet_load_alien|
          |handle_input_file| |handle_output_file| |maybe_delete_file|
          |remove_directory| |writeablep| |openServer| |sockGetInt|
          |sockSendInt| |sockSendString| |sockGetFloat| |sockSendFloat|
          |serverSwitch| |sockSendSignal| |sockGetStringFrom|))

#+:GCL
(progn
    (import '(SI::LAMBDA-CLOSURE))
    (export '(SI::LAMBDA-CLOSURE))
)
#+:ecl
(progn
    (require 'cmp)
    (eval-when (:execute :compile-toplevel :load-toplevel)
         (proclaim '(optimize (safety 0))))
)
#+:openmcl
(eval-when (:execute :compile-toplevel :load-toplevel)
      ;;; For Clozure CL assume :win32, when :windows
      #+:windows (push :win32 *features*)
      (setf *features* (delete :CCL *features*)))

;;; Package containing Shoe to Lisp translator
(defpackage "BOOTTRAN" (:use "FRICAS-LISP" "COMMON-LISP"))

;;; Main FriCAS package.  The interpreter and the algebra are run
;;; after switching to the boot package (in-package "BOOT") so any
;;; symbol that the interpreter or algebra uses has to appear here.
(defpackage "BOOT" (:use "FRICAS-LISP" "COMMON-LISP"))

(in-package "BOOT")

(import '(BOOTTRAN::BOOTTOCLC BOOTTRAN::STTOSEX
          BOOTTRAN::|shoeRemovebootIfNec|))

(in-package "BOOTTRAN")

(import '(BOOT::MAKE_HASHTABLE BOOT::QSETVELT BOOT::SETELT_BVEC
          BOOT::STR_ELT))

;;; Package containing support routines for code generated
;;; by Aldor compiler.
(defpackage "FOAM" (:use "FRICAS-LISP" "COMMON-LISP"))

;;; Package for code output by Aldor.
(defpackage "FOAM-USER" (:use "FRICAS-LISP" "COMMON-LISP" "FOAM"))
