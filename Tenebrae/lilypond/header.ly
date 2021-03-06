#(set-default-paper-size "letter")

\paper {
  %myStaffSize = #19
  myStaffSize = #22
  indent = 0\mm
  %line-width = 7.5\in
  line-width = 8.5\in - 1.25\in
  %ragged-right = ##t
  force-assignment = #""
  line-width = #(- line-width (* mm  3.000000))
  #(define fonts
   (make-pango-font-tree "Garamond Premier Pro"
                         "Garamond Premier Pro"
                         "Garamond Premier Pro"
                          (/ myStaffSize 23)))
}

\layout {
}

stemOn = {
  \revert Staff.Stem #'transparent
  \revert Staff.Flag #'transparent
  \revert Voice.Stem #'length
}

stemOff = {
  \override Staff.Stem #'transparent = ##t
  \override Staff.Flag #'transparent = ##t
  \override Voice.Stem #'length = #0
}