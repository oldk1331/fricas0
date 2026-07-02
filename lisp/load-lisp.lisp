(load "lisp/fricas-package")

(load "lisp/fricas-lisp")

#+:ECL
(progn (ext:install-bytecodes-compiler) (setq |$lisp_bin_filetype| "fasc"))

(load "lisp/primitives")
