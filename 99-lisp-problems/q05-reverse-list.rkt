#lang racket

(define (rev lst)
  (define (rev-help lst lst-new)
    (if (null? lst)
	lst-new
	(rev-help (cdr lst) (cons (car lst) lst-new))))
  (rev-help lst '()))

(rev '(1 2 3))
