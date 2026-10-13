;
; Safe Z    : 28.0
; Working Z : 3.0 -> -0.1
; Tool      : End Mill 6mm
;
(Exported by FreeCAD)
(Post Processor: script_module)
(Output Time:2026-10-13 03:02:09.546692)
(begin preamble)
G17 G54 G40 G49 G80 G90
G21
(begin operation: Fixture)
(machine: mach3_4, mm/min)
G54
(finish operation: Fixture)
(begin operation: MB31.1P.CompoundTemplate.Job.Tools.ToolBit)
(machine: mach3_4, mm/min)
(MB31.1P.CompoundTemplate.Job.Tools.ToolBit)
M3 S12000
(finish operation: MB31.1P.CompoundTemplate.Job.Tools.ToolBit)
(begin operation: MB31.1P.CompoundTemplate.Job.Operations.02-Profile)
(machine: mach3_4, mm/min)
(MB31.1P.CompoundTemplate.Job.Operations.02-Profile)
(Compensated Tool Path. Diameter: 6.0)
G0 Z28.000
G0 X319.191 Y425.191
G0 Z4.000
G1 X319.191 Y425.191 Z-0.010 F300.000
G2 X322.997 Y416.131 Z-0.010 I-9.194 J-9.193 F900.000
G1 X323.000 Y10.000 Z-0.010 F900.000
G2 X310.131 Y-2.997 Z-0.010 I-13.002 J0.004 F900.000
G1 X10.000 Y-3.000 Z-0.010 F900.000
G2 X-2.997 Y9.869 Z-0.010 I0.004 J13.002 F900.000
G1 X-3.000 Y416.000 Z-0.010 F900.000
G2 X9.869 Y428.997 Z-0.010 I13.002 J-0.004 F900.000
G1 X310.000 Y429.000 Z-0.010 F900.000
G2 X319.191 Y425.191 Z-0.010 I-0.004 J-13.002 F900.000
G0 Z28.000
G0 Z28.000
(finish operation: MB31.1P.CompoundTemplate.Job.Operations.02-Profile)
(begin postamble)
M05
G17 G54 G90 G80 G40
M2
