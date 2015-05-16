#lang racket
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(define top (make-segment (make-vect 0.0 1.0) (make-vect 1.0 1.0)))
(define bottom (make-segment (make-vect 0.0 0.0) (make-vect 1.0 0)))
(define left (make-segment (make-vect 0.0 0.0) (make-vect 0.0 1.0)))
(define right (make-segment (make-vect 1.0 1.0) (make-vect 1.0 0.0)))
(define lb-rt (make-segment (make-vect 0.0 0.0) (make-vect 1.0 1.0)))
(define lt-rb (make-segment (make-vect 1.0 0.0) (make-vect 0.0 1.0)))
(define lc-bc (make-segment (make-vect 0.5 0) (make-vect 0.0 0.5)))
(define rc-bc (make-segment (make-vect 0.5 0.0) (make-vect 1.0 0.5) ))
(define tc-lc (make-segment (make-vect 0.5 1.0) (make-vect 1 0.5)))
(define tc-rc (make-segment (make-vect 0.5 1.0) (make-vect 0 0.5)))

(paint (segments->painter (list top left  right bottom)))
(paint (segments->painter (list lb-rt lt-rb)))
(paint (segments->painter (list lc-bc rc-bc tc-lc tc-rc)))
;;画出wave为重复操作略去