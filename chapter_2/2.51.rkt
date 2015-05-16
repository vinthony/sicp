#lang racket
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(define painter einstein)

(define (belows painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((painter-below ((transform-painter  (make-vect 0.0 0.0)
                                           (make-vect 1.0 0.0)
                                           split-point
                                         ) painter1))
      (painter-up ((transform-painter split-point
                                    (make-vect 1.0 0.5)
                                    (make-vect 0.0 1.0)
                                    ) painter2)))
  (lambda (frame)
    (painter-below frame)
    (painter-up frame)
    ))))
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
(paint (belows painter painter))
(define (below2 painter1 painter2)
  (flip-horiz ((transform-painter 
    (make-vect 0 0)
    (make-vect 0 1)
    (make-vect 1 0)
    )(beside (flip-270 painter1) (flip-270 painter2)))))

(paint (below2 painter painter))