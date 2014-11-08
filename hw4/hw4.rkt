
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below
;(define ones (lambda () (cons 1 ones))) ;; for testing

;1
(define (sequence low high stride) 
    (if (< high low)
        null
        (cons low (sequence (+ low stride) high stride))))


;2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs ))

;3
(define (list-nth-mod xs n) 
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

;4
(define (stream-for-n-steps s n)
  (if (= n 0)
      null
      (let ([pair (s)])
        (cons (car pair) (stream-for-n-steps (cdr pair) (- n 1))))))


;5
(define (funny-number-stream)
  (define (f x) (cons (if (= 0 (remainder x 5)) (- x) x) (lambda () (f(+ x 1)))))
  (f 1));


;6  
(define (dan-then-dog)
  (letrec ([dog (lambda () (cons "dog.jpg" dan ))]
          [dan (lambda () (cons "dan.jpg" dog ))])
   (dan)))

;7
(define (stream-add-zero s)
  (define (f x) 
    (let ([pair (x)])
      (cons (cons 0 (car pair)) (lambda () (f (cdr pair))) )))
  (lambda () (f s)))
    


;8
(define (cycle-lists xs ys)
  (letrec  ([f (lambda (n) 
                 (let ([x (list-nth-mod xs n)]
                       [y (list-nth-mod ys n)])
                   (cons (cons x y) (lambda () (f (+ n 1))))))])
  (lambda () (f 0))))


;9
(define (vector-assoc v vec)
  (letrec ([f (lambda (n)
                (if (>= n (vector-length vec)) 
                    #f
                    (let ([ele (vector-ref vec n)])
                      (if (and (pair? ele) (equal? (car ele) v))
                          ele
                          (f (+ n 1))))))])
    (f 0)))
                          
;10
(define (cached-assoc xs n)
  (letrec ([cache (make-vector n)]
        [size 0]
        [f (lambda (v) 
             (if (vector-assoc v cache) 
                 (vector-assoc v cache)
                 (let ([ans (assoc v xs)]) 
                   (if ans
                       (begin (vector-set! cache size ans)
                              (set! size (remainder (+ size 1) n))
                              ans)
                       (#f)))))])
    f))
  
;11
(define-syntax while-less
  (syntax-rules (do)
     [(while-less e1 do e2)
      (letrec ([e1v e1]
               [f (lambda () (if (>= e2 e1v)
                                 #t
                                 (f)))])
        (f))]))
           

  
  
  
  
  
  