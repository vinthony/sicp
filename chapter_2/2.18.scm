#lang planet neil/sicp
(define (reverse alist)
  (define (reverse-iter alist relist) 
    (if (null? alist)
        relist
        (reverse-iter (cdr alist) (cons (car alist) relist))
        ))
  (reverse-iter alist '())
  )
(reverse (list 1 4 9 16 25))
(list 1 4 9 16 25)