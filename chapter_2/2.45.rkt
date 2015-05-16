#lang racket
 ( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))
(define (split operation-1 operation-2)
  (define (iter painter n)
    (if ( = n 0)
        painter
        (operation-1 painter (operation-2 (iter painter (- n 1)) (iter painter (- n 1))))
        ))
  (lambda (painter n) (iter painter n))
  )

(define right-split (split beside below))
(define top-split (split below beside))
(define painter einstein)
(paint (right-split painter 4))
(paint (top-split painter 4))