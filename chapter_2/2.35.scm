#lang planet neil/sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))
          )
      ))
(define (fringe alist)
  (cond 
    ((null? alist) alist)
    ((pair? alist) (append (fringe (car alist)) (fringe (cadr alist)))) 
    (else (list alist))))
(define (count-leaves t)
  (accumulate (lambda (x y) (+ y 1)) 0 (fringe t)))
(count-leaves (list (list 1 2) (list 3 4)))
;;方法2
(define (count-leaves-2 t)
  (accumulate (lambda (x y) (+ y x)) 0 (map (lambda (x) (if (pair? x) (count-leaves-2 x) 1) t))))
(count-leaves (list (list 1 2) (list 3 4)))