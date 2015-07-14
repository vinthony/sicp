 #lang planet neil/sicp
(define (g y) ;; 返回f 其中y =0 
    (define (f x)  
     (let ((z y))  
        (set! y x) 
        z)) 
    f) 
  (define f (g 0)) 

;(+ (f 0) (f 1)) 0 / 0
(+ (f 1) (f 0)) ;;  0 / 1