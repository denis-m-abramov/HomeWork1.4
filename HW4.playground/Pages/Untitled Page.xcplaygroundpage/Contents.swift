import UIKit
let formatter = NumberFormatter()
formatter.numberStyle = NumberFormatter.Style.decimal
formatter.roundingMode = NumberFormatter.RoundingMode.up
formatter.maximumFractionDigits = 3
formatter.minimumFractionDigits = 3
//:  [Сылка на тесты](https://docs.google.com/forms/d/e/1FAIpQLSd1u0QO7NUHombGhJkB0r0o8rsfGvUuVJmMbfWd-2nCbhOaAA/viewform)

//: ## Home Work 4

/*:
 ### Задание 1
 1.1 Пользователь открывает вклад (deposit) в банке на 5 лет на сумму 500 тыс. рублей. Процентная ставка годовых (rate) составляет 11%. Необходимо просчитать сумму дохода (profit) по окончании срока действия (period) вклада.  Для решения данной задачи используйет цикл for-in. Примечание: сумма вклада увеличивается с каждым годом и процент нужно считать уже от увелеченной суммы.
 
 1.2 Выведите результат на консоль в таком виде: "Сумма вклада через <... > лет увеличится на <...> и составит <...>"
 */

let deposit: Double = 500_000                   //сумма депозита в рублях
let period = 5                                  //количество лет вклада
let rate: Double = 11                          //ставка в % в год
var depositGrowth: Double = deposit         //сумма депозита с учетом сложного процента

if deposit <= 0 || period <= 0 || rate <= 0 {
    print("Введено некорректное значение!")
} else {
    for _ in 1...period {
        depositGrowth *= rate / 100 + 1
    }
    
    formatter.string(from: NSNumber(value: depositGrowth))
    
    let profit = depositGrowth - deposit    //сумма дохода
    formatter.string(from: NSNumber(value: profit))
    
    print("Сумма вклада \(deposit) рублей через \(period) лет увеличится на \(profit) рублей и составит \(depositGrowth) рублей")
    
    print("Сумма вклада \(deposit) рублей через \(period) лет увеличится на \(formatter.string(from: NSNumber(value: profit))!) рублей и составит \(formatter.string(from: NSNumber(value: depositGrowth))!) рублей")
}

/*:
 ### Задание 2
 2.1 Создайте целочисленные переменные `base` и `power` с любым значениями на ваше усмотрение.
 
 2.2 При помощи цикла `for in` возведите переменную `base` в степень `power` и присвойте результат переменной `result`
 
 2.3 Выведите результат на консоль в следующем виде: «<…> в <…> степени равно <…>»
 */
var base: Int = 2
var power: Int = 5
var result = base

if  base < 0 || power < 0 {
    print ("Введено некорректное значение!")
} else if power == 0 {
    result = 1
    print("\(base) в \(power) степени равно \(result)")
} else {
    for _ in 1..<power {
        result *= base
    }
    print("\(base) в \(power) степени равно \(result)")
}
/*:
 ### Задание 3
 3.1 Создайте целочисленный массив данных с любым набором чисел.
*/
//var arrayOne = Array<Int>(-20...20)
//: 3.2 Выведите на консоль все четные числа из массива

let numberFirst = -10
let numberLast = 10
var arrayOne = Array<Int>()

for i in numberFirst...numberLast {
    if i % 2 == 0 {
        arrayOne.append(i)
    }
}
print(arrayOne)



//Альтернативный вариант 1 (из интернета)
//var evens = [Int]()
//for i in 1...10 {
//  if i % 2 == 0 {
//    evens.append(i)
//  }
//}
//print(evens)

//Альтернативный вариант 2 (из интернета)
//var evens = [Int]()
//func isEven(number: Int) -> Bool {
//  return number % 2 == 0
//}
//evens = Array(1...10).filter(isEven)
//print(evens)

//Альтернативный вариант 3 (из интернета)
//var evens = [Int]()
//evens = Array(1...10).filter { (number) in number % 2 == 0 }
//print(evens)

//Альтернативный вариант 4 (из интернета)
//evens = Array(1...10).filter { $0 % 2 == 0 }
//print(evens)


