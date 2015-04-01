#lang planet neil/sicp
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
((repeated square 2) 5)
  