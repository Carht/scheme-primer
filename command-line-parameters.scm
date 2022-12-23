#! /usr/bin/guile -s
!#
(write (command-line))
(newline)
;; chmod 755 command-line-parameters
;; usage command-line-parameters:
;; ./command-line-parameters -f foo -v -test 1 2 3
;; => ("command-line-parameters.scm" "-f" "foo" "-v" "-test" "1" "2" "3")
