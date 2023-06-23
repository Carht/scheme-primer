(let ([me "Bob"])
  "Alice"
  me)

(let* ([x 1]
       [y (+ x 1)])
  (* x y))

(letrec ([is-even? (lambda (x)
		     (or (zero? x)
			 (is-odd? (sub1 x))))]
	 [is-odd? (lambda (x)
		    (and (not (zero? x))
			 (is-even? (sub1 x))))])
  (is-odd? 11))

(struct dog (name breed age))
(define my-pet
  (dog "lassie" "collie" 5))

(dog? my-pet)
(dog-breed my-pet)

(struct rgba-color (red green blue alpha) #:mutable)
(define burgundy
  (rgba-color 144 0 32 1.0))
(set-rgba-color-green! burgundy 10)
(rgba-color-green burgundy)

(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))

(cons 1 (cons 2 null))
(list 1 2)
'(1 2)
`(1 ,(+ 1 5))

(car (list 1 2 3))
(cdr (list 1 2 3))

(cadr (list 1 2 3))
(car (cdr (list 1 2 3)))

(cddr (list 1 2 3))
(cdr (cdr (list 1 2 3)))
(caddr (list 1 2 3))
(car (cdr (cdr (list 1 2 3))))

(cons 3 (list 1 2 3))
(append (list 1 2 3) (list 4 5 6))

(map add1 (list 1 2 3))
(map + (list 1 2 3) (list 4 5 6))
(filter even? (list 1 2 3 4 5))
(count even? (list 1 2 3 4 5))
(take (list 1 2 3 4) 2)
(drop (list 1 2 3 4) 2)

;; vectors

#(1 2 3)

(vector-append #(1 2 3) #(4 5 6))

;; sets from list
(list->set (list 1 2 3 3 1 2 3 1 1 2 3 4))

(set-add (set 1 2 3) 4)
(set-remove (set 1 2 3) 1)
(set-member? (set 1 2 3) 1)
(set-member? (set 1 2 3) 5)

;; hashes or dictionaries
(define m (hash 'a 1 'b 2 'c 3))
(hash-ref m 'a)
(hash-ref m 'z)
(hash-ref m 'x 0)
(define m2 (hash-set m 'd 5))
m
m2

;; functions
(lambda () "Hello, Racket")
(define hello-racket (lambda () "Hello Racket!"))

(define hello
  (lambda (name)
    (string-append "Hello, " name)))

(define (hello2 name)
  (string-append "Hello, " name))

(define hello3
  (case-lambda
    [() "Hell-o Racket!"]
    [(name) (string-append "HELL-o " name)]))

(hello3)
(hello "somename")

;; with default value
(define (hello4 [name "Racket!"])
  (string-append "Hello " name))
(hello4)
(hello4 "somename")

;; variadic
(define count-args
  (lambda args
    (format "OK, you passed ~a args. args: ~a" (length args) args)))

(define count-args2
  (lambda (name . args)
    (format "Hello ~a, you passed ~a extra args" name (length args))))

;; Equality
;; For numbers `='
;; eq? return #t if 2 arguments refer to the same object (in memory), a simple pointer comparison
;; eqv? for numbers and characters
;; equal? is more generic, support comparison for: strings, byte strings, pairs, mutable pairs,
;;        vectors, boxes, hash tables and inspectable structures.

;; Control flow
(if #t
    "True"
    "False")

(cond [(> 2 2) (error "wrong!")]
      [(< 2 2) (error "wrong again!")]
      [else 'ok])


;; Pattern Matching

(define (fizzbuzz? x)
  (match (list (remainder x 3) (remainder x 5))
    [(list 0 0) 'fizzbuzz]
    [(list 0 _) 'fizz]
    [(list _ 0) 'buzz]
    [_ #f]))

;; Loops

(for ([i 10])
  (printf "i=~a\n" i))

(for ([i (in-range 5 10)])
  (printf "i=~a\n" i))

(for ([i (in-list '(a b c d))])
  (displayln i))

(for ([i (in-vector #(a b c d))])
  (displayln i))

(for ([i (in-string "abcd")])
  (displayln i))

(for ([i (in-set (set 'a 'b 'c))])
  (displayln i))

(for ([(x y) (in-hash (hash 'a 1 'b 2 'c 3))])
  (printf "Key:~a value:~a\n" x y))

;; conditions
(for ([i 1000]
      #:when (> i 5)
      #:unless (odd? i)
      #:break (> i 10))
  (printf "~a\n" i))

;; collecting results
(for/list ([i (range 0 10)])
  (add1 i))

(for/list ([i (range 0 10)] #:when (even? i))
  i)

(for/list ([i 10] [j '(x y z)])
  (list i j))

(for/list ([i 1000] #:when (> i 5) #:unless (odd? i) #:break (> i 21))
  i)

(for/hash ([i (range 0 10)])
  (values i (number->string i)))

(for/sum ([i 10]) (* i i))
(for/product ([i (in-range 1 11)]) (* i i))
(for/and ([i 10] [j (in-range 10 20)]) (< i j))
(for/or ([i 10] [j (in-range 0 20 2)]) (= i j))

;; fold!
(for/fold ([sum 0]) ([i (range 0 5)]) (+ sum i))

;; IO
(define out-port (open-output-file "/tmp/tmp.txt"))
(displayln "Hello Racket!" out-port)
(close-output-port out-port)

;; append information
(define out-port (open-output-file "/tmp/tmp.txt"
				   #:exists 'append))
(displayln "Hello RACKETT!" out-port)
(close-output-port out-port)

;; read from file
(define in-port (open-input-file "/tmp/tmp.txt"))
(displayln (read-line in-port))
(displayln (read-line in-port))
(close-input-port in-port)

;; macro way
(call-with-output-file "/tmp/tmp.txt"
  #:exists 'update
  (lambda (out-port)
    (displayln "ABC!" out-port)))

(call-with-input-file "/tmp/tmp.txt"
  (lambda (in-port)
    (displayln (read-line in-port))))
