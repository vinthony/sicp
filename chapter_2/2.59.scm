#lang planet neil/sicp

;; 集合作为未排序的表

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set))))
  )

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))
        ))
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) 
         (union-set (cdr set1) set2)
         )
        (else (cons (car set1) (union-set (cdr set1) set2)))))
(define set1 (list 1 2 3 4 5 6))
(define set2 (list 4 5 6 7 8 9))
(element-of-set? 3 set1)
(element-of-set? 3 set2)
(display (adjoin-set 10 set1))
(display (adjoin-set 6 set2))
(display (intersection-set set1 set2))
(display (union-set set1 set2))