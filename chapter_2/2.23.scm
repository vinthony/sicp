#lang planet neil/sicp
(define (for-each proc alist)
  (if 
    (null? alist)
    true
    (cons (proc (car alist)) 
          (for-each proc (cdr alist))) 
    ))
(for-each (lambda (x) (newline) (display x)) (list 57 321 88))