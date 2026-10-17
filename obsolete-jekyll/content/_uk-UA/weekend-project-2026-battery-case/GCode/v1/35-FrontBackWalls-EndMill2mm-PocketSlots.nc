;
; Safe Z    : 3.6 (20.0)
; Working Z : 3.1 -> -0.4
; Tool      : End Mill 2mm
;

;
G17 G54 G40 G49 G80 G90 G94
G21
;
G0 Z20.0
;
M3 S6000
M0 (!!! override spindle speed override to 100Hz/6000RPM)
;
;
F60
;
(helical milling - 1/4)
G0 Z20
G0 G00 X0 Y9
G0 Z3.6
G1 Z3.1
G91                            (switch to incremental coordinates)
M98 P1000 L[3.5 / 0.125]       (depth Z)
G90                            (switch to absolute coordinates)
G0 Z20.0
;
(helical milling - 1/4)
G0 Z20
G0 G00 X0 Y170.000
G0 Z3.6
G1 Z3.1
G91                            (switch to incremental coordinates)
M98 P1000 L[3.5 / 0.125]       (depth Z)
G90                            (switch to absolute coordinates)
G0 Z20.0
;
(helical milling - 1/4)
G0 Z20
G0 G00 X0 Y256.000
G0 Z3.6
G1 Z3.1
G91                            (switch to incremental coordinates)
M98 P1000 L[3.5 / 0.125]       (depth Z)
G90                            (switch to absolute coordinates)
G0 Z20.0
;
(helical milling - 1/4)
G0 Z20
G0 G00 X0 Y386.000
G0 Z3.6
G1 Z3.1
G91                            (switch to incremental coordinates)
M98 P1000 L[3.5 / 0.125]       (depth Z)
G90                            (switch to absolute coordinates)
G0 Z20.0
;
;
G0 Z20.0
;
(goto parking zone)
G0 X360 Y213
G0 Y480
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


O1000 (sub-program)
;
;   _
;  ( )
;  | |
;  (_)
;
; 1/4 arc
G2 X-3.0 Y3.0 I0.0 J3.0 Z-0.01875
; line up
G1 X0.0 Y6.0 Z-0.025
; 1/3 arc
G2 X6.0 Y0.0 I3.0 J0.0 Z-0.0375
; line down
G1 X0.0 Y-6.0 Z-0.025
; 1/4 arc
G2 X0.0 Y-3.0 I0.0 J-3.0 Z-0.01875

; return from sub-program
M99
