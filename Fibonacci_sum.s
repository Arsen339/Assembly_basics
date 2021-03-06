# Напишем программу, считающую четные элементы ряда фибоначчи до заданного числа.
# start position:
# x1 = 1
# x10 = 1 # регистр с предыдущим числом
# x11 = 1 # регистр с последующим числом
# x18 = 20 # граница для чисел Фибоначчи(вводится пользователем) 
# x12 = 0 # регистр с суммой (с результатом)
# x4 - пузырьковый регистр
# x14 - результат проверки на четность
# Проверим четность методом сравнения результата 
# операции побитового и, примененной к проверяемому
# числу и сравнением его с числом 1 в двоичной СС

li x1 1
li x10 1
li x11 1
li x18 55
li x12 0

start:
ADD x4, zero, x11 # заполним пузырек последующим числом
ADD x11, x10, x11 # получим следующие число Фиб.
ADD x10, zero, x4 # получим число из пузырька
AND x14, x1, x11  # побитовое и единицы и проверяемого числа
BEQ x14, x1, uneven    # проверяем на четность
ADD x12, x12, x11 # инкрементируем сумму в случае четности
uneven:
BLT x11, x18, start # проверим, не привысило ли число Ф границы
BEQ x14, x1, stop_point # отменяем вычет в случае нечетности
SUB x12, x12, x11
stop_point: # вычтем последнее прибавленное число
ADD x12, x12, zero



