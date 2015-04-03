#lang planet neil/sicp

;;递归版本
(define (f x)(* (/ (- x 1) x) (/ (+ x 1) x)))
(define (next-f x)(+ x 2.0))
(define (product item a next b)
  (if (> a b) 1
  (* (item a) (product item (next a) next b)))
)

(define (factorial n) (* 4 (product f 3 next-f n)))
;(factorial 10000)

;;迭代版本
(define (product-iter item a result next b) 
  ;(display result)
  (if (> a b) result 
      (product-iter item (next a) (* result (item a)) next b)))
(define (product2 item a next b)
  (product-iter item a (item a) next b))

;;test
(define (square x)(* x x))
(define (inc x) (+ x 1))
(product square 1 inc 10)
(product2 square 1 inc 10)