#lang racket
(define (equal? a b)
 (if (and (pair? a) (pair? b))
          (if (and (equal? (car a) (car b)))
              (equal? (cdr a) (cdr b))
              #f
              )
          (eq? a b)
        )
  )

(equal? "100" 300)
(equal? '() '())
(equal? (list 1) (list 1 2 3))
(equal? (list 1 2 3) (list 1 2 3))