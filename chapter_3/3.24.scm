 #lang planet neil/sicp

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
  (define (lookup key-1 key-2)
    (let ((subtable (assoc (key-1 (cdr local-table)))))
      (if subtable
          (let ((record (assoc key-2 (cdr subtable))))
            (if record
                (cdr record)
                false)
            ) false)
      ))
  (define (assoc key records)
    (cond ((null? records) #f)
          ((same-key? key (caar records)) (car records))
          (else (assoc key (cdr records)))
          ))
  (define (insert! key-1 key-2 value)
    (let ((subtable (assoc (key-1 (cdr local-table)))))
      (if subtable
          (let ((record (assoc (key-2 (cdr subtable)))))
            (if record
                (set-cdr! record value)
                (set-cdr! subtable
                          (cons (cons key-2 value)
                                (cdr subtable)))
                )
            ))
           (set-cdr! local-table
                     (cons (list key-1) (cons key-2 value))
                     (cdr local-table))
      ) 'ok)
    (define (dispatch s)
      (cond ((eq? s 'lookup) lookup)
            ((eq? s 'insert) insert!)
            (else (error "ERROR 'UNKNOW OPERATION'" s))
            ))
  dispatch))