//: 3.3 Используя оператор Continue выведите на консоль все нечетные числа из массива. Оператор continue предназначен для перехода к очередной итерации, игнорируя следующий за ним код. Т.е. вам нужно выполнить проверку на четность числа, и если оно оказалось четным перейти к следующей итерации.

let numberFirstTwo = -10
let numberLastTwo = 10
var arrayTwo = Array<Int>()

for i in numberFirstTwo...numberLastTwo {
    if i % 2 == 0 {
        continue
    } else {
        arrayTwo.append(i)
    }
}
print(arrayTwo)

//: ### Задание 4
//: 4.1 Создайте цикл (интревал можно задать от 1 до 10) в котором будет случайным образом вычисляться число в пределах от 1 до 10. Если число будет равно 5, выведите на коносль сообщение с номером итерации, например (Что бы выпало число 5 понадобилось 3 итерации) и остановите цикл. Для остановки цикла используйте оператор breack. Оператор break предназначен для досрочного завершения работы цикла. При этом весь последующий код в теле цикла игнорируется.

for i in 1... {
    let randNum = Int.random(in: 1...10)
    if randNum == 5 {
        print("Чтобы выпало число \(randNum) понадобилось \(i) итерации(й)")
        break }
}

/*:
 ### Задание 5
  5.1 На 10 метровый столб лезет черепашка. За день она забирается на два метра, за ночь съезжает на 1. Определите при помощи цикла, через сколько дней она заберетсья на столб. Подумайте над тем, какой цикл использовать в этой ситуации.
 */

let riseUp = 2
let sinkingDown = 1
var goalStart = 0
let goalEnd = 10
var day: Int = 0

if  riseUp <= 0 || sinkingDown < 0 || goalEnd <= 0 {
    print ("Введено некорректное значение!")
} else {
    while goalStart < goalEnd  {
    goalStart += riseUp
  //      print(goalStart)
        if goalStart < goalEnd {
            goalStart -= sinkingDown
 //           print(goalStart)
            day += 1
//            print("день \(day)")
        }
}
    day += 1
    print("Через \(day) дня(-ей) черепашка заберётся на \(goalEnd)-метровый столб")
}

/*:
 ### Задание 6
 Определить сложность алгоритма (с описанием рассуждения)
 
 
 */
// Входные данные, которые могут изменяться
let items = ["Раз", "Два"]


// Начало алгоритма
print("Привет")

for _ in items {
    for item1 in items {
        print("subitem 1 \(item1)")
    }
    for item2 in items {
        print(item2)
    }
}

print("36")
// Конец алгоритма

/* Массив состоит из 2-х элементов, которые выполняют по 4 операции в общем цикле:
 1 + n * (n + n) + n * (n + n) + 1 =  1 + n^2 + n^2 + n^2 + n^2 + 1 =  2 4+ 4 * n^2:
 => отбрасываем числовое значение n^2
 => максимальная степень n^2
 => сложность будет O(n^2)
 */

/*:
 ### Задание 7. От Google. Не обязательно решать.
 Дан массив 'a', который содержит целые числа в диапазоне от 1 до 'a.count'.
 Найти повторяющееся число в массиве для которого второе повторение имеет минимальный индекс.
 
 Другими словами, если в массиве есть более чем 1 дублирующееся числа, вывести то число, у которого второе повторение имеет индекс в массиве меньше, чем индекс второго повторения другого числа.
 
 Если повторяющихся чисел нет, то  ничего не выводить в консоль
 
 ПРИМЕР:
 
 Для a = [2, 1, 3, 5, 3, 2], вывод в консоль должен быть "3".

 В массиве есть два числа, которые дублируются: числа 2 и 3. Второе поторение 3 имеет меньший индекс, чем второе повторение 2, значит ответ: 3.
 
 
 Для a = [2, 2], вывод будет 2;

 Для a = [2, 4, 3, 5, 1],вывода не будет.
 
 */

let a = [2, 1, 3, 5, 3, 2]
var numbersSet = Set<Int>()

for number in a {
    if numbersSet.contains(number) {
        print(number)
        break
    } else {
        numbersSet.insert(number)
    }
}
