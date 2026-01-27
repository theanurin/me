(-- Start position X0 Y0 Z5 --)

#1 = 3.2    (total depth Z)
#2 = 0.100  (depth Z per cycle, should be multiply to #1)
#3 = 120    (trimming feed)
#4 = 20     (drilling feed)

G21         (mm)
G91         (switch to incremental coordinates)

G17         (use plane XY)

G0 Z2 F300  (up Z for 2mm before start spindle)
M3 S8000    (turn on spindle)
G0 Z-2 F300 (down Z for 2mm after start spindle)

G0 X0 Y23 F300             (move to left-top corner)
G0 Z-4 F300
G1 Z-1 F#4                 (move Z->0)

M98 P1000 L[[#1 / #2] / 2] (call sub-program few times)
G0 Z#1 F300                (restore Z to value before call sub-program)

G0 Z5 F300                 (restore Z to initial value)
G0 X0 Y-23 Z5 F300         (restore X,Y to initial value)

G90         (switch to absolute coordinates)

M30         (turn off spindle)


; Sub-program
O1000
G1 Z[0 - #2] F#4                        (down 1)
G2 X16.26 Y-6.74 I0 J-23 F#3            (arc from 90 to 45 degrees)
G1 Z[0 - #2] F#4                        (down 2)
G3 X-16.26 Y6.74 I-16.26 J-16.26 F#3    (arc from 45 to 90 degrees)
M99                                     (exit from sub-program)
