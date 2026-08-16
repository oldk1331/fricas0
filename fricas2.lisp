
(in-package "FRICAS-LISP")
(setq load-type 'load-ondemand)

(defun load2 (file)
    (let* ((suffix (pathname-type (compile-file-pathname "foo.lisp")))
           (basename (string-right-trim "." (string-right-trim (pathname-type file) file)))
           (bin-file (probe-file (concatenate 'string basename "." suffix)))
           (lisp-file (or (probe-file (concatenate 'string basename ".lisp"))
                          (probe-file (concatenate 'string basename ".lsp"))))
           (bin-file-date (if bin-file (file-write-date bin-file) 0))
           (lisp-file-date (if lisp-file (file-write-date lisp-file) 0))
           (bin-newer (> bin-file-date lisp-file-date)))
      (cond
        ((eq load-type 'load-ondemand)
         (load (if bin-newer bin-file lisp-file)))
        ((eq load-type 'compile-ondemand)
         (load (if bin-newer bin-file (compile-file lisp-file))))
        (t (load file))
        )))

(in-package :boot)
(setq |$spadroot| ".")
(defvar |$defaultMsgDatabaseName| "msgs/s2-us.msgs")
(defvar |$build_version| "Common Lisp - 1.3.13")
(defvar |$build_date| "Thu Mar 5 2026")
(defvar |$lisp_id_string| (concatenate 'string (lisp-implementation-type) " " (lisp-implementation-version)))

#+:SBCL
(fricas-lisp::set-initial-parameters) ;; this is skipped in fricas-lisp.lisp, why?

(defun gcmsg (x))

(defun |load_quietly| (f)
)
;;  (handler-bind ((warning #'muffle-warning))
;;    (fricas-lisp::load2 f)))

;;; init
(|interpsysInitialization| t)

(setq |$has_category_hash| (make-hash-table :test #'equal))
(setq |$operation_hash| (make-hash-table))


 (|open_interp_db| t)
 (|open_category_db| t)
 (|open_operation_db| t)
 (|open_browse_db| t)


(let ((*debugger-hook*
            (lambda (condition previous-handler)
                (|spad_system_error_handler| condition))
       ))
     (handler-bind ((error #'|spad_system_error_handler|))
       (|spad|)))
