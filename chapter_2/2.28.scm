#lang planet neil/sicp
(define (fringe alist)
  (cond 
    ((null? alist) alist)
    ((pair? (car alist)) (append (fringe (car alist)) (fringe (cdr alist)))) 
    (else (cons (car alist) (fringe (cdr alist))))))
(fringe (list (list 1 2 3 4)))