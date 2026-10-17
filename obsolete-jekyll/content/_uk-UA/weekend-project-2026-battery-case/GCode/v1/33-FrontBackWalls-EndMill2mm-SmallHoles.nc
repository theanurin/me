;
; Safe Z    : 12.0 (20.0)
; Working Z : 3.6 -> -0.4
; Tool      : End Mill 2mm
;

;
G17 G54 G40 G49 G80 G90 G94
G21
;
G0 Z20.0
;
M3 S72000
M0 (!!! override spindle speed override to 120Hz/7200RPM)
;

; shared setting for each hole
#9702 = 2       (end-mill diameter, should be lower of equal to #1)
#9703 = 0.125   (depth per cycle, should be multiple to #4)
#9704 = 4.0     (depth Z)
#9709 = 120     (drilling feed)


(drilling 1/16 - front display)
G0 Z20
G0 X121.000 Y47.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 2/16 - front display)
G0 Z20
G0 X198.000 Y47.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 3/16 - connector red)
G0 Z20
G0 X248.500 Y54.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 4/16 - connector red)
G0 Z20
G0 X248.500 Y77.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 5/16 - connector red)
G0 Z20
G0 X271.500 Y77.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 6/16 - connector red)
G0 Z20
G0 X271.500 Y54.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 7/16 - connector black)
G0 Z20
G0 X271.500 Y133.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 8/16 - connector black)
G0 Z20
G0 X248.500 Y133.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 9/16 - connector black)
G0 Z20
G0 X248.500 Y156.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 10/16 - connector black)
G0 Z20
G0 X271.500 Y156.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 4.20     (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 11/16 - front display)
G0 Z20
G0 X198.000 Y163.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 12/16 - front display)
G0 Z20
G0 X121.000 Y163.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 13/16 - BMS)
G0 Z20
G0 X99.000 Y263.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 14/16 - BMS)
G0 Z20
G0 X99.000 Y379.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 15/16 - BMS)
G0 Z20
G0 X240.000 Y379.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
;

(drilling 16/16 - BMS)
G0 Z20
G0 X240.000 Y263.000
G0 Z3.6
G91               (switch to incremental coordinates)
#9701 = 2.75    (drilling diameter)
M98 P9700         (call drill sub-program)
#9701 = 3.50    (drilling diameter)
M98 P9700         (call drill sub-program)
G90               (switch to absolute coordinates)
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

O9700 (sub-program)
;
; Helix Drilling by End Mill
;
; Parameters
;
; #9701 (drilling diameter)
; #9702 (end-mill diameter, should be lower of equal to #9701)
; #9703 (depth per cycle, should be multiple to #9704)
; #9704 (depth Z)
; #9709 (helix-drilling feed)
;

G0 Z2
G0 X[[#9701 - #9702] / 2] Y0
G0 Z-2
M98 P9701 L[#9704 / #9703]                                                    (call sub-program few times)
G3 X0 Y0 I[0 - [[#9701 - #9702] / 2]] J0 F[0 + #9709]                       (360 by circle without Z inset)
G0 Z[[#9704 / #9703] * #9703] F80                                           (go to original Z position)
G0 Z2
G0 X[0 - [[#9701 - #9702] / 2]] Y0
G0 Z-2
; return from sub-program
M99

O9701 (sub-program)
; Make one round of circle using helical interpolation
G3 X0 Y0 Z[0 - #9703] I[0 - [[#9701 - #9702] / 2]] J0 F[0 + #9709]        (helical interpolation)
; return from sub-program
M99
