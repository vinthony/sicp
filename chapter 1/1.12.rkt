#lang planet neil/sicp

;帕斯卡三角形
(define (pascal-iter row col)
  (if (or (= row col) (= col 0)) 1 
      (+ (pascal-iter (- row 1) (- col 1)) (pascal-iter (- row 1) col ))))
  
;;迭代版本可以通过Cm/n的通项公式来实现
(pascal-iter 4 2)
