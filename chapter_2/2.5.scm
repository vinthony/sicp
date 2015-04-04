#lang planet neil/sicp
(define (square x)(* x x))
(define (exp base n)
  (cond ((= n 0) 1) 
        ((even? n) (square (exp base (/ n 2))))
        (else (* base (exp base (- n 1))))
      ))
(define (cons x y)
  (* (exp 2 x) (exp 3 y)))

(define (car z)
  (if (= (remainder z 2) 0) (+ 1 (car (/ z 2)))
      0
      ))
(define (cdr z)
  (if (= (remainder z 3) 0) (+ 1 (cdr (/ z 3)))
      0
      ))

(cdr (cons 10 5))