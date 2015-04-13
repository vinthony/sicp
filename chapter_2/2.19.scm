#lang planet neil/sicp

(define (first-denomination kinds-of-coins)
  (cond 
    ((= kinds-of-coins 1) 1)
    ((= kinds-of-coins 2) 5)
    ((= kinds-of-coins 3) 10)
    ((= kinds-of-coins 4) 25)
    ((= kinds-of-coins 5) 50)
    ))
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ 
               (cc amount (- kinds-of-coins 1))
               (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
               ))
        ))
(define (no-more? alist);;定义列表之中是否还有数据
  (if (null? alist) true false))
(define (except-first-denomination coin-values);;定义剩余的金钱数额list
  (cdr coin-values))
(define (first-denomination-2 coin-values);;定义当前的面值
  (car coin-values))
(define (cc-2 amount coin-values)
  (cond 
    ((= amount 0) 1)
    ((or (< amount 0) (no-more? coin-values)) 0)
    (else (+ 
           (cc-2 amount (except-first-denomination coin-values));;当前面值的递归
           (cc-2 (- amount (first-denomination-2 coin-values)) coin-values);;除当前面值之外 剩余金额的递归
           ))
        ))
(define us-coins (list 50 25 10 5 1))
(cc-2 100 us-coins)