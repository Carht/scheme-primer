#lang racket

;; Find the n-th element of a list
;; (get-th '(a b c d e) 3)
;; => c

(define (get-th lst n)
  (cond [(eq? lst '()) '()]
	[(= n 1) (car lst)]
	[else (get-th (cdr lst) (- n 1))]))
