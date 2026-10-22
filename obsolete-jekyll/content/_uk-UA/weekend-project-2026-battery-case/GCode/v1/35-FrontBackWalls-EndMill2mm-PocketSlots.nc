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
M3 S6000
M0 (!!! override spindle speed override to 100Hz/6000RPM)
;
;
F80
;
(helical milling - 1/4)
G0 Z20
G0 X[12.000 - 1.800] Y40.000
G0 Z4.0
G1 Z3.1
M98 P1000 L[3.5 / 0.125]       ; do work few times
G0 Z3.1                        ; restore Z after pocket-drill
G1 X[12.000 - 2.000] Y40.000
M98 P1001 L[3.5 / 0.125]       ; do clean work
G0 Z3.1                        ; restore Z after pocket-drill
G0 Z20.0
;
(helical milling - 2/4)
G0 Z20
G0 X[12.000 - 1.800] Y170.000
G0 Z4.0
G1 Z3.1
M98 P1000 L[3.5 / 0.125]       ; do work few times
G0 Z3.1                        ; restore Z after pocket-drill
G1 X[12.000 - 2.000] Y170.000
M98 P1001 L[3.5 / 0.125]       ; do clean work
G0 Z3.1                        ; restore Z after pocket-drill
G0 Z20.0
;
(helical milling - 3/4)
G0 Z20
G0 X[12.000 - 1.800] Y256.000
G0 Z4.0
G1 Z3.1
M98 P1000 L[3.5 / 0.125]       ; do work few times
G0 Z3.1                        ; restore Z after pocket-drill
G1 X[12.000 - 2.000] Y256.000
M98 P1001 L[3.5 / 0.125]       ; do clean work
G0 Z3.1                        ; restore Z after pocket-drill
G0 Z20.0
;
(helical milling - 4/4)
G0 Z20
G0 X[12.000 - 1.800] Y386.000
G0 Z4.0
G1 Z3.1
M98 P1000 L[3.5 / 0.125]       ; do dirty work
G0 Z3.1                        ; restore Z after pocket-drill
G1 X[12.000 - 2.000] Y386.000
M98 P1001 L[3.5 / 0.125]       ; do clean work
G0 Z3.1                        ; restore Z after pocket-drill
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
F80
S6000
G91                                 ; switch to incremental coordinates
G2 X1.8 Y1.8 I1.8 J0 Z-0.01875      ; 1/4 arc
G1 X6 Y0 Z-0.025                    ; line up
G2 X0 Y-3.6 I0 J-1.8 Z-0.0375       ; 1/3 arc
G1 X-6 Y0 Z-0.025                   ; line down
G2 X-1.8 Y1.8 I0 J1.8 Z-0.01875     ; 1/4 arc
G90                                 ; switch to absolute coordinates
S6000
M99                                 ; return from sub-program
;
O1001
;
; clean phase
;
F160
S8000
G91                                 ; switch to incremental coordinates
G2 X2.0 Y2.0 I2.0 J0.0 Z-0.01875    ; 1/4 arc
G1 X6.0 Y0 Z-0.025                  ; line up
G2 X0.0 Y-4 I0.0 J-2.0 Z-0.0375     ; 1/3 arc
G1 X-6.0 Y0 Z-0.025                 ; line down
G2 X-2.0 Y2.0 I0.0 J2.0 Z-0.01875   ; 1/4 arc
G90                                 ; switch to absolute coordinates
S6000
M99                                 ; return from sub-program
