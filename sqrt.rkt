#lang planet neil/sicp
(define (goodenough2? guess nextguess)
  (< (/ (abs (- guess nextguess)) guess) 0.001))
(define (sqrt-iter guess x)
  (if (goodenough2? guess (improve guess x)) guess
      (sqrt-iter (improve guess x) x)))
(define (square x) (* x x))
(define (goodenough? guess x) 
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (/ (+ (/ x guess) guess) 2))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

