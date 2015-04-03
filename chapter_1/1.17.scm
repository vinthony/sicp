#lang planet neil/sicp
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (fast-multi a b)
  (cond ((= b 0) b)
        ((even? b) (double (fast-multi a (halve b))))
        ((odd? b) (+ a (fast-multi a (- b 1))))
        ))

(fast-multi 10 2)