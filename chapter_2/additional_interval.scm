#lang planet neil/sicp
;;2.7
(define (make-interval a b)
  (cons a b))
(define (upper-bound interval)
  (max (car interval) (cdr interval)))
(define (lower-bound interval)
  (min (cdr interval) (car interval)))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y)))
        )(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
;;2.8
(define (sub-interval int-a int-b)
  (make-interval 
   (- (upper-bound int-a) (upper-bound int-b))
   (- (lower-bound int-a) (lower-bound int-b))
   ))

;;2.9 略 展开可证

;;2.10

(define (div-interval int-a int-b)
  (if (<= (* (- (upper-bound int-a) (upper-bound int-b)) 
          (- (lower-bound int-a) (lower-bound int-b))) 0)
  (error "can not span 0")
  (mul-interval int-a (make-interval (/ 1. (upper-bound int-b)) (/ 1. (lower-bound int-b))))
  ))
