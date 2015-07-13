#lang racket
(define (variable? e) (symbol? e))
(define (same-variable? e1 e2)
  (and (variable? e1) (variable? e2) (eq? e1 e2)))
(define (sum? x) ;; 是否为加
  (and (pair? x) (eq? (car x) '+)))
(define (make-sum a1 a2) ;; 构造加式
  (list '+ a1 a2))
(define (addend s) (cadr s))
(define (augend s) (caddr s))
(define (product? x) ;; 是否为乘式
  (and (pair? x) (eq? (car x) '*)))
(define (make-product m1 m2) ;;乘式
  (list '* m1 m2))
(define (multiplier p) ;; 被乘数
  (cadr p))
(define (multiplicand p) ;; 乘数
  (caddr p))
(define (deriv exp var)
  (cond ((number? exp) 0) ;; 数字求导
        ((variable? exp) (if (same-variable? exp var) 1 0)) ;; 同字符/不同字符
        ((sum? exp)
         (make-sum (deriv (addend exp) var) ;;如果是和式 则对加数和被加数进行求导
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum ;; 如果为乘式 按照公式进行求导
          (make-product (multiplier exp) 
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))
          ))
        (else (error "unknown type -- DERIV" exp))
        ))

(provide variable? same-variable? sum? make-sum addend augend product? make-product multiplier multiplicand)