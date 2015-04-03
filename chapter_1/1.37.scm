#lang planet neil/sicp
;;递归版本

;;从小的加到大的
(define (cont-frac f g k)
 (if (= k 0) (/ (f k) (g k)) (/ (f k) (+ (g k) (cont-frac f g (- k 1))))
 )
)
(define (c-f f g k)
  (define (cf i)
    (if (= i k) (/ (f k) (g k)) (/ (f k) (+ (g k) (cf (+ i 1)))))
    )
  (cf 1)
  )

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100)

;;迭代版本
(define (cont-frac-d f g k)
  (define (iter i result)
    (if (= i 0) result 
        (iter (- i 1) (/ (f i) (+ (g i) result))
    )))
  (iter k (/ (f k) (g k)))
  )
(cont-frac-d (lambda (i) 1.0) (lambda (i) 1.0) 100)
(c-f  (lambda (i) 1.0) (lambda (i) 1.0) 100)