#lang planet neil/sicp

;fixed point
(define tolerate 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerate))
  (define (guess x)
    (let ((next (f x)))
    (if (close-enough? next x) next (guess next))
    ))
  (guess first-guess)
)
;(fixed-point cos 1.0)
; average-damp
(define (average x y) (/ (+ x y) 2 ))
(define (average-damp f)(lambda (x) (average x (f x))))
;; repeated
(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x) (* x x))
(define (inc x) (+ x 1))
;((compose square inc) 6)
(define (repeated f n)
  (define (iter ftime i)
    (if (< i n) (compose f ftime))
    )
  (iter f 0)
    )
;; expt
(define (expt base n)
  (if (= n 0) 1 
      ((repeated (lambda (x) (* base x)) n) 1)))

(define (repeated-average-damp x n damp-times)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (expt y (- n 1)))) ) damp-times) 1.0))
(repeated-average-damp 27 3 1)
