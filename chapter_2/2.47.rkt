#lang racket
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame f)
  (car f))
(define (edge1-frame f)
  (car (cdr f)))
(define (edge2-frame f)
  (car (cdr (cdr f))))

(define frame (make-frame 2 3 4))
(origin-frame frame)
(edge1-frame frame)
(edge2-frame frame)
;;第二种

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(display (make-frame 2 3 4))
(display (make-frame-2 2 3 4))

(define frame-2 (make-frame-2 2 3 4))

(define (origin-frame-2 f)
  (car f))
(define (edge1-frame-2 f)
  (car (cdr f)))
(define (edge2-frame-2 f)
  (cdr (cdr f)))

(origin-frame-2 frame-2)
(edge1-frame-2 frame-2)
(edge2-frame-2 frame-2)