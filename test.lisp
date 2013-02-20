"Hello World"
(defun helloworld()
 (format t "hi there"))

(helloworld);
(defun call-name(firstn lastn)
 (list :fname firstn :nlast lastn))

(defvar *lst1* nil);
(defun add-name (name)
 (push name *lst1*))
(add-name 
           (call-name "Mary" "Gold")
           )
(add-name 
           (call-name "Joe" "Doe")
           )
(add-name 
           (call-name "Hellow" "oRld")
           )

(print *lst1*);

(defun printn ()
(dolist (name *lst1*)
  (format t "~%~{~a~10t~a~%~}~%" name)
 ))

(defun prompt-read (prompt)
 (format *query-io* "~a:" prompt)
 (force-output *query-io*)
 (read-line *query-io*))

(defun input-name()
 (call-name
  (or (prompt-read "First Name") "Default-First")
  (or (prompt-read "Second Name") "Default-Last")
 ))

(defun get-name()
 (loop (add-name (input-name))
    (if (not (y-or-n-p "add more? [y/n]: ")) (return))))
  
(printn);
(get-name);
(printn);

(defun save-lst (filename)
 (with-open-file (out filename
                  :direction :output
                  :if-exists :supersede)
  (with-standard-io-syntax
   (print *lst1* out))))
    
(save-lst "mylst.db");

(defun load-lst (filename)
 (with-open-file (in filename)
  (with-standard-io-syntax
   (setf *db* (read in)))))

(load-lst "mylst.db");
(print "here's file out");
(print (printn));


