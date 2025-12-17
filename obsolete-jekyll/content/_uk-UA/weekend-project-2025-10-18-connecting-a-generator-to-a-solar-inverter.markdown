# Connecting a generator to a solar inverter

Цього weekend-у працюємо над Delta FR-48V-2000W-E

## Матеріали:

- Сетка на провод 1метр - 4шт
- Провід на DC 0.75кв.мм Одеса Кабель 0.75метра - 16шт жовтих + 16шт чорних
- Провід на AC 2.5кв.мм 0.5метра

## Підбір резисторів

### Напруга

Оригінальний SMD резистор напруги 332k(3223) на [фото](weekend-project-2025-10-18-connecting-a-generator-to-a-solar-inverter.files/voltage-resistance-1.jpg)

| Напруга | Номінал | Нотаток                                                                                    |
| ------- | ------- | ------------------------------------------------------------------------------------------ |
| 53.5V   | 332k    | Оригінальний (заводський) номінал                                                          |
| 55.2V   | ???k    | Для заряджання LiFePO₄ 16S (3.45V на елемент (замість 3.65V) для збереження довговічності) |
| 57.6V   | 363k    | Для заряджання свинцевого акумулятора                                                      |

### Обмеження струму

Між 12 і 3 виводом UCC3895 знайти SMD резистор (резистор обмеження по струму) змінити на необхідний. Чим вищий спротив тим менший струм, але спротив не повинен бути нижче оригінального.

## References

- https://www.youtube.com/shorts/MvEgUgoyErQ
- https://www.youtube.com/watch?v=XasIrrq9KTs
- https://www.youtube.com/watch?v=PnNgrjpihQk
- https://www.youtube.com/watch?v=_jtXRpx67_U
- https://electroavtosam.com.ua/forums/viewtopic.php?t=4024
- https://skylots.org/6591867238/Blok+pitaniya+ot+bazovoy+stancii+delta+FR48V-2000W-E+regulirovka+napryajeniya+3-71V40A
- https://electroavtosam.com.ua/forums/viewtopic.php?t=4074
