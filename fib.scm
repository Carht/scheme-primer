#!/usr/bin/guile -s
!#

(define (fib n)
  (cond ((zero? n) 0)
	((equal? n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(display (fib (string->number (cadr (command-line))))) ;; invoca directamente a la función
(newline)
