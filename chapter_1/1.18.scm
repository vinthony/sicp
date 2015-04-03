#lang planet neil/sicp

(define (double x) 
  (+ x x))
(define (halve x)
  (/ x 2))
;(define (multi a b)
;  (cond 
;    ((= b 0) a)
;    ((even? b) (double (multi a (halve b))))
;    ((odd? b) (+ a (multi a (- b 1))))
;    ))
(define (multi-iter a b product)
  (cond
    ((= b 0) product)
    ((even? b) (multi-iter (double a) (halve b)  product))
    ((odd? b) (multi-iter a (- b 1) (+ a product)))
    ))
(define (multi a b)
  (multi-iter a b 0))

(multi 10 10)