;; Código normal

(for-each (lambda (str)
	    (display
	     (string-append "Header "
			    (string-upcase str)
			    " Welcome to Guile BOOYEAH!\n")))
	  '("Hello" "World"))

;; deseo ajustar la entrada
;; usamos el "pattern-matching" esquema de scheme-macros

(define-syntax-rule (for (elem lst) body ...)
  (for-each (lambda (elem)
	      body ...)
	    lst))

;; Con este macro podemos ajustar la entrada así:
(for (elem '("Hello" "World"))
     (display
      (string-append "Header "
		     (string-upcase elem)
		     " Welcome to Guile!\n")))

;; Puedo seguir generando la abstracción

(define-syntax-rule (for (elem lst) body ...)
  (for-each (lambda (elem)
	      (display
	       body ...))
	    lst))

;; así reduciría un poco más el for
(for (str '("Hello" "World"))
     (string-append "Header "
		    (string-upcase str)
		    " Welcome to the Jungle!\n"))
