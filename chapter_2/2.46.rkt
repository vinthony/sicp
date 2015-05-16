#lang racket
(define (make-vect x y)
  (cons x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cdr v))
(define (helper v1 v2 operation type)
  (operation (type v1) (type v2)))

(define (add-vect v1 v2)
  (make-vect (helper v1 v2 + xcor-vect) (helper v1 v2 + ycor-vect)))

(define (sub-vect v1 v2)
  (make-vect (helper v1 v2 - xcor-vect) (helper v1 v2 - ycor-vect)))
(define (scale-vect s v1)
  (make-vect (* s (xcor-vect v1)) (* s (ycor-vect v1))))

(define n1 (make-vect 10 2))
(define n2 (make-vect 3 4))
(add-vect n1 n2)
(sub-vect n1 n2)
(scale-vect 5 n1)