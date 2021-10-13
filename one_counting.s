# Напишем  на RISC-V ассемблере программу, считающую количество единиц в числе 
# SRL x16, x13, x12
# x11 - число для подсчета единиц
# x13 - счетчик от 0 до 31
# x14 = 31
# x15 - промежуточный результат
# x16 - Подсчет единиц(результат)

ADD x10, x11, x0 # копируем число для сохранности данных

AND x15, x11, x1 # Определим, равен ли последний бит единице
BEQ x15, x0, 8 # Если не равен, не будем увеличивать счетчик
ADD x16, x16, x1 # В противном случае увеличим счетчик
ADD x13, x13, x1 # Увеличим счетчик цикла
SRL x11, x11, x1 # Сдвинем число на один бит вправо(логический сдвиг)
BLT x13, x14, -20 # (перейдем в начало цикла, если он не прошел 32 такта)
