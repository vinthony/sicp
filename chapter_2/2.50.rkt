#lang racket
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(define painter einstein)
;;transform-painter 和sicp中参数略有不同
;;关于frame
;; 第一个参数为参考点的坐标
;; 第二个为x方向的分量
;; 第三个为y方向的分量
(define (filp-horiz-s painter)
  ((transform-painter 
                     (make-vect 1.0 0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)) painter))
(define (flip-180 painter)
  ((transform-painter
    (make-vect 1.0 1.0)
    (make-vect 0 1.0)
    (make-vect 1.0 0)
    ) painter))

(define (flip-270 painter)
  ((transform-painter
    (make-vect 0 1.0)
    (make-vect 0 0)
    (make-vect 1.0 1.0)
    ) painter))
(paint painter)
(paint (filp-horiz-s painter))
(paint (flip-180 painter))
(paint (flip-270 painter))