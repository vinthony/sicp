#lang planet neil/sicp

;;集合作为排序表

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))
        ))

(define (adjoin-set x set)
  (if (element-of-set? x set) set 
  (cond ((null? set) (cons x '()))
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))
        )))
(define s (list 1 2 3 4))
(adjoin-set 0 s)