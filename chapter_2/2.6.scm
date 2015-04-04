#lang planet neil/sicp
;;zero 接受参数F 返回一个接受参数为x返回x的函数
(define zero (lambda (f) (lambda (x) x)))
;;add-1接受一个过程n返回的是接受F作为参数
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;;带入(add-1 zero)
(define (one)
  (lambda (f) (lambda (x) (f x))))

;;two (add-1 one)
(define (two)
  (lambda (f) (lambda (x) (f (f x))))
  )

;; define +

(define +
  (lambda (m)
      (lambda (n)
        (lambda (f)
          (lambda (x)
            (m f (n f x)))))))