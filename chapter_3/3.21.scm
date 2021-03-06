 #lang planet neil/sicp
(define (front-ptr queue)
  (car queue))
(define (rear-ptr queue)
  (cdr queue))
(define (set-front-ptr! queue item)
  (set-car! queue item))
(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (make-queue)
  (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))
      )
  )

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair) ;; 空队列 将car和cdr都指向新的序对
           (set-rear-ptr! queue new-pair)
           queue)
          (else (set-cdr! (rear-ptr queue) new-pair) ;; 如果存在则让队列中最后一个值的指针的指向新的数据
                (set-rear-ptr! queue new-pair) ;; 设置queue的后指针指向新的序对
                queue)
          )
    ))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else 
         (set-front-ptr! queue (cdr (front-ptr queue))) queue)))


(define q1 (make-queue))
(insert-queue! q1 'a)
(newline)
(insert-queue! q1 'b)
(newline)
(delete-queue! q1)
(newline)
(delete-queue! q1)

;;当insert过程，插入a时，rear指针指向(a '()) front指针指向(a '())
;;当insert过程，插入b时，将整个队列最后一项的rear部分变成(b '())，同时将后指针变成(b '())
;;当delete过程，将front指针设置成front指针的cdr部分，并未改变后指针的位置

(define (print-queue q)
  (display (car q)))

