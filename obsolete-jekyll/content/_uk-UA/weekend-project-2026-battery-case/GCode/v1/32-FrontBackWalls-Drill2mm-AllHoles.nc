;
; Safe Z    : 5.0 (20.0)
; Working Z : 3.2 -> [#1000]
; Tool      : Drill 2mm
;
#1000 = -1.500    (total drilling depth in Z)
#1004 = 30.000    (drilling feed in Z)

;
G17 G54 G40 G49 G80 G90 G94
G21
;
G0 Z20.0
;
M3 S4000
M0 (!!! override spindle speed override to 66Hz/4000RPM)
;
(Drilling - 36 holes)
G0 X[16.000 - 1.750] Y[16.000 + 0]
G0 Z5
G98
;X16.000 Y16.000 !!! Do not drill center !!!
(drilling 1/36 - helix enter hole)
G83 X[16.000 - 1.750] Y[16.000 + 0] Z[#1000] F[#1004] Q0.250 R3.200
(drilling 2/36 - helix enter hole pocket slot)
X12.000 Y40.000
;
; center of hole - X102.000 Y12.000
(drilling 3/36 - helix enter hole)
X[102.000 - 3.8] Y[12.000 + 0]
;
(drilling 4/36 - front display)
X121.000 Y47.000
;
; center of hole - X170.000 Y12.000
(drilling 5/36 - helix enter hole)
X[170.000 - 3.8] Y[12.000 + 0]
;
(drilling 6/36 - front display)
X198.000 Y47.000
;
(drilling 7/36 - connector red)
X248.500 Y54.000
;
; large hole right center - X260.000 Y65.500 (X offset 18.0 - 3.0 = -7.5)
(drilling 8/36 - large hole enter right)
X[260.000 - 7.500] Y65.500
;
(drilling 9/36 - connector red)
X248.500 Y77.000
(drilling 10/36 - connector red)
X271.500 Y77.000
(drilling 11/36 - connector red)
X271.500 Y54.000
(drilling 12/36 - connector black)
X271.500 Y133.000
;
; large hole left center - X260.000 Y144.500 (X offset 18.0 - 3.0 = -7.5)
(drilling 13/36 - large hole enter left)
X[260.000 - 7.500] Y144.500
;
(drilling 14/36 - connector black)
X248.500 Y156.000
(drilling 15/36 - connector black)
X248.500 Y133.000
;
; Drilling start point for final profiling
(drilling 16/36)
X314.318 Y215.884
;
; Drilling start point for final profiling
(drilling 17/36)
X317.777 Y207.778
;
(drilling 18/36 - connector black)
X271.500 Y156.000
;
(drilling 19/36 - front display)
X198.000 Y163.000
;
; center of hole - X170.000 Y198.000
(drilling 20/36 - helix enter hole)
X[170.000 - 3.8] Y[198.000 + 0]
;
; center of hole - X170.000 Y228.000
(drilling 21/36 - helix enter hole)
X[170.000 - 3.8] Y[228.000 + 0]
;
; center of hole - X102.000 Y228.000
(drilling 22/36 - helix enter hole)
X[102.000 - 3.8] Y[228.000 + 0]
; center of hole - X102.000 Y198.000
(drilling 23/36 - helix enter hole)
X[102.000 - 3.8] Y[198.000 + 0]
;
(drilling 24/36 - front display)
X121.000 Y163.000
;
(drilling 25/36 - BMS)
X99.000 Y263.000
;
(drilling 26/36 - helix enter hole pocket slot)
X12.000 Y256.000
;
;X16.000 Y232.000  !!! Do not drill center to prevent broken tool !!!
(drilling 27/36 - helix enter hole)
X[16.000 - 1.750] Y[232.000 + 0]
;
;X16.000 Y194.000  !!! Do not drill center to prevent broken tool !!!
(drilling 28/36 - helix enter hole)
X[16.000 - 1.750] Y[194.000 + 0]
;
(drilling 29/36 - helix enter hole pocket slot)
X12.000 Y170.000
;
(drilling 30/36 - BMS)
X240.000 Y263.000
;
(drilling 31/36 - BMS)
X240.000 Y379.000
;
; center of hole - X170.000 Y414.000
(drilling 32/36 - helix enter hole)
X[170.000 - 3.8] Y[414.000 + 0]
;
(drilling 33/36 - BMS)
X99.000 Y379.000
;
; center of hole - X102.000 Y414.000
(drilling 34/36 - helix enter hole)
X[102.000 - 3.8] Y[414.000 + 0]
;
; X16.000 Y410.000 !!! Do not drill center to prevent broken tool !!!
(drilling 35/36 - helix enter hole)
X[16.000 - 1.750] Y[410.000 + 0]
;
(drilling 36/36 - helix enter hole pocket slot left)
X12.000 Y386.000
G80
;
G0 Z20.0
(goto change tool zone)
G0 X360 Y213
G0 Y-80
(stopping spindle)
M05
G17 G54 G90 G80 G40
(bye-bye)
M2
