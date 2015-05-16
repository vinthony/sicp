#lang racket
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(define (make-segments v1 v2)
  (cons v1 v2))
(define (start-segments s)
  (car s))
(define (end-segments s)
  (cdr s))