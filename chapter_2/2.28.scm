#lang planet neil/sicp
(define (fringe alist)
  (cond 
    ((null? alist) alist)
    ((pair? (car alist)) (append (fringe (car alist)) (fringe (cdr alist)))) 
    (else (cons (car alist) (fringe (cdr alist))))))
(fringe (list (list 1 2) (list 3 4)))
;;another way
(define (simplify alist)
  (cond
    ((null? alist) alist)
    ((not (pair? alist)) (list alist))
    (else (append (simplify (car alist)) (simplify (cdr alist))))
    ))
(simplify (list (list 1 2) (list 3 4)))