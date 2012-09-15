;;; this file should compile and load without complaint.

(defpackage #:com.clearly-useful.iterate+.test
  (:use #:cl
	#:iterate
	#:com.clearly-useful.sequence-protocol
	#:com.clearly-useful.iterate+))


(in-package #:com.clearly-useful.iterate+.test)


(defun seq-equalp (a b)
  "somewhat value-wise recursive equality
for seqs"
  (cond
    ((and (seq-p a)
	(seq-p b)
	(= (count-seq a)
	   (count-seq b))
	(iter (per c in a)
	      (per d in b)
	      (always (seq-equalp c d)))))
    ((equalp a b) t)
    (t nil)))

(defun expect-in (seq list)
  (let ((result (loop for x in list collect x)))
    (assert (seq-equalp
	     result
	     (iter (per x in seq)
		   (collect x))))))

(defun expect-on (seq list)
  (let ((result (loop for x on list collect x)))
    (assert (seq-equalp
	     result
	     (iter (per x on seq)
		   (collect x))))))

(defun expect-across (seq list)
  (let ((result (loop for x in list collect x)))
    (assert (seq-equalp
	     result
	     (iter (per x across seq)
		   (collect x))))))

(defun expect-of (seq list)
  (let ((result (loop for x in list collect x)))
    (assert (seq-equalp
	     result
	     (iter (per x of seq)
		   (collect x))))))

(let ((result '(a b c d e)))
  (mapcar (lambda (seq)
	    (expect-in seq result)
	    (expect-on seq result)
	    (expect-across seq result)
	    (expect-of seq result))
	  '(;;cons
	    (a b c d e)
	    ;;vector
	    #(a b c d e)
	    ;;mixed
	    (a . #2A((b c) (d e)))
	    )))
