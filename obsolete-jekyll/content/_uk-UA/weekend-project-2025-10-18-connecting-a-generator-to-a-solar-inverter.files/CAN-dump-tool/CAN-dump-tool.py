#
# source .venv/bin/activate
# python3.13 CAN-dump-tool.py | tee Delta_Reflicter-FR-48-2000W-E-D0105128_PSC3_$(date '+%Y%m%d%H%M%S').log
#

#
# To use this script you have to connect TWO CAN adapters can0 and can1.
#
# sudo ip link set can0 type can bitrate 250000
# sudo ip link set can1 type can bitrate 250000
# sudo ifconfig can0 up
# sudo ifconfig can1 up
#

import can
from datetime import datetime

with can.Bus(channel='can0',interface='socketcan',receive_own_messages=False) as bus0, can.Bus(channel='can1',interface='socketcan',receive_own_messages=False) as bus1:

    BUS0_DESC="PSC3"
    BUS1_DESC="Rectifier"

    print("✓ CAN bridge запущено!", flush=True)
    print(f"✓ {BUS0_DESC} ↔ {BUS1_DESC}", flush=True)
    print("✓ Ctrl+C для зупинки\n", flush=True)

    try:
        while True:
            timestamp = datetime.now().strftime("%Y%m%d%H%M%S.%f")

            # Читаємо з can0 і пересилаємо на can1
            msg0 = bus0.recv(timeout=0.001)
            if msg0:
                print(f"{timestamp} [{BUS0_DESC}] ID: 0x{msg0.arbitration_id:03X} DLC:  {msg0.dlc} Data: {msg0.data.hex(' ').upper()}", flush=True)
                bus1.send(msg0, timeout=0.2)

            # Читаємо з can1 і пересилаємо на can0
            msg1 = bus1.recv(timeout=0.001)
            if msg1:
                print(f"{timestamp} [{BUS1_DESC}] ID: 0x{msg1.arbitration_id:03X} DLC: {msg1.dlc} Data: {msg1.data. hex(' ').upper()}", flush=True)
                bus0.send(msg1, timeout=0.2)

    except KeyboardInterrupt: 
        print("\n\nЗупинка...", flush=True)
