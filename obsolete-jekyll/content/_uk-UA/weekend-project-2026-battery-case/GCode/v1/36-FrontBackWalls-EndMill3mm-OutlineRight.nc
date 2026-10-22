;
; Safe Z    : 20.0 (20.0)
; Working Z : 3.1 -> -0.4
; Tool      : End Mill 2mm
;

;
G17 G54 G40 G49 G80 G90 G94
G21
;
G0 Z20.0
;
M3 S8000
M0 (!!! override spindle speed override to 133Hz/8000RPM)
;
;
F240
;
(profile milling - 1/2)
G0 Z20
G0 X-8 Y10
G0 Z4.0
S6000
F180
G1 Z3.1
M98 P1000                           ; do dirty work
S8000
F240
M98 P1010                           ; do clean work
;
G0 Z20.0
;
(goto parking zone)
;G0 X360 Y213
;G0 Y480
(stopping spindle)
M05
G17 G54 G90 G80 G40
(bye-bye)
M2


;
;
;
;
;
;

O1000
;
; dirty phase
;
; Start position offset X-8 Y10
;
G91                                 ; switch to incremental coordinates
M98 P1001 L[3.5 / 0.25]             ; make work few times
G0 Z3.5                             ; restore original Z
G90                                 ; switch to absolute coordinates
M99                                 ; return from sub-program
;
O1001
G1 Z-0.25
G1 X6.4
G1 Y190
G2 X11.6 Y11.6 I11.6 J0.0           ; 1/4 arc (1)
G1 X300.0                           ;
G2 X11.6 Y-11.6 I0.0 J-11.6         ; 1/4 arc (2)
G1 Y-20                             ;
G2 X-11.6 Y-11.6 I-11.6 J0.0        ; 1/4 arc (3)
G1 X-16.8                           ; compensate 3mm (2 arcs)
G3 X-11.6 Y-11.6 I0.0 J-11.6        ; 1/4 arc (4)
G1 Y-103.6                          ; compensate 6mm (4 arcs)
G3 X11.6 Y-11.6 I11.6 J0.0          ; 1/4 arc (5)
G1 X16.8                            ; compensate 3mm (2 arcs)
G2 X11.6 Y-11.6 I0.0 J-11.6        ; 1/4 arc (6)
G1 Y-20                             ;
G2 X-11.6 Y-11.6 I-11.6 J0.0        ; 1/4 arc (7)
G1 X-300.0                          ;
G2 X-11.6 Y11.6 I0.0 J11.6          ; 1/4 arc (8)
G1 X-6.4                            ; return to start location
M99                                 ; return from sub-program
;
;
O1010
;
; clean phase
;
; Start position offset X-8 Y10
;
G91                                 ; switch to incremental coordinates
M98 P1011 L[3.5 / 0.25]             ; make work few times
G0 Z3.5                             ; restore original Z
G90                                 ; switch to absolute coordinates
M99                                 ; return from sub-program
;
O1011
G1 Z-0.25
G1 X6.5
G1 Y190
G2 X11.5 Y11.5 I11.5 J0.0           ; 1/4 arc (1)
G1 X300.0                           ;
G2 X11.5 Y-11.5 I0.0 J-11.5         ; 1/4 arc (2)
G1 Y-20                             ;
G2 X-11.5 Y-11.5 I-11.5 J0.0        ; 1/4 arc (3)
G1 X-17                             ; compensate 3mm (2 arcs)
G3 X-11.5 Y-11.5 I0.0 J-11.5        ; 1/4 arc (4)
G1 Y-104                            ; compensate 6mm (4 arcs)
G3 X11.5 Y-11.5 I11.5 J0.0          ; 1/4 arc (5)
G1 X17                              ; compensate 3mm (2 arcs)
G2 X11.5 Y-11.5 I0.0 J-11.5        ; 1/4 arc (6)
G1 Y-20                             ;
G2 X-11.5 Y-11.5 I-11.5 J0.0        ; 1/4 arc (7)
G1 X-300.0                          ;
G2 X-11.5 Y11.5 I0.0 J11.5          ; 1/4 arc (8)
G1 X-6.5                            ; return to start location
M99                                 ; return from sub-program
