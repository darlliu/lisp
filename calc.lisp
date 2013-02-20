(defvar *start* (get-internal-real-time))

(defvar *a*
    (* 29384723987 
     (expt 571 203467)))
(defvar *fin* (get-internal-real-time))
(print (- *fin*  *start*))
(print " = time elapsed " )
(print *a*)
