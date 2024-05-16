#lang racket

;; Find the last but one box of a list
;; (my-but-last '(a b c d))
;; => '(c d)

(define (my-but-last lst)
  (let ((rev (reverse lst)))
    (list (cadr rev) (car rev))))
