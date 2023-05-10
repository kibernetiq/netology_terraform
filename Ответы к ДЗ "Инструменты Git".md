**Задание**.

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.  
Выполнил: 
  git show aefea -s --format="%H %B  
Результат:  
  aefead2207ef7e2aa5dc81a34aedf0cad4c32545 Update CHANGELOG.md  

2. 
    - Какому тегу соответствует коммит 85024d3?  
    Выполнил: 
      git show 85024d3  
    Результат:  
      v0.12.23  

    - Сколько родителей у коммита b8d720? Напишите их хеши.  
    Выполнил:  
      git show b8d720 --pretty=%P   
    Результат:  
      56cd7859e05c36c06b56d013b55a252d0bb7e158 и 9ea88f22fc6269854151c571162c5bcf958bee2b  

    - Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.  
    Выполнил:  
      git log v0.12.23..v0.12.24  
    Результат:  
    33ff1c03bb (tag: v0.12.24) v0.12.24  
    b14b74c493 [Website] vmc provider links  
    3f235065b9 Update CHANGELOG.md  
    6ae64e247b registry: Fix panic when server is unreachable  
    5c619ca1ba website: Remove links to the getting started guide's old location  
    06275647e2 Update CHANGELOG.md  
    d5f9411f51 command: Fix bug when using terraform login on Windows  
    4b6d06cc5d Update CHANGELOG.md  
    dd01a35078 Update CHANGELOG.md  
    225466bc3e Cleanup after v0.12.23 release  

    - Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func  providerSource(...) (вместо троеточия перечислены аргументы).  
    Выполнил:  
      git log -S 'func providerSource(' --oneline --graph  
    Поиск нашел 2 коммита, посмотрел коммит который на ветвлении был раньше  
      git show 8c928e8358  
    Результат:  
    Функция была создана в 8c928e83589d90a031f811fae52a81be7153e82f  

    - Найдите все коммиты, в которых была изменена функция globalPluginDirs.  
    Выполнил:  
      git log -S 'func globalPluginDirs'  
    Результат:  
      8364383c359a6b738a436d1b7745ccdce178df47  

    - Кто автор функции synchronizedWriters?  
      git log -S 'func synchronizedWriters' --oneline --graph  
    Нашел 2 коммита, после добавил параметр graph и посмотрел коммит с первым упоминанием  
      git show 5ac311e2a9 -s --pretty=format:%an  
    Результат: Martin Atkins  

