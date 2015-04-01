#lang planet neil/sicp

;;smooth
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

(define (average a b c)(/ (+ a b c) 3))
(define dx 0.000001)
(define (smooth f)
  (lambda (x) (average (f x) (f (+ x dx)) (f (- x dx)))))
((smooth square) 5)

(define (smooth-n-times f n)
  ((repeated smooth n) f))
((smooth-n-times square 100) 5)