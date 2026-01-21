# Connecting a generator to a solar inverter

Цього weekend-у працюємо над Delta FR-48V-2000W-E

## Матеріали

- Сетка на провод 1метр - 4шт
- Провід на DC 0.75кв.мм Одеса Кабель 0.75метра - 16шт жовтих + 16шт чорних
- Провід на AC 2.5кв.мм 0.5метра

## Підбір резисторів

### Напруга

Оригінальний SMD резистор напруги 332k(3223) на [фото](weekend-project-2025-10-18-connecting-a-generator-to-a-solar-inverter.files/voltage-resistance-1.jpg)

#### Напруга перший блок

| Напруга | Номінал | Нотаток                                                                                    |
| ------- | ------- | ------------------------------------------------------------------------------------------ |
| 53.5V   | 332k    | Оригінальний (заводський) номінал                                                          |
| 55.2V   | ???k    | Для заряджання LiFePO₄ 16S (3.45V на елемент (замість 3.65V) для збереження довговічності) |
| 56.5V   | 352k    |                                                                                            |
| 57.6V   | 363k    | Для заряджання свинцевого акумулятора                                                      |

#### Напруга другий блок

| Напруга | Номінал | Нотаток                                               |
| ------- | ------- | ----------------------------------------------------- |
| 53.5V   | 332k    | Оригінальний (заводський) номінал                     |
| 58.4V   | 357.2k  | Для заряджання свинцевого акумулятора (332k+20k+5.2k) |
| 58.4V   | 362k    | Для заряджання свинцевого акумулятора (332k+20k+10k)  |

#### Напруга третій блок

| Напруга | Номінал | Нотаток                                                                                    |
| ------- | ------- | ------------------------------------------------------------------------------------------ |
| 53.5V   | 332k    | Оригінальний (заводський) номінал                                                          |
| 55.2V   | 348k    | Для заряджання LiFePO₄ 16S (3.45V на елемент (замість 3.65V) для збереження довговічності) |
| 56.5V   | 352k    |                                                                                            |
| 57.6V   | 359k    | Для заряджання свинцевого акумулятора                                                      |
| 58.0V   | 362k    |                                                                                            |
| 58.2V   | 363k    |                                                                                            |

### Обмеження струму

### Вхідний струм (Input Current)

Вхідний струм можна обмежити шляхом притискання VSENSE до землі через додавання резистору мін pin 11 та pin 1 на PFC контролері UC3854BDW.

- Нижче еквівалентний опір на дільнику
- Менше напруги на VSENSE при одній і тій же вхідній напрузі
- Це змушує контролер підняти коефіцієнт заповнення для досягнення тієї ж напруги на VSENSE
- Результат: менша вихідна потужність

#### Вхідна потужність третій блок

##### Вхідна потужність третій блок (Vout = 53.5V)

| Середня Потужність | Максимальна Пікова Потужність | Номінал | Нотаток |
| ------------------ | ----------------------------- | ------- | ------- |
| ???W               | 380W                          | 332k    |         |
| ???W               | 700W                          | 350k    |         |

##### Вхідна потужність третій блок (Vout = 57.6V)

| Середня Потужність | Максимальна Пікова Потужність | Номінал | Нотаток |
| ------------------ | ----------------------------- | ------- | ------- |
| ???W               | 470W                          | 332k    |         |
| ???W               | 500W                          | 335k    |         |
| ???W               | 700W                          | 350k    |         |

### Вихідний струм (Output Current)

~~Між 12 і 3 виводом UCC3895 знайти SMD резистор (резистор обмеження по струму) змінити на необхідний. Чим вищий спротив тим менший струм, але спротив не повинен бути нижче оригінального.~~

## Програмне керування

### Google AI said

