#lang planet neil/sicp
(define (deep-reverse alist)
  (define (reverse-iter alist relist)
    (if (null? alist)
        relist
        (reverse-iter (cdr alist) (if (pair? (car alist)) (cons (reverse-iter (car alist) '()) relist) (cons (car alist) relist)))
        ))
  (reverse-iter alist '())
  )
(deep-reverse (list (list 1 2) (list 3 4)))