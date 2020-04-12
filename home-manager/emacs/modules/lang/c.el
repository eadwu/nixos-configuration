(c-add-style "ub-cse"
             '((c-basic-offset . 4)
              (indent-tabs-mode . nil)
              (c-hanging-braces-alist
               (defun-open        after)
               (defun-close       before)
               (defun-block-intro after)
               (class-open        after)
               (class-close       before)
               (inline-open       after)
               (inline-close      before)
               (block-open        after)
               (block-close       before)
               (substatement-open after)
               (extern-lang-open  after)
               (extern-lang-close before))
              (c-offsets-alist
               (statement-block-intro . +)
               (label                 . 0)
               (case-label            . 0))))

(defun ub-cse-c-mode ()
  (c-set-style "ub-cse"))

(add-hook 'c-mode-hook 'ub-cse-c-mode)
(add-hook 'c++-mode-hook 'ub-cse-c-mode)