The Delta PSC3 is a versatile, modular Power System Controller for DC power systems, featuring the proprietary IMBUS (Intelligent Modular Bus) for easy expansion with modules like string sensors (SSM) and I/O units, enabling advanced features like battery management, rectifier control, and remote monitoring via Ethernet, SMS, or SNMP for telecom/datacom applications, reducing costs through efficiency and smart alarming.
Key Components & Functionality:
PSC3 Controller: The central unit with integrated PLC for monitoring, control, and communication.
IMBUS (Intelligent Modular Bus): A robust, CAN-based communication bus that allows connecting various expansion modules.
Expansion Modules: Supports units like String Sensor Modules (SSM) for battery monitoring, Block Voltage Sensor Modules (BSM), and Input/Output (IOM) modules for AC/DC parameters.
Core Features:
Battery Management: Includes capacity tests, lifetime prediction, and management for improved availability.
Remote Monitoring & Alarming: Offers local and remote access via web browser, modem, LAN/Ethernet, and SMS.
Cost Reduction: Features like efficiency modes (Economy Mode) and generator control (genset fuel saving) lower operating costs.
Modular Design: Perfect for scalable power solutions, from small to large decentralized systems.
Integrated Web Server: Provides a user-friendly graphical interface for monitoring and control.
How it Works:
The PSC3 controller connects to various peripheral modules via the IMBUS, collecting data (battery health, rectifier status, AC/DC voltages) and using its PLC to manage system operations, send alarms, and optimize energy usage, all accessible remotely.

### Dry-Run

1. Got CANable Pro USB adapter ([see](./weekend-project-2025-10-18-connecting-a-generator-to-a-solar-inverter.files/CANablePro.avif))
1. Download driver https://mac-can.github.io/drivers/libPCBUSB.html (I am MacOS user)
   - `cat ~/Downloads/PCBUSB/install.txt`
   - `(cd ~/Downloads/PCBUSB/ && sudo ./install.sh)`
   - `sudo xattr -dr com.apple.quarantine /usr/local/lib/libPCBUSB.0.13.dylib`
   - `(cd  ~/Downloads/PCBUSB/Examples/Python/ && python3 pcbusb_recv.py)`
1. Download tools https://github.com/mac-can/PCBUSB-Utilities/releases
   - `xattr -d com.apple.quarantine ~/Downloads/artifacts/can_moni`
   - `xattr -d com.apple.quarantine ~/Downloads/artifacts/can_test`
   - `~/Downloads/artifacts/can_moni PCAN-USB1 -b 250`
   - `~/Downloads/artifacts/can_moni PCAN-USB1 -b 250 --trace=ON -a OFF`
   - `~/Downloads/artifacts/can_moni PCAN-USB1 -b 250 --trace=ON -a OFF -t ZERO --no-remote-frames`

## PSC 3 Controller

Default Panel Password: Up, Up, Down, Exit, Exit, Enter
Default Web User: configuration/psc3

### Евіденси про прошивкам

