(Exported by FreeCAD)
(Post Processor: script_module)
(Output Time:2026-10-09 23:25:48.089703)
(begin preamble)
G17 G54 G40 G49 G80 G90
G21
(begin operation: Fixture)
(machine: mach3_4, mm/min)
G54
(finish operation: Fixture)
(begin operation: MB31.Template.Job.Tools.ToolBit)
(machine: mach3_4, mm/min)
(MB31.Template.Job.Tools.ToolBit)
M5
M6 T1 
G43 H1
M3 S12000
(finish operation: MB31.Template.Job.Tools.ToolBit)
(begin operation: MB31.Template.Job.01-Pocket-6x4)
(machine: mach3_4, mm/min)
(MB31.Template.Job.01-Pocket-6x4)
G0 Z9.000
G0 X60.001 Y288.001
G0 X60.000 Y288.001
G0 X60.000 Y288.001 Z7.000
G1 X60.000 Y288.001 Z0.000 F250.000
G2 X60.000 Y287.999 Z0.000 I-0.000 J-0.001 F900.000
G2 X60.000 Y288.001 Z0.000 I0.000 J0.001 F900.000
G0 Z9.000
G0 Z9.000
G0 X60.000 Y288.001
G0 X150.000 Y287.999
G0 X150.000 Y287.999 Z7.000
G1 X150.000 Y287.999 Z0.000 F250.000
G2 X150.000 Y288.001 Z0.000 I0.000 J0.001 F900.000
G2 X150.000 Y287.999 Z0.000 I-0.000 J-0.001 F900.000
G0 Z9.000
G0 Z9.000
(finish operation: MB31.Template.Job.01-Pocket-6x4)
(begin operation: Fixture)
(machine: mach3_4, mm/min)
G54
(finish operation: Fixture)
(begin operation: MB31.Template.Job.02-Profile)
(machine: mach3_4, mm/min)
(MB31.Template.Job.02-Profile)
(Compensated Tool Path. Diameter: 6.0)
G0 Z9.000
G0 X209.191 Y299.191
G0 Z7.000
G1 X209.191 Y299.191 Z0.000 F250.000
G2 X212.997 Y290.131 Z0.000 I-9.194 J-9.193 F900.000
G1 X213.000 Y10.000 Z0.000 F900.000
G2 X200.131 Y-2.997 Z0.000 I-13.002 J0.004 F900.000
G1 X10.000 Y-3.000 Z0.000 F900.000
G2 X-2.997 Y9.869 Z0.000 I0.004 J13.002 F900.000
G1 X-3.000 Y290.000 Z0.000 F900.000
G2 X9.869 Y302.997 Z0.000 I13.002 J-0.004 F900.000
G1 X200.000 Y303.000 Z0.000 F900.000
G2 X209.191 Y299.191 Z0.000 I-0.004 J-13.002 F900.000
G0 Z9.000
G0 Z9.000
(finish operation: MB31.Template.Job.02-Profile)
(begin postamble)
M05
G17 G54 G90 G80 G40
M2
