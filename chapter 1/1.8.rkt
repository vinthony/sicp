#lang planet neil/sicp

(define (sqrt3 guess x) 
  (if (goodenough guess x) guess)
  (sqrt3 (improve guess x) x))

(define (goodenough guess x)
  (< (abs (- (square guess) x)) 0.1))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x)
  (* x x)
  )
(define (sqrt x)
  (sqrt3 1.0 x)
 )
(sqrt 27)
