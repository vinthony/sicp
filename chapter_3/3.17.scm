#lang planet neil/sicp
(define (container? l item)
  (if (null? l)
      #f
      (if (eq? (car l) item) 
          #t
          (container? (cdr l) item)
          )
      ))

(define (count-pairs x)
  (define (inner x memo-list)
    (if (and (pair? x) (not (memq x memo-list))) ;; memq : x 在 list 中
        (inner (car x) (inner (cdr x) (cons x memo-list))) ;; 下一个在 cdr和cons 
        memo-list)) 
  (length (inner x '()))
  )


(define three (cons 1 (cons 2 (cons 3 '()))))

(count-pairs three)

(define two (cons 1 (cons 2 '())))
(define four (cons two (cdr two)))
(count-pairs four)

(define seven (cons three three))

(count-pairs seven)
(count-pairs (cons (cons 1 '()) (cons 3 '())))