#lang racket

;; Find the last box of a list.
;; ex:
;; (my-last '(a b c d))
;; => '(d)

(define (my-last lst)
  (list (car (reverse lst))))
