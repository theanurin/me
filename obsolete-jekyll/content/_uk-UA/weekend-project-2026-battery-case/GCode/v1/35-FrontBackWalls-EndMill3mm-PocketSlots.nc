;
; Safe Z    : 20.0 (20.0)
; Working Z : 3.2 -> -1.0
; Tool      : End Mill 3mm
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
F60
;
(helical milling - 1/4)
G0 Z20
G0 X[12.000 - 1.300] Y40.000
G0 Z4.0
G1 Z3.2 F30
S6000
F30
M98 P1000 L[4.2 / 0.2]       ; do work few times
G0 Z3.2                        ; restore Z after pocket-drill
G1 X[12.000 - 1.500] Y40.000
S8000
F60
M98 P1001 L[4.2 / 0.2]       ; do clean work
S6000
G0 Z3.2                        ; restore Z after pocket-drill
G0 Z20.0
;
(helical milling - 2/4)
G0 Z20
G0 X[12.000 - 1.300] Y170.000
G0 Z4.0
G1 Z3.2 F30
S6000
F30
M98 P1000 L[4.2 / 0.2]       ; do work few times
G0 Z3.2                        ; restore Z after pocket-drill
G1 X[12.000 - 1.500] Y170.000
S8000
F60
M98 P1001 L[4.2 / 0.2]       ; do clean work
S6000
G0 Z3.2                        ; restore Z after pocket-drill
G0 Z20.0
;
(helical milling - 3/4)
G0 Z20
G0 X[12.000 - 1.300] Y256.000
G0 Z4.0
G1 Z3.2 F30
S6000
F30
M98 P1000 L[4.2 / 0.2]       ; do work few times
G0 Z3.2                        ; restore Z after pocket-drill
G1 X[12.000 - 1.500] Y256.000
S8000
F60
M98 P1001 L[4.2 / 0.2]       ; do clean work
S6000
G0 Z3.2                        ; restore Z after pocket-drill
G0 Z20.0
;
(helical milling - 4/4)
G0 Z20
G0 X[12.000 - 1.300] Y386.000
G0 Z4.0
G1 Z3.2 F30
S6000
F30
M98 P1000 L[4.2 / 0.2]       ; do dirty work
G0 Z3.2                        ; restore Z after pocket-drill
G1 X[12.000 - 1.500] Y386.000
S8000
F60
M98 P1001 L[4.2 / 0.2]       ; do clean work
S6000
G0 Z3.2                        ; restore Z after pocket-drill
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


O1000
;
; dirty phase
;
G91               ; switch to incremental coordinates
G2 X1.3 Y1.3 I1.3 J0 Z-0.03      ; 1/4 arc
G1 X6 Y0 Z-0.04                    ; line up
G2 X0 Y-2.6 I0 J-1.3 Z-0.06       ; 1/3 arc
G1 X-6 Y0 Z-0.04                   ; line down
G2 X-1.3 Y1.3 I0 J1.3 Z-0.03     ; 1/4 arc
G90               ; switch to absolute coordinates
M99                                 ; return from sub-program
;
O1001
;
; clean phase
;
G91               ; switch to incremental coordinates
G2 X1.5 Y1.5 I1.5 J0.0 Z-0.03    ; 1/4 arc
G1 X6.0 Y0 Z-0.04                  ; line up
G2 X0.0 Y-3 I0.0 J-1.5 Z-0.06     ; 1/3 arc
G1 X-6.0 Y0 Z-0.04                 ; line down
G2 X-1.5 Y1.5 I0.0 J1.5 Z-0.03   ; 1/4 arc
G90               ; switch to absolute coordinates
M99                                 ; return from sub-program
