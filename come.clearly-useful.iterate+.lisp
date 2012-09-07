;;;; com.clearly-useful.iterate+.lisp 

(in-package #:com.clearly-useful.iterate+)


;;; per item in seq
;;; like for x in list
(defmacro-clause (per v in s)
  (let ((seq (gensym)))
    `(progn
       (initially (setq ,seq (seq ,s)))
       (while ,seq)
       (for ,v = (head ,seq))
       (for ,seq next (tail ,seq)))))

;;; per item on seq
;;; like for item on list (binds item to subsequent tails)
(defmacro-clause (per v on s)
  (let ((seq (gensym)))
    `(progn
       (initially (setq ,seq (seq ,s)))
       (while ,seq)
       (for ,v = ,seq)
       (for ,seq next (tail ,seq)))))

;;; per item of thing
;;; iters through a iterator
;;; createad by calling iterator
;;; on thing.
(defmacro-clause (per v of s)
  (let ((it (gensym))
	(val (gensym))
	(continue (gensym)))
    `(progn
       (with ,it = (iterator ,s))
       (finally-protected (iterator-finish! ,it))
       (for (values ,val ,continue) = (iterator-next! ,it))
       (while ,continue)
       (for ,v = ,val))))
