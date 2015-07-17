 #lang planet neil/sicp

;; 双端队列类似于双向链表 每一项需要有首指针 尾指针 和数据项


(define (make-deque)
  (cons '() '()))

(define (front-ptr queue)
  (car queue))
(define (rear-ptr queue)
  (cdr queue))
(define (set-front-ptr! queue item)
  (set-car! queue item))
(define (set-rear-ptr! queue item)
  (set-cdr! queue item))
(define (empty-deque? queue)
  (null? (car queue)))

(define (front-insert-deque! queue item)
  (let ((new-pair (cons item '()))))
  (cond ((empty-deque? queue)
         (set-front-ptr! queue new-pair)
         (set-rear-ptr! queue new-pair)
         queue)
        (else
         (set-cdr! (front-ptr queue) new-pair)
         (set-front-ptr! queue new-pair)
         )
      ))
(define (rear-insert-deque! queue item)
  (let ((new-pair (cons item '())))
  (cond ((empty-deque? queue)
         (set-front-ptr! queue new-pair)
         (set-rear-ptr! queue new-pair)
         queue)
        (else
         (set-cdr! (rear-ptr queue) new-pair)
         (set-rear-ptr! queue new-pair)
         ))))

(define (front-delete-deque! queue)
  (cond ((empty-deque? queue) (error "EMPTY-DEQUE" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)
        ))
(define (rear-delete-deque! queue)
  (cond ((empty-deque? queue) (error "EMPTY-DEQUE" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)
        ))