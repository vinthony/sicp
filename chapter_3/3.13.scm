 #lang planet neil/sicp
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))
      ))
(define (append! x y)
  (set-cdr! (last-pair x) y) x)

(define (make-cycle x)
  (set-cdr! (last-pair x) x) 
  x)

(define z (make-cycle (list 'a 'b 'c)))

;;
;;       | a | * | -> | b | * | -> | c | / |
;;     
;;       | a | * | -> | b | * | -> | c | * |
;;        ^                              |                                       
;;        |-------------------------------                                
(last-pair z) ;; 死循环