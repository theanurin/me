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
(Drilling - 188 holes)
G0 X[16.000 - 1.750] Y[16.000 + 1.750]
G0 Z5
G98
(drilling 1/188)
;X16.000 Y16.000 !!! Do not drill center to prevent broken tool !!!
G83 X[16.000 - 1.750] Y[16.000 + 1.750] Z[#1000] F[#1004] Q0.250 R3.200
(drilling 2/188)
X[16.000 - 1.750] Y[16.000 - 1.750]
(drilling 3/188)
X[16.000 + 1.750] Y[16.000 + 1.750]
(drilling 4/188)
X[16.000 + 1.750] Y[16.000 - 1.750]
;
(drilling 5/188)
X18.000 Y[40.000 - 1.5]
(drilling 6/188)
X18.000 Y[40.000 + 1.5]
(drilling 7/188)
X15.000 Y[40.000 - 1.5]
(drilling 8/188)
X15.000 Y[40.000 + 1.5]
(drilling 9/188)
X12.000 Y[40.000 - 1.5]
(drilling 10/188)
X12.000 Y[40.000 + 1.5]
;
(drilling 11/188)
X102.000 Y12.000
(drilling 12/188)
X[102.000 + 0] Y[12.000 + 3.8]
(drilling 13/188)
X[102.000 + 2.2335] Y[12.000 + 3.0742]
(drilling 14/188)
X[102.000 + 3.614] Y[12.000 + 1.1743]
(drilling 15/188)
X[102.000 + 3.614] Y[12.000 - 1.1743]
(drilling 16/188)
X[102.000 + 2.2335] Y[12.000 - 3.0742]
(drilling 17/188)
X[102.000 + 0] Y[12.000 - 3.8]
(drilling 18/188)
X[102.000 - 2.2335] Y[12.000 - 3.0742]
(drilling 19/188)
X[102.000 - 3.614] Y[12.000 - 1.1743]
(drilling 20/188)
X[102.000 - 3.614] Y[12.000 + 1.1743]
(drilling 21/188)
X[102.000 - 2.2335] Y[12.000 + 3.0742]
;
(drilling 22/188 - front display)
X121.000 Y47.000
;
(drilling 23/188)
X170.000 Y12.000
(drilling 24/188)
X[170.000 + 0] Y[12.000 + 3.8]
(drilling 25/188)
X[170.000 + 2.2335] Y[12.000 + 3.0742]
(drilling 26/188)
X[170.000 + 3.614] Y[12.000 + 1.1743]
(drilling 27/188)
X[170.000 + 3.614] Y[12.000 - 1.1743]
(drilling 28/188)
X[170.000 + 2.2335] Y[12.000 - 3.0742]
(drilling 29/188)
X[170.000 + 0] Y[12.000 - 3.8]
(drilling 30/188)
X[170.000 - 2.2335] Y[12.000 - 3.0742]
(drilling 31/188)
X[170.000 - 3.614] Y[12.000 - 1.1743]
(drilling 32/188)
X[170.000 - 3.614] Y[12.000 + 1.1743]
(drilling 33/188)
X[170.000 - 2.2335] Y[12.000 + 3.0742]
;
(drilling 34/188 - front display)
X198.000 Y47.000
;
(drilling 35/188 - connector red)
X248.500 Y54.000
;
(drilling 36/188 - large hole right center)
X260.000 Y65.500
(drilling 37/188 - large hole right)
X[260.000 + 0.0000] Y[65.500 + 9.0000]
(drilling 38/188 - large hole right)
X[260.000 + 2.7812] Y[65.500 + 8.5595]
(drilling 39/188 - large hole right)
X[260.000 + 5.2901] Y[65.500 + 7.2812]
(drilling 40/188 - large hole right)
X[260.000 + 7.2812] Y[65.500 + 5.2901]
(drilling 41/188 - large hole right)
X[260.000 + 8.5595] Y[65.500 + 2.7812]
(drilling 42/188 - large hole right)
X[260.000 + 9.0000] Y[65.500 + 0.0000]
(drilling 43/188 - large hole right)
X[260.000 + 8.5595] Y[65.500 - 2.7812]
(drilling 44/188 - large hole right)
X[260.000 + 7.2812] Y[65.500 - 5.2901]
(drilling 45/188 - large hole right)
X[260.000 + 5.2901] Y[65.500 - 7.2812]
(drilling 46/188 - large hole right)
X[260.000 + 2.7812] Y[65.500 - 8.5595]
(drilling 47/188 - large hole right)
X[260.000 + 0.0000] Y[65.500 - 9.0000]
(drilling 48/188 - large hole right)
X[260.000 - 2.7812] Y[65.500 - 8.5595]
(drilling 49/188 - large hole right)
X[260.000 - 5.2901] Y[65.500 - 7.2812]
(drilling 50/188 - large hole right)
X[260.000 - 7.2812] Y[65.500 - 5.2901]
(drilling 51/188 - large hole right)
X[260.000 - 8.5595] Y[65.500 - 2.7812]
(drilling 52/188 - large hole right)
X[260.000 - 9.0000] Y[65.500 + 0.0000]
(drilling 53/188 - large hole right)
X[260.000 - 8.5595] Y[65.500 + 2.7812]
(drilling 54/188 - large hole right)
X[260.000 - 7.2812] Y[65.500 + 5.2901]
(drilling 55/188 - large hole right)
X[260.000 - 5.2901] Y[65.500 + 7.2812]
(drilling 56/188 - large hole right)
X[260.000 - 2.7812] Y[65.500 + 8.5595]
;
(drilling 57/188 - connector red)
X248.500 Y77.000
(drilling 58/188 - connector red)
X271.500 Y77.000
(drilling 59/188 - connector red)
X271.500 Y54.000
(drilling 60/188 - connector black)
X271.500 Y133.000
;
(drilling 61/188 - large hole left center)
X260.000 Y144.500
(drilling 62/188 - large hole left)
X[260.000 + 0.0000] Y[144.500 + 9.0000]
(drilling 63/188 - large hole left)
X[260.000 + 2.7812] Y[144.500 + 8.5595]
(drilling 64/188 - large hole left)
X[260.000 + 5.2901] Y[144.500 + 7.2812]
(drilling 65/188 - large hole left)
X[260.000 + 7.2812] Y[144.500 + 5.2901]
(drilling 66/188 - large hole left)
X[260.000 + 8.5595] Y[144.500 + 2.7812]
(drilling 67/188 - large hole left)
X[260.000 + 9.0000] Y[144.500 + 0.0000]
(drilling 68/188 - large hole left)
X[260.000 + 8.5595] Y[144.500 - 2.7812]
(drilling 69/188 - large hole left)
X[260.000 + 7.2812] Y[144.500 - 5.2901]
(drilling 70/188 - large hole left)
X[260.000 + 5.2901] Y[144.500 - 7.2812]
(drilling 71/188 - large hole left)
X[260.000 + 2.7812] Y[144.500 - 8.5595]
(drilling 72/188 - large hole left)
X[260.000 + 0.0000] Y[144.500 - 9.0000]
(drilling 73/188 - large hole left)
X[260.000 - 2.7812] Y[144.500 - 8.5595]
(drilling 74/188 - large hole left)
X[260.000 - 5.2901] Y[144.500 - 7.2812]
(drilling 75/188 - large hole left)
X[260.000 - 7.2812] Y[144.500 - 5.2901]
(drilling 76/188 - large hole left)
X[260.000 - 8.5595] Y[144.500 - 2.7812]
(drilling 77/188 - large hole left)
X[260.000 - 9.0000] Y[144.500 + 0.0000]
(drilling 78/188 - large hole left)
X[260.000 - 8.5595] Y[144.500 + 2.7812]
(drilling 79/188 - large hole left)
X[260.000 - 7.2812] Y[144.500 + 5.2901]
(drilling 80/188 - large hole left)
X[260.000 - 5.2901] Y[144.500 + 7.2812]
(drilling 81/188 - large hole left)
X[260.000 - 2.7812] Y[144.500 + 8.5595]
;
(drilling 82/188 - connector black)
X248.500 Y156.000
(drilling 83/188 - connector black)
X248.500 Y133.000
;
; Drilling start point for final profiling
(drilling 84/188)
X314.318 Y215.884
;
; Drilling start point for final profiling
(drilling 85/188)
X317.777 Y207.778
;
(drilling 86/188 - connector black)
X271.500 Y156.000
;
(drilling 87/188 - front display)
X198.000 Y163.000
;
(drilling 88/188)
X170.000 Y198.000
(drilling 89/188)
X[170.000 + 0] Y[198.000 + 3.8]
(drilling 90/188)
X[170.000 + 2.2335] Y[198.000 + 3.0742]
(drilling 91/188)
X[170.000 + 3.614] Y[198.000 + 1.1743]
(drilling 92/188)
X[170.000 + 3.614] Y[198.000 - 1.1743]
(drilling 93/188)
X[170.000 + 2.2335] Y[198.000 - 3.0742]
(drilling 94/188)
X[170.000 + 0] Y[198.000 - 3.8]
(drilling 95/188)
X[170.000 - 2.2335] Y[198.000 - 3.0742]
(drilling 96/188)
X[170.000 - 3.614] Y[198.000 - 1.1743]
(drilling 97/188)
X[170.000 - 3.614] Y[198.000 + 1.1743]
(drilling 98/188)
X[170.000 - 2.2335] Y[198.000 + 3.0742]
;
(drilling 99/188)
X170.000 Y228.000
(drilling 100/188)
X[170.000 + 0] Y[228.000 + 3.8]
(drilling 101/188)
X[170.000 + 2.2335] Y[228.000 + 3.0742]
(drilling 102/188)
X[170.000 + 3.614] Y[228.000 + 1.1743]
(drilling 103/188)
X[170.000 + 3.614] Y[228.000 - 1.1743]
(drilling 104/188)
X[170.000 + 2.2335] Y[228.000 - 3.0742]
(drilling 105/188)
X[170.000 + 0] Y[228.000 - 3.8]
(drilling 106/188)
X[170.000 - 2.2335] Y[228.000 - 3.0742]
(drilling 107/188)
X[170.000 - 3.614] Y[228.000 - 1.1743]
(drilling 108/188)
X[170.000 - 3.614] Y[228.000 + 1.1743]
(drilling 109/188)
X[170.000 - 2.2335] Y[228.000 + 3.0742]
;
(drilling 110/188)
X102.000 Y228.000
(drilling 111/188)
X[102.000 + 0] Y[228.000 + 3.8]
(drilling 112/188)
X[102.000 + 2.2335] Y[228.000 + 3.0742]
(drilling 113/188)
X[102.000 + 3.614] Y[228.000 + 1.1743]
(drilling 114/188)
X[102.000 + 3.614] Y[228.000 - 1.1743]
(drilling 115/188)
X[102.000 + 2.2335] Y[228.000 - 3.0742]
(drilling 116/188)
X[102.000 + 0] Y[228.000 - 3.8]
(drilling 117/188)
X[102.000 - 2.2335] Y[228.000 - 3.0742]
(drilling 118/188)
X[102.000 - 3.614] Y[228.000 - 1.1743]
(drilling 119/188)
X[102.000 - 3.614] Y[228.000 + 1.1743]
(drilling 120/188)
X[102.000 - 2.2335] Y[228.000 + 3.0742]
(drilling 121/188)
X102.000 Y198.000
(drilling 122/188)
X[102.000 + 0] Y[198.000 + 3.8]
(drilling 123/188)
X[102.000 + 2.2335] Y[198.000 + 3.0742]
(drilling 124/188)
X[102.000 + 3.614] Y[198.000 + 1.1743]
(drilling 125/188)
X[102.000 + 3.614] Y[198.000 - 1.1743]
(drilling 126/188)
X[102.000 + 2.2335] Y[198.000 - 3.0742]
(drilling 127/188)
X[102.000 + 0] Y[198.000 - 3.8]
(drilling 128/188)
X[102.000 - 2.2335] Y[198.000 - 3.0742]
(drilling 129/188)
X[102.000 - 3.614] Y[198.000 - 1.1743]
(drilling 130/188)
X[102.000 - 3.614] Y[198.000 + 1.1743]
(drilling 131/188)
X[102.000 - 2.2335] Y[198.000 + 3.0742]
;
(drilling 132/188 - front display)
X121.000 Y163.000
;
(drilling 133/188 - BMS)
X99.000 Y263.000
;
(drilling 134/188)
X18.000 Y[256.000 - 1.5]
(drilling 135/188)
X18.000 Y[256.000 + 1.5]
(drilling 136/188)
X15.000 Y[256.000 - 1.5]
(drilling 137/188)
X15.000 Y[256.000 + 1.5]
(drilling 138/188)
X12.000 Y[256.000 - 1.5]
(drilling 139/188)
X12.000 Y[256.000 + 1.5]
;
;X16.000 Y232.000  !!! Do not drill center to prevent broken tool !!!
(drilling 140/188)
X[16.000 - 1.750] Y[232.000 + 1.750]
(drilling 141/188)
X[16.000 - 1.750] Y[232.000 - 1.750]
(drilling 142/188)
X[16.000 + 1.750] Y[232.000 + 1.750]
(drilling 143/188)
X[16.000 + 1.750] Y[232.000 - 1.750]
;
;X16.000 Y194.000  !!! Do not drill center to prevent broken tool !!!
(drilling 144/188)
X[16.000 - 1.750] Y[194.000 + 1.750]
(drilling 145/188)
X[16.000 - 1.750] Y[194.000 - 1.750]
(drilling 146/188)
X[16.000 + 1.750] Y[194.000 + 1.750]
(drilling 147/188)
X[16.000 + 1.750] Y[194.000 - 1.750]
;
(drilling 148/188)
X18.000 Y[170.000 - 1.5]
(drilling 149/188)
X18.000 Y[170.000 + 1.5]
(drilling 150/188)
X15.000 Y[170.000 - 1.5]
(drilling 151/188)
X15.000 Y[170.000 + 1.5]
(drilling 152/188)
X12.000 Y[170.000 - 1.5]
(drilling 153/188)
X12.000 Y[170.000 + 1.5]
;
(drilling 154/188 - BMS)
X240.000 Y263.000
;
(drilling 155/188 - BMS)
X240.000 Y379.000
;
(drilling 156/188)
X170.000 Y414.000
(drilling 157/188)
X[170.000 + 0] Y[414.000 + 3.8]
(drilling 158/188)
X[170.000 + 2.2335] Y[414.000 + 3.0742]
(drilling 159/188)
X[170.000 + 3.614] Y[414.000 + 1.1743]
(drilling 160/188)
X[170.000 + 3.614] Y[414.000 - 1.1743]
(drilling 161/188)
X[170.000 + 2.2335] Y[414.000 - 3.0742]
(drilling 162/188)
X[170.000 + 0] Y[414.000 - 3.8]
(drilling 163/188)
X[170.000 - 2.2335] Y[414.000 - 3.0742]
(drilling 164/188)
X[170.000 - 3.614] Y[414.000 - 1.1743]
(drilling 165/188)
X[170.000 - 3.614] Y[414.000 + 1.1743]
(drilling 166/188)
X[170.000 - 2.2335] Y[414.000 + 3.0742]
;
(drilling 167/188 - BMS)
X99.000 Y379.000
;
(drilling 168/188)
X102.000 Y414.000
(drilling 169/188)
X[102.000 + 0] Y[414.000 + 3.8]
(drilling 170/188)
X[102.000 + 2.2335] Y[414.000 + 3.0742]
(drilling 171/188)
X[102.000 + 3.614] Y[414.000 + 1.1743]
(drilling 172/188)
X[102.000 + 3.614] Y[414.000 - 1.1743]
(drilling 173/188)
X[102.000 + 2.2335] Y[414.000 - 3.0742]
(drilling 174/188)
X[102.000 + 0] Y[414.000 - 3.8]
(drilling 175/188)
X[102.000 - 2.2335] Y[414.000 - 3.0742]
(drilling 176/188)
X[102.000 - 3.614] Y[414.000 - 1.1743]
(drilling 177/188)
X[102.000 - 3.614] Y[414.000 + 1.1743]
(drilling 178/188)
X[102.000 - 2.2335] Y[414.000 + 3.0742]
;
; X16.000 Y410.000 !!! Do not drill center to prevent broken tool !!!
(drilling 179/188)
X[16.000 - 1.750] Y[410.000 + 1.750]
(drilling 180/188)
X[16.000 - 1.750] Y[410.000 - 1.750]
(drilling 181/188)
X[16.000 + 1.750] Y[410.000 + 1.750]
(drilling 182/188)
X[16.000 + 1.750] Y[410.000 - 1.750]
;
(drilling 183/188)
X18.000 Y[386.000 - 1.5]
(drilling 184/188)
X18.000 Y[386.000 + 1.5]
(drilling 185/188)
X15.000 Y[386.000 - 1.5]
(drilling 186/188)
X15.000 Y[386.000 + 1.5]
(drilling 187/188)
X12.000 Y[386.000 - 1.5]
(drilling 188/188)
X12.000 Y[386.000 + 1.5]
G80
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