- V2.70 B1 - на нашому контролері
- [V2.92 B5](https://youtu.be/PA1r2SJDKZI?t=62)
- [V3.11 B2](https://youtu.be/Z2wzR68pIFU?t=12)
- [V3.24 B3](https://youtu.be/dSc3j79U4Oc?t=11)

### IMBUS Connector Pinout

Дослідження прозвонка:

- Pin 1 та Pin 4 замкнуті (дзвоняться 0 Ом, та пищить в режимі діода)
- Pin 2 та Pin 3 замкнуті (дзвоняться 0 Ом, та пищить в режимі діода)
- Pin 7 та Pin 8 мають опір відповідно до джампера 60 або 120 Ом

Дослідження напруга (увімкнено PSC 3):

- Pin 1 (чорний) та Pin 2 (червоний) = 24V
- Pin 1 (чорний) та Pin 3 (червоний) = 24V
- Pin 4 (чорний) та Pin 2 (червоний) = 24V
- Pin 4 (чорний) та Pin 3 (червоний) = 24V
- Pin 1 (чорний) та Pin 5 (червоний) = відсутне
- Pin 1 (чорний) та Pin 6 (червоний) = відсутне
- Pin 1 (чорний) та Pin 7 (червоний) = 3V
- Pin 1 (чорний) та Pin 8 (червоний) = 1.9V

Висновок:

| Пін | Функція                            | Пояснення з ваших вимірів                                                             |
| --- | ---------------------------------- | ------------------------------------------------------------------------------------- |
| 1   | DC– (мінус живлення, 0 V референс) | Використовували як чорний щуп — всі напруги відносно нього. Замкнутий з Pin 4 (0 Ом). |
| 2   | DC+ (плюс живлення, ~24–48 V)      | +24 V відносно Pin 1/4. Замкнутий з Pin 3 (0 Ом).                                     |
| 3   | DC+ (дубль плюса)                  | Те саме +24 V, замкнутий з Pin 2."                                                    |
| 4   | DC– (дубль мінуса)                 | Те саме 0 V, замкнутий з Pin 1."                                                      |
| 5   | NC (не підключено)                 | Немає напруги відносно Pin 1.                                                         |
| 6   | NC (не підключено)                 | Немає напруги відносно Pin 1.                                                         |
| 7   | CAN_H                              | 3.0 V відносно GND (Pin 1/4) — типове значення CAN_H у recessive.                     |
| 8   | CAN_L                              | 1.9 V відносно GND — типове CAN_L. Разом з Pin 7 — термінатор 60/120 Ом (джампер).    |

## References

- https://www.youtube.com/shorts/MvEgUgoyErQ
- https://www.youtube.com/watch?v=XasIrrq9KTs
- https://www.youtube.com/watch?v=PnNgrjpihQk
- https://www.youtube.com/watch?v=_jtXRpx67_U
- https://electroavtosam.com.ua/forums/viewtopic.php?t=4024
- https://electroavtosam.com.ua/forums/viewtopic.php?t=4074
- https://skylots.org/6591867238/Blok+pitaniya+ot+bazovoy+stancii+delta+FR48V-2000W-E+regulirovka+napryajeniya+3-71V40A
- https://electroavtosam.com.ua/forums/viewtopic.php?t=4074
- https://endless-sphere.com/sphere/threads/delta-dpr-3000b-48-can-code.122463/

## Flatpak2

Устройство для регулировки выходного напряжения в блоках Flatpack2 48v далее БП, в заявленных изготовителем пределах, посредством can шины.

- https://electrotransport.ru/?topic=19373.180
- https://forum.cxem.net/topic/164248-%D1%80%D0%B5%D0%B3%D1%83%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE-%D0%BD%D0%B0%D0%BF%D1%80%D1%8F%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B1%D0%BF-eltek-flatpack2-2000-%D0%B2%D1%82/page/5/#comments


А самое прикольное, поставил сегодня прогу PowerSuite 3.6.1 решил проверить как же изменить значение напруги по умолчанию! Так вот к этой закладке можно добраться только с паролем который дает заводской уровень доступа! Благо добрый человек здесь в этой теме его упомянул. От сканировал команды, быстренько подправил программу указав значение по умолчанию 44 вольта и в нетерпении подключил к БП! Команда прошла, отключил БП отключил платку, и включил один БП. И о чудо значение по умолчанию встало на 44 вольта и теперь при включении всегда 44. Думаю это отличная новость, и в программе постараюсь это учесть! А то этот вопрос как то не давал мне покоя, ладно буду разбирать дальше пока индикация в пути, может еще что наковыряю.


Выглядит это так.
БП передает информацию каждые 100-200мс данные такого вида 1B 00 00 B8 13 DA 00 1F
где:
1B    - это температура = 27 гр.
00 00 - потребляемый ток
13 B8 - выходное напряжение = 50,48 вольта
00 DA - входное напряжение = 218 вольт
1F    - пока не определил что
Для правильного перевода двух байтных данных меняем их местами и переводим в десятичный вид.

Блок питания включен без нагрузки значение 00 00
Подключаем нагрузку 1.3А  значение изменяется на 0D 00
Не отключая нагрузки добавляем еще 0.8А значение не меняется 0D 00 хотя ток 2.1А
Отключаем нагрузку значение 00 00
Подключаем сразу обе нагрузки 2.1А значение 15 00
В общем меряет правильно но только при подключении!
А вот изменять выходное напряжение при подключенной нагрузке не попробовал, учту, проверю! может замер повторится.


Сегодня утром белго пробежался по пунктам меню в контроллере, не нашел ничего похожего на Default Voltage. Вечером поизучаю подробнее. Похоже, что через комп и правда открывается доступ к большему числу настроек. dimad63, какой пароль вводишь?

`003`
И ток у меня без шунта регулируется .


В приложение PowerSuite есть графа изменить минимальное напряжение, она стала доступна только после того как вводишь пароль доступу (Заводской уровень) код доступа 0709
Но в самой графе это число не меняется не на какое только 48V.

## flatpack2s2 Protocol.md

https://github.com/neggles/flatpack2s2/blob/main/docs/Protocol.md

### Hardware

The Flatpack2's CAN bus runs at 125kbps with 29-bit extended IDs, referenced to the PSU's negative rail.

If your breakout PCB exposes GNDD (the third small contact next to CANH and CANL), connect your transceiver GND to GNDD.
If GNDD is not available, connect your transceiver GND to the supply's VOUT-.

**Failure to tie your transceiver's GND to GNDD or VOUT- will probably brutally murder your transceiver.**

If possible, use a CAN transceiver which can tolerate in excess of 55V bus fault voltage such as the MAX3305x and its 5V siblings; this makes transceiver damage less likely in the event of it being miswired.

I am using a MAX3051 in my application but the drop-in replacement MAX33053 would be a better idea.

---

### Notes

I can't confirm whether any of this protocol data is correct for models other than the Flatpack2 HE 48V/2000W and Flatpack2 HE 48V/3000W. That said, anecdotal evidence from posters on various forums suggests the Flatpack S models are command-compatible and will work as well.

I'd expect it to work with any black-fronted Flatpack2 (HE/SHE) or Flatpack S model, but am unable to confirm.

---

### ID-less Messages

These messages do not contain a PSU ID in their identity field, and are primarily used to discover PSUs and assign addresses to them.

#### **CMD** Log in, `0x050048XX`

Log in to a power supply and assign it a CAN ID. Serial number payload chooses which supply to target.

PSU ID is assigned by setting `XX` to (ID \* 4), e.g. sending message ID `0x05004804` assigns PSU ID of `0x01` for future commands.

Allowable ID range is `0x01` to `0x3F`, or an `XX` of `0x04` through `0xFC`, and the power supply will log out if no login packet is received for (64 \* 0.2) seconds.

<table>
    <thead>
        <tr>
            <th><b>Byte</b></th> <th>0</th> <th>1</th> <th>2</th> <th>3</th> <th>4</th> <th>5</th> <th>6</th> <th>7</th>
        </tr>
    </thead>
    <tr>
        <td><b>Value</b></td> <td colspan='6'>Power supply's serial number</td> <td><code>0x00</code></td> <td><code>0x00</code></td>
    </tr>
</table>

#### **MSG** CAN hello packet, `0x0500XXXX`

A supply that is not logged in will send this packet every two seconds or so.

`XXXX` is the last two bytes of the PSU's serial number.

<table>
    <thead>
        <tr>
            <th><b>Byte</b></th> <th>0</th> <th>1</th> <th>2</th> <th>3</th> <th>4</th> <th>5</th> <th>6</th> <th>7</th>
        </tr>
    </thead>
    <tr>
        <td><b>Value</b></td> <td><code>0x1B</code></td> <td colspan='6'>Power supply's serial number</td> <td><code>0x00</code></td>
    </tr>
</table>

---

### PSU-specific Messages

These messages contain the PSU's assigned ID number, `XX`, in their message ID.

Sending messages to ID `0xFF` will command _all_ power supplies on the bus - I think this only works for the 'Set voltage and current limits' command, untested.

At the moment I actually can't get single-supply commands to work at all, so that's... odd.

#### **MSG** Status, `0x05XX40YY`

Once a power supply is logged in and has an address assigned, it will send these packets every 0.2 seconds exactly 64 times.

Transmit count is reset to 64 whenever a login is received; logging in every 10 seconds (or 5 to be safe) should be adequate to stay logged in.

Current is in deciAmps (A _ 0.1), voltages are all in centiVolts (V _ 0.01), all in little-endian byte order.

| Value of `YY` | Power supply state           |
| ------------- | ---------------------------- |
| `0x04`        | Normal (Constant Voltage)    |
| `0x08`        | Normal (Constant Current)    |
| `0x0C`        | Alarm                        |
| `0x10`        | Walk in (voltage ramping up) |

<table>
    <thead>
        <tr>
            <th><b>Byte</b></th> <th>0</th> <th>1</th> <th>2</th> <th>3</th> <th>4</th> <th>5</th> <th>6</th> <th>7</th>
        </tr>
    </thead>
    <tr>
        <td><b>Value</b></td> <td>Intake Temp</td> <td colspan='2'>Iout</td> <td colspan='2'>Vout</td> <td colspan='2'>Vin</td> <td>Exhaust Temp</td>
    </tr>
    <tr>
        <td><b>Unit</b></td> <td>°C</td> <td colspan='2'>dA (A * 0.1)</td> <td colspan='2'>cV (V * 0.01)</td> <td colspan='2'>Vrms (AC)</td> <td>°C</td>
    </tr>
</table>

#### **MSG** Login request / start-up notification, `0x05XX4400`

Sent by a logged-out power supply every ten seconds or so. Similar to the CAN hello packet, but uses supply's pre-set ID.

<table>
    <thead>
        <tr>
            <th><b>Byte</b></th> <th>0</th> <th>1</th> <th>2</th> <th>3</th> <th>4</th> <th>5</th> <th>6</th> <th>7</th>
        </tr>
    </thead>
    <tr>
        <td><b>Value</b></td> <td colspan='6'>Power supply's serial number</td> <td><code>0x00</code></td> <td><code>0x00</code></td>
    </tr>
</table>

#### **CMD** Set voltage and current limits, `0x05xx4004`

Sent to the power supply to immediately set output voltage and current limits.  
**If the supply logs out, these settings will be lost - default voltage will apply, and current limit will be set to factory maximum.**

Max current is the point at which the supply will switch from CV to CC modes.  
**Please note that the supply will not go below its minimum output voltage in CC mode!**

Desired voltage is the output voltage setpoint.

Measured voltage is for calibration/feedback; if you do not have a feedback voltage source, it should be equal to desired voltage.

OVP voltage is the voltage at which over-voltage protection will enable & cause the supply to shut down. Set this to your supply's maximum rated output voltage.

Max current is in deciAmps (A _ 0.1), voltages are all in centiVolts (V _ 0.01), all in little-endian byte order.

<table>
    <thead>
        <tr>
            <th><b>Byte</b></th> <th>0</th> <th>1</th> <th>2</th> <th>3</th> <th>4</th> <th>5</th> <th>6</th> <th>7</th>
        </tr>
    </thead>
    <tr>
        <td><b>Value</b></td> <td colspan='2'>Max Current</td> <td colspan='2'>Measured Voltage</td> <td colspan='2'>Desired Voltage</td> <td colspan='2'>OVP Voltage</td>
    </tr>
    <tr>
        <td><b>Unit</b></td> <td colspan='2'>dA (A * 0.1)</td> <td colspan='2'>cV (V * 0.01)</td> <td colspan='2'>cV (V * 0.01)</td> <td colspan='2'>cV (V * 0.01)</td>
    </tr>
</table>

#### **CMD** Set default voltage, `0x05XX9C00`

Sent to the power supply to set its default voltage. Does not take effect until the supply is logged out. If the supply is logged in when the command is sent, the voltage is set when the log in times out. If it is not logged in, the voltage will be set when the supply logs in then times out.

Voltage is stored in the same format as the status message - centivolts (V \* 0.01) in little-endian byte order.

<table>
    <thead>
        <tr>
            <th><b>Byte</b></th> <th>0</th> <th>1</th> <th>2</th> <th>3</th> <th>4</th>
        </tr>
    </thead>
    <tr>
        <td><b>Value</b></td> <td><code>0x29</code></td> <td><code>0x15</code></td> <td><code>0x00</code></td> <td colspan='2'>New voltage</td>
    </tr>
</table>

#### **CMD** Alert request, `0x05XXBFFC`

Requests current alerts (warnings/alarms) from targeted power supply.

Send this after receiving a status message with a last byte of `0x08` or `0x0C` to return current alert flags.

2nd byte of payload dictates whether query is for warning or critical alerts, and can be copied from the last byte of the status message.

| Byte  | 0    | 1                              | 2    |
| ----- | ---- | ------------------------------ | ---- |
| Value | 0x08 | 0x04 (warnings), 0x08 (alarms) | 0x00 |

#### **MSG** Alert information, `0x05XXBFFC`

Response to CMD `0x05XXBFFC`, containing requested alert information.

2nd byte indicates whether flag bits are warning or critical, and is equal to 2nd byte of CMD packet.

| Byte  | 0    | 1                                | 2    | 3                 | 4                 | 5    | 6    |
| ----- | ---- | -------------------------------- | ---- | ----------------- | ----------------- | ---- | ---- |
| Value | 0x0E | 0x04 (Warning) / 0x08 (Critical) | 0x00 | Alert flag byte 1 | Alert flag byte 2 | 0x00 | 0x00 |

Alert flag bit mapping:

| Bit | Alert flag byte 1  | Alert flag byte 2  |
| --- | ------------------ | ------------------ |
| 0   | OVS Lock Out       | Internal Voltage   |
| 1   | Mod Fail Primary   | Module Fail        |
| 2   | Mod Fail Secondary | Mod Fail Secondary |
| 3   | High Mains         | Fan 1 Speed Low    |
| 4   | Low Mains          | Fan 2 Speed Low    |
| 5   | High Temp          | Sub Mod1 Fail      |
| 6   | Low Temp           | Fan 3 Speed Low    |
| 7   | Current Limit      | Inner Volt         |
