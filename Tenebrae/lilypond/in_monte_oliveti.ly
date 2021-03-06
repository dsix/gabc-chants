\header {
  tagline = ""
  composer = "Giovanni Battista Martini (1706-1784)"
}
\include "english.ly"
\include "lilypond-book-preamble.ly"
\include "header.ly"

global = {
  \key bf \major
  \time 4/4
}

sopMusic = \relative c' {
  \clef "treble_8"
  d2 d4 d | d d d( c) | d2 r2 | r4 bf4 ef2 | c4 d c2 | bf2 d2 |
  c4 c ef ef8 ef | d4 d d4. d8 | d4 e f2 | d4 d cs( d) ~ | d( cs) d2 | 
  \mark \markup { \musicglyph #"scripts.segno" }
  a4 a8 a bf4 bf |
  c4 c d2 | d4 d bf2 | c4 bf a2 | a b( | c4) d ef8[ d] c4 ~ | c bf a2 | g1\fermata \bar "||"
    \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
    \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \override Score . RehearsalMark #'font-shape = #'italic
    \override Score.RehearsalMark #'font-size = #0.5
    \mark "Fine"
}
sopWords = \lyricmode {
  \set fontSize = #0.5
  %\set vocalName = "2. "
  %\set shortVocalName = "2. "
  In mon -- te | O -- li -- vé -- | ti o -- rá -- |vit ad Pa -- trem_: Pa -- |
  ter, si fí -- e -- ri po -- test, tráns -- e -- at a me ca -- lix i -- ste_: | Spí -- ri -- tus qui -- dem |
  prom -- ptus est, | ca -- ro au -- | tem in -- fír -- | ma, ca -- ro au -- _ tem __ in -- fír -- ma.
}

altoMusic = \relative c' {
  \clef "treble_8"
  bf2 a4 a | bf4 a g2 | fs4 a d2 | bf c | a4( bf2 a4) | bf2 bf |
  a4 a c c8 c | b4 b b4. b8 | b4 cs d a ~ | a g g( f | e2) d | fs4 fs8 fs g4 bf |
  bf a bf2 | bf4 bf g2 | a4 g fs2 | fs g ~ | g4 g2 a8[ g] | fs4 g2 fs4 | g1\fermata \bar "||"
}

altoWords = \lyricmode {
  \set fontSize = #0.5
  In mon -- te | O -- li -- vé -- | ti o -- rá -- | vit ad | Pa -- | trem_: Pa -- |
  ter, si fí -- e -- ri | po -- test, tráns -- e -- | at a me ca -- lix i -- ste_: | Spí -- ri -- tus qui -- dem |
  prom -- ptus est, | ca -- ro au -- | tem in -- fír -- | ma, ca -- ro au -- _ -- tem in -- fír -- ma.
}

bassMusic = \relative a {
  \clef bass
  g2 fs4 fs | g d ef2 | d r4 d | g2 ef4 ef | f1 | bf2 bf |
  f4 f c c8 c| g'4 g g4. g8 | g4 e d2 | bf4 bf a2 ~ | a d | d4 d8 d g4 g |
  ef f bf,2 | bf4 bf ef2 | c4 c d2 | d g2( | ef4) b c c | d ef8( d c bf a4) | g1\fermata \bar "||"
  \cadenzaOn
  \stemOff
  bf4 c( d) d d ef d c d4. s8 \bar "|"
  s8 d\breve c4 bf c c ~ c( d4.)
  s8 \bar "||"
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
    \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \override Score . RehearsalMark #'font-shape = #'italic
    \override Score.RehearsalMark #'font-size = #0.5
    \mark "D.S. al Fine"
  \stemOn
  s8 <d fs a>4
  \cadenzaOff  
}

bassWords = \lyricmode {
  \set fontSize = #0.5
  In mon -- te | O -- li -- vé -- ti o -- | rá -- vit ad | Pa -- trem_: Pa -- |
  ter, si fí -- e -- ri | po -- test, tráns -- e -- at a me ca -- lix i -- ste_: | Spí -- ri -- tus qui -- dem |
  prom -- ptus est, | ca -- ro au -- tem in -- fír -- | ma, ca -- ro au -- tem | in -- fír -- ma.
  Vi -- gi -- lá -- te, et o -- rá -- te,
  \once \override LyricText #'self-alignment-X = #LEFT
  ut_non_intrétis_in_ten -- ta -- ti -- ó -- nem.
  Spi-
}

chantMusic = \relative c {
  \clef bass
  \cadenzaOn
  \stemOff
  bf4 c( d) d d ef d c d4. s8 \bar "|"
  s8 d\breve c4 bf c c ~ c( d4.)
  s8 \bar "||"
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
    \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \override Score . RehearsalMark #'font-shape = #'italic
    \override Score.RehearsalMark #'font-size = #0.5
    \mark "D.S. al Fine"
  \stemOn
  s8 <d fs a>4
  \cadenzaOff
}

chantWords = \lyricmode {
  Vi -- gi -- lá -- te, et o -- rá -- te,
  \once \override LyricText #'self-alignment-X = #LEFT
  ut_non_intrétis_in_ten -- ta -- ti -- ó -- nem.
  Spi-
}

%altoWords = \lyricmode {
%  \override StanzaNumber #'font-name = #"Garamond Premier Pro"
%  \override LyricText #'font-name = #"Garamond Premier Pro"
%}

\score {
  \new ChoirStaff <<
    \new Staff = "women" <<
      \new Voice = "sopranos"{
%        \voiceOne
        << \global \sopMusic >>
      }
    >>
    \new Lyrics = "sopranos"

    \new Staff = "women2" <<
      \new Voice = "altos" {
%        \voiceTwo
        << \global \altoMusic >>
      }
    >>
    \new Lyrics = "altos"
    
    \new Staff = "men" <<
      %\new Lyrics = "bass"
      \new Voice = "bass" {
%        \voiceOne
        << \global \bassMusic >>
      }
    >>
    \context Lyrics = "sopranos" \lyricsto "sopranos" \sopWords
    \context Lyrics = "altos" \lyricsto "altos" \altoWords
    \context Lyrics = "bass" \lyricsto "bass" \bassWords
  >>
  \layout {
    \context {
      \Staff
    }
  }
}

%\score {
%  \new Staff \with { \remove "Time_signature_engraver" } <<
%    \global
%    \new Voice = "chant" \chantMusic
%    \new Lyrics = "chant" \lyricsto chant \chantWords
%  >>
%}

