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

;;2.11
(define (endpoint-sign i)
  (cond 
    ((and (>= (upper-bound i) 0) (>= (lower-bound i) 0)) 1)
    ((and (< (upper-bound i) 0) (< (lower-bound i) 0)) -1)
    (else 0)    ))

(define (mul-interval-2 x y)
  (let ((es-x (endpoint-sign x))
        (es-y (endpoint-sign y))
        (x-up (upper-bound x))
        (x-lo (lower-bound y))
        (y-up (upper-bound y))
        (y-lo (lower-bound y))
        )
    (cond 
      ((> es-x 0);;当x区间在正半轴
       (cond 
         ((> es-y 0) (make-interval (* x-lo y-lo) (* x-up y-up)));;y都大于0
         ((< es-y 0) (make-interval (* x-up y-lo) (* x-lo y-up)));;y都小于0
         (else (make-interval (* x-up y-lo) (* x-up y-up))) ;;y有正有负
       ))
      ((< es-x 0);;x区间在负半轴
       (cond
         ((> es-y 0) (make-interval (* x-lo y-up) (* x-up y-lo)))
         ((< es-y 0) (make-interval (* x-up y-up) (* x-lo y-lo)))
         (else (make-interval (* x-lo y-up) (* x-lo y-lo)))
       ))  
      (else
        (cond
          ((> es-y 0) (make-interval (* y-up x-lo) (* y-up x-up)))
          ((< es-y 0) (make-interval (* x-up y-lo) (* x-lo y-lo)))
          (else
           (make-interval (min (* x-lo y-up) (* x-up y-lo)) (max (* x-lo y-lo) (* x-up y-up))))
          )
       )   
         ))
    )

;;2.12
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
(define (make-center-percent i percent) 
  (make-center-width (center i) (* (width i) percent)))
