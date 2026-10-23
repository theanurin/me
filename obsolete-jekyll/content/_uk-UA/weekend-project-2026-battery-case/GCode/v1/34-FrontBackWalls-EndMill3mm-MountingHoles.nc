;
; Safe Z    : 4.0 (20.0)
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
;
; shared setting for each hole
#9702 = 3       ; end-mill diameter
#9703 = 0.2     ; depth per cycle, should be multiple to #9704
#9704 = 4.2     ; depth Z
;
(drilling 1/12)
G0 Z20
G0 X16.000 Y16.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 7.50    (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 8.00    (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 2/12)
G0 Z20
G0 X102.000 Y12.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 3/12)
G0 Z20
G0 X170.000 Y12.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 4/12)
G0 Z20
G0 X170.000 Y198.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 5/12)
G0 Z20
G0 X170.000 Y228.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 6/12)
G0 Z20
G0 X102.000 Y228.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 7/12)
G0 Z20
G0 X102.000 Y198.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 8/12)
G0 Z20
G0 X16.000 Y194.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 7.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 8.00      (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 9/12)
G0 Z20
G0 X16.000 Y232.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 7.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 8.00      (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 10/12)
G0 Z20
G0 X170.000 Y414.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 11/12)
G0 Z20
G0 X102.000 Y414.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 9.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 10.00     (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
(drilling 12/12)
G0 Z20
G0 X16.000 Y410.000
G0 Z4.0
G1 Z3.2 F30
G91               ; switch to incremental coordinates
#9701 = 7.50      (drilling diameter)
#9709 = 30     (drilling feed)
S6000
M98 P9700         (call drill sub-program)
#9701 = 8.00      (drilling diameter)
#9709 = 60     (drilling feed)
S8000
M98 P9700         (call drill sub-program)
S6000
G90               (switch to absolute coordinates)
;
;
G0 Z20.0
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

O9700
;
; Helix Drilling by End Mill
;
; Parameters
;
; #9701 - drilling diameter
; #9702 - end-mill diameter, should be lower of equal to #9701
; #9703 - depth per cycle, should be multiple to #9704
; #9704 - drilling depth Z
; #9709 - drilling(inset) feed
;
G91                                                                             ; switch to incremental coordinates
G0 Z2
G0 X[[#9701 - #9702] / 2] Y0                                                    ; go left to start position
G0 Z-2
M98 P9701 L[#9704 / #9703]                                                      ; call helical interpolation few times to cover Z depth
G3 X0 Y0 I[0 - [[#9701 - #9702] / 2]] J0 F[0 + #9709]                           ; 360 by circle without Z inset
G0 Z[[#9704 / #9703] * #9703]                                                   ; go to original Z position
G0 Z2
G0 X[0 - [[#9701 - #9702] / 2]] Y0                                              ; restore X original position
G0 Z-2
G90                                                                             ; switch to absolute coordinates
M99                                                                             ; return from sub-program
;
O9701                                                                           ; Make one round of circle using helical interpolation
G3 X0 Y0 Z[0 - #9703] I[0 - [[#9701 - #9702] / 2]] J0 F[0 + #9709]              ; helical interpolation
M99                                                                             ; return from sub-program
